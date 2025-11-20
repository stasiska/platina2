import { ApiProperty } from "@nestjs/swagger";

export class CreateApplicationDto {
  @ApiProperty({ example: 'Алексей', description: 'Имя клиента' })
  name: string;

  @ApiProperty({ example: '+79991234567', description: 'Телефон' })
  phone: string;

  @ApiProperty({ example: 'newBuildingApartment', required: false })
  propertyType?: string;

  @ApiProperty({ example: 42, required: false })
  propertyId?: number;

  @ApiProperty({ example: 'https://platina.su/flat/42', description: 'Откуда пришёл' })
  link: string;
}