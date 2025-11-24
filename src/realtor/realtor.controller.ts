import { Body, Controller, Delete, Get, Param, ParseIntPipe, Patch, Post, UseGuards } from '@nestjs/common';
import { RealtorService } from './realtor.service';
import { ApiBody, ApiOperation, ApiParam, ApiTags } from '@nestjs/swagger';
import { CreateRealtorDto, UpdateRealtorDto } from './dto/create-realtor.dto';
import { AdminGuard } from 'src/auth/guard/admin.guard';

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

  @UseGuards(AdminGuard)
  @Post()
  @ApiBody({ type: CreateRealtorDto })
  create(@Body() dto: CreateRealtorDto) {
    return this.service.create(dto);
  }

  @UseGuards(AdminGuard)
  @Patch(':id')
  @ApiBody({ type: UpdateRealtorDto })
  update(
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: UpdateRealtorDto,
  ) {
    return this.service.update(id, dto);
  }

  @UseGuards(AdminGuard)
  @Delete(':id')
  remove(@Param('id', ParseIntPipe) id: number) {
    return this.service.remove(id);
  }
}
