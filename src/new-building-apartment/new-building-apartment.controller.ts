import { Body, Controller, Delete, Get, Param, ParseIntPipe, Patch, Post, Query } from '@nestjs/common';
import { NewBuildingApartmentService } from './new-building-apartment.service';
import { UpdateNewBuildingApartmentDto } from './dto/update-new-building-apartment.dto';
import { ApartmentPaginationDto } from './dto/apartment-pagination.dto';
import { CreateNewBuildingApartmentDto } from './dto/create-new-building-apartment.dto';

@Controller('new-building-apartments')
export class NewBuildingApartmentController {
  constructor(private readonly service: NewBuildingApartmentService) {}

  @Post()

  create(@Body() dto: CreateNewBuildingApartmentDto) {
    return this.service.create(dto);
  }

  @Get()
  findAll(@Query() query: ApartmentPaginationDto) {
    return this.service.findAll(query);
  }

  // Удобный эндпоинт: все квартиры конкретного ЖК
  @Get('complex/:complexId')
  findByComplex(
    @Param('complexId', ParseIntPipe) complexId: number,
    @Query() query: ApartmentPaginationDto,
  ) {
    return this.service.findByComplexId(complexId, query);
  }

  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.service.findOne(id);
  }

  @Patch(':id')
  update(
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: UpdateNewBuildingApartmentDto,
  ) {
    return this.service.update(id, dto);
  }

  @Delete(':id')
  remove(@Param('id', ParseIntPipe) id: number) {
    return this.service.remove(id);
  }
}
