import { PartialType } from '@nestjs/mapped-types';
import { CreateRentalApartmentDto } from './create-rental-apartment.dto';

export class UpdateRentalApartmentDto extends PartialType(CreateRentalApartmentDto) {}