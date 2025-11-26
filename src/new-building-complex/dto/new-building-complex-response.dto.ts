import { ApiProperty } from '@nestjs/swagger';
import { BuildingClass } from 'prisma/__generated__';

class ImageResponseDto {
  @ApiProperty({ example: 567, description: 'ID изображения' })
  id: number;

  @ApiProperty({
    example: 'https://9c9a241d-...selstorage.ru/images/river-park.jpg',
    description: 'Прямой URL изображения ЖК',
  })
  url: string;

  @ApiProperty({ example: '2025-11-20T15:00:00.000Z' })
  createdAt: string;
}

export class NewBuildingComplexResponseDto {
  @ApiProperty({ example: 3, description: 'ID жилого комплекса' })
  id: number;

  @ApiProperty({ example: 'ЖК "Ривер Парк"', description: 'Название комплекса' })
  name: string;

  @ApiProperty({ example: 'Москва, ул. Речная, д. 7', description: 'Полный адрес' })
  address: string;

  @ApiProperty({ example: 'ЮАО', description: 'Район', nullable: true })
  district: string | null;

  city: string;
  
  @ApiProperty({ example: 'Коломенская', description: 'Ближайшее метро', nullable: true })
  metro: string | null;

  lat: number;
  lng: number;
  
  @ApiProperty({ example: 8, description: 'Расстояние до метро пешком (в минутах)', nullable: true })
  metroDistance: number | null;

  @ApiProperty({ example: 'ПИК', description: 'Застройщик' })
  developer: string;

  @ApiProperty({ example: 12500000, description: 'Цена от (руб)' })
  priceFrom: number;

  @ApiProperty({ example: 38, description: 'Площадь от (м²)', nullable: true })
  areaFrom: number | null;

  @ApiProperty({
    example: 'COMFORT',
    enum: BuildingClass,
    description: 'Класс недвижимости: ECONOM, COMFORT, BUSINESS, ELITE',
  })
  buildingClass: BuildingClass;

  @ApiProperty({ example: 25, description: 'Количество этажей', nullable: true })
  floors: number | null;

  @ApiProperty({ example: 1200, description: 'Всего квартир', nullable: true })
  totalApartments: number | null;

  @ApiProperty({ example: 342, description: 'Квартир в продаже', nullable: true })
  availableApartments: number | null;

  @ApiProperty({
    example: '2026-12-01T00:00:00.000Z',
    description: 'Дата сдачи (ISO)',
    nullable: true,
  })
  completionDate: string | null;

  @ApiProperty({ example: 85, description: 'Высота потолков (см)', nullable: true })
  height: number | null;

  @ApiProperty({ example: true, description: 'Есть ли паркинг' })
  hasParking: boolean;

  @ApiProperty({
    example: 'Современный жилой комплекс на берегу реки...',
    description: 'Описание',
    nullable: true,
  })
  description: string | null;

  @ApiProperty({ type: [ImageResponseDto], description: 'Фотографии комплекса' })
  images: ImageResponseDto[];

  @ApiProperty({ example: '2025-11-20T15:00:00.000Z' })
  createdAt: string;

  @ApiProperty({ example: '2025-11-20T15:30:00.000Z' })
  updatedAt: string;
}