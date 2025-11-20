import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreateNewBuildingComplexDto } from './dto/create-new-building-complex.dto';
import { UpdateNewBuildingComplexDto } from './dto/update-new-building-complex.dto';
import { PropertyPaginationDto } from 'src/common/dto/property-pagination.dto';
import { PaginatedResponseDto } from 'src/common/dto/paginated-response.dto';

@Injectable()
export class NewBuildingComplexService {
  constructor(private prisma: PrismaService) {}

  async create(dto: CreateNewBuildingComplexDto) {
    return this.prisma.newBuildingComplex.create({
      data: dto,
      include: {
        images: true,
        apartments: { include: { images: true } },
        nearbyPlaces: true,
      },
    });
  }

  // Универсальный метод (и для findAll, и для search)
  private async findManyWithPagination(dto: PropertyPaginationDto) {
    const {
      skip,
      take,
      orderBy,
      order,
      metro,
      district,
      developer,
      buildingClass,
      minPrice,
      maxPrice,
      hasParking,
    } = dto;

    const where: any = {
      ...(metro && { metro: { contains: metro, mode: 'insensitive' } }),
      ...(district && { district: { contains: district, mode: 'insensitive' } }),
      ...(developer && { developer: { contains: developer, mode: 'insensitive' } }),
      ...(buildingClass && { buildingClass }),
      ...(minPrice && { priceFrom: { gte: +minPrice } }),
      ...(maxPrice && { priceFrom: { lte: +maxPrice } }),
      ...(hasParking !== undefined && {
        hasParking: hasParking === true || hasParking === 'true' || hasParking === '1',
      }),
    };

    const [data, total] = await Promise.all([
      this.prisma.newBuildingComplex.findMany({
        where,
        skip,
        take,
        orderBy: orderBy === 'completionDate' && order === 'asc'
          ? { completionDate: 'asc' }
          : { [orderBy]: order },
        include: {
          images: true,
          apartments: { include: { images: true } },
          nearbyPlaces: true,
        },
      }),
      this.prisma.newBuildingComplex.count({ where }),
    ]);

    return new PaginatedResponseDto(data, total, skip, take);
  }

  async findAll(dto: PropertyPaginationDto) {
    return this.findManyWithPagination(dto);
  }

  async search(dto: PropertyPaginationDto) {
    return this.findManyWithPagination(dto);
  }

  async findOne(id: number) {
    const complex = await this.prisma.newBuildingComplex.findUnique({
      where: { id },
      include: {
        images: true,
        apartments: { include: { images: true } },
        nearbyPlaces: true,
      },
    });

    if (!complex) throw new NotFoundException('ЖК не найден');
    return complex;
  }

  async update(id: number, dto: UpdateNewBuildingComplexDto) {
    await this.findOne(id);
    return this.prisma.newBuildingComplex.update({
      where: { id },
      data: dto,
      include: {
        images: true,
        apartments: true,
        nearbyPlaces: true,
      },
    });
  }

  async remove(id: number) {
    await this.findOne(id);
    return this.prisma.newBuildingComplex.delete({ where: { id } });
  }
}