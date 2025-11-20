import { PartialType } from '@nestjs/mapped-types';
import { CreateNewBuildingComplexDto } from './create-new-building-complex.dto';

export class UpdateNewBuildingComplexDto extends PartialType(
  CreateNewBuildingComplexDto,
) {}