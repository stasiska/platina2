import { Module } from '@nestjs/common';
import { CountryPropertyService } from './country-property.service';
import { CountryPropertyController } from './country-property.controller';
import { PrismaService } from 'src/prisma/prisma.service';
import { AuthModule } from 'src/auth/auth.module';

@Module({
  imports:[AuthModule],
  controllers: [CountryPropertyController],
  providers: [CountryPropertyService, PrismaService],
})
export class CountryPropertyModule {}
