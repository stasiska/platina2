import { Body, Controller, Delete, Get, Param, ParseIntPipe, Patch, Post } from '@nestjs/common';
import { NewBuildingComplexService } from './new-building-complex.service';
import { CreateNewBuildingComplexDto } from './dto/create-new-building-complex.dto';
import { UpdateNewBuildingComplexDto } from './dto/update-new-building-complex.dto';

@Controller('new-building-complexes')
export class NewBuildingComplexController {
  constructor(private readonly service: NewBuildingComplexService) {}
@Post()
  create(@Body() dto: CreateNewBuildingComplexDto) {
    return this.service.create(dto);
  }

  @Get()
  findAll() {
    return this.service.findAll();
  }

  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.service.findOne(id);
  }

  @Patch(':id')
  update(
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: UpdateNewBuildingComplexDto,
  ) {
    return this.service.update(id, dto);
  }

  @Delete(':id')
  remove(@Param('id', ParseIntPipe) id: number) {
    return this.service.remove(id);
  }
}
