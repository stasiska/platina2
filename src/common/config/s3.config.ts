// src/config/s3.config.ts
import { S3Client } from '@aws-sdk/client-s3';

export const s3Client = new S3Client({
  region: process.env.S3_REGION || 'ru-7',
  endpoint: `https://${process.env.S3_ENDPOINT}`, 
  credentials: {
    accessKeyId: process.env.S3_ACCESSKEY!,
    secretAccessKey: process.env.S3_SECRET_KEY!,
  },
  forcePathStyle: false, 
});

export const S3_BUCKET = process.env.S3_BACKETNAME!; 
export const S3_BASE_URL = process.env.S3_URL; 