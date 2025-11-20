import { PaginatedResponseDto } from 'src/common/dto/paginated-response.dto';
import { NewBuildingComplexResponseDto } from './new-building-complex-response.dto';
import { ApiProperty } from '@nestjs/swagger';

export class NewBuildingComplexPaginatedResponseDto extends PaginatedResponseDto<NewBuildingComplexResponseDto> {
  @ApiProperty({ type: [NewBuildingComplexResponseDto] })
  data: NewBuildingComplexResponseDto[];
}