import { ApiProperty } from '@nestjs/swagger';

class ImageResponseDto {
  @ApiProperty({ example: 1024, description: 'ID изображения' })
  id: number;

  @ApiProperty({
    example: 'https://9c9a241d-...selstorage.ru/images/rental-2bed.jpg',
    description: 'Прямой URL изображения',
  })
  url: string;

  @ApiProperty({ example: '2025-11-20T17:00:00.000Z' })
  createdAt: string;
}

export class RentalApartmentResponseDto {
  @ApiProperty({ example: 89, description: 'ID объявления' })
  id: number;

  @ApiProperty({ example: 'Светлая 2-комнатная квартира у метро', description: 'Заголовок' })
  title: string;

  @ApiProperty({ example: 'Москва, ул. Ленинская, д. 25, кв. 87', description: 'Полный адрес' })
  address: string;

  @ApiProperty({ example: 65, description: 'Площадь в м²' })
  area: number;

  @ApiProperty({ example: 95000, description: 'Стоимость аренды в месяц (руб)' })
  pricePerMonth: number;

  @ApiProperty({ example: 2, description: 'Количество комнат (0 = студия)' })
  bedrooms: number;

  @ApiProperty({ example: 8, description: 'Этаж' })
  floor: number;

  @ApiProperty({ example: 17, description: 'Всего этажей в доме' })
  totalFloors: number;

  @ApiProperty({ example: 'Таганская', description: 'Ближайшее метро', nullable: true })
  metro: string | null;

  @ApiProperty({ example: 4, description: 'Расстояние до метро пешком (в минутах)', nullable: true })
  metroDistance: number | null;

  @ApiProperty({
    example: 'Сдаётся впервые! Евроремонт, мебель, техника. Без животных.',
    description: 'Подробное описание',
    nullable: true,
  })
  description: string | null;

  @ApiProperty({ type: [ImageResponseDto], description: 'Фотографии квартиры' })
  images: ImageResponseDto[];

  @ApiProperty({ example: '2025-11-20T17:00:00.000Z', description: 'Дата создания' })
  createdAt: string;

  city: string;
    

  @ApiProperty({ example: '2025-11-20T17:30:00.000Z', description: 'Дата обновления' })
  updatedAt: string;
}