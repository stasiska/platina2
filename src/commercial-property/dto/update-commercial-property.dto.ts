import { PartialType } from '@nestjs/mapped-types';
import { CreateCommercialPropertyDto } from './create-commercial-property.dto';

export class UpdateCommercialPropertyDto extends PartialType(CreateCommercialPropertyDto) {}