import { Module } from '@nestjs/common';
import { ReadyApartmentService } from './ready-apartment.service';
import { ReadyApartmentController } from './ready-apartment.controller';
import { PrismaService } from 'src/prisma/prisma.service';

@Module({
  controllers: [ReadyApartmentController],
  providers: [ReadyApartmentService, PrismaService],
})
export class ReadyApartmentModule {}
