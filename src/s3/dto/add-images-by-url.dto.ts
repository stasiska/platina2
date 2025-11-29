import { ApiProperty } from '@nestjs/swagger';
import { IsArray, IsIn, IsString, IsUrl, ArrayMinSize, IsNumber } from 'class-validator';

type OwnerType =
  | 'newBuildingComplex'
  | 'newBuildingApartment'
  | 'readyApartment'
  | 'rentalApartment'
  | 'countryProperty'
  | 'commercialProperty';

export class AddImagesByUrlDto {
  @ApiProperty({
    example: 'readyApartment',
    enum: [
      'newBuildingComplex',
      'newBuildingApartment',
      'readyApartment',
      'rentalApartment',
      'countryProperty',
      'commercialProperty',
    ],
    description: 'Тип объекта',
  })
  @IsString()
  @IsIn([
    'newBuildingComplex',
    'newBuildingApartment',
    'readyApartment',
    'rentalApartment',
    'countryProperty',
    'commercialProperty',
  ])
  ownerType: OwnerType;

  @ApiProperty({
    example: 1,
    description: 'ID объекта',
  })
  @IsNumber()
  ownerId: number;

  @ApiProperty({
    example: [
      'https://example.com/image1.jpg',
      'https://example.com/image2.png',
    ],
    description: 'Массив URL изображений',
    type: [String],
  })
  @IsArray()
  @ArrayMinSize(1, { message: 'Необходимо передать хотя бы один URL' })
  @IsUrl({}, { each: true, message: 'Каждый элемент должен быть валидным URL' })
  urls: string[];
}