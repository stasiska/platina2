import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { UpdateCommercialPropertyDto } from './dto/update-commercial-property.dto';
import { PaginatedResponseDto } from 'src/common/dto/paginated-response.dto';
import { CommercialPaginationDto } from './dto/commercial-pagination.dto';
import { CreateCommercialPropertyDto } from './dto/create-commercial-property.dto';
import { CommercialPropertyPaginationDto } from 'src/dto/base.dto';

@Injectable()
export class CommercialPropertyService {
    constructor(private prisma: PrismaService) {}

    async create(dto: CreateCommercialPropertyDto) {
    return this.prisma.commercialProperty.create({
      data: dto,
      include: { images: { orderBy: { id: 'asc' } } },
    });
  }

  private async findManyWithPagination(dto: CommercialPropertyPaginationDto) {
    const {
      skip,
      take,
      orderBy,
      order,
      minPrice,
      maxPrice,
      areaMin,
      areaMax,
      hasFinishing,
      purpose,
      metro,
      city
    } = dto;

    const where: any = {
      ...(minPrice && { price: { gte: +minPrice } }),
      ...(maxPrice && { price: { lte: +maxPrice } }),
      ...(areaMin && { area: { gte: areaMin } }),
      ...(areaMax && { area: { lte: areaMax } }),
      ...(city && { city: { contains: city, mode: 'insensitive' } }),
      ...(hasFinishing !== undefined && { hasFinishing }),
      ...(purpose && { purpose: { contains: purpose, mode: 'insensitive' } }),
      ...(metro && { metro: { contains: metro, mode: 'insensitive' } }),
    };

    const [data, total] = await Promise.all([
      this.prisma.commercialProperty.findMany({
        where,
        skip,
        take,
        orderBy: { [orderBy]: order },
        include: { images: { orderBy: { id: 'asc' } } },
      }),
      this.prisma.commercialProperty.count({ where }),
    ]);

    return new PaginatedResponseDto(data, total, skip!, take!);
  }

  async findAll(dto: CommercialPropertyPaginationDto) {
    return this.findManyWithPagination(dto);
  }

  async search(dto: CommercialPropertyPaginationDto) {
    return this.findManyWithPagination(dto);
  }

  async findOne(id: number) {
    const property = await this.prisma.commercialProperty.findUnique({
      where: { id },
      include: { images: true },
    });

    if (!property) throw new NotFoundException('Коммерческий объект не найден');
    return property;
  }

  async update(id: number, dto: UpdateCommercialPropertyDto) {
    await this.findOne(id);
    return this.prisma.commercialProperty.update({
      where: { id },
      data: dto,
      include: { images: true },
    });
  }

  async remove(id: number) {
    await this.findOne(id);
    return this.prisma.commercialProperty.delete({ where: { id } });
  }
}
