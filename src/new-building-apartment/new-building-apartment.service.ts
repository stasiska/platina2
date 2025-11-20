import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { UpdateNewBuildingApartmentDto } from './dto/update-new-building-apartment.dto';
import { ApartmentPaginationDto } from './dto/apartment-pagination.dto';
import { PaginatedResponseDto } from 'src/common/dto/paginated-response.dto';
import { CreateNewBuildingApartmentDto } from './dto/create-new-building-apartment.dto';

@Injectable()
export class NewBuildingApartmentService {
    constructor(private prisma: PrismaService) {}
    async create(dto: CreateNewBuildingApartmentDto) {
    return this.prisma.newBuildingApartment.create({
      data: dto,
      include: { images: true, complex: true },
    });
  }

  private async findManyWithPagination(dto: ApartmentPaginationDto) {
    const {
      skip,
      take,
      orderBy,
      order,
      complexId,
      minPrice,
      maxPrice,
      bedrooms,
      areaMin,
      areaMax,
      floorMin,
      floorMax,
    } = dto;

    const where: any = {
      ...(complexId && { complexId }),
      ...(minPrice && { price: { gte: +minPrice } }),
      ...(maxPrice && { price: { lte: +maxPrice } }),
      ...(bedrooms !== undefined && { bedrooms }),
      ...(areaMin && { area: { gte: areaMin } }),
      ...(areaMax && { area: { lte: areaMax } }),
      ...(floorMin && { floor: { gte: floorMin } }),
      ...(floorMax && { floor: { lte: floorMax } }),
    };

    const [data, total] = await Promise.all([
      this.prisma.newBuildingApartment.findMany({
        where,
        skip,
        take,
        orderBy: { [orderBy]: order },
        include: {
          images: { orderBy: { id: 'asc' } },
          complex: {
            select: { id: true, name: true, address: true, buildingClass: true },
          },
        },
      }),
      this.prisma.newBuildingApartment.count({ where }),
    ]);

    return new PaginatedResponseDto(data, total, skip!, take!);
  }

  async findAll(dto: ApartmentPaginationDto) {
    return this.findManyWithPagination(dto);
  }

  async findByComplexId(complexId: number, dto: ApartmentPaginationDto) {
    return this.findManyWithPagination({ ...dto, complexId });
  }

  async findOne(id: number) {
    const apartment = await this.prisma.newBuildingApartment.findUnique({
      where: { id },
      include: {
        images: true,
        complex: {
          include: {
            images: true,
            nearbyPlaces: true,
          },
        },
      },
    });

    if (!apartment) throw new NotFoundException('Квартира не найдена');
    return apartment;
  }

  async update(id: number, dto: UpdateNewBuildingApartmentDto) {
    await this.findOne(id);
    return this.prisma.newBuildingApartment.update({
      where: { id },
      data: dto,
      include: { images: true, complex: true },
    });
  }

  async remove(id: number) {
    await this.findOne(id);
    return this.prisma.newBuildingApartment.delete({ where: { id } });
  }
}
