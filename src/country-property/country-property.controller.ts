import { Body, Controller, Delete, Get, Param, ParseIntPipe, Patch, Post, Query } from '@nestjs/common';
import { CountryPropertyService } from './country-property.service';
import { CreateCountryPropertyDto } from './dto/create-country-property.dto';
import { CountryPaginationDto } from './dto/country-pagination.dto';
import { UpdateCountryPropertyDto } from './dto/update-country-property.dto';

@Controller('country-properties')
export class CountryPropertyController {
  constructor(private readonly service: CountryPropertyService) {}

  @Post()
  create(@Body() dto: CreateCountryPropertyDto) {
    return this.service.create(dto);
  }

  @Get()
  findAll(@Query() query: CountryPaginationDto) {
    return this.service.findAll(query);
  }

  @Get('search')
  search(@Query() query: CountryPaginationDto) {
    return this.service.search(query);
  }

  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.service.findOne(id);
  }

  @Patch(':id')
  update(@Param('id', ParseIntPipe) id: number, @Body() dto: UpdateCountryPropertyDto) {
    return this.service.update(id, dto);
  }

  @Delete(':id')
  remove(@Param('id', ParseIntPipe) id: number) {
    return this.service.remove(id);
  }
}
