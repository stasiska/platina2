import {
  IsString,
  IsInt,
  IsOptional,
  IsNumber,
  Min,
  IsBoolean,
} from 'class-validator';

export class CreateReadyApartmentDto {
  @IsString()
  title: string;

  @IsOptional()
  @IsString()
  complexName?: string;

  @IsString()
  address: string;

  @IsInt()
  @Min(1)
  area: number;

  @IsInt()
  @Min(0)
  price: number;

  @IsInt()
  @Min(0)
  pricePerM2: number;

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