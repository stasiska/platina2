import { ApiProperty } from '@nestjs/swagger';

class ImageResponseDto {
  @ApiProperty({ example: 123, description: 'ID изображения' })
  id: number;

  @ApiProperty({
    example: 'https://9c9a241d-...selstorage.ru/images/abc123.jpg',
    description: 'Прямой URL изображения',
  })
  url: string;

  @ApiProperty({ example: '2025-11-20T10:05:55.590Z', description: 'Дата загрузки' })
  createdAt: string;
}

export class CommercialPropertyResponseDto {
  @ApiProperty({ example: 1, description: 'ID объекта' })
  id: number;

  @ApiProperty({ example: 'Офис 120 м² в БЦ класс А', description: 'Название объекта' })
  title: string;

  @ApiProperty({ example: 'Москва, Ленинградский пр-т, д. 37', description: 'Полный адрес' })
  address: string;

  @ApiProperty({ example: 48500000, description: 'Полная стоимость объекта в рублях' })
  price: number;

  @ApiProperty({ example: 404167, description: 'Цена за м²' })
  pricePerM2: number;

  @ApiProperty({ example: 120, description: 'Площадь в м²' })
  area: number;

  @ApiProperty({ example: true, description: 'Есть ли отделка' })
  hasFinishing: boolean;

  @ApiProperty({ example: 'офис', description: 'Назначение помещения', nullable: true })
  purpose: string | null;

  @ApiProperty({ example: 'Аэропорт', description: 'Ближайшая станция метро', nullable: true })
  metro: string | null;

  lat: number;
  lng: number;

  city: string;
  @ApiProperty({ example: 5, description: 'Расстояние до метро пешком (в минутах)', nullable: true })
  metroDistance: number | null;

  @ApiProperty({
    example: 'Светлый офис с ремонтом, 3 кабинета, своя мокая точка.',
    description: 'Подробное описание',
    nullable: true,
  })
  description: string | null;

  @ApiProperty({ type: [ImageResponseDto], description: 'Массив изображений объекта' })
  images: ImageResponseDto[];

  @ApiProperty({ example: '2025-11-20T10:05:55.590Z', description: 'Дата создания' })
  createdAt: string;

  @ApiProperty({ example: '2025-11-20T10:05:55.590Z', description: 'Дата последнего обновления' })
  updatedAt: string;
}