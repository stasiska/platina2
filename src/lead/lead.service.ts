// src/lead/lead.service.ts
import { Injectable, BadRequestException } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { Telegraf } from 'telegraf';
import { CreateApplicationDto } from './dto/create';

@Injectable()
export class LeadService {
  private bot?: Telegraf;

  constructor(private prisma: PrismaService) {
    const token = process.env.TELEGRAM_BOT_TOKEN;
    const chatId = process.env.TELEGRAM_CHAT_ID;

    if (token && chatId) {
      this.bot = new Telegraf(token);
    }
  }

  async create(body: CreateApplicationDto) {
    const name = String(body.name ?? '').trim();
    const phone = String(body.phone ?? '').trim();
    const link = String(body.link ?? '').trim();
    const propertyType = body.propertyType ? String(body.propertyType) : undefined;
    const propertyId = body.propertyId ? Number(body.propertyId) : undefined;
    if (!name || !phone || !link) {
      throw new BadRequestException('name, phone и link обязательны');
    }

    const application = await this.prisma.application.create({
      data: {
        name,
        phone,
        propertyType,
        propertyId,
        link,
      },
    });

    if (this.bot && process.env.TELEGRAM_CHAT_ID) {
      const typeNames: Record<string, string> = {
        newBuildingComplex: 'ЖК Новостройка',
        newBuildingApartment: 'Квартира в новостройке',
        readyApartment: 'Вторичка',
        rentalApartment: 'Аренда',
        countryProperty: 'Загородная',
        commercialProperty: 'Коммерческая',
      };

      const typeText = propertyType ? typeNames[propertyType] || propertyType : 'Не указан';
      const idText = propertyId ? ` • #${propertyId}` : '';

      const shortLink = link.length > 50 ? link.slice(0, 47) + '...' : link;

      const message = `
<b>НОВАЯ ЗАЯВКА #${application.id}</b>

<b>Имя:</b> ${this.escape(name)}
<b>Телефон:</b> <a href="tel:${phone}">${phone}</a>

<b>Тип:</b> ${typeText}
<b>ссыдка на обьект:</b> <a href="${link}">${link}</a>

<b>Время:</b> ${new Date().toLocaleString('ru-RU')}
      `.trim();

      try {
        await this.bot.telegram.sendMessage(process.env.TELEGRAM_CHAT_ID, message, {
          parse_mode: 'HTML',
        });
      } catch (error: any) {
        console.error('Ошибка отправки в Telegram:', error.message);
      }
    }

    return application;
  }

  private escape(text: string): string {
    return text.replace(/[&<>"']/g, (match) => ({
      '&': '&amp;',
      '<': '&lt;',
      '>': '&gt;',
      '"': '&quot;',
      "'": '&#039;',
    }[match]!));
  }
}