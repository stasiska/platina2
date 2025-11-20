import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { PrismaModule } from './prisma/prisma.module';
import { NewBuildingComplexModule } from './new-building-complex/new-building-complex.module';
import { ReadyApartmentModule } from './ready-apartment/ready-apartment.module';
import { NewBuildingApartmentModule } from './new-building-apartment/new-building-apartment.module';
import { RentalApartmetsModule } from './rental-apartmets/rental-apartmets.module';
import { CountryPropertyModule } from './country-property/country-property.module';
import { CommercialPropertyModule } from './commercial-property/commercial-property.module';
import { S3Module } from './s3/s3.module';
import { LeadModule } from './lead/lead.module';
import { ReviewsModule } from './reviews/reviews.module';
import { RealtorModule } from './realtor/realtor.module';


@Module({
  imports: [ConfigModule.forRoot({
    isGlobal: true
  }), PrismaModule, NewBuildingComplexModule, ReadyApartmentModule, NewBuildingApartmentModule, RentalApartmetsModule, CountryPropertyModule, CommercialPropertyModule, S3Module, LeadModule, ReviewsModule, RealtorModule],
  controllers: [],
  providers: [
  ],
  exports: [
  ]
})
export class AppModule {}
