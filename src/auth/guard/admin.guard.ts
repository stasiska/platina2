// src/auth/admin.guard.ts
import { Injectable, CanActivate, ExecutionContext, UnauthorizedException } from '@nestjs/common';
import { AuthService } from '../auth.service';

@Injectable()
export class AdminGuard implements CanActivate {
  constructor(private authService: AuthService) {}

  canActivate(context: ExecutionContext): boolean {
    const req = context.switchToHttp().getRequest();
    const token = req.cookies?.jwt;

    if (!token) {
      throw new UnauthorizedException('Нет доступа');
    }

    try {
      const user = this.authService.verifyToken(token);
      req.user = user; 
      return true;
    } catch {
      throw new UnauthorizedException('Токен недействителен');
    }
  }
}