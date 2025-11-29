import { Type } from 'class-transformer';
import {
  IsOptional,
  IsPositive,
  Max,
  IsIn,
  IsNumberString,
  Min,
  IsBooleanString,
  IsString,
  IsInt,
} from 'class-validator';

export class CommercialPaginationDto {
  @IsOptional()
  @Type(() => Number)
  @IsInt({ message: 'skip должен быть целым числом' })
  @Min(0, { message: 'skip не может быть отрицательным' })
  skip?: number = 0;

  @IsOptional()
  @Type(() => Number)
  @IsPositive()
  @Max(100)
  take?: number = 20;

  @IsOptional()
  @IsIn(['price', 'pricePerM2', 'area', 'createdAt'])
  orderBy?: 'price' | 'pricePerM2' | 'area' | 'createdAt' = 'createdAt';

  @IsOptional()
  @IsIn(['asc', 'desc'])
  order?: 'asc' | 'desc' = 'desc';

  // Фильтры
  @IsOptional()
  @IsNumberString()
  minPrice?: string;

  @IsOptional()
  @IsNumberString()
  maxPrice?: string;

  @IsOptional()
  @Type(() => Number)
  @Min(1)
  areaMin?: number;

  @IsOptional()
  @Type(() => Number)
  @Min(1)
  areaMax?: number;

  @IsOptional()
  @IsString()
  currentId?: string;

  @IsOptional()
  @IsBooleanString()
  hasFinishing?: string;

  @IsOptional()
  @IsString()
  purpose?: string;

  @IsOptional()
  @IsString()
  metro?: string;

  @IsOptional()
  @IsString()
  city?: string;
}