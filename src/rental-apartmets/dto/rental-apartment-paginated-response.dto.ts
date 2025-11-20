import { PaginatedResponseDto } from 'src/common/dto/paginated-response.dto';
import { RentalApartmentResponseDto } from './rental-apartment-response.dto';
import { ApiProperty } from '@nestjs/swagger';

export class RentalApartmentPaginatedResponseDto extends PaginatedResponseDto<RentalApartmentResponseDto> {
  @ApiProperty({ type: [RentalApartmentResponseDto] })
  data: RentalApartmentResponseDto[];
}