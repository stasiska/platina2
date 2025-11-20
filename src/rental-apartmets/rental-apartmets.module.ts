import { Module } from '@nestjs/common';
import { RentalApartmetsService } from './rental-apartmets.service';
import { RentalApartmetsController } from './rental-apartmets.controller';
import { PrismaService } from 'src/prisma/prisma.service';

@Module({
  controllers: [RentalApartmetsController],
  providers: [RentalApartmetsService, PrismaService],
})
export class RentalApartmetsModule {}
