import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { PrismaModule } from './prisma/prisma.module';
import { NewBuildingComplexModule } from './new-building-complex/new-building-complex.module';
import { ReadyApartmentModule } from './ready-apartment/ready-apartment.module';


@Module({
  imports: [ConfigModule.forRoot({
    isGlobal: true
  }), PrismaModule, NewBuildingComplexModule, ReadyApartmentModule],
  controllers: [],
  providers: [
  ],
  exports: [
  ]
})
export class AppModule {}
