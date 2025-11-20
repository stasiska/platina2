export class PaginatedResponseDto<T> {
  data: T[];
  total: number;
  skip: number;
  take: number;

  constructor(data: T[], total: number, skip: number, take: number) {
    this.data = data;
    this.total = total;
    this.skip = skip;
    this.take = take;
  }
}