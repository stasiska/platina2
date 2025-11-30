import { BadRequestException, Body, Controller, Delete, Get, Param, ParseIntPipe, Post, UploadedFiles, UseGuards, UseInterceptors } from '@nestjs/common';
import { S3Service } from './s3.service';
import { FilesInterceptor } from '@nestjs/platform-express';
import { UploadImagesDto } from './dto/upload-images.dto';
import { ApiTags } from '@nestjs/swagger';
import { AdminGuard } from 'src/auth/guard/admin.guard';
import { AddImagesByUrlDto } from './dto/add-images-by-url.dto';

type OwnerType =
  | 'newBuildingComplex'
  | 'newBuildingApartment'
  | 'readyApartment'
  | 'rentalApartment'
  | 'countryProperty'
  | 'commercialProperty';

@ApiTags('S3 storage')

@Controller('s3')
export class S3Controller {
  constructor(private readonly s3Service: S3Service) {}

@UseGuards(AdminGuard)
@Post('upload')
  @UseInterceptors(
    FilesInterceptor('files', 20, {
      limits: {
        fileSize: 15 * 1024 * 1024, // 15 MB
      },
      fileFilter: (req, file, callback) => {
        const allowed = /\.(jpg|jpeg|png|webp|avif)$/i;
        if (!allowed.test(file.originalname)) {
          return callback(
            new BadRequestException('Разрешены только изображения (jpg, png, webp, avif)'),
            false,
          );
        }
        callback(null, true);
      },
    }),
  )
  async uploadImages(
    @UploadedFiles() files: Express.Multer.File[],
    @Body() dto: UploadImagesDto,
  ) {
    if (!dto.ownerType || !dto.ownerId) {
      throw new BadRequestException('ownerType и ownerId обязательны');
    }

    return this.s3Service.uploadMultiple(files, dto);
  }

  @UseGuards(AdminGuard)
  @Post('add-by-url')
  async addImagesByUrl(@Body() dto: AddImagesByUrlDto) {
    return this.s3Service.addImagesByUrl(dto);
  }

  @Get('owner/:ownerType/:ownerId')
  async findByOwner(
    @Param('ownerType') ownerType: OwnerType,
    @Param('ownerId', ParseIntPipe) ownerId: number,
  ) {
    return this.s3Service.findByOwner(ownerType, ownerId);
  }

  
  @Delete(':id')
  async remove(@Param('id', ParseIntPipe) id: number) {
    return this.s3Service.remove(id);
  }
}
