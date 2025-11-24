// src/commercial-properties/commercial-properties.controller.ts
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
import { CreateCommercialPropertyDto } from './dto/create-commercial-property.dto';
import { UpdateCommercialPropertyDto } from './dto/update-commercial-property.dto';
import {
  ApiTags,
  ApiOperation,
  ApiResponse,
  ApiQuery,
  ApiParam,
  ApiBody,
  ApiBearerAuth,
} from '@nestjs/swagger';
import { CommercialPropertyResponseDto } from './dto/commercial-property-response.dto';
import { PaginatedResponseDto } from 'src/common/dto/paginated-response.dto';
import { CommercialPropertyService } from './commercial-property.service';
import { CommercialPaginationDto } from './dto/commercial-pagination.dto';
import { CommercialPaginatedResponseDto } from './dto/commercial-paginated-response.dto';
import { AdminGuard } from 'src/auth/guard/admin.guard';
import { CommercialPropertyPaginationDto } from 'src/dto/base.dto';

@ApiTags('commercial-properties')
@ApiBearerAuth()
@Controller('commercial-properties')
export class CommercialPropertyController {
  constructor(private readonly service: CommercialPropertyService) {}
  @UseGuards(AdminGuard)
  @Post()
  @ApiOperation({ summary: 'Создать коммерческий объект' })
  @ApiBody({ type: CreateCommercialPropertyDto })
  @ApiResponse({
    status: 201,
    description: 'Объект успешно создан',
    type: CommercialPropertyResponseDto,
  })
  @ApiResponse({ status: 400, description: 'Неверные данные' })
  create(@Body() dto: CreateCommercialPropertyDto) {
    return this.service.create(dto);
  }

@Get()
@ApiOperation({ summary: 'Получить список коммерческих объектов с пагинацией и фильтрами' })
@ApiResponse({
  status: 200,
  description: 'Список объектов с пагинацией',
  type: CommercialPaginatedResponseDto, 
})
  findAll(@Query() query: CommercialPropertyPaginationDto) {
    return this.service.findAll(query);
  }

  @Get('search')
  @ApiOperation({ summary: 'Получить список коммерческих объектов с пагинацией и фильтрами' })
@ApiResponse({
  status: 200,
  description: 'Список объектов с пагинацией',
  type: CommercialPaginatedResponseDto, 
})
  @ApiOperation({ summary: 'Поиск коммерческих объектов (то же, что и GET /)' })
  @ApiResponse({
    status: 200,
    description: 'Результаты поиска',
    type: () => PaginatedResponseDto<CommercialPropertyResponseDto>,
  })
  search(@Query() query: CommercialPropertyPaginationDto) {
    return this.service.search(query);
  }

  @Get(':id')
  @ApiOperation({ summary: 'Получить коммерческий объект по ID' })
  @ApiParam({ name: 'id', description: 'ID объекта', example: 42 })
  @ApiResponse({
    status: 200,
    description: 'Объект найден',
    type: CommercialPropertyResponseDto,
  })
  @ApiResponse({ status: 404, description: 'Объект не найден' })
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.service.findOne(id);
  }

  @UseGuards(AdminGuard)
  @Patch(':id')
  @ApiOperation({ summary: 'Обновить коммерческий объект' })
  @ApiParam({ name: 'id', example: 42 })
  @ApiBody({ type: UpdateCommercialPropertyDto })
  @ApiResponse({
    status: 200,
    description: 'Объект обновлён',
    type: CommercialPropertyResponseDto,
  })
  @ApiResponse({ status: 404, description: 'Объект не найден' })
  update(
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: UpdateCommercialPropertyDto,
  ) {
    return this.service.update(id, dto);
  }

  @UseGuards(AdminGuard)
  @Delete(':id')
  @ApiOperation({ summary: 'Удалить коммерческий объект' })
  @ApiParam({ name: 'id', example: 42 })
  @ApiResponse({
    status: 200,
    description: 'Объект удалён',
    type: CommercialPropertyResponseDto,
  })
  @ApiResponse({ status: 404, description: 'Объект не найден' })
  remove(@Param('id', ParseIntPipe) id: number) {
    return this.service.remove(id);
  }
}