import { ApiProperty } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import {
  IsOptional,
  IsPositive,
  Max,
  Min,
  IsIn,
  IsString,
  IsNumberString,
  IsInt,
  IsBoolean,
} from 'class-validator';
import { BuildingClass } from 'prisma/__generated__';

// ==========================================
// BASE DTO (общие поля для всех)
// ==========================================
class BasePaginationDto {
  @ApiProperty({ default: 0, description: 'Пропустить записей' })
  @IsOptional()
  @Type(() => Number)
  @IsInt({ message: 'skip должен быть целым числом' })
  @Min(0, { message: 'skip не может быть отрицательным' })
  skip?: number = 0;

  @ApiProperty({ default: 20, description: 'Количество записей' })
  @IsOptional()
  @Type(() => Number)
  @IsPositive()
  @Max(100)
  take?: number = 20;

  @ApiProperty({ default: 'desc', description: 'Порядок сортировки' })
  @IsOptional()
  @IsIn(['asc', 'desc'])
  order?: 'asc' | 'desc' = 'desc';

  @ApiProperty({ required: false, description: 'Город' })
  @IsOptional()
  @IsString()
  city?: string;
}

// ==========================================
// READY APARTMENT DTO
// ==========================================
export class ReadyApartmentPaginationDto extends BasePaginationDto {
  @ApiProperty({ default: 'createdAt', description: 'Поле для сортировки' })
  @IsOptional()
  @IsIn([
    'price',
    'pricePerM2',
    'area',
    'bedrooms',
    'floor',
    'totalFloors',
    'createdAt',
    'metroDistance',
  ])
  orderBy?:
    | 'price'
    | 'pricePerM2'
    | 'area'
    | 'bedrooms'
    | 'floor'
    | 'totalFloors'
    | 'createdAt'
    | 'metroDistance' = 'createdAt';

  @ApiProperty({ required: false, description: 'Метро' })
  @IsOptional()
  @IsString()
  metro?: string;

  @ApiProperty({ required: false, description: 'Минимальная цена' })
  @IsOptional()
  @IsNumberString()
  minPrice?: string;

  @ApiProperty({ required: false, description: 'Максимальная цена' })
  @IsOptional()
  @IsNumberString()
  maxPrice?: string;

  @ApiProperty({ required: false, description: 'Количество спален' })
  @IsOptional()
  @Type(() => Number)
  @Min(0)
  bedrooms?: number;

  @ApiProperty({ required: false, description: 'Минимальная площадь' })
  @IsOptional()
  @Type(() => Number)
  @Min(0)
  areaMin?: number;

  @ApiProperty({ required: false, description: 'Максимальная площадь' })
  @IsOptional()
  @Type(() => Number)
  @Min(0)
  areaMax?: number;
}

// ==========================================
// RENTAL APARTMENT DTO
// ==========================================
export class RentalApartmentPaginationDto extends BasePaginationDto {
  @ApiProperty({ default: 'createdAt', description: 'Поле для сортировки' })
  @IsOptional()
  @IsIn(['pricePerMonth', 'area', 'bedrooms', 'floor', 'createdAt'])
  orderBy?:
    | 'pricePerMonth'
    | 'area'
    | 'bedrooms'
    | 'floor'
    | 'createdAt' = 'createdAt';

  @ApiProperty({ required: false, description: 'Метро' })
  @IsOptional()
  @IsString()
  metro?: string;

  @ApiProperty({ required: false, description: 'Минимальная цена аренды в месяц' })
  @IsOptional()
  @IsNumberString()
  minPrice?: string;

  @ApiProperty({ required: false, description: 'Максимальная цена аренды в месяц' })
  @IsOptional()
  @IsNumberString()
  maxPrice?: string;

  @ApiProperty({ required: false, description: 'Количество спален' })
  @IsOptional()
  @Type(() => Number)
  @Min(0)
  bedrooms?: number;

  @ApiProperty({ required: false, description: 'Минимальная площадь' })
  @IsOptional()
  @Type(() => Number)
  @Min(0)
  areaMin?: number;

  @ApiProperty({ required: false, description: 'Максимальная площадь' })
  @IsOptional()
  @Type(() => Number)
  @Min(0)
  areaMax?: number;
}

// ==========================================
// NEW BUILDING COMPLEX DTO
// ==========================================
export class NewBuildingComplexPaginationDto extends BasePaginationDto {
  @ApiProperty({ default: 'createdAt', description: 'Поле для сортировки' })
  @IsOptional()
  @IsIn([
    'priceFrom',
    'areaFrom',
    'floors',
    'completionDate',
    'createdAt',
    'metroDistance',
  ])
  orderBy?:
    | 'priceFrom'
    | 'areaFrom'
    | 'floors'
    | 'completionDate'
    | 'createdAt'
    | 'metroDistance' = 'createdAt';

