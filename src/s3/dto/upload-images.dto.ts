// src/images/dto/upload-images.dto.ts
import { IsIn, IsInt, IsPositive, IsString } from 'class-validator';

export class UploadImagesDto {
  @IsIn([
    'newBuildingComplex',
    'newBuildingApartment',
    'readyApartment',
    'rentalApartment',
    'countryProperty',
    'commercialProperty',
  ])
  ownerType: string;

  @IsString()
  ownerId: string;
}