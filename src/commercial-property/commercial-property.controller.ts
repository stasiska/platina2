import { Body, Controller, Delete, Get, Param, ParseIntPipe, Patch, Post, Query } from '@nestjs/common';
import { CommercialPropertyService } from './commercial-property.service';
import { CreateCommercialPropertyDto } from './dto/create-commercial-property.dto';
import { CommercialPaginationDto } from './dto/commercial-pagination.dto';
import { UpdateCommercialPropertyDto } from './dto/update-commercial-property.dto';

@Controller('commercial-properties')
export class CommercialPropertyController {
  constructor(private readonly service: CommercialPropertyService) {}

  @Post()
  create(@Body() dto: CreateCommercialPropertyDto) {
    return this.service.create(dto);
  }

  @Get()
  findAll(@Query() query: CommercialPaginationDto) {
    return this.service.findAll(query);
  }

  @Get('search')
  search(@Query() query: CommercialPaginationDto) {
    return this.service.search(query);
  }

  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.service.findOne(id);
  }

  @Patch(':id')
  update(@Param('id', ParseIntPipe) id: number, @Body() dto: UpdateCommercialPropertyDto) {
    return this.service.update(id, dto);
  }

  @Delete(':id')
  remove(@Param('id', ParseIntPipe) id: number) {
    return this.service.remove(id);
  }
}
