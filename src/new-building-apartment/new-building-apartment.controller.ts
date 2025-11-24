// src/new-building-apartments/new-building-apartments.controller.ts
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
import { NewBuildingApartmentService } from './new-building-apartment.service';
import { CreateNewBuildingApartmentDto } from './dto/create-new-building-apartment.dto';
import { UpdateNewBuildingApartmentDto } from './dto/update-new-building-apartment.dto';
import { ApartmentPaginationDto } from './dto/apartment-pagination.dto';
import {
  ApiTags,
  ApiOperation,
  ApiResponse,
  ApiParam,
  ApiBody,
  ApiBearerAuth,
  ApiQuery,
} from '@nestjs/swagger';
import { NewBuildingApartmentResponseDto } from './dto/new-building-apartment-response.dto';
import { NewBuildingApartmentPaginatedResponseDto } from './dto/new-building-apartment-paginated-response.dto';
import { AdminGuard } from 'src/auth/guard/admin.guard';

@ApiTags('new-building-apartments')
@ApiBearerAuth()
@Controller('api/new-building-apartments')
export class NewBuildingApartmentController {
  constructor(private readonly service: NewBuildingApartmentService) {}

  @UseGuards(AdminGuard)
  @Post()
  @ApiOperation({ summary: 'Создать квартиру в новостройке' })
  @ApiBody({ type: CreateNewBuildingApartmentDto })
  @ApiResponse({
    status: 201,
    description: 'Квартира успешно создана',
    type: NewBuildingApartmentResponseDto,
  })
  @ApiResponse({ status: 400, description: 'Неверные данные или ЖК не существует' })
  create(@Body() dto: CreateNewBuildingApartmentDto) {
    return this.service.create(dto);
  }

  @Get()
  @ApiOperation({ summary: 'Получить все квартиры в новостройках (с фильтрами по ЖК, цене и т.д.)' })
  @ApiResponse({
    status: 200,
    description: 'Список квартир с пагинацией',
    type: NewBuildingApartmentPaginatedResponseDto,
  })
  findAll(@Query() query: ApartmentPaginationDto) {
    return this.service.findAll(query);
  }

  @Get('complex/:complexId')
  @ApiOperation({ summary: 'Получить все квартиры конкретного ЖК' })
  @ApiParam({ name: 'complexId', example: 3, description: 'ID жилого комплекса' })
  @ApiResponse({
    status: 200,
    description: 'Список квартир в указанном ЖК',
    type: NewBuildingApartmentPaginatedResponseDto,
  })
  @ApiResponse({ status: 404, description: 'ЖК не найден' })
  findByComplex(
    @Param('complexId', ParseIntPipe) complexId: number,
    @Query() query: ApartmentPaginationDto,
  ) {
    return this.service.findByComplexId(complexId, query);
  }

  @Get(':id')
  @ApiOperation({ summary: 'Получить квартиру по ID' })
  @ApiParam({ name: 'id', example: 42 })
  @ApiResponse({
    status: 200,
    description: 'Квартира найдена',
    type: NewBuildingApartmentResponseDto,
  })
  @ApiResponse({ status: 404, description: 'Квартира не найдена' })
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.service.findOne(id);
  }

  @UseGuards(AdminGuard)
  @Patch(':id')
  @ApiOperation({ summary: 'Обновить квартиру' })
  @ApiParam({ name: 'id', example: 42 })
  @ApiBody({ type: UpdateNewBuildingApartmentDto })
  @ApiResponse({
    status: 200,
    description: 'Квартира обновлена',
    type: NewBuildingApartmentResponseDto,
  })
  
  @UseGuards(AdminGuard)
  update(
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: UpdateNewBuildingApartmentDto,
  ) {
    return this.service.update(id, dto);
  }

  @UseGuards(AdminGuard)
  @Delete(':id')
  @ApiOperation({ summary: 'Удалить квартиру' })
  @ApiParam({ name: 'id', example: 42 })
  @ApiResponse({
    status: 200,
    description: 'Квартира удалена',
    type: NewBuildingApartmentResponseDto,
  })
  remove(@Param('id', ParseIntPipe) id: number) {
    return this.service.remove(id);
  }
}