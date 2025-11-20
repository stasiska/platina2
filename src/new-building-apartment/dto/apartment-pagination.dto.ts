import { ApiProperty } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import {
  IsOptional,
  IsPositive,
  Max,
  IsIn,
  IsNumberString,
  Min,
  IsInt,
} from 'class-validator';

export class ApartmentPaginationDto {
  @ApiProperty({ default: 0, description: 'Номер страницы'}, )
  @IsOptional()
  @Type(() => Number)
  @IsInt({ message: 'skip должен быть целым числом' })
  @Min(0, { message: 'skip не может быть отрицательным' })
  skip?: number = 0;

  @ApiProperty({ default: 20, description: 'Количество элементов на странице'}, )
  @IsOptional()
  @Type(() => Number)
  @IsPositive()
  @Max(100)
  take?: number = 20;

  @ApiProperty({ default: 'createdAt', description: 'Сортировка'}, )
  @IsOptional()
  @IsIn(['price', 'pricePerM2', 'area', 'floor', 'bedrooms', 'createdAt'])
  orderBy?:
    | 'price'
    | 'pricePerM2'
    | 'area'
    | 'floor'
    | 'bedrooms'
    | 'createdAt' = 'createdAt';

  @ApiProperty({ default: 'desc', description: 'Порядок сортировки'}, )
  @IsOptional()
  @IsIn(['asc', 'desc'])
  order?: 'asc' | 'desc' = 'desc';

  @ApiProperty({ default: 1, description: 'ID комплекса'}, )
  @IsOptional()
  @Type(() => Number)
  @IsPositive()
  complexId?: number;

  @ApiProperty({ default: 0, description: 'Минимальная цена'}, )
  @IsOptional()
  @IsNumberString()
  minPrice?: string;

  @ApiProperty({ default: 0, description: 'Максимальная цена'}, )
  @IsOptional()
  @IsNumberString()
  maxPrice?: string;

  @ApiProperty({ default: 0, description: 'Количество комнат'}, )
  @IsOptional()
  @Type(() => Number)
  @Min(0)
  bedrooms?: number;

  @ApiProperty({ default: 0, description: 'Минимальная площадь'}, )
  @IsOptional()
  @Type(() => Number)
  @Min(0)
  areaMin?: number;

  @ApiProperty({ default: 0, description: 'Максимальная площадь'}, )
  @IsOptional()
  @Type(() => Number)
  @Min(0)
  areaMax?: number;

  @ApiProperty({ default: 0, description: 'Минимальный этаж'}, )
  @IsOptional()
  @Type(() => Number)
  @Min(1)
  floorMin?: number;

  @ApiProperty({ default: 0, description: 'Максимальный этаж'}, )
  @IsOptional()
  @Type(() => Number)
  @Min(1)
  floorMax?: number;
}