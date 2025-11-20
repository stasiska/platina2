import { PartialType } from '@nestjs/mapped-types';
import { CreateNewBuildingApartmentDto } from './create-new-building-apartment.dto';

export class UpdateNewBuildingApartmentDto extends PartialType(
  CreateNewBuildingApartmentDto,
) {}