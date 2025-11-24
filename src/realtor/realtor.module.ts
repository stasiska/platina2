import { Module } from '@nestjs/common';
import { RealtorService } from './realtor.service';
import { RealtorController } from './realtor.controller';
import { PrismaService } from 'src/prisma/prisma.service';
import { AuthModule } from 'src/auth/auth.module';

@Module({
  imports: [AuthModule],
  controllers: [RealtorController],
  providers: [RealtorService, PrismaService],
})
export class RealtorModule {}
