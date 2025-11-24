import { Module } from '@nestjs/common';
import { NewBuildingApartmentService } from './new-building-apartment.service';
import { NewBuildingApartmentController } from './new-building-apartment.controller';
import { PrismaService } from 'src/prisma/prisma.service';
import { AuthModule } from 'src/auth/auth.module';

@Module({
  imports: [AuthModule],
  controllers: [NewBuildingApartmentController],
  providers: [NewBuildingApartmentService, PrismaService],
})
export class NewBuildingApartmentModule {}
