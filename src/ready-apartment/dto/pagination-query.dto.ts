import { ApiProperty } from '@nestjs/swagger';
import { Transform, Type } from 'class-transformer';
import {
  IsOptional,
  IsPositive,
  IsIn,
  Max,
  Min,
  IsInt,
} from 'class-validator';

export class PaginationQueryDto {
  @ApiProperty({ example: 0, description: 'Номер страницы' })
  @IsOptional()
  @Type(() => Number)
  @IsInt({ message: 'skip должен быть целым числом' })
  @Min(0, { message: 'skip не может быть отрицательным' })
  skip?: number = 0;

  @ApiProperty({ example: 20, description: 'Количество элементов на странице' })
  @IsOptional()
  @Type(() => Number)
  @IsPositive()
  @Max(100)
  @Transform(({ value }) => parseInt(value, 10))
  take?: number = 20;

  @ApiProperty({ example: 'createdAt', description: 'Сортировка' })
  @IsOptional()
  @IsIn(['price', 'area', 'createdAt', 'pricePerM2'] as const)
  orderBy?: 'price' | 'area' | 'createdAt' | 'pricePerM2' = 'createdAt';

  @ApiProperty({ example: 'desc', description: 'Порядок сортировки' })
  @IsOptional()
  @IsIn(['asc', 'desc'] as const)
  order?: 'asc' | 'desc' = 'desc';
}