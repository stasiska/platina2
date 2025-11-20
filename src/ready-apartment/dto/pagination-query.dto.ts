import { Transform, Type } from 'class-transformer';
import {
  IsOptional,
  IsPositive,
  IsIn,
  Max,
  Min,
} from 'class-validator';

export class PaginationQueryDto {
  @IsOptional()
  @Type(() => Number)
  @IsPositive()
  @Transform(({ value }) => parseInt(value, 10))
  skip?: number = 0;

  @IsOptional()
  @Type(() => Number)
  @IsPositive()
  @Max(100)
  @Transform(({ value }) => parseInt(value, 10))
  take?: number = 20;

  @IsOptional()
  @IsIn(['price', 'area', 'createdAt', 'pricePerM2'] as const)
  orderBy?: 'price' | 'area' | 'createdAt' | 'pricePerM2' = 'createdAt';

  @IsOptional()
  @IsIn(['asc', 'desc'] as const)
  order?: 'asc' | 'desc' = 'desc';
}