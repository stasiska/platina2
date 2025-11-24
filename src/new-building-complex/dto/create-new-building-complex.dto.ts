import { ApiProperty } from '@nestjs/swagger';
import { IsString, IsInt, IsOptional, IsBoolean, IsEnum, IsDateString } from 'class-validator';
import { BuildingClass } from 'prisma/__generated__';

export class CreateNewBuildingComplexDto {
  @ApiProperty({ example: 'ЖК "Ривер Парк"', description: 'Название комплекса' })
  @IsString()
  name: string;

  @ApiProperty({ example: 'Москва, ул. Речная, д. 7', description: 'Полный адрес' })
  @IsString()
  address: string;

  @ApiProperty({ example: 'ЮАО', description: 'Район', nullable: true })
  @IsOptional()
  @IsString()
  district?: string;

  @ApiProperty({ example: 'Коломенская', description: 'Ближайшее метро', nullable: true })
  @IsOptional()
  @IsString()
  metro?: string;

  @ApiProperty({ example: 8, description: 'Расстояние до метро пешком (в минутах)', nullable: true })
  @IsOptional()
  @IsInt()
  metroDistance?: number;

  @ApiProperty({ example: 'ПИК', description: 'Застройщик' })
  @IsString()
  developer: string;

  @ApiProperty({ example: 12500000, description: 'Цена от (руб)' })
  @IsInt()
  priceFrom: number;

  @ApiProperty({ example: 38, description: 'Площадь от (м²)', nullable: true })
  @IsOptional()
  @IsInt()
  areaFrom?: number;

  @ApiProperty({ example: 'COMFORT', enum: BuildingClass, description: 'Класс недвижимости: ECONOM, COMFORT, BUSINESS, ELITE' })
  @IsEnum(BuildingClass)
  buildingClass: BuildingClass;

  @ApiProperty({ example: 25, description: 'Количество этажей', nullable: true })
  @IsOptional()
  @IsInt()
  floors?: number;

  @ApiProperty({ example: 1200, description: 'Всего квартир', nullable: true })
  @IsOptional()
  @IsInt()
  totalApartments?: number;

  @ApiProperty({ example: 800, description: 'Количество доступных квартир', nullable: true })
  @IsOptional()
  @IsInt()
  availableApartments?: number;

  @ApiProperty({ example: '2026-12-01T00:00:00.000Z', description: 'Дата завершения строительства', nullable: true })
  @IsOptional()
  @IsDateString()
  completionDate?: string; // ISO string, напр. "2026-12-01T00:00:00.000Z"

  @ApiProperty({ example: 5, description: 'Количество этажей', nullable: true })
  @IsOptional()
  @IsInt()
  height?: number;

  @ApiProperty({ example: true, description: 'Наличие парковки', nullable: true })
  @IsOptional()
  @IsBoolean()
  hasParking?: boolean = false;

  @ApiProperty({ example: 'Описание комплекса', description: 'Описание комплекса', nullable: true })
  @IsOptional()
  @IsString()
  description?: string;
}