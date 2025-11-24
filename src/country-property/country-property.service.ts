import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { UpdateCountryPropertyDto } from './dto/update-country-property.dto';
import { CountryPaginationDto } from './dto/country-pagination.dto';
import { PaginatedResponseDto } from 'src/common/dto/paginated-response.dto';
import { CreateCountryPropertyDto } from './dto/create-country-property.dto';
import { CountryPropertyPaginationDto } from 'src/dto/base.dto';

@Injectable()
export class CountryPropertyService {
    constructor(private prisma: PrismaService) {}

    async create(dto: CreateCountryPropertyDto) {
    return this.prisma.countryProperty.create({
      data: dto,
      include: { images: { orderBy: { id: 'asc' } } },
    });
  }

  private async findManyWithPagination(dto: CountryPropertyPaginationDto) {
    const {
      skip,
      take,
      orderBy,
      order,
      metro,
      minPrice,
      maxPrice,
      bedrooms,
      landAreaMin,
      landAreaMax,
      city
    } = dto;

    const where: any = {
      ...(metro && { metro: { contains: metro, mode: 'insensitive' } }),
      ...(minPrice && { price: { gte: +minPrice } }),
      ...(maxPrice && { price: { lte: +maxPrice } }),
      ...(bedrooms !== undefined && { bedrooms }),
      ...(city && { city: { contains: city, mode: 'insensitive' } }),
      ...(landAreaMin && { landArea: { gte: landAreaMin } }),
      ...(landAreaMax && { landArea: { lte: landAreaMax } }),
    };

    const [data, total] = await Promise.all([
      this.prisma.countryProperty.findMany({
        where,
        skip,
        take,
        orderBy: { [orderBy]: order },
        include: { images: { orderBy: { id: 'asc' } } },
      }),
      this.prisma.countryProperty.count({ where }),
    ]);

    return new PaginatedResponseDto(data, total, skip!, take!);
  }

  async findAll(dto: CountryPropertyPaginationDto) {
    return this.findManyWithPagination(dto);
  }

  async search(dto: CountryPropertyPaginationDto) {
    return this.findManyWithPagination(dto);
  }

  async findOne(id: number) {
    const property = await this.prisma.countryProperty.findUnique({
      where: { id },
      include: { images: true },
    });

    if (!property) throw new NotFoundException('Загородный объект не найден');
    return property;
  }

  async update(id: number, dto: UpdateCountryPropertyDto) {
    await this.findOne(id);
    return this.prisma.countryProperty.update({
      where: { id },
      data: dto,
      include: { images: true },
    });
  }

  async remove(id: number) {
    await this.findOne(id);
    return this.prisma.countryProperty.delete({ where: { id } });
  }
}
