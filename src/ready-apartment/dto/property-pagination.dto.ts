import { ApiProperty } from '@nestjs/swagger';
import { Transform, Type } from 'class-transformer';
import {
  IsOptional,
  IsPositive,
  Max,
  Min,
  IsIn,
  IsString,
  IsNumberString,
  IsInt,
} from 'class-validator';

export class PropertyPaginationDto {
  @ApiProperty({ default: 0, description: 'Номер страницы' })
  @IsOptional()
  @Type(() => Number)
  @IsInt({ message: 'skip должен быть целым числом' })
  @Min(0, { message: 'skip не может быть отрицательным' })
  skip?: number = 0;

  @ApiProperty({ default: 20, description: 'Количество элементов на странице' })
  @IsOptional()
  @Type(() => Number)
  @IsPositive()
  @Max(100)
  take?: number = 20;

  @ApiProperty({ default: 'createdAt', description: 'Сортировка' })
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

  @ApiProperty({ default: 'desc', description: 'Порядок сортировки' })
  @IsOptional()
  @IsIn(['asc', 'desc'])
  order?: 'asc' | 'desc' = 'desc';

  @ApiProperty({ default: 1, description: 'Расстояние' })
  @IsOptional()
  @IsString()
  metro?: string;

  @ApiProperty({ default: 1, description: 'Цена' })
  @IsOptional()
  @IsNumberString()
  minPrice?: string;

  @ApiProperty({ default: 1, description: 'Цена' })
  @IsOptional()
  @IsNumberString()
  maxPrice?: string;

  @ApiProperty({ default: 1, description: 'Количество комнат' })
  @IsOptional()
  @Type(() => Number)
  @Min(0)
  bedrooms?: number;

  @ApiProperty({ default: 1, description: 'Площадь' })
  @IsOptional()
  @Type(() => Number)
  @Min(0)
  areaMin?: number;

  @ApiProperty({ default: 1, description: 'Площадь' })
  @IsOptional()
  @Type(() => Number)
  @Min(0)
  areaMax?: number;

  
  @IsOptional()
  @IsString()
  city?: string;
    
}