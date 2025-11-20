import { Module } from '@nestjs/common';
import { CommercialPropertyService } from './commercial-property.service';
import { CommercialPropertyController } from './commercial-property.controller';
import { PrismaService } from 'src/prisma/prisma.service';

@Module({
  controllers: [CommercialPropertyController],
  providers: [CommercialPropertyService, PrismaService],
})
export class CommercialPropertyModule {}
