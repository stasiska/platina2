import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { UpdateRentalApartmentDto } from './dto/update-rental-apartment.dto';
import { RentalPaginationDto } from './dto/rental-pagination.dto';
import { PaginatedResponseDto } from 'src/common/dto/paginated-response.dto';
import { CreateRentalApartmentDto } from './dto/create-rental-apartment.dto';

@Injectable()
export class RentalApartmetsService {
    constructor(private prisma: PrismaService) {}

    async create(dto: CreateRentalApartmentDto) {
    return this.prisma.rentalApartment.create({
      data: dto,
      include: { images: { orderBy: { id: 'asc' } } },
    });
  }

  private async findManyWithPagination(dto: RentalPaginationDto) {
    const {
      skip,
      take,
      orderBy,
      order,
      metro,
      minPrice,
      maxPrice,
      bedrooms,
      areaMin,
      areaMax,
    } = dto;

    const where: any = {
      ...(metro && { metro: { contains: metro, mode: 'insensitive' } }),
      ...(minPrice && { pricePerMonth: { gte: +minPrice } }),
      ...(maxPrice && { pricePerMonth: { lte: +maxPrice } }),
      ...(bedrooms !== undefined && { bedrooms }),
      ...(areaMin && { area: { gte: areaMin } }),
      ...(areaMax && { area: { lte: areaMax } }),
    };

    const [data, total] = await Promise.all([
      this.prisma.rentalApartment.findMany({
        where,
        skip,
        take,
        orderBy: { [orderBy]: order },
        include: { images: { orderBy: { id: 'asc' } } },
      }),
      this.prisma.rentalApartment.count({ where }),
    ]);

    return new PaginatedResponseDto(data, total, skip!, take!);
  }

  async findAll(dto: RentalPaginationDto) {
    return this.findManyWithPagination(dto);
  }

  async search(dto: RentalPaginationDto) {
    return this.findManyWithPagination(dto);
  }

  async findOne(id: number) {
    const apartment = await this.prisma.rentalApartment.findUnique({
      where: { id },
      include: { images: true },
    });

    if (!apartment) throw new NotFoundException('Квартира в аренду не найдена');
    return apartment;
  }

  async update(id: number, dto: UpdateRentalApartmentDto) {
    await this.findOne(id);
    return this.prisma.rentalApartment.update({
      where: { id },
      data: dto,
      include: { images: true },
    });
  }

  async remove(id: number) {
    await this.findOne(id);
    return this.prisma.rentalApartment.delete({ where: { id } });
  }
}
