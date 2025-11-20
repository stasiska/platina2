import { Type } from 'class-transformer';
import {
  IsOptional,
  IsPositive,
  Max,
  IsIn,
  IsNumberString,
  Min,
} from 'class-validator';

export class ApartmentPaginationDto {
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
  @IsIn(['price', 'pricePerM2', 'area', 'floor', 'bedrooms', 'createdAt'])
  orderBy?:
    | 'price'
    | 'pricePerM2'
    | 'area'
    | 'floor'
    | 'bedrooms'
    | 'createdAt' = 'createdAt';

  @IsOptional()
  @IsIn(['asc', 'desc'])
  order?: 'asc' | 'desc' = 'desc';

  // Фильтры
  @IsOptional()
  @Type(() => Number)
  @IsPositive()
  complexId?: number;

  @IsOptional()
  @IsNumberString()
  minPrice?: string;

  @IsOptional()
  @IsNumberString()
  maxPrice?: string;

  @IsOptional()
  @Type(() => Number)
  @Min(0)
  bedrooms?: number;

  @IsOptional()
  @Type(() => Number)
  @Min(0)
  areaMin?: number;

  @IsOptional()
  @Type(() => Number)
  @Min(0)
  areaMax?: number;

  @IsOptional()
  @Type(() => Number)
  @Min(1)
  floorMin?: number;

  @IsOptional()
  @Type(() => Number)
  @Min(1)
  floorMax?: number;
}