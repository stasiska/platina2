import { ApiProperty } from '@nestjs/swagger';
import { IsInt, IsOptional, IsString, Max, Min } from 'class-validator';

export class CreateReviewDto {
  @ApiProperty({ example: 'Алексей', required: false })
  @IsOptional()
  @IsString()
  authorName?: string;

  @ApiProperty({ example: 5, description: 'Оценка от 1 до 5' })
  @IsInt()
  @Min(1)
  @Max(5)
  rating: number;

  @ApiProperty({ example: 'Отличный сервис! Быстро нашли квартиру мечты', required: false })
  @IsOptional()
  @IsString()
  comment?: string;
}