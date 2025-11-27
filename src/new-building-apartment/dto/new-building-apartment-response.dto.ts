import { ApiProperty } from '@nestjs/swagger';

class ImageResponseDto {
  @ApiProperty({ example: 124, description: 'ID изображения' })
  id: number;

  @ApiProperty({
    example: 'https://9c9a241d-...selstorage.ru/images/apartment-3-124.jpg',
    description: 'Прямой URL изображения',
  })
  url: string;

  @ApiProperty({ example: '2025-11-20T14:00:00.000Z', description: 'Дата загрузки' })
  createdAt: string;
}

class ComplexInfoDto {
  @ApiProperty({ example: 3, description: 'ID жилого комплекса' })
  id: number;

  @ApiProperty({ example: 'ЖК "Ривер Парк"', description: 'Название ЖК' })
  name: string;

  @ApiProperty({ example: 'Москва, ул. Речная, д. 7', description: 'Адрес ЖК' })
  address: string;
}

export class NewBuildingApartmentResponseDto {
  @ApiProperty({ example: 42, description: 'ID квартиры' })
  id: number;

  @ApiProperty({ example: 3, description: 'ID жилого комплекса' })
  complexId: number;

  @ApiProperty({ type: ComplexInfoDto, description: 'Краткая информация о ЖК' })
  complex: ComplexInfoDto;

  @ApiProperty({ example: 2, description: 'Количество комнат (0 = студия)' })
  bedrooms: number;

  apartmentNumber: number;

  title: string; 

  @ApiProperty({ example: 55.751244, description: 'Широта' })
  lat: number;

  @ApiProperty({ example: 37.618423, description: 'Долгота' })
  lng: number;

  city: string;

  @ApiProperty({ example: 68, description: 'Площадь в м²' })
  area: number;

  @ApiProperty({ example: 18500000, description: 'Полная цена квартиры' })
  price: number;

  @ApiProperty({ example: 272058, description: 'Цена за м²' })
  pricePerM2: number;

  @ApiProperty({ example: 12, description: 'Этаж' })
  floor: number;

  @ApiProperty({ type: [ImageResponseDto], description: 'Фотографии квартиры' })
  images: ImageResponseDto[];

  @ApiProperty({ example: '2025-11-20T14:00:00.000Z', description: 'Дата создания' })
  createdAt: string;

  @ApiProperty({ example: '2025-11-20T14:30:00.000Z', description: 'Дата обновления' })
  updatedAt: string;
}