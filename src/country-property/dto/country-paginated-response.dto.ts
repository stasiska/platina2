import { PaginatedResponseDto } from 'src/common/dto/paginated-response.dto';
import { CountryPropertyResponseDto } from './country-property-response.dto';
import { ApiProperty } from '@nestjs/swagger';

export class CountryPaginatedResponseDto extends PaginatedResponseDto<CountryPropertyResponseDto> {
  @ApiProperty({ type: [CountryPropertyResponseDto] })
  data: CountryPropertyResponseDto[];
}