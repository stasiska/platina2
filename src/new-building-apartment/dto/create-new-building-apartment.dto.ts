import { ApiProperty } from '@nestjs/swagger';
import { IsInt, Min, IsPositive, IsString } from 'class-validator';

export class CreateNewBuildingApartmentDto {
  @ApiProperty({ example: 3, description: 'ID жилого комплекса' })
  @IsInt()
  @IsPositive()
  complexId: number;

  @ApiProperty({ example: 2, description: 'Количество комнат (0 = студия)' })
  @IsInt()
  @Min(0)
  bedrooms: number;

  @ApiProperty({ example: 68, description: 'Площадь в м²' })
  @IsInt()
  @Min(1)
  area: number;

  @IsString()
  city: string;
      
  @ApiProperty({ example: 18500000, description: 'Полная цена' })
  @IsInt()
  @Min(0)
  price: number;

  @ApiProperty({ example: 272058, description: 'Цена за м²' })
  @IsInt()
  @Min(0)
  pricePerM2: number;

  @ApiProperty({ example: 12, description: 'Этаж' })
  @IsInt()
  @Min(1)
  floor: number;
}