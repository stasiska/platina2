import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { UpdateReadyApartmentDto } from './dto/update-ready-apartment.dto';
import { CreateReadyApartmentDto } from './dto/create-ready-apartment.dto';
import { PaginationQueryDto } from './dto/pagination-query.dto';
import { PaginatedResponseDto } from './dto/paginated-response.dto';
import { ReadyApartment } from 'prisma/__generated__';
import { ReadyApartmentPaginationDto } from 'src/dto/base.dto';

@Injectable()
export class ReadyApartmentService {
    constructor(private prisma: PrismaService) {}

    async create(dto: CreateReadyApartmentDto) {
    return this.prisma.readyApartment.create({
      data: dto,
      include: {
        images: {
          orderBy: { id: 'asc' },
        },
      },
    });
  }

async findAll(
    query: PaginationQueryDto,
  ): Promise<PaginatedResponseDto<ReadyApartment & { images: any[] }>> {
    const { skip, take, orderBy, order } = query;

    const [data, total] = await Promise.all([
      this.prisma.readyApartment.findMany({
        skip,
        take,
        orderBy: { [orderBy]: order },
        include: { images: { orderBy: { id: 'asc' } } },
      }),
      this.prisma.readyApartment.count(),
    ]);

    return new PaginatedResponseDto(data, total, skip, take);
  }

async findAllAndSearch(dto: ReadyApartmentPaginationDto) {
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
    city,
  } = dto;

  const where: any = {
    ...(metro && { metro: { contains: metro, mode: 'insensitive' } }),
    ...(minPrice && { price: { gte: +minPrice } }),
    ...(maxPrice && { price: { lte: +maxPrice } }),
    ...(bedrooms !== undefined && { bedrooms }),
    ...(areaMin && { area: { gte: areaMin } }),
    ...(areaMax && { area: { lte: areaMax } }),
    ...(city && { city: { contains: city, mode: 'insensitive' } }),
  };

  const [data, total] = await Promise.all([
    this.prisma.readyApartment.findMany({
      where,
      skip,
      take,
      orderBy: { [orderBy]: order },
      include: { images: { orderBy: { id: 'asc' } } },
    }),
    this.prisma.readyApartment.count({ where }),
  ]);

  return new PaginatedResponseDto(data, total, skip, take);
}

  // Поиск тоже с total
  async search(params: {
    filters: {
      metro?: string;
      minPrice?: number;
      maxPrice?: number;
      bedrooms?: number;
    };
    pagination: PaginationQueryDto;
  }): Promise<PaginatedResponseDto<any>> {
    const { filters, pagination } = params;
    const { skip, take, orderBy, order } = pagination;

    const where: any = {
      ...(filters.metro && {
        metro: { contains: filters.metro, mode: 'insensitive' },
      }),
      ...(filters.minPrice && { price: { gte: filters.minPrice } }),
      ...(filters.maxPrice && { price: { lte: filters.maxPrice } }),
      ...(filters.bedrooms !== undefined && { bedrooms: filters.bedrooms }),
    };

    const [data, total] = await Promise.all([
      this.prisma.readyApartment.findMany({
        where,
        skip,
        take,
        orderBy: { [orderBy]: order },
        include: { images: true },
      }),
      this.prisma.readyApartment.count({ where }),
    ]);

    return new PaginatedResponseDto(data, total, skip, take);
  }

  async findOne(id: number) {
    const apartment = await this.prisma.readyApartment.findUnique({
      where: { id },
      include: {
        images: true,
      },
    });

    if (!apartment) {
      throw new NotFoundException(`Готовая квартира с ID ${id} не найдена`);
    }

    return apartment;
  }

  async update(id: number, dto: UpdateReadyApartmentDto) {
    await this.findOne(id); // проверка существования

    return this.prisma.readyApartment.update({
      where: { id },
      data: dto,
      include: { images: true },
    });
  }

  async remove(id: number) {
    await this.findOne(id);
    return this.prisma.readyApartment.delete({
      where: { id },
      include: { images: true }, // вернём с картинками перед удалением (по желанию)
    });
  }


}