import { ApiProperty } from '@nestjs/swagger';
import { IsInt, IsString, IsOptional, Min, IsPositive } from 'class-validator';

export class CreateCountryPropertyDto {
  @ApiProperty({ example: 'Коттедж в Истринском районе', description: 'Название объекта' })
  @IsString()
  title: string;

  @ApiProperty({ example: 'МО, Истринский р-н, д. Ламишино', description: 'Полный адрес' })
  @IsString()
  address: string;

  @ApiProperty({ example: 48500000, description: 'Полная стоимость в рублях' })
  @IsInt()
  @IsPositive()
  price: number;

  @ApiProperty({ example: 15, description: 'Площадь участка в сотках' })
  @IsInt()
  @IsPositive()
  landArea: number; 

  @IsString()
  city: string;
  
  @ApiProperty({ example: 5, description: 'Количество спален' })
  @IsInt()
  @Min(0)
  bedrooms: number;

  @ApiProperty({ example: 2, description: 'Количество этажей' })
  @IsInt()
  @Min(1)
  totalFloors: number;

  @ApiProperty({ example: 185000, description: 'Цена за м² дома' })
  @IsInt()
  @IsPositive()
  pricePerM2: number;

  @ApiProperty({ example: 'Мякинино', description: 'Ближайшее метро', nullable: true })
  @IsOptional()
  @IsString()
  metro?: string;

  @ApiProperty({ example: 45, description: 'Расстояние до метро на машине (в минутах)', nullable: true })
  @IsOptional()
  @IsInt()
  @Min(0)
  metroDistance?: number;

  
  @ApiProperty({ example: 'Коттедж в Истринском районе', description: 'Описание объекта', nullable: true })
  @IsOptional()
  @IsString()
  description?: string;
}