import { PaginatedResponseDto } from 'src/common/dto/paginated-response.dto';
import { CommercialPropertyResponseDto } from './commercial-property-response.dto';
import { ApiProperty } from '@nestjs/swagger';

export class CommercialPaginatedResponseDto extends PaginatedResponseDto<CommercialPropertyResponseDto> {
  @ApiProperty({ type: [CommercialPropertyResponseDto] })
  data: CommercialPropertyResponseDto[];
}