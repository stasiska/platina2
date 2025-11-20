import { PartialType } from '@nestjs/mapped-types';
import { CreateCountryPropertyDto } from './create-country-property.dto';

export class UpdateCountryPropertyDto extends PartialType(CreateCountryPropertyDto) {}