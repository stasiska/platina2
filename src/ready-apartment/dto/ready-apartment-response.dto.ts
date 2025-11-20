// src/ready-apartments/dto/ready-apartment-response.dto.ts
import { ApiProperty } from '@nestjs/swagger';

class ImageResponseDto {
  @ApiProperty({ example: 987, description: 'ID изображения' })
  id: number;

  @ApiProperty({
    example: 'https://9c9a241d-...selstorage.ru/images/apartment-secondary.jpg',
    description: 'Прямой URL изображения',
  })
  url: string;

  @ApiProperty({ example: '2025-11-20T16:00:00.000Z' })
  createdAt: string;
}

export class ReadyApartmentResponseDto {
  @ApiProperty({ example: 156, description: 'ID квартиры' })
  id: number;

  @ApiProperty({ example: '2-комнатная квартира в сталинке', description: 'Заголовок объявления' })
  title: string;

  @ApiProperty({ example: 'ЖК "Алые паруса"', description: 'Название комплекса (если есть)', nullable: true })
  complexName: string | null;

  @ApiProperty({ example: 'Москва, ул. Пресненская наб., д. 8', description: 'Полный адрес' })
  address: string;

  @ApiProperty({ example: 78, description: 'Площадь в м²' })
  area: number;

  @ApiProperty({ example: 38500000, description: 'Полная цена' })
  price: number;

  @ApiProperty({ example: 493589, description: 'Цена за м²' })
  pricePerM2: number;

  @ApiProperty({ example: 2, description: 'Количество комнат (0 = студия)' })
  bedrooms: number;

  @ApiProperty({ example: 5, description: 'Этаж' })
  floor: number;

  @ApiProperty({ example: 12, description: 'Всего этажей в доме' })
  totalFloors: number;

  @ApiProperty({ example: 'Деловой центр', description: 'Ближайшее метро', nullable: true })
  metro: string | null;

  @ApiProperty({ example: 3, description: 'Расстояние до метро (в минутах пешком)', nullable: true })
  metroDistance: number | null;

  @ApiProperty({
    example: 'Светлая квартира с ремонтом от дизайнера. Вид на реку. 2 санузла.',
    description: 'Подробное описание',
    nullable: true,
  })
  description: string | null;

  @ApiProperty({ type: [ImageResponseDto], description: 'Фотографии квартиры' })
  images: ImageResponseDto[];

  @ApiProperty({ example: '2025-11-20T16:00:00.000Z' })
  createdAt: string;

  @ApiProperty({ example: '2025-11-20T16:45:00.000Z' })
  updatedAt: string;
}