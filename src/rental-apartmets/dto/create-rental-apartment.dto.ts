import { IsInt, IsString, IsOptional, Min, IsPositive } from 'class-validator';

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

  @IsOptional()
  @IsString()
  description?: string;
}