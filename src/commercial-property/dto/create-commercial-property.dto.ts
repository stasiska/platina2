import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsInt, IsString, IsOptional, IsBoolean, Min, IsPositive, IsNumber } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateCommercialPropertyDto {
  @ApiProperty({ description: 'Название объекта', example: 'Офис в БЦ "Северная башня"' })
  @IsString()
  title: string;

  @ApiProperty({ description: 'Адрес', example: 'Москва, Ленинградский пр-т, д. 37' })
  @IsString()
  address: string;

  @IsString()
  city: string;

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

  @ApiProperty({ example: '2', description: 'Id в crm', })
  @IsOptional()
  @IsString()
  currentId?: string;


  @ApiProperty({ description: 'Полная цена', example: 48500000 })
  @IsInt()
  @IsPositive()
  price: number;

  @ApiProperty({ description: 'Цена за м²', example: 404167 })
  @IsInt()
  @IsPositive()
  pricePerM2: number;

  @ApiProperty({ description: 'Площадь в м²', example: 120 })
  @IsInt()
  @IsPositive()
  area: number;

  @ApiProperty({ description: 'Есть ли отделка', default: false })
  @IsBoolean()
  hasFinishing?: boolean = false;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  purpose?: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  metro?: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsInt()
  @Min(0)
  metroDistance?: number;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  description?: string;
}
