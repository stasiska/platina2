import { IsString, IsInt, IsOptional, IsBoolean, IsEnum, IsDateString } from 'class-validator';
import { BuildingClass } from 'prisma/__generated__';

export class CreateNewBuildingComplexDto {
  @IsString()
  name: string;

  @IsString()
  address: string;

  @IsOptional()
  @IsString()
  district?: string;

  @IsOptional()
  @IsString()
  metro?: string;

  @IsOptional()
  @IsInt()
  metroDistance?: number;

  @IsString()
  developer: string;

  @IsInt()
  priceFrom: number;

  @IsOptional()
  @IsInt()
  areaFrom?: number;

  @IsEnum(BuildingClass)
  buildingClass: BuildingClass;

  @IsOptional()
  @IsInt()
  floors?: number;

  @IsOptional()
  @IsInt()
  totalApartments?: number;

  @IsOptional()
  @IsInt()
  availableApartments?: number;

  @IsOptional()
  @IsDateString()
  completionDate?: string; // ISO string, напр. "2026-12-01T00:00:00.000Z"

  @IsOptional()
  @IsInt()
  height?: number;

  @IsBoolean()
  hasParking?: boolean = false;

  @IsOptional()
  @IsString()
  description?: string;
}