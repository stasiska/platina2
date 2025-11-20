import { Body, Controller, Delete, Get, Param, ParseIntPipe, Patch, Post, Query } from '@nestjs/common';
import { RentalApartmetsService } from './rental-apartmets.service';
import { CreateRentalApartmentDto } from './dto/create-rental-apartment.dto';
import { RentalPaginationDto } from './dto/rental-pagination.dto';
import { UpdateRentalApartmentDto } from './dto/update-rental-apartment.dto';

@Controller('rental-apartmets')
export class RentalApartmetsController {
  constructor(private readonly service: RentalApartmetsService) {}

  @Post()
  create(@Body() dto: CreateRentalApartmentDto) {
    return this.service.create(dto);
  }

  @Get()
  findAll(@Query() query: RentalPaginationDto) {
    return this.service.findAll(query);
  }

  @Get('search')
  search(@Query() query: RentalPaginationDto) {
    return this.service.search(query);
  }

  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.service.findOne(id);
  }

  @Patch(':id')
  update(@Param('id', ParseIntPipe) id: number, @Body() dto: UpdateRentalApartmentDto) {
    return this.service.update(id, dto);
  }

  @Delete(':id')
  remove(@Param('id', ParseIntPipe) id: number) {
    return this.service.remove(id);
  }
}
