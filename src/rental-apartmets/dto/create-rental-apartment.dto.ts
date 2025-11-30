import { ApiPropertyOptional } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import { IsInt, IsString, IsOptional, Min, IsPositive, IsNumber } from 'class-validator';

export class CreateRentalApartmentDto {
  @IsString()
  title: string;

  @IsString()
  address: string;

  @IsInt()
  @IsPositive()
  area: number;

  @IsInt()
  @IsPositive()
  pricePerMonth: number;

  @IsInt()
  @Min(0)
  bedrooms: number; // 0 = студия

  @IsInt()
  @Min(1)
  floor: number;

  @IsInt()
  @Min(1)
  totalFloors: number;

  @IsOptional()
  @IsString()
  metro?: string;

  @IsOptional()
  @IsInt()
  @Min(0)
  metroDistance?: number;

  @ApiPropertyOptional({ example: '2', description: 'Id в crm' })
  @IsOptional()
  @IsString()
  currentId?: string;
  
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
  
  

  @IsString()
  city: string;
    

  @IsOptional()
  @IsString()
  description?: string;
}