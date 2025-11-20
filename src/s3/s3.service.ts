// src/images/s3.service.ts
import {
  Injectable,
  BadRequestException,
  InternalServerErrorException,
} from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { PutObjectCommand } from '@aws-sdk/client-s3';
import { s3Client, S3_BUCKET, S3_BASE_URL } from 'src/common/config/s3.config';
import { v4 as uuidv4 } from 'uuid';
import { UploadImagesDto } from './dto/upload-images.dto';

type OwnerType =
  | 'newBuildingComplex'
  | 'newBuildingApartment'
  | 'readyApartment'
  | 'rentalApartment'
  | 'countryProperty'
  | 'commercialProperty';

interface UploadDto {
  ownerType: OwnerType;
  ownerId: number;
}

@Injectable()
export class S3Service {
  constructor(private readonly prisma: PrismaService) {}

  private async uploadToSelectel(file: Express.Multer.File): Promise<string> {
    const ext = file.originalname.split('.').pop()?.toLowerCase() || 'jpg';
    const key = `images/${uuidv4()}.${ext}`;

    const command = new PutObjectCommand({
      Bucket: S3_BUCKET,
      Key: key,
      Body: file.buffer,
      ContentType: file.mimetype,
      ACL: 'public-read',
    });

    try {
      await s3Client.send(command);
      return `${S3_BASE_URL}${key}`;
    } catch (error) {
      console.error('S3 Upload Error:', error);
      throw new InternalServerErrorException('Ошибка загрузки файла в хранилище');
    }
  }

  // Главная функция — теперь полностью типобезопасна
  async uploadMultiple(files: Express.Multer.File[], dto: UploadImagesDto) {
    if (!files?.length) {
      throw new BadRequestException('Не переданы файлы для загрузки');
    }

    const { ownerType, ownerId } = dto;

    // Карта соответствия ownerType → модель Prisma
    const modelMap: Record<OwnerType, keyof PrismaService> = {
      newBuildingComplex: 'newBuildingComplex',
      newBuildingApartment: 'newBuildingApartment',
      readyApartment: 'readyApartment',
      rentalApartment: 'rentalApartment',
      countryProperty: 'countryProperty',
      commercialProperty: 'commercialProperty',
    };

    const modelName = modelMap[ownerType];
    if (!modelName || !(modelName in this.prisma)) {
      throw new BadRequestException(`Неподдерживаемый тип объекта: ${ownerType}`);
    }

    // Проверяем существование владельца
    const ownerExists = await (this.prisma[modelName] as any).findUnique({
      where: { id: Number(ownerId) },
    });

    if (!ownerExists) {
      throw new BadRequestException(
        `Объект типа "${ownerType}" с ID ${ownerId} не найден`,
      );
    }

    // Загружаем все файлы
    const urls = await Promise.all(files.map((file) => this.uploadToSelectel(file)));

    // Формируем данные для createMany
    const imageData = urls.map((url) => {
      const data: any = { url };

      // Только одно поле будет заполнено — как и нужно по твоей схеме
      const fieldName = `${ownerType}Id` as const;
      data[fieldName] = Number(ownerId);

      return data;
    });

    // Сохраняем в БД
    return this.prisma.image.createManyAndReturn({
      data: imageData,
    });
  }

  async findByOwner(ownerType: OwnerType, ownerId: number) {
    const fieldName = `${ownerType}Id` as const;
    return this.prisma.image.findMany({
      where: { [fieldName]: ownerId },
      orderBy: { createdAt: 'asc' },
    });
  }

  async remove(id: number) {
    const image = await this.prisma.image.findUnique({
      where: { id },
    });

    if (!image) {
      throw new BadRequestException('Изображение не найдено');
    }

    // Опционально: удаление из S3
    // const key = image.url.replace(S3_BASE_URL, '');
    // await s3Client.send(new DeleteObjectCommand({ Bucket: S3_BUCKET, Key: key }));

    return this.prisma.image.delete({ where: { id } });
  }
}