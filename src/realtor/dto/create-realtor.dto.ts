// src/realtors/dto/create-realtor.dto.ts
import { PartialType } from '@nestjs/mapped-types';
import { ApiProperty } from '@nestjs/swagger';
import { IsString, IsOptional, IsUrl, IsEmail } from 'class-validator';

export class CreateRealtorDto {
  @ApiProperty({ example: 'Иванова Анна Сергеевна' })
  @IsString()
  fullName: string;

  @ApiProperty({ example: '+7 (999) 123-45-67', required: false })
  @IsOptional()
  @IsString()
  phone?: string;

  @ApiProperty({ example: 'anna@platina.su', required: false })
  @IsOptional()
  @IsEmail()
  email?: string;

  @ApiProperty({ example: 'https://platina.su/uploads/anna.jpg', required: false })
  @IsOptional()
  @IsUrl()
  avatarUrl?: string;

  @ApiProperty({ example: 'Ведущий риэлтор по новостройкам Москвы', required: false })
  @IsOptional()
  @IsString()
  position?: string;
}

export class UpdateRealtorDto extends PartialType(CreateRealtorDto) {}