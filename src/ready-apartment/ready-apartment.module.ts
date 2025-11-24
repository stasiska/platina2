import { Module } from '@nestjs/common';
import { ReadyApartmentService } from './ready-apartment.service';
import { ReadyApartmentController } from './ready-apartment.controller';
import { PrismaService } from 'src/prisma/prisma.service';
import { AuthModule } from 'src/auth/auth.module';

@Module({
  imports: [AuthModule],
  controllers: [ReadyApartmentController],
  providers: [ReadyApartmentService, PrismaService],
})
export class ReadyApartmentModule {}
