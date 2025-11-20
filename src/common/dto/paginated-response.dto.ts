// src/common/dto/paginated-response.dto.ts
import { ApiProperty } from '@nestjs/swagger';

export class PaginatedResponseDto<T> {
  @ApiProperty({
    description: 'Массив объектов (зависит от эндпоинта)',
    type: 'array',
    items: { type: 'object' }, // будет переопределён в конкретных контроллерах
  })
  data: T[];

  @ApiProperty({
    description: 'Общее количество записей в базе (для пагинации)',
    example: 156,
  })
  total: number;

  @ApiProperty({
    description: 'Сколько записей пропущено (для текущей страницы)',
    example: 0,
  })
  skip: number;

  @ApiProperty({
    description: 'Сколько записей возвращено в текущем запросе',
    example: 20,
  })
  take: number;

  constructor(data: T[], total: number, skip: number, take: number) {
    this.data = data;
    this.total = total;
    this.skip = skip;
    this.take = take;
  }
}