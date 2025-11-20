import { Type } from 'class-transformer';
import {
  IsOptional,
  IsPositive,
  Max,
  IsIn,
  IsString,
  IsNumberString,
  IsEnum,
} from 'class-validator';
import { BuildingClass } from 'prisma/__generated__';

export class PropertyPaginationDto {
  @IsOptional()
  @Type(() => Number)
  @IsPositive()
  skip?: number = 0;

  @IsOptional()
  @Type(() => Number)
  @IsPositive()
  @Max(100)
  take?: number = 20;

  @IsOptional()
  @IsIn([
    'priceFrom',
    'areaFrom',
    'createdAt',
    'completionDate',
    'availableApartments',
    'buildingClass',
  ] as const)
  orderBy?:
    | 'priceFrom'
    | 'areaFrom'
    | 'createdAt'
    | 'completionDate'
    | 'availableApartments'
    | 'buildingClass' = 'createdAt';

  @IsOptional()
  @IsIn(['asc', 'desc'])
  order?: 'asc' | 'desc' = 'desc';

  // Фильтры для ЖК
  @IsOptional()
  @IsString()
  metro?: string;

  @IsOptional()
  @IsString()
  district?: string;

  @IsOptional()
  @IsString()
  developer?: string;

  @IsOptional()
  @IsEnum(BuildingClass)
  buildingClass?: BuildingClass;

  @IsOptional()
  @IsNumberString()
  minPrice?: string;

  @IsOptional()
  @IsNumberString()
  maxPrice?: string;

  @IsOptional()
  @IsIn(['true', 'false', true, false, '1', '0'])
  hasParking?: string | boolean;
}