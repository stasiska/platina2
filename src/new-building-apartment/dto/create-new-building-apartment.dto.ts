import { IsInt, Min, IsPositive } from 'class-validator';

export class CreateNewBuildingApartmentDto {
  @IsInt()
  @IsPositive()
  complexId: number;

  @IsInt()
  @Min(0)
  bedrooms: number; // 0 = студия

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
  @Min(1)
  floor: number;
}