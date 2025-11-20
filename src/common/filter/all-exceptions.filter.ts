// src/common/filters/all-exceptions.filter.ts  (переименуй как хочешь)
import {
  ExceptionFilter,
  Catch,
  ArgumentsHost,
  HttpException,
  HttpStatus,
  Logger,
} from '@nestjs/common';
import { Request, Response } from 'express';
import { Prisma } from '@prisma/client';
import { PrismaClientKnownRequestError } from '@prisma/client/runtime/library';

@Catch() 
export class AllExceptionsFilter implements ExceptionFilter {
  private readonly logger = new Logger(AllExceptionsFilter.name);

  catch(exception: unknown, host: ArgumentsHost) {
    const ctx = host.switchToHttp();
    const response = ctx.getResponse<Response>();
    const request = ctx.getRequest<Request>();

    let status = HttpStatus.INTERNAL_SERVER_ERROR;
    let message = 'Internal server error';

    if (exception instanceof HttpException) {
      status = exception.getStatus();
      const resp = exception.getResponse();
      message = typeof resp === 'string' ? resp : (resp as any)?.message || exception.message;
    }
    else if (exception instanceof PrismaClientKnownRequestError) {
      if (exception.code === 'P2003') {
        status = HttpStatus.BAD_REQUEST; // 400
        message = 'Указанный жилой комплекс не существует';
      } else if (exception.code === 'P2025') {
        status = HttpStatus.NOT_FOUND; // 404
        message = 'Объект не найден';
      }
    }
    else if (exception instanceof Error) {
      this.logger.error(exception.message, exception.stack);
    }

    response.status(status).json({
      success: false,
      error: {
        statusCode: status,
        message: exception,
        timestamp: new Date().toISOString(),
        path: request.url,
        method: request.method,
      },
    });
  }
}