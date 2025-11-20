import { IsInt, IsString, IsOptional, Min, IsPositive } from 'class-validator';

export class CreateCountryPropertyDto {
  @IsString()
  title: string;

  @IsString()
  address: string;

  @IsInt()
  @IsPositive()
  price: number;

  @IsInt()
  @IsPositive()
  landArea: number; // сотки

  @IsInt()
  @Min(0)
  bedrooms: number;

  @IsInt()
  @Min(1)
  totalFloors: number;

  @IsInt()
  @IsPositive()
  pricePerM2: number;

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