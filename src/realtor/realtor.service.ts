import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreateRealtorDto, UpdateRealtorDto } from './dto/create-realtor.dto';

@Injectable()
export class RealtorService {
    constructor(private prisma: PrismaService) {}

    async findAllActive() {
    return this.prisma.realtor.findMany({
      orderBy: { createdAt: 'asc' },
    });
  }

  // Для админки — все
  async findAll() {
    return this.prisma.realtor.findMany({
      orderBy: { createdAt: 'desc' },
    });
  }

  async findOne(id: number) {
    const realtor = await this.prisma.realtor.findUnique({
      where: { id },
    });
    if (!realtor) throw new NotFoundException('Риэлтор не найден');
    return realtor;
  }

  async create(dto: CreateRealtorDto) {
    return this.prisma.realtor.create({
      data: {
        fullName: dto.fullName.trim(),
        phone: dto.phone?.trim() || null,
        email: dto.email?.trim() || null,
        avatarUrl: dto.avatarUrl || null,
        position: dto.position?.trim() || null,
      },
    });
  }

  async update(id: number, dto: UpdateRealtorDto) {
    await this.findOne(id); 
    return this.prisma.realtor.update({
      where: { id },
      data: dto,
    });
  }

  async remove(id: number) {
    await this.findOne(id);
    return this.prisma.realtor.delete({ where: { id } });
  }
}
