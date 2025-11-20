import { PaginatedResponseDto } from './paginated-response.dto';
import { ReadyApartmentResponseDto } from './ready-apartment-response.dto';
import { ApiProperty } from '@nestjs/swagger';

export class ReadyApartmentPaginatedResponseDto extends PaginatedResponseDto<ReadyApartmentResponseDto> {
  @ApiProperty({ type: [ReadyApartmentResponseDto] })
  data: ReadyApartmentResponseDto[];
}