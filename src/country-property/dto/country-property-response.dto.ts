import { ApiProperty } from '@nestjs/swagger';

class ImageResponseDto {
  @ApiProperty({ example: 892, description: 'ID изображения' })
  id: number;

  @ApiProperty({
    example: 'https://9c9a241d-...selstorage.ru/images/kottedzh-1.jpg',
    description: 'Прямой URL изображения',
  })
  url: string;

  @ApiProperty({ example: '2025-11-20T12:00:00.000Z', description: 'Дата загрузки' })
  createdAt: string;
}

export class CountryPropertyResponseDto {
  @ApiProperty({ example: 7, description: 'ID объекта' })
  id: number;

  @ApiProperty({ example: 'Коттедж в Истринском районе', description: 'Название объекта' })
  title: string;

  @ApiProperty({ example: 'МО, Истринский р-н, д. Ламишино', description: 'Полный адрес' })
  address: string;

  @ApiProperty({ example: 48500000, description: 'Полная стоимость в рублях' })
  price: number;

  @ApiProperty({ example: 15, description: 'Площадь участка в сотках' })
  landArea: number;

  @ApiProperty({ example: 55.751244, description: 'Широта' })
  lat: number;

  @ApiProperty({ example: 37.618423, description: 'Долгота' })
  lng: number;

  city: string;

  @ApiProperty({ example: 5, description: 'Количество спален' })
  bedrooms: number;

  @ApiProperty({ example: 2, description: 'Количество этажей' })
  totalFloors: number;

  @ApiProperty({ example: 185000, description: 'Цена за м² дома' })
  pricePerM2: number;

  @ApiProperty({ example: 'Мякинино', description: 'Ближайшее метро', nullable: true })
  metro: string | null;

  @ApiProperty({ example: 45, description: 'Расстояние до метро на машине (в минутах)', nullable: true })
  metroDistance: number | null;

  @ApiProperty({
    example: 'Кирпичный дом 260 м² с баней и гаражом. Участок 15 соток ИЖС. Все коммуникации.',
    description: 'Подробное описание',
    nullable: true,
  })
  description: string | null;

  @ApiProperty({ type: [ImageResponseDto], description: 'Фотографии объекта' })
  images: ImageResponseDto[];

  @ApiProperty({ example: '2025-11-20T12:00:00.000Z', description: 'Дата создания' })
  createdAt: string;

  @ApiProperty({ example: '2025-11-20T12:30:00.000Z', description: 'Дата обновления' })
  updatedAt: string;
}