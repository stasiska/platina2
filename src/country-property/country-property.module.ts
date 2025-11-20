import { Module } from '@nestjs/common';
import { CountryPropertyService } from './country-property.service';
import { CountryPropertyController } from './country-property.controller';
import { PrismaService } from 'src/prisma/prisma.service';

@Module({
  controllers: [CountryPropertyController],
  providers: [CountryPropertyService, PrismaService],
})
export class CountryPropertyModule {}
