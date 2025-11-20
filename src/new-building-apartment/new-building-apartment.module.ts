import { Module } from '@nestjs/common';
import { NewBuildingApartmentService } from './new-building-apartment.service';
import { NewBuildingApartmentController } from './new-building-apartment.controller';
import { PrismaService } from 'src/prisma/prisma.service';

@Module({
  controllers: [NewBuildingApartmentController],
  providers: [NewBuildingApartmentService, PrismaService],
})
export class NewBuildingApartmentModule {}
