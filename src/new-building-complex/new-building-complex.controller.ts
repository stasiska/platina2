// src/new-building-complexes/new-building-complexes.controller.ts
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
import { NewBuildingComplexService } from './new-building-complex.service';
import { CreateNewBuildingComplexDto } from './dto/create-new-building-complex.dto';
import { UpdateNewBuildingComplexDto } from './dto/update-new-building-complex.dto';
import { PropertyPaginationDto } from 'src/common/dto/property-pagination.dto';
import {
  ApiTags,
  ApiOperation,
  ApiResponse,
  ApiParam,
  ApiBody,
  ApiBearerAuth,
} from '@nestjs/swagger';
import { NewBuildingComplexResponseDto } from './dto/new-building-complex-response.dto';
import { NewBuildingComplexPaginatedResponseDto } from './dto/new-building-complex-paginated-response.dto';
import { AdminGuard } from 'src/auth/guard/admin.guard';

@ApiTags('new-building-complexes')
@ApiBearerAuth()
@Controller('api/new-building-complexes')
export class NewBuildingComplexController {
  constructor(private readonly service: NewBuildingComplexService) {}

  @UseGuards(AdminGuard)
  @Post()
  @ApiOperation({ summary: 'Создать жилой комплекс (новостройку)' })
  @ApiBody({ type: CreateNewBuildingComplexDto })
  @ApiResponse({
    status: 201,
    description: 'ЖК успешно создан',
    type: NewBuildingComplexResponseDto,
  })
  create(@Body() dto: CreateNewBuildingComplexDto) {
    return this.service.create(dto);
  }

  @Get()
  @ApiOperation({ summary: 'Получить список всех новостроек с фильтрами и пагинацией' })
  @ApiResponse({
    status: 200,
    description: 'Список жилых комплексов',
    type: NewBuildingComplexPaginatedResponseDto,
  })
  findAll(@Query() query: PropertyPaginationDto) {
    return this.service.findAll(query);
  }

  @Get('search')
  @ApiOperation({ summary: 'Поиск новостроек (аналог GET /)' })
  @ApiResponse({
    status: 200,
    description: 'Результаты поиска',
    type: NewBuildingComplexPaginatedResponseDto,
  })
  search(@Query() query: PropertyPaginationDto) {
    return this.service.search(query);
  }

  @Get(':id')
  @ApiOperation({ summary: 'Получить ЖК по ID' })
  @ApiParam({ name: 'id', example: 3 })
  @ApiResponse({
    status: 200,
    description: 'ЖК найден',
    type: NewBuildingComplexResponseDto,
  })
  @ApiResponse({ status: 404, description: 'ЖК не найден' })
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.service.findOne(id);
  }

  @UseGuards(AdminGuard)
  @Patch(':id')
  @ApiOperation({ summary: 'Обновить ЖК' })
  @ApiParam({ name: 'id', example: 3 })
  @ApiBody({ type: UpdateNewBuildingComplexDto })
  @ApiResponse({
    status: 200,
    description: 'ЖК обновлён',
    type: NewBuildingComplexResponseDto,
  })
  
  @UseGuards(AdminGuard)
  update(
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: UpdateNewBuildingComplexDto,
  ) {
    return this.service.update(id, dto);
  }

  @UseGuards(AdminGuard)
  @Delete(':id')
  @ApiOperation({ summary: 'Удалить ЖК' })
  @ApiParam({ name: 'id', example: 3 })
  @ApiResponse({
    status: 200,
    description: 'ЖК удалён',
    type: NewBuildingComplexResponseDto,
  })
  remove(@Param('id', ParseIntPipe) id: number) {
    return this.service.remove(id);
  }
}