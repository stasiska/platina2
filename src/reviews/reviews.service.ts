import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreateReviewDto } from './dto/create-review.dto';

@Injectable()
export class ReviewsService {
    constructor(private prisma: PrismaService) {}

    async create(dto: CreateReviewDto) {
    return this.prisma.review.create({
      data: {
        authorName: dto.authorName?.trim() || null,
        rating: dto.rating,
        comment: dto.comment?.trim() || null,
      },
    });
  }


  async findAll() {
    return this.prisma.review.findMany({
      orderBy: { createdAt: 'desc' },
    });
  }


  async remove(id: number) {
    return this.prisma.review.delete({ where: { id } });
  }
}
