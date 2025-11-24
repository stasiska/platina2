import { ApiProperty } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import {
  IsOptional,
  IsPositive,
  Max,
  IsIn,
  IsNumberString,
  Min,
  IsString,
  IsInt,
} from 'class-validator';

export class CountryPaginationDto {

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

  @ApiProperty({
    default: 'createdAt',
    description: 'Поле для сортировки',
    enum: ['price', 'pricePerM2', 'landArea', 'bedrooms', 'totalFloors', 'createdAt'],
  })
  @IsOptional()
  @IsIn(['price', 'pricePerM2', 'landArea', 'bedrooms', 'totalFloors', 'createdAt'])
  orderBy?:
    | 'price'
    | 'pricePerM2'
    | 'landArea'
    | 'bedrooms'
    | 'totalFloors'
    | 'createdAt' = 'createdAt';

  @ApiProperty({
    default: 'desc',
    description: 'Направление сортировки',
    enum: ['asc', 'desc'],
  })
  @IsOptional()
  @IsIn(['asc', 'desc'])
  order?: 'asc' | 'desc' = 'desc';

  @ApiProperty({ default: 'dalala', description: 'Поиск по названию' })
  @IsOptional()
  @IsString()
  title?: string;
  @IsOptional()
  @IsString()
  
  @ApiProperty({ default: 'dfdfd', description: 'Поиск по адресу metro' })
  metro?: string;

  @ApiProperty({ default: 0, description: 'Минимальная цена' })
  @IsOptional()
  @IsNumberString()
  minPrice?: string;

  @ApiProperty({ default: 0, description: 'Максимальная цена' })
  @IsOptional()
  @IsNumberString()
  maxPrice?: string;

  @ApiProperty({ default: 0, description: 'Количество комнат' })
  @IsOptional()
  @Type(() => Number)
  @Min(0)
  bedrooms?: number;

  @IsOptional()
  @IsString()
  city?: string;
  
  @ApiProperty({ default: 0, description: 'Минимальная площадь участка' })
  @IsOptional()
  @Type(() => Number)
  @Min(1)
  landAreaMin?: number;

  @ApiProperty({ default: 0, description: 'Максимальная площадь участка' })
  @IsOptional()
  @Type(() => Number)
  landAreaMax?: number;
}