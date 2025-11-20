import { Module } from '@nestjs/common';
import { NewBuildingComplexService } from './new-building-complex.service';
import { NewBuildingComplexController } from './new-building-complex.controller';
import { PrismaService } from 'src/prisma/prisma.service';
import { PrismaModule } from 'src/prisma/prisma.module';

@Module({
  imports: [PrismaModule],
  controllers: [NewBuildingComplexController],
  providers: [NewBuildingComplexService, PrismaService],
  exports: [NewBuildingComplexService],
})
export class NewBuildingComplexModule {}
