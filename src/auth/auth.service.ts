import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import * as bcrypt from 'bcryptjs';
@Injectable()
export class AuthService {
    private readonly adminlogin = process.env.ADMIN_LOGIN;
    private readonly adminpasswordHash = process.env.ADMIN_PASSWORD;
    
    constructor(private jwtService: JwtService) {
        this.adminpasswordHash = bcrypt.hashSync(process.env.ADMIN_PASSWORD!, 10);
    }

async login(login: string, password: string) {
    const isValid = login === this.adminlogin && bcrypt.compareSync(password, this.adminpasswordHash);
    if (!isValid) {
      throw new UnauthorizedException('Неверный логин или пароль');
    }

    const payload = { role: 'admin', login };

    return {
      token: this.jwtService.sign(payload, {
        expiresIn: process.env.JWT_EXPIRES || '7d',
      } as any),
    };
  }

  verifyToken(token: string) {
    try {
      return this.jwtService.verify(token);
    } catch {
      throw new UnauthorizedException('Неверный или просроченный токен');
    }
  }
}
