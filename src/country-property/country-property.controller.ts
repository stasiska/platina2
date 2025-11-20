import { Body, Controller, Delete, Get, Param, ParseIntPipe, Patch, Post, Query } from '@nestjs/common';
import { CountryPropertyService } from './country-property.service';
import { CreateCountryPropertyDto } from './dto/create-country-property.dto';
import { CountryPaginationDto } from './dto/country-pagination.dto';
import { UpdateCountryPropertyDto } from './dto/update-country-property.dto';
import { ApiBody, ApiOperation, ApiParam, ApiResponse, ApiTags } from '@nestjs/swagger';
import { CountryPropertyResponseDto } from './dto/country-property-response.dto';
import { CountryPaginatedResponseDto } from './dto/country-paginated-response.dto';

@ApiTags('country-properties')
@Controller('country-properties')
export class CountryPropertyController {
  constructor(private readonly service: CountryPropertyService) {}

  @Post()
  @ApiOperation({ summary: 'Создать загородный объект' })
  @ApiBody({ type: CreateCountryPropertyDto })
  @ApiResponse({
    status: 201,
    description: 'Объект успешно создан',
    type: CountryPropertyResponseDto,
  })
  create(@Body() dto: CreateCountryPropertyDto) {
    return this.service.create(dto);
  }

  @Get()
  @ApiOperation({ summary: 'Получить список загородной недвижимости с фильтрами и пагинацией' })
  @ApiResponse({
    status: 200,
    description: 'Список объектов',
    type: CountryPaginatedResponseDto, 
  })
  findAll(@Query() query: CountryPaginationDto) {
    return this.service.findAll(query);
  }

  @ApiOperation({ summary: 'Поиск загородных объектов (аналог GET /)' })
  @ApiResponse({
    status: 200,
    description: 'Результаты поиска',
    type: CountryPaginatedResponseDto,
  })
  @Get('search')
  search(@Query() query: CountryPaginationDto) {
    return this.service.search(query);
  }

  @ApiOperation({ summary: 'Получить загородный объект по ID' })
  @ApiParam({ name: 'id', example: 7 })
  @ApiResponse({
    status: 200,
    description: 'Объект найден',
    type: CountryPropertyResponseDto,
  })
  @ApiResponse({ status: 404, description: 'Объект не найден' })
  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.service.findOne(id);
  }

  @Patch(':id')
  @ApiOperation({ summary: 'Обновить загородный объект' })
  @ApiParam({ name: 'id', example: 7 })
  @ApiBody({ type: UpdateCountryPropertyDto })
  @ApiResponse({
    status: 200,
    description: 'Объект обновлён',
    type: CountryPropertyResponseDto,
  })
  update(@Param('id', ParseIntPipe) id: number, @Body() dto: UpdateCountryPropertyDto) {
    return this.service.update(id, dto);
  }

  @Delete(':id')
  @ApiOperation({ summary: 'Удалить загородный объект' })
  @ApiParam({ name: 'id', example: 7 })
  @ApiResponse({
    status: 200,
    description: 'Объект удалён',
    type: CountryPropertyResponseDto,
  })
  remove(@Param('id', ParseIntPipe) id: number) {
    return this.service.remove(id);
  }
}
