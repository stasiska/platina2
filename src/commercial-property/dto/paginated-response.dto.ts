import { ApiProperty } from '@nestjs/swagger';

export class PaginatedResponseDto<T> {
  @ApiProperty({ description: 'Массив объектов' })
  data: T[];

  @ApiProperty({ description: 'Общее количество записей (для пагинации)', example: 156 })
  total: number;

  @ApiProperty({ description: 'Сколько пропущено', example: 0 })
  skip: number;

  @ApiProperty({ description: 'Сколько взято', example: 20 })
  take: number;

  constructor(data: T[], total: number, skip: number, take: number) {
    this.data = data;
    this.total = total;
    this.skip = skip;
    this.take = take;
  }
}