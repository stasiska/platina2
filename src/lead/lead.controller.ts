import { Body, Controller, Post } from '@nestjs/common';
import { LeadService } from './lead.service';
import { ApiBody, ApiOperation, ApiResponse, ApiTags } from '@nestjs/swagger';
import { CreateApplicationDto } from './dto/create';

@ApiTags('commercial-properties')
@Controller('lead')
export class LeadController {
  constructor(private readonly service: LeadService) {}

  @Post()
  @ApiOperation({ summary: 'Создать заявку от клиента' })
  @ApiBody({ type: CreateApplicationDto })
  @ApiResponse({ status: 201, description: 'Заявка принята и отправлена в Telegram' })
  create(@Body() dto: any) {
    return this.service.create(dto);
  }
}