  @ApiProperty({ required: false, description: 'Метро' })
  @IsOptional()
  @IsString()
  metro?: string;

  @ApiProperty({ required: false, description: 'Район' })
  @IsOptional()
  @IsString()
  district?: string;

  @ApiProperty({ required: false, description: 'Застройщик' })
  @IsOptional()
  @IsString()
  developer?: string;
//
  @ApiProperty({
    required: false,
    enum: BuildingClass,
    description: 'Класс жилья',
  })
  @IsOptional()
  @IsIn(['ECONOMY', 'COMFORT', 'BUSINESS', 'PREMIUM', 'ELITE'])
  buildingClass?: BuildingClass;

  @ApiProperty({ required: false, description: 'Минимальная цена от' })
  @IsOptional()
  @IsNumberString()
  minPrice?: string;

  @ApiProperty({ required: false, description: 'Максимальная цена от' })
  @IsOptional()
  @IsNumberString()
  maxPrice?: string;

  @ApiProperty({ required: false, description: 'Наличие парковки' })
  @IsOptional()
  @Type(() => Boolean)
  @IsBoolean()
  hasParking?: boolean;
}

// ==========================================
// COUNTRY PROPERTY DTO
// ==========================================
export class CountryPropertyPaginationDto extends BasePaginationDto {
  @ApiProperty({ default: 'createdAt', description: 'Поле для сортировки' })
  @IsOptional()
  @IsIn([
    'price',
    'pricePerM2',
    'landArea',
    'bedrooms',
    'totalFloors',
    'createdAt',
    'metroDistance',
  ])
  orderBy?:
    | 'price'
    | 'pricePerM2'
    | 'landArea'
    | 'bedrooms'
    | 'totalFloors'
    | 'createdAt'
    | 'metroDistance' = 'createdAt';

  @ApiProperty({ required: false, description: 'Метро' })
  @IsOptional()
  @IsString()
  metro?: string;

  @ApiProperty({ required: false, description: 'Минимальная цена' })
  @IsOptional()
  @IsNumberString()
  minPrice?: string;

  @ApiProperty({ required: false, description: 'Максимальная цена' })
  @IsOptional()
  @IsNumberString()
  maxPrice?: string;

  @ApiProperty({ required: false, description: 'Минимальное количество соток' })
  @IsOptional()
  @Type(() => Number)
  @Min(0)
  landAreaMin?: number;

  @ApiProperty({ required: false, description: 'Максимальное количество соток' })
  @IsOptional()
  @Type(() => Number)
  @Min(0)
  landAreaMax?: number;

  @ApiProperty({ required: false, description: 'Количество спален' })
  @IsOptional()
  @Type(() => Number)
  @Min(0)
  bedrooms?: number;
}

// ==========================================
// COMMERCIAL PROPERTY DTO
// ==========================================
export class CommercialPropertyPaginationDto extends BasePaginationDto {
  @ApiProperty({ default: 'createdAt', description: 'Поле для сортировки' })
  @IsOptional()
  @IsIn(['price', 'pricePerM2', 'area', 'createdAt', 'metroDistance'])
  orderBy?:
    | 'price'
    | 'pricePerM2'
    | 'area'
    | 'createdAt'
    | 'metroDistance' = 'createdAt';

  @ApiProperty({ required: false, description: 'Метро' })
  @IsOptional()
  @IsString()
  metro?: string;

  @ApiProperty({ required: false, description: 'Минимальная цена' })
  @IsOptional()
  @IsNumberString()
  minPrice?: string;

  @ApiProperty({ required: false, description: 'Максимальная цена' })
  @IsOptional()
  @IsNumberString()
  maxPrice?: string;

  @ApiProperty({ required: false, description: 'Минимальная площадь' })
  @IsOptional()
  @Type(() => Number)
  @Min(0)
  areaMin?: number;

  @ApiProperty({ required: false, description: 'Максимальная площадь' })
  @IsOptional()
  @Type(() => Number)
  @Min(0)
  areaMax?: number;

  @ApiProperty({ required: false, description: 'Наличие отделки' })
  @IsOptional()
  @Type(() => Boolean)
  @IsBoolean()
  hasFinishing?: boolean;

  @ApiProperty({ required: false, description: 'Назначение помещения' })
  @IsOptional()
  @IsString()
  purpose?: string;
}