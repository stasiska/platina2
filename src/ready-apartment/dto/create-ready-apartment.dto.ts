import { ApiProperty } from '@nestjs/swagger';
import {
  IsString,
  IsInt,
  IsOptional,
  IsNumber,
  Min,
  IsBoolean,
} from 'class-validator';

export class CreateReadyApartmentDto {
  @ApiProperty({ example: '2-комнатная квартира в сталинке' })
  @IsString()
  title: string;

  @ApiProperty({ example: 'ЖК "Ривер Парк"' })
  @IsOptional()
  @IsString()
  complexName?: string;

  @ApiProperty({ example: 'Москва, ул. Речная, д. 7' })
  @IsString()
  address: string;

  @ApiProperty({ example: 78, description: 'Площадь в м²' })
  @IsInt()
  @Min(1)
  area: number;

  @ApiProperty({ example: 38500000, description: 'Полная цена' })
  @IsInt()
  @Min(0)
  price: number;

  @ApiProperty({ example: 493589, description: 'Цена за м²' })
  @IsInt()
  @Min(0)
  pricePerM2: number;

  @ApiProperty({ example: 2, description: 'Количество комнат (0 = студия)' })
  @IsInt()
  @Min(0)
  bedrooms: number; 

  @ApiProperty({ example: 5, description: 'Этаж' })
  @IsInt()
  @Min(1)
  floor: number;

  @ApiProperty({ example: 2, description: 'Количество этажей' })
  @IsInt()
  @Min(1)
  totalFloors: number;

  @ApiProperty({ example: 'ПИК', description: 'Застройщик' })
  @IsString()
  developer?: string;
  
  @ApiProperty({ example: 'Деловой центр', description: 'Ближайшее метро', nullable: true })
  @IsOptional()
  @IsString()
  metro?: string;

  @ApiProperty({ example: 8, description: 'Расстояние до метро пешком (в минутах)', nullable: true })
  @IsOptional()
  @IsInt()
  @Min(0)
  metroDistance?: number;

  @ApiProperty({ example: 'Возможна сдача', description: 'Описание' })
  @IsOptional()
  @IsString()
  description?: string;
}