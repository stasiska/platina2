import { BadRequestException, Body, Controller, Delete, Get, Param, ParseIntPipe, Post, UploadedFiles, UseInterceptors } from '@nestjs/common';
import { S3Service } from './s3.service';
import { FilesInterceptor } from '@nestjs/platform-express';
import { UploadImagesDto } from './dto/upload-images.dto';

type OwnerType =
  | 'newBuildingComplex'
  | 'newBuildingApartment'
  | 'readyApartment'
  | 'rentalApartment'
  | 'countryProperty'
  | 'commercialProperty';

@Controller('s3')
export class S3Controller {
  constructor(private readonly s3Service: S3Service) {}

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
    // Валидация DTO (можно добавить class-validator, если хочешь)
    if (!dto.ownerType || !dto.ownerId) {
      throw new BadRequestException('ownerType и ownerId обязательны');
    }

    return this.s3Service.uploadMultiple(files, dto);
  }

  /**
   * Получить все изображения конкретного объекта
   */
  @Get('owner/:ownerType/:ownerId')
  async findByOwner(
    @Param('ownerType') ownerType: OwnerType,
    @Param('ownerId', ParseIntPipe) ownerId: number,
  ) {
    return this.s3Service.findByOwner(ownerType, ownerId);
  }

  /**
   * Удалить изображение по ID
   */
  @Delete(':id')
  async remove(@Param('id', ParseIntPipe) id: number) {
    return this.s3Service.remove(id);
  }
}
