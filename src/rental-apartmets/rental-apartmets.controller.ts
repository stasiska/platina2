// src/rental-apartments/rental-apartments.controller.ts
import {
  Controller,
  Get,
  Post,
  Body,
  Param,
  ParseIntPipe,
  Patch,
  Delete,
  Query,
  UseGuards,
} from '@nestjs/common';
import { CreateRentalApartmentDto } from './dto/create-rental-apartment.dto';
import { UpdateRentalApartmentDto } from './dto/update-rental-apartment.dto';
import { RentalPaginationDto } from './dto/rental-pagination.dto';
import {
  ApiTags,
  ApiOperation,
  ApiResponse,
  ApiParam,
  ApiBody,
  ApiBearerAuth,
} from '@nestjs/swagger';
import { RentalApartmentResponseDto } from './dto/rental-apartment-response.dto';
import { RentalApartmentPaginatedResponseDto } from './dto/rental-apartment-paginated-response.dto';
import { RentalApartmetsService } from './rental-apartmets.service';
import { AdminGuard } from 'src/auth/guard/admin.guard';

@ApiTags('rental-apartments')
@ApiBearerAuth()
@Controller('rental-apartments')
export class RentalApartmetsController {
  constructor(private readonly service: RentalApartmetsService) {}

  //@UseGuards(AdminGuard)
  @Post()
  @ApiOperation({ summary: 'Создать объявление об аренде квартиры' })
  @ApiBody({ type: CreateRentalApartmentDto })
  @ApiResponse({
    status: 201,
    description: 'Объявление успешно создано',
    type: RentalApartmentResponseDto,
  })
  create(@Body() dto: CreateRentalApartmentDto) {
    console.log("helelel")
    return this.service.create(dto);
  }

  @Get()
  @ApiOperation({ summary: 'Получить список квартир в аренду (с фильтрами и пагинацией)' })
  @ApiResponse({
    status: 200,
    description: 'Список арендных квартир',
    type: RentalApartmentPaginatedResponseDto,
  })
  findAll(@Query() query: RentalPaginationDto) {
    return this.service.findAll(query);
  }

  @Get('search')
  @ApiOperation({ summary: 'Поиск квартир в аренду (аналог GET /)' })
  @ApiResponse({
    status: 200,
    description: 'Результаты поиска',
    type: RentalApartmentPaginatedResponseDto,
  })
  search(@Query() query: RentalPaginationDto) {
    return this.service.search(query);
  }

  @Get(':id')
  @ApiOperation({ summary: 'Получить квартиру в аренду по ID' })
  @ApiParam({ name: 'id', example: 89 })
  @ApiResponse({
    status: 200,
    description: 'Квартира найдена',
    type: RentalApartmentResponseDto,
  })
  @ApiResponse({ status: 404, description: 'Квартира не найдена' })
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.service.findOne(id);
  }

  @UseGuards(AdminGuard)
  @Patch(':id')
  @ApiOperation({ summary: 'Обновить объявление' })
  @ApiParam({ name: 'id', example: 89 })
  @ApiBody({ type: UpdateRentalApartmentDto })
  @ApiResponse({
    status: 200,
    description: 'Объявление обновлено',
    type: RentalApartmentResponseDto,
  })
  update(
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: UpdateRentalApartmentDto,
  ) {
    return this.service.update(id, dto);
  }

  @UseGuards(AdminGuard)
  @Delete(':id')
  @ApiOperation({ summary: 'Удалить объявление' })
  @ApiParam({ name: 'id', example: 89 })
  @ApiResponse({
    status: 200,
    description: 'Объявление удалено',
    type: RentalApartmentResponseDto,
  })
  remove(@Param('id', ParseIntPipe) id: number) {
    return this.service.remove(id);
  }
}