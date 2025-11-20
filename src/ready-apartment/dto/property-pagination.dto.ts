import { Transform, Type } from 'class-transformer';
import {
  IsOptional,
  IsPositive,
  Max,
  Min,
  IsIn,
  IsString,
  IsNumberString,
} from 'class-validator';

export class PropertyPaginationDto {
  // Пагинация
  @IsOptional()
  @Type(() => Number)
  @IsPositive()
  skip?: number = 0;

  @IsOptional()
  @Type(() => Number)
  @IsPositive()
  @Max(100)
  take?: number = 20;

  // Сортировка — теперь любые поля!
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

  @IsOptional()
  @IsIn(['asc', 'desc'])
  order?: 'asc' | 'desc' = 'desc';

  // Фильтры (общие для всех)
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