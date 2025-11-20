import { Body, Controller, Delete, Get, Param, ParseIntPipe, Patch, Post, Query } from '@nestjs/common';
import { ReadyApartmentService } from './ready-apartment.service';
import { CreateReadyApartmentDto } from './dto/create-ready-apartment.dto';
import { UpdateReadyApartmentDto } from './dto/update-ready-apartment.dto';
import { PropertyPaginationDto } from './dto/property-pagination.dto';

@Controller('ready-apartments')
export class ReadyApartmentController {
  constructor(private readonly service: ReadyApartmentService) {}

  @Post()
  create(@Body() dto: CreateReadyApartmentDto) {
    return this.service.create(dto);
  }

  
@Get()
async findAll(@Query() query: PropertyPaginationDto) {
  return this.service.findAllAndSearch(query);
}

@Get('search')
async search(@Query() query: PropertyPaginationDto) {
  return this.service.findAllAndSearch(query);
}

  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.service.findOne(id);
  }

  @Patch(':id')
  update(
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: UpdateReadyApartmentDto,
  ) {
    return this.service.update(id, dto);
  }

  @Delete(':id')
  remove(@Param('id', ParseIntPipe) id: number) {
    return this.service.remove(id);
  }
}
