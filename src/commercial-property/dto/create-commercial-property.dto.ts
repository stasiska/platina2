import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsInt, IsString, IsOptional, IsBoolean, Min, IsPositive } from 'class-validator';

export class CreateCommercialPropertyDto {
  @ApiProperty({ description: 'Название объекта', example: 'Офис в БЦ "Северная башня"' })
  @IsString()
  title: string;

  @ApiProperty({ description: 'Адрес', example: 'Москва, Ленинградский пр-т, д. 37' })
  @IsString()
  address: string;

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

  @ApiPropertyOptional({ description: 'Назначение', example: 'офис' })
  @IsOptional()
  @IsString()
  purpose?: string;

  @ApiPropertyOptional({ description: 'Ближайшее метро', example: 'Аэропорт' })
  @IsOptional()
  @IsString()
  metro?: string;

  @ApiPropertyOptional({ description: 'Расстояние до метро в минутах', example: 5 })
  @IsOptional()
  @IsInt()
  @Min(0)
  metroDistance?: number;

  @ApiPropertyOptional({ description: 'Описание', example: 'Светлый офис с ремонтом...' })
  @IsOptional()
  @IsString()
  description?: string;
}