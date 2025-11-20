import { PartialType } from '@nestjs/mapped-types';
import { CreateReadyApartmentDto } from './create-ready-apartment.dto';

export class UpdateReadyApartmentDto extends PartialType(
  CreateReadyApartmentDto,
) {}