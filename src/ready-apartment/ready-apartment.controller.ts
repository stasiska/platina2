// src/ready-apartments/ready-apartments.controller.ts
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
import { ReadyApartmentService } from './ready-apartment.service';
import { CreateReadyApartmentDto } from './dto/create-ready-apartment.dto';
import { UpdateReadyApartmentDto } from './dto/update-ready-apartment.dto';
import { PropertyPaginationDto } from './dto/property-pagination.dto';
import {
  ApiTags,
  ApiOperation,
  ApiResponse,
  ApiParam,
  ApiBody,
  ApiBearerAuth,
} from '@nestjs/swagger';
import { ReadyApartmentResponseDto } from './dto/ready-apartment-response.dto';
import { ReadyApartmentPaginatedResponseDto } from './dto/ready-apartment-paginated-response.dto';
import { AdminGuard } from 'src/auth/guard/admin.guard';

@ApiTags('ready-apartments')
@ApiBearerAuth()
@Controller('ready-apartments')
export class ReadyApartmentController {
  constructor(private readonly service: ReadyApartmentService) {}

  @UseGuards(AdminGuard)
  @Post()
  @ApiOperation({ summary: 'Создать объект вторичного жилья' })
  @ApiBody({ type: CreateReadyApartmentDto })
  @ApiResponse({
    status: 201,
    description: 'Квартира успешно создана',
    type: ReadyApartmentResponseDto,
  })

  create(@Body() dto: CreateReadyApartmentDto) {
    return this.service.create(dto);
  }

  @Get()
  @ApiOperation({ summary: 'Получить список вторичного жилья (с фильтрами и пагинацией)' })
  @ApiResponse({
    status: 200,
    description: 'Список квартир на вторичном рынке',
    type: ReadyApartmentPaginatedResponseDto,
  })
  findAll(@Query() query: PropertyPaginationDto) {
    return this.service.findAllAndSearch(query);
  }

  @Get('search')
  @ApiOperation({ summary: 'Поиск вторичного жилья (то же, что и GET /)' })
  @ApiResponse({
    status: 200,
    description: 'Результаты поиска',
    type: ReadyApartmentPaginatedResponseDto,
  })
  search(@Query() query: PropertyPaginationDto) {
    return this.service.findAllAndSearch(query);
  }

  @Get(':id')
  @ApiOperation({ summary: 'Получить квартиру на вторичке по ID' })
  @ApiParam({ name: 'id', example: 156 })
  @ApiResponse({
    status: 200,
    description: 'Квартира найдена',
    type: ReadyApartmentResponseDto,
  })
  @ApiResponse({ status: 404, description: 'Квартира не найдена' })
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.service.findOne(id);
  }

  @UseGuards(AdminGuard)
  @Patch(':id')
  @ApiOperation({ summary: 'Обновить квартиру' })
  @ApiParam({ name: 'id', example: 156 })
  @ApiBody({ type: UpdateReadyApartmentDto })
  @ApiResponse({
    status: 200,
    description: 'Квартира обновлена',
    type: ReadyApartmentResponseDto,
  })
  update(
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: UpdateReadyApartmentDto,
  ) {
    return this.service.update(id, dto);
  }

  @UseGuards(AdminGuard)
  @Delete(':id')
  @ApiOperation({ summary: 'Удалить квартиру' })
  @ApiParam({ name: 'id', example: 156 })
  @ApiResponse({
    status: 200,
    description: 'Квартира удалена',
    type: ReadyApartmentResponseDto,
  })
  remove(@Param('id', ParseIntPipe) id: number) {
    return this.service.remove(id);
  }
}