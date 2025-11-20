import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreateNewBuildingComplexDto } from './dto/create-new-building-complex.dto';
import { UpdateNewBuildingComplexDto } from './dto/update-new-building-complex.dto';

@Injectable()
export class NewBuildingComplexService {
    constructor(private prisma: PrismaService) {}
    async create(dto: CreateNewBuildingComplexDto) {
    return this.prisma.newBuildingComplex.create({
      data: dto,
      include: {
        images: true,
        apartments: true,
        nearbyPlaces: true,
        reviews: true,
      },
    });
  }

  async findAll() {
    return this.prisma.newBuildingComplex.findMany({
      include: {
        images: true,
        apartments: {
          include: { images: true },
        },
        nearbyPlaces: true,
        reviews: true,
      },
      orderBy: { createdAt: 'desc' },
    });
  }

  async findOne(id: number) {
    const complex = await this.prisma.newBuildingComplex.findUnique({
      where: { id },
      include: {
        images: true,
        apartments: {
          include: { images: true },
        },
        nearbyPlaces: true,
        reviews: true,
      },
    });

    if (!complex) throw new NotFoundException('ЖК не найден');

    return complex;
  }

  async update(id: number, dto: UpdateNewBuildingComplexDto) {
    await this.findOne(id); // проверка существования

    return this.prisma.newBuildingComplex.update({
      where: { id },
      data: dto,
      include: {
        images: true,
        apartments: true,
        nearbyPlaces: true,
        reviews: true,
      },
    });
  }

  async remove(id: number) {
    await this.findOne(id);
    return this.prisma.newBuildingComplex.delete({
      where: { id },
    });
  }
}
