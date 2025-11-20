import { Body, Controller, Delete, Get, Param, ParseIntPipe, Patch, Post } from '@nestjs/common';
import { RealtorService } from './realtor.service';
import { ApiBody, ApiOperation, ApiParam, ApiTags } from '@nestjs/swagger';
import { CreateRealtorDto, UpdateRealtorDto } from './dto/create-realtor.dto';

@ApiTags('realtors')
@Controller('realtor')
export class RealtorController {
  constructor(private readonly service: RealtorService) {}

  @Get()
  @ApiOperation({ summary: 'Получить всех активных риэлторов (для сайта)' })
  findAll() {
    return this.service.findAllActive();
  }

  @Get(':id')
  @ApiParam({ name: 'id', example: 1 })
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.service.findOne(id);
  }

  @Post()
  @ApiBody({ type: CreateRealtorDto })
  create(@Body() dto: CreateRealtorDto) {
    return this.service.create(dto);
  }
  
  @Patch(':id')
  @ApiBody({ type: UpdateRealtorDto })
  update(
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: UpdateRealtorDto,
  ) {
    return this.service.update(id, dto);
  }

  @Delete(':id')
  remove(@Param('id', ParseIntPipe) id: number) {
    return this.service.remove(id);
  }
}
