import { Module } from '@nestjs/common';
import { S3Service } from './s3.service';
import { S3Controller } from './s3.controller';
import { PrismaService } from 'src/prisma/prisma.service';

@Module({
  controllers: [S3Controller],
  providers: [S3Service, PrismaService],
})
export class S3Module {}
