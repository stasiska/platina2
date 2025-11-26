import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsInt, Min, IsPositive, IsString, IsNumber, IsOptional, IsIn } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateNewBuildingApartmentDto {
  @ApiProperty({ example: 3, description: 'ID жилого комплекса' })
  @IsInt()
  @IsPositive()
  complexId: number;

  @ApiProperty({ example: 2, description: 'Количество комнат (0 = студия)' })
  @IsInt()
  @Min(0)
  bedrooms: number;

  @ApiPropertyOptional({ example: 55.751244, description: 'Широта' })
  @IsOptional()
  @Type(() => Number)
  @IsNumber()
  lat?: number;

  @ApiPropertyOptional({ example: 37.618423, description: 'Долгота' })
  @IsOptional()
  @Type(() => Number)
  @IsNumber()
  lng?: number;

  @ApiProperty({ example: 68, description: 'Площадь в м²' })
  @IsInt()
  @Min(1)
  area: number;

  @ApiPropertyOptional({ example: 'Москва', description: 'Город' })
  @IsOptional()
  @IsString()
  city?: string;

  @ApiProperty({ example: 18500000, description: 'Полная цена' })
  @IsInt()
  @Min(0)
  price: number;

  @ApiProperty({ example: 272058, description: 'Цена за м²' })
  @IsInt()
  @Min(0)
  pricePerM2: number;

  @ApiProperty({ example: 12, description: 'Этаж' })
  @IsInt()
  @Min(1)
  floor: number;

  @ApiProperty({ example: 25, description: 'Всего этажей в доме' })
  @IsInt()
  @Min(1)
  totalFloors: number;


 
  @ApiProperty({ example: 'студия', description: 'Тип квартиры (студия, 1-комнатная, 2-комнатная и т.д.)' })
  @IsIn([
    'readyApartment',
    'rentalApartment',
    'countryProperty',
    'commercialProperty',
  ])
  type: string;

  @ApiPropertyOptional({ example: 6.5, description: 'Ширина помещения в метрах' })
  @IsOptional()
  @Type(() => Number)
  @IsNumber()
  width?: number;

  @ApiPropertyOptional({ example: 3.2, description: 'Высота потолков в метрах' })
  @IsOptional()
  @Type(() => Number)
  @IsNumber()
  height?: number;
}