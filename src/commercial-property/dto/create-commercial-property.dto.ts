import { IsInt, IsString, IsOptional, IsBoolean, Min, IsPositive } from 'class-validator';

export class CreateCommercialPropertyDto {
  @IsString()
  title: string;

  @IsString()
  address: string;

  @IsInt()
  @IsPositive()
  price: number;

  @IsInt()
  @IsPositive()
  pricePerM2: number;

  @IsInt()
  @IsPositive()
  area: number;

  @IsBoolean()
  hasFinishing?: boolean = false;

  @IsOptional()
  @IsString()
  purpose?: string;

  @IsOptional()
  @IsString()
  metro?: string;

  @IsOptional()
  @IsInt()
  @Min(0)
  metroDistance?: number;

  @IsOptional()
  @IsString()
  description?: string;
}