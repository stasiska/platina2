import { PaginatedResponseDto } from 'src/common/dto/paginated-response.dto';
import { NewBuildingApartmentResponseDto } from './new-building-apartment-response.dto';
import { ApiProperty } from '@nestjs/swagger';

export class NewBuildingApartmentPaginatedResponseDto extends PaginatedResponseDto<NewBuildingApartmentResponseDto> {
  @ApiProperty({ type: [NewBuildingApartmentResponseDto] })
  data: NewBuildingApartmentResponseDto[];
}