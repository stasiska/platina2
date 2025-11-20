import { Type } from 'class-transformer';
import {
  IsOptional,
  IsPositive,
  Max,
  IsIn,
  IsNumberString,
  Min,
  IsString,
} from 'class-validator';

export class RentalPaginationDto {
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
  @IsIn(['pricePerMonth', 'area', 'bedrooms', 'floor', 'createdAt'])
  orderBy?:
    | 'pricePerMonth'
    | 'area'
    | 'bedrooms'
    | 'floor'
    | 'createdAt' = 'createdAt';

  @IsOptional()
  @IsIn(['asc', 'desc'])
  order?: 'asc' | 'desc' = 'desc';

  // Фильтры
  @IsOptional()
  @IsString()
  metro?: string;

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
}