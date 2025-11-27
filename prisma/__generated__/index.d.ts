
/**
 * Client
**/

import * as runtime from './runtime/library.js';
import $Types = runtime.Types // general types
import $Public = runtime.Types.Public
import $Utils = runtime.Types.Utils
import $Extensions = runtime.Types.Extensions
import $Result = runtime.Types.Result

export type PrismaPromise<T> = $Public.PrismaPromise<T>


/**
 * Model Realtor
 * 
 */
export type Realtor = $Result.DefaultSelection<Prisma.$RealtorPayload>
/**
 * Model Application
 * 
 */
export type Application = $Result.DefaultSelection<Prisma.$ApplicationPayload>
/**
 * Model Image
 * 
 */
export type Image = $Result.DefaultSelection<Prisma.$ImagePayload>
/**
 * Model NewBuildingComplex
 * 
 */
export type NewBuildingComplex = $Result.DefaultSelection<Prisma.$NewBuildingComplexPayload>
/**
 * Model NewBuildingApartment
 * 
 */
export type NewBuildingApartment = $Result.DefaultSelection<Prisma.$NewBuildingApartmentPayload>
/**
 * Model NearbyPlace
 * 
 */
export type NearbyPlace = $Result.DefaultSelection<Prisma.$NearbyPlacePayload>
/**
 * Model Review
 * 
 */
export type Review = $Result.DefaultSelection<Prisma.$ReviewPayload>
/**
 * Model ReadyApartment
 * 
 */
export type ReadyApartment = $Result.DefaultSelection<Prisma.$ReadyApartmentPayload>
/**
 * Model RentalApartment
 * 
 */
export type RentalApartment = $Result.DefaultSelection<Prisma.$RentalApartmentPayload>
/**
 * Model CountryProperty
 * 
 */
export type CountryProperty = $Result.DefaultSelection<Prisma.$CountryPropertyPayload>
/**
 * Model CommercialProperty
 * 
 */
export type CommercialProperty = $Result.DefaultSelection<Prisma.$CommercialPropertyPayload>

/**
 * Enums
 */
export namespace $Enums {
  export const ApplicationStatus: {
  NEW: 'NEW',
  PROCESSING: 'PROCESSING',
  COMPLETED: 'COMPLETED',
  CANCELLED: 'CANCELLED'
};

export type ApplicationStatus = (typeof ApplicationStatus)[keyof typeof ApplicationStatus]


export const BuildingClass: {
  ECONOMY: 'ECONOMY',
  COMFORT: 'COMFORT',
  BUSINESS: 'BUSINESS',
  PREMIUM: 'PREMIUM',
  ELITE: 'ELITE'
};

export type BuildingClass = (typeof BuildingClass)[keyof typeof BuildingClass]

}

export type ApplicationStatus = $Enums.ApplicationStatus

export const ApplicationStatus: typeof $Enums.ApplicationStatus

export type BuildingClass = $Enums.BuildingClass

export const BuildingClass: typeof $Enums.BuildingClass

/**
 * ##  Prisma Client ʲˢ
 *
 * Type-safe database client for TypeScript & Node.js
 * @example
 * ```
 * const prisma = new PrismaClient()
 * // Fetch zero or more Realtors
 * const realtors = await prisma.realtor.findMany()
 * ```
 *
 *
 * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client).
 */
export class PrismaClient<
  ClientOptions extends Prisma.PrismaClientOptions = Prisma.PrismaClientOptions,
  U = 'log' extends keyof ClientOptions ? ClientOptions['log'] extends Array<Prisma.LogLevel | Prisma.LogDefinition> ? Prisma.GetEvents<ClientOptions['log']> : never : never,
  ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs
> {
  [K: symbol]: { types: Prisma.TypeMap<ExtArgs>['other'] }

    /**
   * ##  Prisma Client ʲˢ
   *
   * Type-safe database client for TypeScript & Node.js
   * @example
   * ```
   * const prisma = new PrismaClient()
   * // Fetch zero or more Realtors
   * const realtors = await prisma.realtor.findMany()
   * ```
   *
   *
   * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client).
   */

  constructor(optionsArg ?: Prisma.Subset<ClientOptions, Prisma.PrismaClientOptions>);
  $on<V extends U>(eventType: V, callback: (event: V extends 'query' ? Prisma.QueryEvent : Prisma.LogEvent) => void): PrismaClient;

  /**
   * Connect with the database
   */
  $connect(): $Utils.JsPromise<void>;

  /**
   * Disconnect from the database
   */
  $disconnect(): $Utils.JsPromise<void>;

  /**
   * Add a middleware
   * @deprecated since 4.16.0. For new code, prefer client extensions instead.
   * @see https://pris.ly/d/extensions
   */
  $use(cb: Prisma.Middleware): void

/**
   * Executes a prepared raw query and returns the number of affected rows.
   * @example
   * ```
   * const result = await prisma.$executeRaw`UPDATE User SET cool = ${true} WHERE email = ${'user@email.com'};`
   * ```
   *
   * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client/raw-database-access).
   */
  $executeRaw<T = unknown>(query: TemplateStringsArray | Prisma.Sql, ...values: any[]): Prisma.PrismaPromise<number>;

  /**
   * Executes a raw query and returns the number of affected rows.
   * Susceptible to SQL injections, see documentation.
   * @example
   * ```
   * const result = await prisma.$executeRawUnsafe('UPDATE User SET cool = $1 WHERE email = $2 ;', true, 'user@email.com')
   * ```
   *
   * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client/raw-database-access).
   */
  $executeRawUnsafe<T = unknown>(query: string, ...values: any[]): Prisma.PrismaPromise<number>;

  /**
   * Performs a prepared raw query and returns the `SELECT` data.
   * @example
   * ```
   * const result = await prisma.$queryRaw`SELECT * FROM User WHERE id = ${1} OR email = ${'user@email.com'};`
   * ```
   *
   * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client/raw-database-access).
   */
  $queryRaw<T = unknown>(query: TemplateStringsArray | Prisma.Sql, ...values: any[]): Prisma.PrismaPromise<T>;

  /**
   * Performs a raw query and returns the `SELECT` data.
   * Susceptible to SQL injections, see documentation.
   * @example
   * ```
   * const result = await prisma.$queryRawUnsafe('SELECT * FROM User WHERE id = $1 OR email = $2;', 1, 'user@email.com')
   * ```
   *
   * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client/raw-database-access).
   */
  $queryRawUnsafe<T = unknown>(query: string, ...values: any[]): Prisma.PrismaPromise<T>;


  /**
   * Allows the running of a sequence of read/write operations that are guaranteed to either succeed or fail as a whole.
   * @example
   * ```
   * const [george, bob, alice] = await prisma.$transaction([
   *   prisma.user.create({ data: { name: 'George' } }),
   *   prisma.user.create({ data: { name: 'Bob' } }),
   *   prisma.user.create({ data: { name: 'Alice' } }),
   * ])
   * ```
   * 
   * Read more in our [docs](https://www.prisma.io/docs/concepts/components/prisma-client/transactions).
   */
  $transaction<P extends Prisma.PrismaPromise<any>[]>(arg: [...P], options?: { isolationLevel?: Prisma.TransactionIsolationLevel }): $Utils.JsPromise<runtime.Types.Utils.UnwrapTuple<P>>

  $transaction<R>(fn: (prisma: Omit<PrismaClient, runtime.ITXClientDenyList>) => $Utils.JsPromise<R>, options?: { maxWait?: number, timeout?: number, isolationLevel?: Prisma.TransactionIsolationLevel }): $Utils.JsPromise<R>


  $extends: $Extensions.ExtendsHook<"extends", Prisma.TypeMapCb<ClientOptions>, ExtArgs, $Utils.Call<Prisma.TypeMapCb<ClientOptions>, {
    extArgs: ExtArgs
  }>>

      /**
   * `prisma.realtor`: Exposes CRUD operations for the **Realtor** model.
    * Example usage:
    * ```ts
    * // Fetch zero or more Realtors
    * const realtors = await prisma.realtor.findMany()
    * ```
    */
  get realtor(): Prisma.RealtorDelegate<ExtArgs, ClientOptions>;

  /**
   * `prisma.application`: Exposes CRUD operations for the **Application** model.
    * Example usage:
    * ```ts
    * // Fetch zero or more Applications
    * const applications = await prisma.application.findMany()
    * ```
    */
  get application(): Prisma.ApplicationDelegate<ExtArgs, ClientOptions>;

  /**
   * `prisma.image`: Exposes CRUD operations for the **Image** model.
    * Example usage:
    * ```ts
    * // Fetch zero or more Images
    * const images = await prisma.image.findMany()
    * ```
    */
  get image(): Prisma.ImageDelegate<ExtArgs, ClientOptions>;

  /**
   * `prisma.newBuildingComplex`: Exposes CRUD operations for the **NewBuildingComplex** model.
    * Example usage:
    * ```ts
    * // Fetch zero or more NewBuildingComplexes
    * const newBuildingComplexes = await prisma.newBuildingComplex.findMany()
    * ```
    */
  get newBuildingComplex(): Prisma.NewBuildingComplexDelegate<ExtArgs, ClientOptions>;

  /**
   * `prisma.newBuildingApartment`: Exposes CRUD operations for the **NewBuildingApartment** model.
    * Example usage:
    * ```ts
    * // Fetch zero or more NewBuildingApartments
    * const newBuildingApartments = await prisma.newBuildingApartment.findMany()
    * ```
    */
  get newBuildingApartment(): Prisma.NewBuildingApartmentDelegate<ExtArgs, ClientOptions>;

  /**
   * `prisma.nearbyPlace`: Exposes CRUD operations for the **NearbyPlace** model.
    * Example usage:
    * ```ts
    * // Fetch zero or more NearbyPlaces
    * const nearbyPlaces = await prisma.nearbyPlace.findMany()
    * ```
    */
  get nearbyPlace(): Prisma.NearbyPlaceDelegate<ExtArgs, ClientOptions>;

  /**
   * `prisma.review`: Exposes CRUD operations for the **Review** model.
    * Example usage:
    * ```ts
    * // Fetch zero or more Reviews
    * const reviews = await prisma.review.findMany()
    * ```
    */
  get review(): Prisma.ReviewDelegate<ExtArgs, ClientOptions>;

  /**
   * `prisma.readyApartment`: Exposes CRUD operations for the **ReadyApartment** model.
    * Example usage:
    * ```ts
    * // Fetch zero or more ReadyApartments
    * const readyApartments = await prisma.readyApartment.findMany()
    * ```
    */
  get readyApartment(): Prisma.ReadyApartmentDelegate<ExtArgs, ClientOptions>;

  /**
   * `prisma.rentalApartment`: Exposes CRUD operations for the **RentalApartment** model.
    * Example usage:
    * ```ts
    * // Fetch zero or more RentalApartments
    * const rentalApartments = await prisma.rentalApartment.findMany()
    * ```
    */
  get rentalApartment(): Prisma.RentalApartmentDelegate<ExtArgs, ClientOptions>;

  /**
   * `prisma.countryProperty`: Exposes CRUD operations for the **CountryProperty** model.
    * Example usage:
    * ```ts
    * // Fetch zero or more CountryProperties
    * const countryProperties = await prisma.countryProperty.findMany()
    * ```
    */
  get countryProperty(): Prisma.CountryPropertyDelegate<ExtArgs, ClientOptions>;

  /**
   * `prisma.commercialProperty`: Exposes CRUD operations for the **CommercialProperty** model.
    * Example usage:
    * ```ts
    * // Fetch zero or more CommercialProperties
    * const commercialProperties = await prisma.commercialProperty.findMany()
    * ```
    */
  get commercialProperty(): Prisma.CommercialPropertyDelegate<ExtArgs, ClientOptions>;
}

export namespace Prisma {
  export import DMMF = runtime.DMMF

  export type PrismaPromise<T> = $Public.PrismaPromise<T>

  /**
   * Validator
   */
  export import validator = runtime.Public.validator

  /**
   * Prisma Errors
   */
  export import PrismaClientKnownRequestError = runtime.PrismaClientKnownRequestError
  export import PrismaClientUnknownRequestError = runtime.PrismaClientUnknownRequestError
  export import PrismaClientRustPanicError = runtime.PrismaClientRustPanicError
  export import PrismaClientInitializationError = runtime.PrismaClientInitializationError
  export import PrismaClientValidationError = runtime.PrismaClientValidationError

  /**
   * Re-export of sql-template-tag
   */
  export import sql = runtime.sqltag
  export import empty = runtime.empty
  export import join = runtime.join
  export import raw = runtime.raw
  export import Sql = runtime.Sql



  /**
   * Decimal.js
   */
  export import Decimal = runtime.Decimal

  export type DecimalJsLike = runtime.DecimalJsLike

  /**
   * Metrics
   */
  export type Metrics = runtime.Metrics
  export type Metric<T> = runtime.Metric<T>
  export type MetricHistogram = runtime.MetricHistogram
  export type MetricHistogramBucket = runtime.MetricHistogramBucket

  /**
  * Extensions
  */
  export import Extension = $Extensions.UserArgs
  export import getExtensionContext = runtime.Extensions.getExtensionContext
  export import Args = $Public.Args
  export import Payload = $Public.Payload
  export import Result = $Public.Result
  export import Exact = $Public.Exact

  /**
   * Prisma Client JS version: 6.5.0
   * Query Engine version: 173f8d54f8d52e692c7e27e72a88314ec7aeff60
   */
  export type PrismaVersion = {
    client: string
  }

  export const prismaVersion: PrismaVersion

  /**
   * Utility Types
   */


  export import JsonObject = runtime.JsonObject
  export import JsonArray = runtime.JsonArray
  export import JsonValue = runtime.JsonValue
  export import InputJsonObject = runtime.InputJsonObject
  export import InputJsonArray = runtime.InputJsonArray
  export import InputJsonValue = runtime.InputJsonValue

  /**
   * Types of the values used to represent different kinds of `null` values when working with JSON fields.
   *
   * @see https://www.prisma.io/docs/concepts/components/prisma-client/working-with-fields/working-with-json-fields#filtering-on-a-json-field
   */
  namespace NullTypes {
    /**
    * Type of `Prisma.DbNull`.
    *
    * You cannot use other instances of this class. Please use the `Prisma.DbNull` value.
    *
    * @see https://www.prisma.io/docs/concepts/components/prisma-client/working-with-fields/working-with-json-fields#filtering-on-a-json-field
    */
    class DbNull {
      private DbNull: never
      private constructor()
    }

    /**
    * Type of `Prisma.JsonNull`.
    *
    * You cannot use other instances of this class. Please use the `Prisma.JsonNull` value.
    *
    * @see https://www.prisma.io/docs/concepts/components/prisma-client/working-with-fields/working-with-json-fields#filtering-on-a-json-field
    */
    class JsonNull {
      private JsonNull: never
      private constructor()
    }

    /**
    * Type of `Prisma.AnyNull`.
    *
    * You cannot use other instances of this class. Please use the `Prisma.AnyNull` value.
    *
    * @see https://www.prisma.io/docs/concepts/components/prisma-client/working-with-fields/working-with-json-fields#filtering-on-a-json-field
    */
    class AnyNull {
      private AnyNull: never
      private constructor()
    }
  }

  /**
   * Helper for filtering JSON entries that have `null` on the database (empty on the db)
   *
   * @see https://www.prisma.io/docs/concepts/components/prisma-client/working-with-fields/working-with-json-fields#filtering-on-a-json-field
   */
  export const DbNull: NullTypes.DbNull

  /**
   * Helper for filtering JSON entries that have JSON `null` values (not empty on the db)
   *
   * @see https://www.prisma.io/docs/concepts/components/prisma-client/working-with-fields/working-with-json-fields#filtering-on-a-json-field
   */
  export const JsonNull: NullTypes.JsonNull

  /**
   * Helper for filtering JSON entries that are `Prisma.DbNull` or `Prisma.JsonNull`
   *
   * @see https://www.prisma.io/docs/concepts/components/prisma-client/working-with-fields/working-with-json-fields#filtering-on-a-json-field
   */
  export const AnyNull: NullTypes.AnyNull

  type SelectAndInclude = {
    select: any
    include: any
  }

  type SelectAndOmit = {
    select: any
    omit: any
  }

  /**
   * Get the type of the value, that the Promise holds.
   */
  export type PromiseType<T extends PromiseLike<any>> = T extends PromiseLike<infer U> ? U : T;

  /**
   * Get the return type of a function which returns a Promise.
   */
  export type PromiseReturnType<T extends (...args: any) => $Utils.JsPromise<any>> = PromiseType<ReturnType<T>>

  /**
   * From T, pick a set of properties whose keys are in the union K
   */
  type Prisma__Pick<T, K extends keyof T> = {
      [P in K]: T[P];
  };


  export type Enumerable<T> = T | Array<T>;

  export type RequiredKeys<T> = {
    [K in keyof T]-?: {} extends Prisma__Pick<T, K> ? never : K
  }[keyof T]

  export type TruthyKeys<T> = keyof {
    [K in keyof T as T[K] extends false | undefined | null ? never : K]: K
  }

  export type TrueKeys<T> = TruthyKeys<Prisma__Pick<T, RequiredKeys<T>>>

  /**
   * Subset
   * @desc From `T` pick properties that exist in `U`. Simple version of Intersection
   */
  export type Subset<T, U> = {
    [key in keyof T]: key extends keyof U ? T[key] : never;
  };

  /**
   * SelectSubset
   * @desc From `T` pick properties that exist in `U`. Simple version of Intersection.
   * Additionally, it validates, if both select and include are present. If the case, it errors.
   */
  export type SelectSubset<T, U> = {
    [key in keyof T]: key extends keyof U ? T[key] : never
  } &
    (T extends SelectAndInclude
      ? 'Please either choose `select` or `include`.'
      : T extends SelectAndOmit
        ? 'Please either choose `select` or `omit`.'
        : {})

  /**
   * Subset + Intersection
   * @desc From `T` pick properties that exist in `U` and intersect `K`
   */
  export type SubsetIntersection<T, U, K> = {
    [key in keyof T]: key extends keyof U ? T[key] : never
  } &
    K

  type Without<T, U> = { [P in Exclude<keyof T, keyof U>]?: never };

  /**
   * XOR is needed to have a real mutually exclusive union type
   * https://stackoverflow.com/questions/42123407/does-typescript-support-mutually-exclusive-types
   */
  type XOR<T, U> =
    T extends object ?
    U extends object ?
      (Without<T, U> & U) | (Without<U, T> & T)
    : U : T


  /**
   * Is T a Record?
   */
  type IsObject<T extends any> = T extends Array<any>
  ? False
  : T extends Date
  ? False
  : T extends Uint8Array
  ? False
  : T extends BigInt
  ? False
  : T extends object
  ? True
  : False


  /**
   * If it's T[], return T
   */
  export type UnEnumerate<T extends unknown> = T extends Array<infer U> ? U : T

  /**
   * From ts-toolbelt
   */

  type __Either<O extends object, K extends Key> = Omit<O, K> &
    {
      // Merge all but K
      [P in K]: Prisma__Pick<O, P & keyof O> // With K possibilities
    }[K]

  type EitherStrict<O extends object, K extends Key> = Strict<__Either<O, K>>

  type EitherLoose<O extends object, K extends Key> = ComputeRaw<__Either<O, K>>

  type _Either<
    O extends object,
    K extends Key,
    strict extends Boolean
  > = {
    1: EitherStrict<O, K>
    0: EitherLoose<O, K>
  }[strict]

  type Either<
    O extends object,
    K extends Key,
    strict extends Boolean = 1
  > = O extends unknown ? _Either<O, K, strict> : never

  export type Union = any

  type PatchUndefined<O extends object, O1 extends object> = {
    [K in keyof O]: O[K] extends undefined ? At<O1, K> : O[K]
  } & {}

  /** Helper Types for "Merge" **/
  export type IntersectOf<U extends Union> = (
    U extends unknown ? (k: U) => void : never
  ) extends (k: infer I) => void
    ? I
    : never

  export type Overwrite<O extends object, O1 extends object> = {
      [K in keyof O]: K extends keyof O1 ? O1[K] : O[K];
  } & {};

  type _Merge<U extends object> = IntersectOf<Overwrite<U, {
      [K in keyof U]-?: At<U, K>;
  }>>;

  type Key = string | number | symbol;
  type AtBasic<O extends object, K extends Key> = K extends keyof O ? O[K] : never;
  type AtStrict<O extends object, K extends Key> = O[K & keyof O];
  type AtLoose<O extends object, K extends Key> = O extends unknown ? AtStrict<O, K> : never;
  export type At<O extends object, K extends Key, strict extends Boolean = 1> = {
      1: AtStrict<O, K>;
      0: AtLoose<O, K>;
  }[strict];

  export type ComputeRaw<A extends any> = A extends Function ? A : {
    [K in keyof A]: A[K];
  } & {};

  export type OptionalFlat<O> = {
    [K in keyof O]?: O[K];
  } & {};

  type _Record<K extends keyof any, T> = {
    [P in K]: T;
  };

  // cause typescript not to expand types and preserve names
  type NoExpand<T> = T extends unknown ? T : never;

  // this type assumes the passed object is entirely optional
  type AtLeast<O extends object, K extends string> = NoExpand<
    O extends unknown
    ? | (K extends keyof O ? { [P in K]: O[P] } & O : O)
      | {[P in keyof O as P extends K ? P : never]-?: O[P]} & O
    : never>;

  type _Strict<U, _U = U> = U extends unknown ? U & OptionalFlat<_Record<Exclude<Keys<_U>, keyof U>, never>> : never;

  export type Strict<U extends object> = ComputeRaw<_Strict<U>>;
  /** End Helper Types for "Merge" **/

  export type Merge<U extends object> = ComputeRaw<_Merge<Strict<U>>>;

  /**
  A [[Boolean]]
  */
  export type Boolean = True | False

  // /**
  // 1
  // */
  export type True = 1

  /**
  0
  */
  export type False = 0

  export type Not<B extends Boolean> = {
    0: 1
    1: 0
  }[B]

  export type Extends<A1 extends any, A2 extends any> = [A1] extends [never]
    ? 0 // anything `never` is false
    : A1 extends A2
    ? 1
    : 0

  export type Has<U extends Union, U1 extends Union> = Not<
    Extends<Exclude<U1, U>, U1>
  >

  export type Or<B1 extends Boolean, B2 extends Boolean> = {
    0: {
      0: 0
      1: 1
    }
    1: {
      0: 1
      1: 1
    }
  }[B1][B2]

  export type Keys<U extends Union> = U extends unknown ? keyof U : never

  type Cast<A, B> = A extends B ? A : B;

  export const type: unique symbol;



  /**
   * Used by group by
   */

  export type GetScalarType<T, O> = O extends object ? {
    [P in keyof T]: P extends keyof O
      ? O[P]
      : never
  } : never

  type FieldPaths<
    T,
    U = Omit<T, '_avg' | '_sum' | '_count' | '_min' | '_max'>
  > = IsObject<T> extends True ? U : T

  type GetHavingFields<T> = {
    [K in keyof T]: Or<
      Or<Extends<'OR', K>, Extends<'AND', K>>,
      Extends<'NOT', K>
    > extends True
      ? // infer is only needed to not hit TS limit
        // based on the brilliant idea of Pierre-Antoine Mills
        // https://github.com/microsoft/TypeScript/issues/30188#issuecomment-478938437
        T[K] extends infer TK
        ? GetHavingFields<UnEnumerate<TK> extends object ? Merge<UnEnumerate<TK>> : never>
        : never
      : {} extends FieldPaths<T[K]>
      ? never
      : K
  }[keyof T]

  /**
   * Convert tuple to union
   */
  type _TupleToUnion<T> = T extends (infer E)[] ? E : never
  type TupleToUnion<K extends readonly any[]> = _TupleToUnion<K>
  type MaybeTupleToUnion<T> = T extends any[] ? TupleToUnion<T> : T

  /**
   * Like `Pick`, but additionally can also accept an array of keys
   */
  type PickEnumerable<T, K extends Enumerable<keyof T> | keyof T> = Prisma__Pick<T, MaybeTupleToUnion<K>>

  /**
   * Exclude all keys with underscores
   */
  type ExcludeUnderscoreKeys<T extends string> = T extends `_${string}` ? never : T


  export type FieldRef<Model, FieldType> = runtime.FieldRef<Model, FieldType>

  type FieldRefInputType<Model, FieldType> = Model extends never ? never : FieldRef<Model, FieldType>


  export const ModelName: {
    Realtor: 'Realtor',
    Application: 'Application',
    Image: 'Image',
    NewBuildingComplex: 'NewBuildingComplex',
    NewBuildingApartment: 'NewBuildingApartment',
    NearbyPlace: 'NearbyPlace',
    Review: 'Review',
    ReadyApartment: 'ReadyApartment',
    RentalApartment: 'RentalApartment',
    CountryProperty: 'CountryProperty',
    CommercialProperty: 'CommercialProperty'
  };

  export type ModelName = (typeof ModelName)[keyof typeof ModelName]


  export type Datasources = {
    db?: Datasource
  }

  interface TypeMapCb<ClientOptions = {}> extends $Utils.Fn<{extArgs: $Extensions.InternalArgs }, $Utils.Record<string, any>> {
    returns: Prisma.TypeMap<this['params']['extArgs'], ClientOptions extends { omit: infer OmitOptions } ? OmitOptions : {}>
  }

  export type TypeMap<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs, GlobalOmitOptions = {}> = {
    globalOmitOptions: {
      omit: GlobalOmitOptions
    }
    meta: {
      modelProps: "realtor" | "application" | "image" | "newBuildingComplex" | "newBuildingApartment" | "nearbyPlace" | "review" | "readyApartment" | "rentalApartment" | "countryProperty" | "commercialProperty"
      txIsolationLevel: Prisma.TransactionIsolationLevel
    }
    model: {
      Realtor: {
        payload: Prisma.$RealtorPayload<ExtArgs>
        fields: Prisma.RealtorFieldRefs
        operations: {
          findUnique: {
            args: Prisma.RealtorFindUniqueArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$RealtorPayload> | null
          }
          findUniqueOrThrow: {
            args: Prisma.RealtorFindUniqueOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$RealtorPayload>
          }
          findFirst: {
            args: Prisma.RealtorFindFirstArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$RealtorPayload> | null
          }
          findFirstOrThrow: {
            args: Prisma.RealtorFindFirstOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$RealtorPayload>
          }
          findMany: {
            args: Prisma.RealtorFindManyArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$RealtorPayload>[]
          }
          create: {
            args: Prisma.RealtorCreateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$RealtorPayload>
          }
          createMany: {
            args: Prisma.RealtorCreateManyArgs<ExtArgs>
            result: BatchPayload
          }
          createManyAndReturn: {
            args: Prisma.RealtorCreateManyAndReturnArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$RealtorPayload>[]
          }
          delete: {
            args: Prisma.RealtorDeleteArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$RealtorPayload>
          }
          update: {
            args: Prisma.RealtorUpdateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$RealtorPayload>
          }
          deleteMany: {
            args: Prisma.RealtorDeleteManyArgs<ExtArgs>
            result: BatchPayload
          }
          updateMany: {
            args: Prisma.RealtorUpdateManyArgs<ExtArgs>
            result: BatchPayload
          }
          updateManyAndReturn: {
            args: Prisma.RealtorUpdateManyAndReturnArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$RealtorPayload>[]
          }
          upsert: {
            args: Prisma.RealtorUpsertArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$RealtorPayload>
          }
          aggregate: {
            args: Prisma.RealtorAggregateArgs<ExtArgs>
            result: $Utils.Optional<AggregateRealtor>
          }
          groupBy: {
            args: Prisma.RealtorGroupByArgs<ExtArgs>
            result: $Utils.Optional<RealtorGroupByOutputType>[]
          }
          count: {
            args: Prisma.RealtorCountArgs<ExtArgs>
            result: $Utils.Optional<RealtorCountAggregateOutputType> | number
          }
        }
      }
      Application: {
        payload: Prisma.$ApplicationPayload<ExtArgs>
        fields: Prisma.ApplicationFieldRefs
        operations: {
          findUnique: {
            args: Prisma.ApplicationFindUniqueArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ApplicationPayload> | null
          }
          findUniqueOrThrow: {
            args: Prisma.ApplicationFindUniqueOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ApplicationPayload>
          }
          findFirst: {
            args: Prisma.ApplicationFindFirstArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ApplicationPayload> | null
          }
          findFirstOrThrow: {
            args: Prisma.ApplicationFindFirstOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ApplicationPayload>
          }
          findMany: {
            args: Prisma.ApplicationFindManyArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ApplicationPayload>[]
          }
          create: {
            args: Prisma.ApplicationCreateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ApplicationPayload>
          }
          createMany: {
            args: Prisma.ApplicationCreateManyArgs<ExtArgs>
            result: BatchPayload
          }
          createManyAndReturn: {
            args: Prisma.ApplicationCreateManyAndReturnArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ApplicationPayload>[]
          }
          delete: {
            args: Prisma.ApplicationDeleteArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ApplicationPayload>
          }
          update: {
            args: Prisma.ApplicationUpdateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ApplicationPayload>
          }
          deleteMany: {
            args: Prisma.ApplicationDeleteManyArgs<ExtArgs>
            result: BatchPayload
          }
          updateMany: {
            args: Prisma.ApplicationUpdateManyArgs<ExtArgs>
            result: BatchPayload
          }
          updateManyAndReturn: {
            args: Prisma.ApplicationUpdateManyAndReturnArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ApplicationPayload>[]
          }
          upsert: {
            args: Prisma.ApplicationUpsertArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ApplicationPayload>
          }
          aggregate: {
            args: Prisma.ApplicationAggregateArgs<ExtArgs>
            result: $Utils.Optional<AggregateApplication>
          }
          groupBy: {
            args: Prisma.ApplicationGroupByArgs<ExtArgs>
            result: $Utils.Optional<ApplicationGroupByOutputType>[]
          }
          count: {
            args: Prisma.ApplicationCountArgs<ExtArgs>
            result: $Utils.Optional<ApplicationCountAggregateOutputType> | number
          }
        }
      }
      Image: {
        payload: Prisma.$ImagePayload<ExtArgs>
        fields: Prisma.ImageFieldRefs
        operations: {
          findUnique: {
            args: Prisma.ImageFindUniqueArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ImagePayload> | null
          }
          findUniqueOrThrow: {
            args: Prisma.ImageFindUniqueOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ImagePayload>
          }
          findFirst: {
            args: Prisma.ImageFindFirstArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ImagePayload> | null
          }
          findFirstOrThrow: {
            args: Prisma.ImageFindFirstOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ImagePayload>
          }
          findMany: {
            args: Prisma.ImageFindManyArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ImagePayload>[]
          }
          create: {
            args: Prisma.ImageCreateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ImagePayload>
          }
          createMany: {
            args: Prisma.ImageCreateManyArgs<ExtArgs>
            result: BatchPayload
          }
          createManyAndReturn: {
            args: Prisma.ImageCreateManyAndReturnArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ImagePayload>[]
          }
          delete: {
            args: Prisma.ImageDeleteArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ImagePayload>
          }
          update: {
            args: Prisma.ImageUpdateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ImagePayload>
          }
          deleteMany: {
            args: Prisma.ImageDeleteManyArgs<ExtArgs>
            result: BatchPayload
          }
          updateMany: {
            args: Prisma.ImageUpdateManyArgs<ExtArgs>
            result: BatchPayload
          }
          updateManyAndReturn: {
            args: Prisma.ImageUpdateManyAndReturnArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ImagePayload>[]
          }
          upsert: {
            args: Prisma.ImageUpsertArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ImagePayload>
          }
          aggregate: {
            args: Prisma.ImageAggregateArgs<ExtArgs>
            result: $Utils.Optional<AggregateImage>
          }
          groupBy: {
            args: Prisma.ImageGroupByArgs<ExtArgs>
            result: $Utils.Optional<ImageGroupByOutputType>[]
          }
          count: {
            args: Prisma.ImageCountArgs<ExtArgs>
            result: $Utils.Optional<ImageCountAggregateOutputType> | number
          }
        }
      }
      NewBuildingComplex: {
        payload: Prisma.$NewBuildingComplexPayload<ExtArgs>
        fields: Prisma.NewBuildingComplexFieldRefs
        operations: {
          findUnique: {
            args: Prisma.NewBuildingComplexFindUniqueArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NewBuildingComplexPayload> | null
          }
          findUniqueOrThrow: {
            args: Prisma.NewBuildingComplexFindUniqueOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NewBuildingComplexPayload>
          }
          findFirst: {
            args: Prisma.NewBuildingComplexFindFirstArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NewBuildingComplexPayload> | null
          }
          findFirstOrThrow: {
            args: Prisma.NewBuildingComplexFindFirstOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NewBuildingComplexPayload>
          }
          findMany: {
            args: Prisma.NewBuildingComplexFindManyArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NewBuildingComplexPayload>[]
          }
          create: {
            args: Prisma.NewBuildingComplexCreateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NewBuildingComplexPayload>
          }
          createMany: {
            args: Prisma.NewBuildingComplexCreateManyArgs<ExtArgs>
            result: BatchPayload
          }
          createManyAndReturn: {
            args: Prisma.NewBuildingComplexCreateManyAndReturnArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NewBuildingComplexPayload>[]
          }
          delete: {
            args: Prisma.NewBuildingComplexDeleteArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NewBuildingComplexPayload>
          }
          update: {
            args: Prisma.NewBuildingComplexUpdateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NewBuildingComplexPayload>
          }
          deleteMany: {
            args: Prisma.NewBuildingComplexDeleteManyArgs<ExtArgs>
            result: BatchPayload
          }
          updateMany: {
            args: Prisma.NewBuildingComplexUpdateManyArgs<ExtArgs>
            result: BatchPayload
          }
          updateManyAndReturn: {
            args: Prisma.NewBuildingComplexUpdateManyAndReturnArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NewBuildingComplexPayload>[]
          }
          upsert: {
            args: Prisma.NewBuildingComplexUpsertArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NewBuildingComplexPayload>
          }
          aggregate: {
            args: Prisma.NewBuildingComplexAggregateArgs<ExtArgs>
            result: $Utils.Optional<AggregateNewBuildingComplex>
          }
          groupBy: {
            args: Prisma.NewBuildingComplexGroupByArgs<ExtArgs>
            result: $Utils.Optional<NewBuildingComplexGroupByOutputType>[]
          }
          count: {
            args: Prisma.NewBuildingComplexCountArgs<ExtArgs>
            result: $Utils.Optional<NewBuildingComplexCountAggregateOutputType> | number
          }
        }
      }
      NewBuildingApartment: {
        payload: Prisma.$NewBuildingApartmentPayload<ExtArgs>
        fields: Prisma.NewBuildingApartmentFieldRefs
        operations: {
          findUnique: {
            args: Prisma.NewBuildingApartmentFindUniqueArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NewBuildingApartmentPayload> | null
          }
          findUniqueOrThrow: {
            args: Prisma.NewBuildingApartmentFindUniqueOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NewBuildingApartmentPayload>
          }
          findFirst: {
            args: Prisma.NewBuildingApartmentFindFirstArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NewBuildingApartmentPayload> | null
          }
          findFirstOrThrow: {
            args: Prisma.NewBuildingApartmentFindFirstOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NewBuildingApartmentPayload>
          }
          findMany: {
            args: Prisma.NewBuildingApartmentFindManyArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NewBuildingApartmentPayload>[]
          }
          create: {
            args: Prisma.NewBuildingApartmentCreateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NewBuildingApartmentPayload>
          }
          createMany: {
            args: Prisma.NewBuildingApartmentCreateManyArgs<ExtArgs>
            result: BatchPayload
          }
          createManyAndReturn: {
            args: Prisma.NewBuildingApartmentCreateManyAndReturnArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NewBuildingApartmentPayload>[]
          }
          delete: {
            args: Prisma.NewBuildingApartmentDeleteArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NewBuildingApartmentPayload>
          }
          update: {
            args: Prisma.NewBuildingApartmentUpdateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NewBuildingApartmentPayload>
          }
          deleteMany: {
            args: Prisma.NewBuildingApartmentDeleteManyArgs<ExtArgs>
            result: BatchPayload
          }
          updateMany: {
            args: Prisma.NewBuildingApartmentUpdateManyArgs<ExtArgs>
            result: BatchPayload
          }
          updateManyAndReturn: {
            args: Prisma.NewBuildingApartmentUpdateManyAndReturnArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NewBuildingApartmentPayload>[]
          }
          upsert: {
            args: Prisma.NewBuildingApartmentUpsertArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NewBuildingApartmentPayload>
          }
          aggregate: {
            args: Prisma.NewBuildingApartmentAggregateArgs<ExtArgs>
            result: $Utils.Optional<AggregateNewBuildingApartment>
          }
          groupBy: {
            args: Prisma.NewBuildingApartmentGroupByArgs<ExtArgs>
            result: $Utils.Optional<NewBuildingApartmentGroupByOutputType>[]
          }
          count: {
            args: Prisma.NewBuildingApartmentCountArgs<ExtArgs>
            result: $Utils.Optional<NewBuildingApartmentCountAggregateOutputType> | number
          }
        }
      }
      NearbyPlace: {
        payload: Prisma.$NearbyPlacePayload<ExtArgs>
        fields: Prisma.NearbyPlaceFieldRefs
        operations: {
          findUnique: {
            args: Prisma.NearbyPlaceFindUniqueArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NearbyPlacePayload> | null
          }
          findUniqueOrThrow: {
            args: Prisma.NearbyPlaceFindUniqueOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NearbyPlacePayload>
          }
          findFirst: {
            args: Prisma.NearbyPlaceFindFirstArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NearbyPlacePayload> | null
          }
          findFirstOrThrow: {
            args: Prisma.NearbyPlaceFindFirstOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NearbyPlacePayload>
          }
          findMany: {
            args: Prisma.NearbyPlaceFindManyArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NearbyPlacePayload>[]
          }
          create: {
            args: Prisma.NearbyPlaceCreateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NearbyPlacePayload>
          }
          createMany: {
            args: Prisma.NearbyPlaceCreateManyArgs<ExtArgs>
            result: BatchPayload
          }
          createManyAndReturn: {
            args: Prisma.NearbyPlaceCreateManyAndReturnArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NearbyPlacePayload>[]
          }
          delete: {
            args: Prisma.NearbyPlaceDeleteArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NearbyPlacePayload>
          }
          update: {
            args: Prisma.NearbyPlaceUpdateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NearbyPlacePayload>
          }
          deleteMany: {
            args: Prisma.NearbyPlaceDeleteManyArgs<ExtArgs>
            result: BatchPayload
          }
          updateMany: {
            args: Prisma.NearbyPlaceUpdateManyArgs<ExtArgs>
            result: BatchPayload
          }
          updateManyAndReturn: {
            args: Prisma.NearbyPlaceUpdateManyAndReturnArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NearbyPlacePayload>[]
          }
          upsert: {
            args: Prisma.NearbyPlaceUpsertArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$NearbyPlacePayload>
          }
          aggregate: {
            args: Prisma.NearbyPlaceAggregateArgs<ExtArgs>
            result: $Utils.Optional<AggregateNearbyPlace>
          }
          groupBy: {
            args: Prisma.NearbyPlaceGroupByArgs<ExtArgs>
            result: $Utils.Optional<NearbyPlaceGroupByOutputType>[]
          }
          count: {
            args: Prisma.NearbyPlaceCountArgs<ExtArgs>
            result: $Utils.Optional<NearbyPlaceCountAggregateOutputType> | number
          }
        }
      }
      Review: {
        payload: Prisma.$ReviewPayload<ExtArgs>
        fields: Prisma.ReviewFieldRefs
        operations: {
          findUnique: {
            args: Prisma.ReviewFindUniqueArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ReviewPayload> | null
          }
          findUniqueOrThrow: {
            args: Prisma.ReviewFindUniqueOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ReviewPayload>
          }
          findFirst: {
            args: Prisma.ReviewFindFirstArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ReviewPayload> | null
          }
          findFirstOrThrow: {
            args: Prisma.ReviewFindFirstOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ReviewPayload>
          }
          findMany: {
            args: Prisma.ReviewFindManyArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ReviewPayload>[]
          }
          create: {
            args: Prisma.ReviewCreateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ReviewPayload>
          }
          createMany: {
            args: Prisma.ReviewCreateManyArgs<ExtArgs>
            result: BatchPayload
          }
          createManyAndReturn: {
            args: Prisma.ReviewCreateManyAndReturnArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ReviewPayload>[]
          }
          delete: {
            args: Prisma.ReviewDeleteArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ReviewPayload>
          }
          update: {
            args: Prisma.ReviewUpdateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ReviewPayload>
          }
          deleteMany: {
            args: Prisma.ReviewDeleteManyArgs<ExtArgs>
            result: BatchPayload
          }
          updateMany: {
            args: Prisma.ReviewUpdateManyArgs<ExtArgs>
            result: BatchPayload
          }
          updateManyAndReturn: {
            args: Prisma.ReviewUpdateManyAndReturnArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ReviewPayload>[]
          }
          upsert: {
            args: Prisma.ReviewUpsertArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ReviewPayload>
          }
          aggregate: {
            args: Prisma.ReviewAggregateArgs<ExtArgs>
            result: $Utils.Optional<AggregateReview>
          }
          groupBy: {
            args: Prisma.ReviewGroupByArgs<ExtArgs>
            result: $Utils.Optional<ReviewGroupByOutputType>[]
          }
          count: {
            args: Prisma.ReviewCountArgs<ExtArgs>
            result: $Utils.Optional<ReviewCountAggregateOutputType> | number
          }
        }
      }
      ReadyApartment: {
        payload: Prisma.$ReadyApartmentPayload<ExtArgs>
        fields: Prisma.ReadyApartmentFieldRefs
        operations: {
          findUnique: {
            args: Prisma.ReadyApartmentFindUniqueArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ReadyApartmentPayload> | null
          }
          findUniqueOrThrow: {
            args: Prisma.ReadyApartmentFindUniqueOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ReadyApartmentPayload>
          }
          findFirst: {
            args: Prisma.ReadyApartmentFindFirstArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ReadyApartmentPayload> | null
          }
          findFirstOrThrow: {
            args: Prisma.ReadyApartmentFindFirstOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ReadyApartmentPayload>
          }
          findMany: {
            args: Prisma.ReadyApartmentFindManyArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ReadyApartmentPayload>[]
          }
          create: {
            args: Prisma.ReadyApartmentCreateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ReadyApartmentPayload>
          }
          createMany: {
            args: Prisma.ReadyApartmentCreateManyArgs<ExtArgs>
            result: BatchPayload
          }
          createManyAndReturn: {
            args: Prisma.ReadyApartmentCreateManyAndReturnArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ReadyApartmentPayload>[]
          }
          delete: {
            args: Prisma.ReadyApartmentDeleteArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ReadyApartmentPayload>
          }
          update: {
            args: Prisma.ReadyApartmentUpdateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ReadyApartmentPayload>
          }
          deleteMany: {
            args: Prisma.ReadyApartmentDeleteManyArgs<ExtArgs>
            result: BatchPayload
          }
          updateMany: {
            args: Prisma.ReadyApartmentUpdateManyArgs<ExtArgs>
            result: BatchPayload
          }
          updateManyAndReturn: {
            args: Prisma.ReadyApartmentUpdateManyAndReturnArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ReadyApartmentPayload>[]
          }
          upsert: {
            args: Prisma.ReadyApartmentUpsertArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$ReadyApartmentPayload>
          }
          aggregate: {
            args: Prisma.ReadyApartmentAggregateArgs<ExtArgs>
            result: $Utils.Optional<AggregateReadyApartment>
          }
          groupBy: {
            args: Prisma.ReadyApartmentGroupByArgs<ExtArgs>
            result: $Utils.Optional<ReadyApartmentGroupByOutputType>[]
          }
          count: {
            args: Prisma.ReadyApartmentCountArgs<ExtArgs>
            result: $Utils.Optional<ReadyApartmentCountAggregateOutputType> | number
          }
        }
      }
      RentalApartment: {
        payload: Prisma.$RentalApartmentPayload<ExtArgs>
        fields: Prisma.RentalApartmentFieldRefs
        operations: {
          findUnique: {
            args: Prisma.RentalApartmentFindUniqueArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$RentalApartmentPayload> | null
          }
          findUniqueOrThrow: {
            args: Prisma.RentalApartmentFindUniqueOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$RentalApartmentPayload>
          }
          findFirst: {
            args: Prisma.RentalApartmentFindFirstArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$RentalApartmentPayload> | null
          }
          findFirstOrThrow: {
            args: Prisma.RentalApartmentFindFirstOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$RentalApartmentPayload>
          }
          findMany: {
            args: Prisma.RentalApartmentFindManyArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$RentalApartmentPayload>[]
          }
          create: {
            args: Prisma.RentalApartmentCreateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$RentalApartmentPayload>
          }
          createMany: {
            args: Prisma.RentalApartmentCreateManyArgs<ExtArgs>
            result: BatchPayload
          }
          createManyAndReturn: {
            args: Prisma.RentalApartmentCreateManyAndReturnArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$RentalApartmentPayload>[]
          }
          delete: {
            args: Prisma.RentalApartmentDeleteArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$RentalApartmentPayload>
          }
          update: {
            args: Prisma.RentalApartmentUpdateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$RentalApartmentPayload>
          }
          deleteMany: {
            args: Prisma.RentalApartmentDeleteManyArgs<ExtArgs>
            result: BatchPayload
          }
          updateMany: {
            args: Prisma.RentalApartmentUpdateManyArgs<ExtArgs>
            result: BatchPayload
          }
          updateManyAndReturn: {
            args: Prisma.RentalApartmentUpdateManyAndReturnArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$RentalApartmentPayload>[]
          }
          upsert: {
            args: Prisma.RentalApartmentUpsertArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$RentalApartmentPayload>
          }
          aggregate: {
            args: Prisma.RentalApartmentAggregateArgs<ExtArgs>
            result: $Utils.Optional<AggregateRentalApartment>
          }
          groupBy: {
            args: Prisma.RentalApartmentGroupByArgs<ExtArgs>
            result: $Utils.Optional<RentalApartmentGroupByOutputType>[]
          }
          count: {
            args: Prisma.RentalApartmentCountArgs<ExtArgs>
            result: $Utils.Optional<RentalApartmentCountAggregateOutputType> | number
          }
        }
      }
      CountryProperty: {
        payload: Prisma.$CountryPropertyPayload<ExtArgs>
        fields: Prisma.CountryPropertyFieldRefs
        operations: {
          findUnique: {
            args: Prisma.CountryPropertyFindUniqueArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$CountryPropertyPayload> | null
          }
          findUniqueOrThrow: {
            args: Prisma.CountryPropertyFindUniqueOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$CountryPropertyPayload>
          }
          findFirst: {
            args: Prisma.CountryPropertyFindFirstArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$CountryPropertyPayload> | null
          }
          findFirstOrThrow: {
            args: Prisma.CountryPropertyFindFirstOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$CountryPropertyPayload>
          }
          findMany: {
            args: Prisma.CountryPropertyFindManyArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$CountryPropertyPayload>[]
          }
          create: {
            args: Prisma.CountryPropertyCreateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$CountryPropertyPayload>
          }
          createMany: {
            args: Prisma.CountryPropertyCreateManyArgs<ExtArgs>
            result: BatchPayload
          }
          createManyAndReturn: {
            args: Prisma.CountryPropertyCreateManyAndReturnArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$CountryPropertyPayload>[]
          }
          delete: {
            args: Prisma.CountryPropertyDeleteArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$CountryPropertyPayload>
          }
          update: {
            args: Prisma.CountryPropertyUpdateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$CountryPropertyPayload>
          }
          deleteMany: {
            args: Prisma.CountryPropertyDeleteManyArgs<ExtArgs>
            result: BatchPayload
          }
          updateMany: {
            args: Prisma.CountryPropertyUpdateManyArgs<ExtArgs>
            result: BatchPayload
          }
          updateManyAndReturn: {
            args: Prisma.CountryPropertyUpdateManyAndReturnArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$CountryPropertyPayload>[]
          }
          upsert: {
            args: Prisma.CountryPropertyUpsertArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$CountryPropertyPayload>
          }
          aggregate: {
            args: Prisma.CountryPropertyAggregateArgs<ExtArgs>
            result: $Utils.Optional<AggregateCountryProperty>
          }
          groupBy: {
            args: Prisma.CountryPropertyGroupByArgs<ExtArgs>
            result: $Utils.Optional<CountryPropertyGroupByOutputType>[]
          }
          count: {
            args: Prisma.CountryPropertyCountArgs<ExtArgs>
            result: $Utils.Optional<CountryPropertyCountAggregateOutputType> | number
          }
        }
      }
      CommercialProperty: {
        payload: Prisma.$CommercialPropertyPayload<ExtArgs>
        fields: Prisma.CommercialPropertyFieldRefs
        operations: {
          findUnique: {
            args: Prisma.CommercialPropertyFindUniqueArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$CommercialPropertyPayload> | null
          }
          findUniqueOrThrow: {
            args: Prisma.CommercialPropertyFindUniqueOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$CommercialPropertyPayload>
          }
          findFirst: {
            args: Prisma.CommercialPropertyFindFirstArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$CommercialPropertyPayload> | null
          }
          findFirstOrThrow: {
            args: Prisma.CommercialPropertyFindFirstOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$CommercialPropertyPayload>
          }
          findMany: {
            args: Prisma.CommercialPropertyFindManyArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$CommercialPropertyPayload>[]
          }
          create: {
            args: Prisma.CommercialPropertyCreateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$CommercialPropertyPayload>
          }
          createMany: {
            args: Prisma.CommercialPropertyCreateManyArgs<ExtArgs>
            result: BatchPayload
          }
          createManyAndReturn: {
            args: Prisma.CommercialPropertyCreateManyAndReturnArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$CommercialPropertyPayload>[]
          }
          delete: {
            args: Prisma.CommercialPropertyDeleteArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$CommercialPropertyPayload>
          }
          update: {
            args: Prisma.CommercialPropertyUpdateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$CommercialPropertyPayload>
          }
          deleteMany: {
            args: Prisma.CommercialPropertyDeleteManyArgs<ExtArgs>
            result: BatchPayload
          }
          updateMany: {
            args: Prisma.CommercialPropertyUpdateManyArgs<ExtArgs>
            result: BatchPayload
          }
          updateManyAndReturn: {
            args: Prisma.CommercialPropertyUpdateManyAndReturnArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$CommercialPropertyPayload>[]
          }
          upsert: {
            args: Prisma.CommercialPropertyUpsertArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$CommercialPropertyPayload>
          }
          aggregate: {
            args: Prisma.CommercialPropertyAggregateArgs<ExtArgs>
            result: $Utils.Optional<AggregateCommercialProperty>
          }
          groupBy: {
            args: Prisma.CommercialPropertyGroupByArgs<ExtArgs>
            result: $Utils.Optional<CommercialPropertyGroupByOutputType>[]
          }
          count: {
            args: Prisma.CommercialPropertyCountArgs<ExtArgs>
            result: $Utils.Optional<CommercialPropertyCountAggregateOutputType> | number
          }
        }
      }
    }
  } & {
    other: {
      payload: any
      operations: {
        $executeRaw: {
          args: [query: TemplateStringsArray | Prisma.Sql, ...values: any[]],
          result: any
        }
        $executeRawUnsafe: {
          args: [query: string, ...values: any[]],
          result: any
        }
        $queryRaw: {
          args: [query: TemplateStringsArray | Prisma.Sql, ...values: any[]],
          result: any
        }
        $queryRawUnsafe: {
          args: [query: string, ...values: any[]],
          result: any
        }
      }
    }
  }
  export const defineExtension: $Extensions.ExtendsHook<"define", Prisma.TypeMapCb, $Extensions.DefaultArgs>
  export type DefaultPrismaClient = PrismaClient
  export type ErrorFormat = 'pretty' | 'colorless' | 'minimal'
  export interface PrismaClientOptions {
    /**
     * Overwrites the datasource url from your schema.prisma file
     */
    datasources?: Datasources
    /**
     * Overwrites the datasource url from your schema.prisma file
     */
    datasourceUrl?: string
    /**
     * @default "colorless"
     */
    errorFormat?: ErrorFormat
    /**
     * @example
     * ```
     * // Defaults to stdout
     * log: ['query', 'info', 'warn', 'error']
     * 
     * // Emit as events
     * log: [
     *   { emit: 'stdout', level: 'query' },
     *   { emit: 'stdout', level: 'info' },
     *   { emit: 'stdout', level: 'warn' }
     *   { emit: 'stdout', level: 'error' }
     * ]
     * ```
     * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client/logging#the-log-option).
     */
    log?: (LogLevel | LogDefinition)[]
    /**
     * The default values for transactionOptions
     * maxWait ?= 2000
     * timeout ?= 5000
     */
    transactionOptions?: {
      maxWait?: number
      timeout?: number
      isolationLevel?: Prisma.TransactionIsolationLevel
    }
    /**
     * Global configuration for omitting model fields by default.
     * 
     * @example
     * ```
     * const prisma = new PrismaClient({
     *   omit: {
     *     user: {
     *       password: true
     *     }
     *   }
     * })
     * ```
     */
    omit?: Prisma.GlobalOmitConfig
  }
  export type GlobalOmitConfig = {
    realtor?: RealtorOmit
    application?: ApplicationOmit
    image?: ImageOmit
    newBuildingComplex?: NewBuildingComplexOmit
    newBuildingApartment?: NewBuildingApartmentOmit
    nearbyPlace?: NearbyPlaceOmit
    review?: ReviewOmit
    readyApartment?: ReadyApartmentOmit
    rentalApartment?: RentalApartmentOmit
    countryProperty?: CountryPropertyOmit
    commercialProperty?: CommercialPropertyOmit
  }

  /* Types for Logging */
  export type LogLevel = 'info' | 'query' | 'warn' | 'error'
  export type LogDefinition = {
    level: LogLevel
    emit: 'stdout' | 'event'
  }

  export type GetLogType<T extends LogLevel | LogDefinition> = T extends LogDefinition ? T['emit'] extends 'event' ? T['level'] : never : never
  export type GetEvents<T extends any> = T extends Array<LogLevel | LogDefinition> ?
    GetLogType<T[0]> | GetLogType<T[1]> | GetLogType<T[2]> | GetLogType<T[3]>
    : never

  export type QueryEvent = {
    timestamp: Date
    query: string
    params: string
    duration: number
    target: string
  }

  export type LogEvent = {
    timestamp: Date
    message: string
    target: string
  }
  /* End Types for Logging */


  export type PrismaAction =
    | 'findUnique'
    | 'findUniqueOrThrow'
    | 'findMany'
    | 'findFirst'
    | 'findFirstOrThrow'
    | 'create'
    | 'createMany'
    | 'createManyAndReturn'
    | 'update'
    | 'updateMany'
    | 'updateManyAndReturn'
    | 'upsert'
    | 'delete'
    | 'deleteMany'
    | 'executeRaw'
    | 'queryRaw'
    | 'aggregate'
    | 'count'
    | 'runCommandRaw'
    | 'findRaw'
    | 'groupBy'

  /**
   * These options are being passed into the middleware as "params"
   */
  export type MiddlewareParams = {
    model?: ModelName
    action: PrismaAction
    args: any
    dataPath: string[]
    runInTransaction: boolean
  }

  /**
   * The `T` type makes sure, that the `return proceed` is not forgotten in the middleware implementation
   */
  export type Middleware<T = any> = (
    params: MiddlewareParams,
    next: (params: MiddlewareParams) => $Utils.JsPromise<T>,
  ) => $Utils.JsPromise<T>

  // tested in getLogLevel.test.ts
  export function getLogLevel(log: Array<LogLevel | LogDefinition>): LogLevel | undefined;

  /**
   * `PrismaClient` proxy available in interactive transactions.
   */
  export type TransactionClient = Omit<Prisma.DefaultPrismaClient, runtime.ITXClientDenyList>

  export type Datasource = {
    url?: string
  }

  /**
   * Count Types
   */


  /**
   * Count Type NewBuildingComplexCountOutputType
   */

  export type NewBuildingComplexCountOutputType = {
    images: number
    apartments: number
    nearbyPlaces: number
  }

  export type NewBuildingComplexCountOutputTypeSelect<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    images?: boolean | NewBuildingComplexCountOutputTypeCountImagesArgs
    apartments?: boolean | NewBuildingComplexCountOutputTypeCountApartmentsArgs
    nearbyPlaces?: boolean | NewBuildingComplexCountOutputTypeCountNearbyPlacesArgs
  }

  // Custom InputTypes
  /**
   * NewBuildingComplexCountOutputType without action
   */
  export type NewBuildingComplexCountOutputTypeDefaultArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingComplexCountOutputType
     */
    select?: NewBuildingComplexCountOutputTypeSelect<ExtArgs> | null
  }

  /**
   * NewBuildingComplexCountOutputType without action
   */
  export type NewBuildingComplexCountOutputTypeCountImagesArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    where?: ImageWhereInput
  }

  /**
   * NewBuildingComplexCountOutputType without action
   */
  export type NewBuildingComplexCountOutputTypeCountApartmentsArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    where?: NewBuildingApartmentWhereInput
  }

  /**
   * NewBuildingComplexCountOutputType without action
   */
  export type NewBuildingComplexCountOutputTypeCountNearbyPlacesArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    where?: NearbyPlaceWhereInput
  }


  /**
   * Count Type NewBuildingApartmentCountOutputType
   */

  export type NewBuildingApartmentCountOutputType = {
    images: number
  }

  export type NewBuildingApartmentCountOutputTypeSelect<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    images?: boolean | NewBuildingApartmentCountOutputTypeCountImagesArgs
  }

  // Custom InputTypes
  /**
   * NewBuildingApartmentCountOutputType without action
   */
  export type NewBuildingApartmentCountOutputTypeDefaultArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingApartmentCountOutputType
     */
    select?: NewBuildingApartmentCountOutputTypeSelect<ExtArgs> | null
  }

  /**
   * NewBuildingApartmentCountOutputType without action
   */
  export type NewBuildingApartmentCountOutputTypeCountImagesArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    where?: ImageWhereInput
  }


  /**
   * Count Type ReadyApartmentCountOutputType
   */

  export type ReadyApartmentCountOutputType = {
    images: number
  }

  export type ReadyApartmentCountOutputTypeSelect<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    images?: boolean | ReadyApartmentCountOutputTypeCountImagesArgs
  }

  // Custom InputTypes
  /**
   * ReadyApartmentCountOutputType without action
   */
  export type ReadyApartmentCountOutputTypeDefaultArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the ReadyApartmentCountOutputType
     */
    select?: ReadyApartmentCountOutputTypeSelect<ExtArgs> | null
  }

  /**
   * ReadyApartmentCountOutputType without action
   */
  export type ReadyApartmentCountOutputTypeCountImagesArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    where?: ImageWhereInput
  }


  /**
   * Count Type RentalApartmentCountOutputType
   */

  export type RentalApartmentCountOutputType = {
    images: number
  }

  export type RentalApartmentCountOutputTypeSelect<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    images?: boolean | RentalApartmentCountOutputTypeCountImagesArgs
  }

  // Custom InputTypes
  /**
   * RentalApartmentCountOutputType without action
   */
  export type RentalApartmentCountOutputTypeDefaultArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the RentalApartmentCountOutputType
     */
    select?: RentalApartmentCountOutputTypeSelect<ExtArgs> | null
  }

  /**
   * RentalApartmentCountOutputType without action
   */
  export type RentalApartmentCountOutputTypeCountImagesArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    where?: ImageWhereInput
  }


  /**
   * Count Type CountryPropertyCountOutputType
   */

  export type CountryPropertyCountOutputType = {
    images: number
  }

  export type CountryPropertyCountOutputTypeSelect<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    images?: boolean | CountryPropertyCountOutputTypeCountImagesArgs
  }

  // Custom InputTypes
  /**
   * CountryPropertyCountOutputType without action
   */
  export type CountryPropertyCountOutputTypeDefaultArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CountryPropertyCountOutputType
     */
    select?: CountryPropertyCountOutputTypeSelect<ExtArgs> | null
  }

  /**
   * CountryPropertyCountOutputType without action
   */
  export type CountryPropertyCountOutputTypeCountImagesArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    where?: ImageWhereInput
  }


  /**
   * Count Type CommercialPropertyCountOutputType
   */

  export type CommercialPropertyCountOutputType = {
    images: number
  }

  export type CommercialPropertyCountOutputTypeSelect<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    images?: boolean | CommercialPropertyCountOutputTypeCountImagesArgs
  }

  // Custom InputTypes
  /**
   * CommercialPropertyCountOutputType without action
   */
  export type CommercialPropertyCountOutputTypeDefaultArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CommercialPropertyCountOutputType
     */
    select?: CommercialPropertyCountOutputTypeSelect<ExtArgs> | null
  }

  /**
   * CommercialPropertyCountOutputType without action
   */
  export type CommercialPropertyCountOutputTypeCountImagesArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    where?: ImageWhereInput
  }


  /**
   * Models
   */

  /**
   * Model Realtor
   */

  export type AggregateRealtor = {
    _count: RealtorCountAggregateOutputType | null
    _avg: RealtorAvgAggregateOutputType | null
    _sum: RealtorSumAggregateOutputType | null
    _min: RealtorMinAggregateOutputType | null
    _max: RealtorMaxAggregateOutputType | null
  }

  export type RealtorAvgAggregateOutputType = {
    id: number | null
  }

  export type RealtorSumAggregateOutputType = {
    id: number | null
  }

  export type RealtorMinAggregateOutputType = {
    id: number | null
    fullName: string | null
    phone: string | null
    email: string | null
    avatarUrl: string | null
    position: string | null
    createdAt: Date | null
    updatedAt: Date | null
  }

  export type RealtorMaxAggregateOutputType = {
    id: number | null
    fullName: string | null
    phone: string | null
    email: string | null
    avatarUrl: string | null
    position: string | null
    createdAt: Date | null
    updatedAt: Date | null
  }

  export type RealtorCountAggregateOutputType = {
    id: number
    fullName: number
    phone: number
    email: number
    avatarUrl: number
    position: number
    createdAt: number
    updatedAt: number
    _all: number
  }


  export type RealtorAvgAggregateInputType = {
    id?: true
  }

  export type RealtorSumAggregateInputType = {
    id?: true
  }

  export type RealtorMinAggregateInputType = {
    id?: true
    fullName?: true
    phone?: true
    email?: true
    avatarUrl?: true
    position?: true
    createdAt?: true
    updatedAt?: true
  }

  export type RealtorMaxAggregateInputType = {
    id?: true
    fullName?: true
    phone?: true
    email?: true
    avatarUrl?: true
    position?: true
    createdAt?: true
    updatedAt?: true
  }

  export type RealtorCountAggregateInputType = {
    id?: true
    fullName?: true
    phone?: true
    email?: true
    avatarUrl?: true
    position?: true
    createdAt?: true
    updatedAt?: true
    _all?: true
  }

  export type RealtorAggregateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which Realtor to aggregate.
     */
    where?: RealtorWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Realtors to fetch.
     */
    orderBy?: RealtorOrderByWithRelationInput | RealtorOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the start position
     */
    cursor?: RealtorWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Realtors from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Realtors.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Count returned Realtors
    **/
    _count?: true | RealtorCountAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to average
    **/
    _avg?: RealtorAvgAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to sum
    **/
    _sum?: RealtorSumAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the minimum value
    **/
    _min?: RealtorMinAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the maximum value
    **/
    _max?: RealtorMaxAggregateInputType
  }

  export type GetRealtorAggregateType<T extends RealtorAggregateArgs> = {
        [P in keyof T & keyof AggregateRealtor]: P extends '_count' | 'count'
      ? T[P] extends true
        ? number
        : GetScalarType<T[P], AggregateRealtor[P]>
      : GetScalarType<T[P], AggregateRealtor[P]>
  }




  export type RealtorGroupByArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    where?: RealtorWhereInput
    orderBy?: RealtorOrderByWithAggregationInput | RealtorOrderByWithAggregationInput[]
    by: RealtorScalarFieldEnum[] | RealtorScalarFieldEnum
    having?: RealtorScalarWhereWithAggregatesInput
    take?: number
    skip?: number
    _count?: RealtorCountAggregateInputType | true
    _avg?: RealtorAvgAggregateInputType
    _sum?: RealtorSumAggregateInputType
    _min?: RealtorMinAggregateInputType
    _max?: RealtorMaxAggregateInputType
  }

  export type RealtorGroupByOutputType = {
    id: number
    fullName: string
    phone: string | null
    email: string | null
    avatarUrl: string | null
    position: string | null
    createdAt: Date
    updatedAt: Date
    _count: RealtorCountAggregateOutputType | null
    _avg: RealtorAvgAggregateOutputType | null
    _sum: RealtorSumAggregateOutputType | null
    _min: RealtorMinAggregateOutputType | null
    _max: RealtorMaxAggregateOutputType | null
  }

  type GetRealtorGroupByPayload<T extends RealtorGroupByArgs> = Prisma.PrismaPromise<
    Array<
      PickEnumerable<RealtorGroupByOutputType, T['by']> &
        {
          [P in ((keyof T) & (keyof RealtorGroupByOutputType))]: P extends '_count'
            ? T[P] extends boolean
              ? number
              : GetScalarType<T[P], RealtorGroupByOutputType[P]>
            : GetScalarType<T[P], RealtorGroupByOutputType[P]>
        }
      >
    >


  export type RealtorSelect<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    fullName?: boolean
    phone?: boolean
    email?: boolean
    avatarUrl?: boolean
    position?: boolean
    createdAt?: boolean
    updatedAt?: boolean
  }, ExtArgs["result"]["realtor"]>

  export type RealtorSelectCreateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    fullName?: boolean
    phone?: boolean
    email?: boolean
    avatarUrl?: boolean
    position?: boolean
    createdAt?: boolean
    updatedAt?: boolean
  }, ExtArgs["result"]["realtor"]>

  export type RealtorSelectUpdateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    fullName?: boolean
    phone?: boolean
    email?: boolean
    avatarUrl?: boolean
    position?: boolean
    createdAt?: boolean
    updatedAt?: boolean
  }, ExtArgs["result"]["realtor"]>

  export type RealtorSelectScalar = {
    id?: boolean
    fullName?: boolean
    phone?: boolean
    email?: boolean
    avatarUrl?: boolean
    position?: boolean
    createdAt?: boolean
    updatedAt?: boolean
  }

  export type RealtorOmit<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetOmit<"id" | "fullName" | "phone" | "email" | "avatarUrl" | "position" | "createdAt" | "updatedAt", ExtArgs["result"]["realtor"]>

  export type $RealtorPayload<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    name: "Realtor"
    objects: {}
    scalars: $Extensions.GetPayloadResult<{
      id: number
      fullName: string
      phone: string | null
      email: string | null
      avatarUrl: string | null
      position: string | null
      createdAt: Date
      updatedAt: Date
    }, ExtArgs["result"]["realtor"]>
    composites: {}
  }

  type RealtorGetPayload<S extends boolean | null | undefined | RealtorDefaultArgs> = $Result.GetResult<Prisma.$RealtorPayload, S>

  type RealtorCountArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> =
    Omit<RealtorFindManyArgs, 'select' | 'include' | 'distinct' | 'omit'> & {
      select?: RealtorCountAggregateInputType | true
    }

  export interface RealtorDelegate<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs, GlobalOmitOptions = {}> {
    [K: symbol]: { types: Prisma.TypeMap<ExtArgs>['model']['Realtor'], meta: { name: 'Realtor' } }
    /**
     * Find zero or one Realtor that matches the filter.
     * @param {RealtorFindUniqueArgs} args - Arguments to find a Realtor
     * @example
     * // Get one Realtor
     * const realtor = await prisma.realtor.findUnique({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUnique<T extends RealtorFindUniqueArgs>(args: SelectSubset<T, RealtorFindUniqueArgs<ExtArgs>>): Prisma__RealtorClient<$Result.GetResult<Prisma.$RealtorPayload<ExtArgs>, T, "findUnique", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>

    /**
     * Find one Realtor that matches the filter or throw an error with `error.code='P2025'`
     * if no matches were found.
     * @param {RealtorFindUniqueOrThrowArgs} args - Arguments to find a Realtor
     * @example
     * // Get one Realtor
     * const realtor = await prisma.realtor.findUniqueOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUniqueOrThrow<T extends RealtorFindUniqueOrThrowArgs>(args: SelectSubset<T, RealtorFindUniqueOrThrowArgs<ExtArgs>>): Prisma__RealtorClient<$Result.GetResult<Prisma.$RealtorPayload<ExtArgs>, T, "findUniqueOrThrow", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Find the first Realtor that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {RealtorFindFirstArgs} args - Arguments to find a Realtor
     * @example
     * // Get one Realtor
     * const realtor = await prisma.realtor.findFirst({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirst<T extends RealtorFindFirstArgs>(args?: SelectSubset<T, RealtorFindFirstArgs<ExtArgs>>): Prisma__RealtorClient<$Result.GetResult<Prisma.$RealtorPayload<ExtArgs>, T, "findFirst", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>

    /**
     * Find the first Realtor that matches the filter or
     * throw `PrismaKnownClientError` with `P2025` code if no matches were found.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {RealtorFindFirstOrThrowArgs} args - Arguments to find a Realtor
     * @example
     * // Get one Realtor
     * const realtor = await prisma.realtor.findFirstOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirstOrThrow<T extends RealtorFindFirstOrThrowArgs>(args?: SelectSubset<T, RealtorFindFirstOrThrowArgs<ExtArgs>>): Prisma__RealtorClient<$Result.GetResult<Prisma.$RealtorPayload<ExtArgs>, T, "findFirstOrThrow", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Find zero or more Realtors that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {RealtorFindManyArgs} args - Arguments to filter and select certain fields only.
     * @example
     * // Get all Realtors
     * const realtors = await prisma.realtor.findMany()
     * 
     * // Get first 10 Realtors
     * const realtors = await prisma.realtor.findMany({ take: 10 })
     * 
     * // Only select the `id`
     * const realtorWithIdOnly = await prisma.realtor.findMany({ select: { id: true } })
     * 
     */
    findMany<T extends RealtorFindManyArgs>(args?: SelectSubset<T, RealtorFindManyArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$RealtorPayload<ExtArgs>, T, "findMany", GlobalOmitOptions>>

    /**
     * Create a Realtor.
     * @param {RealtorCreateArgs} args - Arguments to create a Realtor.
     * @example
     * // Create one Realtor
     * const Realtor = await prisma.realtor.create({
     *   data: {
     *     // ... data to create a Realtor
     *   }
     * })
     * 
     */
    create<T extends RealtorCreateArgs>(args: SelectSubset<T, RealtorCreateArgs<ExtArgs>>): Prisma__RealtorClient<$Result.GetResult<Prisma.$RealtorPayload<ExtArgs>, T, "create", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Create many Realtors.
     * @param {RealtorCreateManyArgs} args - Arguments to create many Realtors.
     * @example
     * // Create many Realtors
     * const realtor = await prisma.realtor.createMany({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     *     
     */
    createMany<T extends RealtorCreateManyArgs>(args?: SelectSubset<T, RealtorCreateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Create many Realtors and returns the data saved in the database.
     * @param {RealtorCreateManyAndReturnArgs} args - Arguments to create many Realtors.
     * @example
     * // Create many Realtors
     * const realtor = await prisma.realtor.createManyAndReturn({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * 
     * // Create many Realtors and only return the `id`
     * const realtorWithIdOnly = await prisma.realtor.createManyAndReturn({
     *   select: { id: true },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * 
     */
    createManyAndReturn<T extends RealtorCreateManyAndReturnArgs>(args?: SelectSubset<T, RealtorCreateManyAndReturnArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$RealtorPayload<ExtArgs>, T, "createManyAndReturn", GlobalOmitOptions>>

    /**
     * Delete a Realtor.
     * @param {RealtorDeleteArgs} args - Arguments to delete one Realtor.
     * @example
     * // Delete one Realtor
     * const Realtor = await prisma.realtor.delete({
     *   where: {
     *     // ... filter to delete one Realtor
     *   }
     * })
     * 
     */
    delete<T extends RealtorDeleteArgs>(args: SelectSubset<T, RealtorDeleteArgs<ExtArgs>>): Prisma__RealtorClient<$Result.GetResult<Prisma.$RealtorPayload<ExtArgs>, T, "delete", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Update one Realtor.
     * @param {RealtorUpdateArgs} args - Arguments to update one Realtor.
     * @example
     * // Update one Realtor
     * const realtor = await prisma.realtor.update({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    update<T extends RealtorUpdateArgs>(args: SelectSubset<T, RealtorUpdateArgs<ExtArgs>>): Prisma__RealtorClient<$Result.GetResult<Prisma.$RealtorPayload<ExtArgs>, T, "update", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Delete zero or more Realtors.
     * @param {RealtorDeleteManyArgs} args - Arguments to filter Realtors to delete.
     * @example
     * // Delete a few Realtors
     * const { count } = await prisma.realtor.deleteMany({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     * 
     */
    deleteMany<T extends RealtorDeleteManyArgs>(args?: SelectSubset<T, RealtorDeleteManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Update zero or more Realtors.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {RealtorUpdateManyArgs} args - Arguments to update one or more rows.
     * @example
     * // Update many Realtors
     * const realtor = await prisma.realtor.updateMany({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    updateMany<T extends RealtorUpdateManyArgs>(args: SelectSubset<T, RealtorUpdateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Update zero or more Realtors and returns the data updated in the database.
     * @param {RealtorUpdateManyAndReturnArgs} args - Arguments to update many Realtors.
     * @example
     * // Update many Realtors
     * const realtor = await prisma.realtor.updateManyAndReturn({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * 
     * // Update zero or more Realtors and only return the `id`
     * const realtorWithIdOnly = await prisma.realtor.updateManyAndReturn({
     *   select: { id: true },
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * 
     */
    updateManyAndReturn<T extends RealtorUpdateManyAndReturnArgs>(args: SelectSubset<T, RealtorUpdateManyAndReturnArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$RealtorPayload<ExtArgs>, T, "updateManyAndReturn", GlobalOmitOptions>>

    /**
     * Create or update one Realtor.
     * @param {RealtorUpsertArgs} args - Arguments to update or create a Realtor.
     * @example
     * // Update or create a Realtor
     * const realtor = await prisma.realtor.upsert({
     *   create: {
     *     // ... data to create a Realtor
     *   },
     *   update: {
     *     // ... in case it already exists, update
     *   },
     *   where: {
     *     // ... the filter for the Realtor we want to update
     *   }
     * })
     */
    upsert<T extends RealtorUpsertArgs>(args: SelectSubset<T, RealtorUpsertArgs<ExtArgs>>): Prisma__RealtorClient<$Result.GetResult<Prisma.$RealtorPayload<ExtArgs>, T, "upsert", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>


    /**
     * Count the number of Realtors.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {RealtorCountArgs} args - Arguments to filter Realtors to count.
     * @example
     * // Count the number of Realtors
     * const count = await prisma.realtor.count({
     *   where: {
     *     // ... the filter for the Realtors we want to count
     *   }
     * })
    **/
    count<T extends RealtorCountArgs>(
      args?: Subset<T, RealtorCountArgs>,
    ): Prisma.PrismaPromise<
      T extends $Utils.Record<'select', any>
        ? T['select'] extends true
          ? number
          : GetScalarType<T['select'], RealtorCountAggregateOutputType>
        : number
    >

    /**
     * Allows you to perform aggregations operations on a Realtor.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {RealtorAggregateArgs} args - Select which aggregations you would like to apply and on what fields.
     * @example
     * // Ordered by age ascending
     * // Where email contains prisma.io
     * // Limited to the 10 users
     * const aggregations = await prisma.user.aggregate({
     *   _avg: {
     *     age: true,
     *   },
     *   where: {
     *     email: {
     *       contains: "prisma.io",
     *     },
     *   },
     *   orderBy: {
     *     age: "asc",
     *   },
     *   take: 10,
     * })
    **/
    aggregate<T extends RealtorAggregateArgs>(args: Subset<T, RealtorAggregateArgs>): Prisma.PrismaPromise<GetRealtorAggregateType<T>>

    /**
     * Group by Realtor.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {RealtorGroupByArgs} args - Group by arguments.
     * @example
     * // Group by city, order by createdAt, get count
     * const result = await prisma.user.groupBy({
     *   by: ['city', 'createdAt'],
     *   orderBy: {
     *     createdAt: true
     *   },
     *   _count: {
     *     _all: true
     *   },
     * })
     * 
    **/
    groupBy<
      T extends RealtorGroupByArgs,
      HasSelectOrTake extends Or<
        Extends<'skip', Keys<T>>,
        Extends<'take', Keys<T>>
      >,
      OrderByArg extends True extends HasSelectOrTake
        ? { orderBy: RealtorGroupByArgs['orderBy'] }
        : { orderBy?: RealtorGroupByArgs['orderBy'] },
      OrderFields extends ExcludeUnderscoreKeys<Keys<MaybeTupleToUnion<T['orderBy']>>>,
      ByFields extends MaybeTupleToUnion<T['by']>,
      ByValid extends Has<ByFields, OrderFields>,
      HavingFields extends GetHavingFields<T['having']>,
      HavingValid extends Has<ByFields, HavingFields>,
      ByEmpty extends T['by'] extends never[] ? True : False,
      InputErrors extends ByEmpty extends True
      ? `Error: "by" must not be empty.`
      : HavingValid extends False
      ? {
          [P in HavingFields]: P extends ByFields
            ? never
            : P extends string
            ? `Error: Field "${P}" used in "having" needs to be provided in "by".`
            : [
                Error,
                'Field ',
                P,
                ` in "having" needs to be provided in "by"`,
              ]
        }[HavingFields]
      : 'take' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "take", you also need to provide "orderBy"'
      : 'skip' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "skip", you also need to provide "orderBy"'
      : ByValid extends True
      ? {}
      : {
          [P in OrderFields]: P extends ByFields
            ? never
            : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
        }[OrderFields]
    >(args: SubsetIntersection<T, RealtorGroupByArgs, OrderByArg> & InputErrors): {} extends InputErrors ? GetRealtorGroupByPayload<T> : Prisma.PrismaPromise<InputErrors>
  /**
   * Fields of the Realtor model
   */
  readonly fields: RealtorFieldRefs;
  }

  /**
   * The delegate class that acts as a "Promise-like" for Realtor.
   * Why is this prefixed with `Prisma__`?
   * Because we want to prevent naming conflicts as mentioned in
   * https://github.com/prisma/prisma-client-js/issues/707
   */
  export interface Prisma__RealtorClient<T, Null = never, ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs, GlobalOmitOptions = {}> extends Prisma.PrismaPromise<T> {
    readonly [Symbol.toStringTag]: "PrismaPromise"
    /**
     * Attaches callbacks for the resolution and/or rejection of the Promise.
     * @param onfulfilled The callback to execute when the Promise is resolved.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of which ever callback is executed.
     */
    then<TResult1 = T, TResult2 = never>(onfulfilled?: ((value: T) => TResult1 | PromiseLike<TResult1>) | undefined | null, onrejected?: ((reason: any) => TResult2 | PromiseLike<TResult2>) | undefined | null): $Utils.JsPromise<TResult1 | TResult2>
    /**
     * Attaches a callback for only the rejection of the Promise.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of the callback.
     */
    catch<TResult = never>(onrejected?: ((reason: any) => TResult | PromiseLike<TResult>) | undefined | null): $Utils.JsPromise<T | TResult>
    /**
     * Attaches a callback that is invoked when the Promise is settled (fulfilled or rejected). The
     * resolved value cannot be modified from the callback.
     * @param onfinally The callback to execute when the Promise is settled (fulfilled or rejected).
     * @returns A Promise for the completion of the callback.
     */
    finally(onfinally?: (() => void) | undefined | null): $Utils.JsPromise<T>
  }




  /**
   * Fields of the Realtor model
   */ 
  interface RealtorFieldRefs {
    readonly id: FieldRef<"Realtor", 'Int'>
    readonly fullName: FieldRef<"Realtor", 'String'>
    readonly phone: FieldRef<"Realtor", 'String'>
    readonly email: FieldRef<"Realtor", 'String'>
    readonly avatarUrl: FieldRef<"Realtor", 'String'>
    readonly position: FieldRef<"Realtor", 'String'>
    readonly createdAt: FieldRef<"Realtor", 'DateTime'>
    readonly updatedAt: FieldRef<"Realtor", 'DateTime'>
  }
    

  // Custom InputTypes
  /**
   * Realtor findUnique
   */
  export type RealtorFindUniqueArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Realtor
     */
    select?: RealtorSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Realtor
     */
    omit?: RealtorOmit<ExtArgs> | null
    /**
     * Filter, which Realtor to fetch.
     */
    where: RealtorWhereUniqueInput
  }

  /**
   * Realtor findUniqueOrThrow
   */
  export type RealtorFindUniqueOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Realtor
     */
    select?: RealtorSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Realtor
     */
    omit?: RealtorOmit<ExtArgs> | null
    /**
     * Filter, which Realtor to fetch.
     */
    where: RealtorWhereUniqueInput
  }

  /**
   * Realtor findFirst
   */
  export type RealtorFindFirstArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Realtor
     */
    select?: RealtorSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Realtor
     */
    omit?: RealtorOmit<ExtArgs> | null
    /**
     * Filter, which Realtor to fetch.
     */
    where?: RealtorWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Realtors to fetch.
     */
    orderBy?: RealtorOrderByWithRelationInput | RealtorOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for Realtors.
     */
    cursor?: RealtorWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Realtors from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Realtors.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of Realtors.
     */
    distinct?: RealtorScalarFieldEnum | RealtorScalarFieldEnum[]
  }

  /**
   * Realtor findFirstOrThrow
   */
  export type RealtorFindFirstOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Realtor
     */
    select?: RealtorSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Realtor
     */
    omit?: RealtorOmit<ExtArgs> | null
    /**
     * Filter, which Realtor to fetch.
     */
    where?: RealtorWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Realtors to fetch.
     */
    orderBy?: RealtorOrderByWithRelationInput | RealtorOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for Realtors.
     */
    cursor?: RealtorWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Realtors from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Realtors.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of Realtors.
     */
    distinct?: RealtorScalarFieldEnum | RealtorScalarFieldEnum[]
  }

  /**
   * Realtor findMany
   */
  export type RealtorFindManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Realtor
     */
    select?: RealtorSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Realtor
     */
    omit?: RealtorOmit<ExtArgs> | null
    /**
     * Filter, which Realtors to fetch.
     */
    where?: RealtorWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Realtors to fetch.
     */
    orderBy?: RealtorOrderByWithRelationInput | RealtorOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for listing Realtors.
     */
    cursor?: RealtorWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Realtors from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Realtors.
     */
    skip?: number
    distinct?: RealtorScalarFieldEnum | RealtorScalarFieldEnum[]
  }

  /**
   * Realtor create
   */
  export type RealtorCreateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Realtor
     */
    select?: RealtorSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Realtor
     */
    omit?: RealtorOmit<ExtArgs> | null
    /**
     * The data needed to create a Realtor.
     */
    data: XOR<RealtorCreateInput, RealtorUncheckedCreateInput>
  }

  /**
   * Realtor createMany
   */
  export type RealtorCreateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to create many Realtors.
     */
    data: RealtorCreateManyInput | RealtorCreateManyInput[]
    skipDuplicates?: boolean
  }

  /**
   * Realtor createManyAndReturn
   */
  export type RealtorCreateManyAndReturnArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Realtor
     */
    select?: RealtorSelectCreateManyAndReturn<ExtArgs> | null
    /**
     * Omit specific fields from the Realtor
     */
    omit?: RealtorOmit<ExtArgs> | null
    /**
     * The data used to create many Realtors.
     */
    data: RealtorCreateManyInput | RealtorCreateManyInput[]
    skipDuplicates?: boolean
  }

  /**
   * Realtor update
   */
  export type RealtorUpdateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Realtor
     */
    select?: RealtorSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Realtor
     */
    omit?: RealtorOmit<ExtArgs> | null
    /**
     * The data needed to update a Realtor.
     */
    data: XOR<RealtorUpdateInput, RealtorUncheckedUpdateInput>
    /**
     * Choose, which Realtor to update.
     */
    where: RealtorWhereUniqueInput
  }

  /**
   * Realtor updateMany
   */
  export type RealtorUpdateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to update Realtors.
     */
    data: XOR<RealtorUpdateManyMutationInput, RealtorUncheckedUpdateManyInput>
    /**
     * Filter which Realtors to update
     */
    where?: RealtorWhereInput
    /**
     * Limit how many Realtors to update.
     */
    limit?: number
  }

  /**
   * Realtor updateManyAndReturn
   */
  export type RealtorUpdateManyAndReturnArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Realtor
     */
    select?: RealtorSelectUpdateManyAndReturn<ExtArgs> | null
    /**
     * Omit specific fields from the Realtor
     */
    omit?: RealtorOmit<ExtArgs> | null
    /**
     * The data used to update Realtors.
     */
    data: XOR<RealtorUpdateManyMutationInput, RealtorUncheckedUpdateManyInput>
    /**
     * Filter which Realtors to update
     */
    where?: RealtorWhereInput
    /**
     * Limit how many Realtors to update.
     */
    limit?: number
  }

  /**
   * Realtor upsert
   */
  export type RealtorUpsertArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Realtor
     */
    select?: RealtorSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Realtor
     */
    omit?: RealtorOmit<ExtArgs> | null
    /**
     * The filter to search for the Realtor to update in case it exists.
     */
    where: RealtorWhereUniqueInput
    /**
     * In case the Realtor found by the `where` argument doesn't exist, create a new Realtor with this data.
     */
    create: XOR<RealtorCreateInput, RealtorUncheckedCreateInput>
    /**
     * In case the Realtor was found with the provided `where` argument, update it with this data.
     */
    update: XOR<RealtorUpdateInput, RealtorUncheckedUpdateInput>
  }

  /**
   * Realtor delete
   */
  export type RealtorDeleteArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Realtor
     */
    select?: RealtorSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Realtor
     */
    omit?: RealtorOmit<ExtArgs> | null
    /**
     * Filter which Realtor to delete.
     */
    where: RealtorWhereUniqueInput
  }

  /**
   * Realtor deleteMany
   */
  export type RealtorDeleteManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which Realtors to delete
     */
    where?: RealtorWhereInput
    /**
     * Limit how many Realtors to delete.
     */
    limit?: number
  }

  /**
   * Realtor without action
   */
  export type RealtorDefaultArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Realtor
     */
    select?: RealtorSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Realtor
     */
    omit?: RealtorOmit<ExtArgs> | null
  }


  /**
   * Model Application
   */

  export type AggregateApplication = {
    _count: ApplicationCountAggregateOutputType | null
    _avg: ApplicationAvgAggregateOutputType | null
    _sum: ApplicationSumAggregateOutputType | null
    _min: ApplicationMinAggregateOutputType | null
    _max: ApplicationMaxAggregateOutputType | null
  }

  export type ApplicationAvgAggregateOutputType = {
    id: number | null
    propertyId: number | null
  }

  export type ApplicationSumAggregateOutputType = {
    id: number | null
    propertyId: number | null
  }

  export type ApplicationMinAggregateOutputType = {
    id: number | null
    name: string | null
    phone: string | null
    status: $Enums.ApplicationStatus | null
    propertyType: string | null
    propertyId: number | null
    link: string | null
    createdAt: Date | null
    updatedAt: Date | null
  }

  export type ApplicationMaxAggregateOutputType = {
    id: number | null
    name: string | null
    phone: string | null
    status: $Enums.ApplicationStatus | null
    propertyType: string | null
    propertyId: number | null
    link: string | null
    createdAt: Date | null
    updatedAt: Date | null
  }

  export type ApplicationCountAggregateOutputType = {
    id: number
    name: number
    phone: number
    status: number
    propertyType: number
    propertyId: number
    link: number
    createdAt: number
    updatedAt: number
    _all: number
  }


  export type ApplicationAvgAggregateInputType = {
    id?: true
    propertyId?: true
  }

  export type ApplicationSumAggregateInputType = {
    id?: true
    propertyId?: true
  }

  export type ApplicationMinAggregateInputType = {
    id?: true
    name?: true
    phone?: true
    status?: true
    propertyType?: true
    propertyId?: true
    link?: true
    createdAt?: true
    updatedAt?: true
  }

  export type ApplicationMaxAggregateInputType = {
    id?: true
    name?: true
    phone?: true
    status?: true
    propertyType?: true
    propertyId?: true
    link?: true
    createdAt?: true
    updatedAt?: true
  }

  export type ApplicationCountAggregateInputType = {
    id?: true
    name?: true
    phone?: true
    status?: true
    propertyType?: true
    propertyId?: true
    link?: true
    createdAt?: true
    updatedAt?: true
    _all?: true
  }

  export type ApplicationAggregateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which Application to aggregate.
     */
    where?: ApplicationWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Applications to fetch.
     */
    orderBy?: ApplicationOrderByWithRelationInput | ApplicationOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the start position
     */
    cursor?: ApplicationWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Applications from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Applications.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Count returned Applications
    **/
    _count?: true | ApplicationCountAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to average
    **/
    _avg?: ApplicationAvgAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to sum
    **/
    _sum?: ApplicationSumAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the minimum value
    **/
    _min?: ApplicationMinAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the maximum value
    **/
    _max?: ApplicationMaxAggregateInputType
  }

  export type GetApplicationAggregateType<T extends ApplicationAggregateArgs> = {
        [P in keyof T & keyof AggregateApplication]: P extends '_count' | 'count'
      ? T[P] extends true
        ? number
        : GetScalarType<T[P], AggregateApplication[P]>
      : GetScalarType<T[P], AggregateApplication[P]>
  }




  export type ApplicationGroupByArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    where?: ApplicationWhereInput
    orderBy?: ApplicationOrderByWithAggregationInput | ApplicationOrderByWithAggregationInput[]
    by: ApplicationScalarFieldEnum[] | ApplicationScalarFieldEnum
    having?: ApplicationScalarWhereWithAggregatesInput
    take?: number
    skip?: number
    _count?: ApplicationCountAggregateInputType | true
    _avg?: ApplicationAvgAggregateInputType
    _sum?: ApplicationSumAggregateInputType
    _min?: ApplicationMinAggregateInputType
    _max?: ApplicationMaxAggregateInputType
  }

  export type ApplicationGroupByOutputType = {
    id: number
    name: string
    phone: string
    status: $Enums.ApplicationStatus
    propertyType: string | null
    propertyId: number | null
    link: string
    createdAt: Date
    updatedAt: Date
    _count: ApplicationCountAggregateOutputType | null
    _avg: ApplicationAvgAggregateOutputType | null
    _sum: ApplicationSumAggregateOutputType | null
    _min: ApplicationMinAggregateOutputType | null
    _max: ApplicationMaxAggregateOutputType | null
  }

  type GetApplicationGroupByPayload<T extends ApplicationGroupByArgs> = Prisma.PrismaPromise<
    Array<
      PickEnumerable<ApplicationGroupByOutputType, T['by']> &
        {
          [P in ((keyof T) & (keyof ApplicationGroupByOutputType))]: P extends '_count'
            ? T[P] extends boolean
              ? number
              : GetScalarType<T[P], ApplicationGroupByOutputType[P]>
            : GetScalarType<T[P], ApplicationGroupByOutputType[P]>
        }
      >
    >


  export type ApplicationSelect<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    name?: boolean
    phone?: boolean
    status?: boolean
    propertyType?: boolean
    propertyId?: boolean
    link?: boolean
    createdAt?: boolean
    updatedAt?: boolean
  }, ExtArgs["result"]["application"]>

  export type ApplicationSelectCreateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    name?: boolean
    phone?: boolean
    status?: boolean
    propertyType?: boolean
    propertyId?: boolean
    link?: boolean
    createdAt?: boolean
    updatedAt?: boolean
  }, ExtArgs["result"]["application"]>

  export type ApplicationSelectUpdateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    name?: boolean
    phone?: boolean
    status?: boolean
    propertyType?: boolean
    propertyId?: boolean
    link?: boolean
    createdAt?: boolean
    updatedAt?: boolean
  }, ExtArgs["result"]["application"]>

  export type ApplicationSelectScalar = {
    id?: boolean
    name?: boolean
    phone?: boolean
    status?: boolean
    propertyType?: boolean
    propertyId?: boolean
    link?: boolean
    createdAt?: boolean
    updatedAt?: boolean
  }

  export type ApplicationOmit<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetOmit<"id" | "name" | "phone" | "status" | "propertyType" | "propertyId" | "link" | "createdAt" | "updatedAt", ExtArgs["result"]["application"]>

  export type $ApplicationPayload<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    name: "Application"
    objects: {}
    scalars: $Extensions.GetPayloadResult<{
      id: number
      name: string
      phone: string
      status: $Enums.ApplicationStatus
      propertyType: string | null
      propertyId: number | null
      link: string
      createdAt: Date
      updatedAt: Date
    }, ExtArgs["result"]["application"]>
    composites: {}
  }

  type ApplicationGetPayload<S extends boolean | null | undefined | ApplicationDefaultArgs> = $Result.GetResult<Prisma.$ApplicationPayload, S>

  type ApplicationCountArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> =
    Omit<ApplicationFindManyArgs, 'select' | 'include' | 'distinct' | 'omit'> & {
      select?: ApplicationCountAggregateInputType | true
    }

  export interface ApplicationDelegate<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs, GlobalOmitOptions = {}> {
    [K: symbol]: { types: Prisma.TypeMap<ExtArgs>['model']['Application'], meta: { name: 'Application' } }
    /**
     * Find zero or one Application that matches the filter.
     * @param {ApplicationFindUniqueArgs} args - Arguments to find a Application
     * @example
     * // Get one Application
     * const application = await prisma.application.findUnique({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUnique<T extends ApplicationFindUniqueArgs>(args: SelectSubset<T, ApplicationFindUniqueArgs<ExtArgs>>): Prisma__ApplicationClient<$Result.GetResult<Prisma.$ApplicationPayload<ExtArgs>, T, "findUnique", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>

    /**
     * Find one Application that matches the filter or throw an error with `error.code='P2025'`
     * if no matches were found.
     * @param {ApplicationFindUniqueOrThrowArgs} args - Arguments to find a Application
     * @example
     * // Get one Application
     * const application = await prisma.application.findUniqueOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUniqueOrThrow<T extends ApplicationFindUniqueOrThrowArgs>(args: SelectSubset<T, ApplicationFindUniqueOrThrowArgs<ExtArgs>>): Prisma__ApplicationClient<$Result.GetResult<Prisma.$ApplicationPayload<ExtArgs>, T, "findUniqueOrThrow", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Find the first Application that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ApplicationFindFirstArgs} args - Arguments to find a Application
     * @example
     * // Get one Application
     * const application = await prisma.application.findFirst({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirst<T extends ApplicationFindFirstArgs>(args?: SelectSubset<T, ApplicationFindFirstArgs<ExtArgs>>): Prisma__ApplicationClient<$Result.GetResult<Prisma.$ApplicationPayload<ExtArgs>, T, "findFirst", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>

    /**
     * Find the first Application that matches the filter or
     * throw `PrismaKnownClientError` with `P2025` code if no matches were found.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ApplicationFindFirstOrThrowArgs} args - Arguments to find a Application
     * @example
     * // Get one Application
     * const application = await prisma.application.findFirstOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirstOrThrow<T extends ApplicationFindFirstOrThrowArgs>(args?: SelectSubset<T, ApplicationFindFirstOrThrowArgs<ExtArgs>>): Prisma__ApplicationClient<$Result.GetResult<Prisma.$ApplicationPayload<ExtArgs>, T, "findFirstOrThrow", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Find zero or more Applications that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ApplicationFindManyArgs} args - Arguments to filter and select certain fields only.
     * @example
     * // Get all Applications
     * const applications = await prisma.application.findMany()
     * 
     * // Get first 10 Applications
     * const applications = await prisma.application.findMany({ take: 10 })
     * 
     * // Only select the `id`
     * const applicationWithIdOnly = await prisma.application.findMany({ select: { id: true } })
     * 
     */
    findMany<T extends ApplicationFindManyArgs>(args?: SelectSubset<T, ApplicationFindManyArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$ApplicationPayload<ExtArgs>, T, "findMany", GlobalOmitOptions>>

    /**
     * Create a Application.
     * @param {ApplicationCreateArgs} args - Arguments to create a Application.
     * @example
     * // Create one Application
     * const Application = await prisma.application.create({
     *   data: {
     *     // ... data to create a Application
     *   }
     * })
     * 
     */
    create<T extends ApplicationCreateArgs>(args: SelectSubset<T, ApplicationCreateArgs<ExtArgs>>): Prisma__ApplicationClient<$Result.GetResult<Prisma.$ApplicationPayload<ExtArgs>, T, "create", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Create many Applications.
     * @param {ApplicationCreateManyArgs} args - Arguments to create many Applications.
     * @example
     * // Create many Applications
     * const application = await prisma.application.createMany({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     *     
     */
    createMany<T extends ApplicationCreateManyArgs>(args?: SelectSubset<T, ApplicationCreateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Create many Applications and returns the data saved in the database.
     * @param {ApplicationCreateManyAndReturnArgs} args - Arguments to create many Applications.
     * @example
     * // Create many Applications
     * const application = await prisma.application.createManyAndReturn({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * 
     * // Create many Applications and only return the `id`
     * const applicationWithIdOnly = await prisma.application.createManyAndReturn({
     *   select: { id: true },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * 
     */
    createManyAndReturn<T extends ApplicationCreateManyAndReturnArgs>(args?: SelectSubset<T, ApplicationCreateManyAndReturnArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$ApplicationPayload<ExtArgs>, T, "createManyAndReturn", GlobalOmitOptions>>

    /**
     * Delete a Application.
     * @param {ApplicationDeleteArgs} args - Arguments to delete one Application.
     * @example
     * // Delete one Application
     * const Application = await prisma.application.delete({
     *   where: {
     *     // ... filter to delete one Application
     *   }
     * })
     * 
     */
    delete<T extends ApplicationDeleteArgs>(args: SelectSubset<T, ApplicationDeleteArgs<ExtArgs>>): Prisma__ApplicationClient<$Result.GetResult<Prisma.$ApplicationPayload<ExtArgs>, T, "delete", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Update one Application.
     * @param {ApplicationUpdateArgs} args - Arguments to update one Application.
     * @example
     * // Update one Application
     * const application = await prisma.application.update({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    update<T extends ApplicationUpdateArgs>(args: SelectSubset<T, ApplicationUpdateArgs<ExtArgs>>): Prisma__ApplicationClient<$Result.GetResult<Prisma.$ApplicationPayload<ExtArgs>, T, "update", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Delete zero or more Applications.
     * @param {ApplicationDeleteManyArgs} args - Arguments to filter Applications to delete.
     * @example
     * // Delete a few Applications
     * const { count } = await prisma.application.deleteMany({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     * 
     */
    deleteMany<T extends ApplicationDeleteManyArgs>(args?: SelectSubset<T, ApplicationDeleteManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Update zero or more Applications.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ApplicationUpdateManyArgs} args - Arguments to update one or more rows.
     * @example
     * // Update many Applications
     * const application = await prisma.application.updateMany({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    updateMany<T extends ApplicationUpdateManyArgs>(args: SelectSubset<T, ApplicationUpdateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Update zero or more Applications and returns the data updated in the database.
     * @param {ApplicationUpdateManyAndReturnArgs} args - Arguments to update many Applications.
     * @example
     * // Update many Applications
     * const application = await prisma.application.updateManyAndReturn({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * 
     * // Update zero or more Applications and only return the `id`
     * const applicationWithIdOnly = await prisma.application.updateManyAndReturn({
     *   select: { id: true },
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * 
     */
    updateManyAndReturn<T extends ApplicationUpdateManyAndReturnArgs>(args: SelectSubset<T, ApplicationUpdateManyAndReturnArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$ApplicationPayload<ExtArgs>, T, "updateManyAndReturn", GlobalOmitOptions>>

    /**
     * Create or update one Application.
     * @param {ApplicationUpsertArgs} args - Arguments to update or create a Application.
     * @example
     * // Update or create a Application
     * const application = await prisma.application.upsert({
     *   create: {
     *     // ... data to create a Application
     *   },
     *   update: {
     *     // ... in case it already exists, update
     *   },
     *   where: {
     *     // ... the filter for the Application we want to update
     *   }
     * })
     */
    upsert<T extends ApplicationUpsertArgs>(args: SelectSubset<T, ApplicationUpsertArgs<ExtArgs>>): Prisma__ApplicationClient<$Result.GetResult<Prisma.$ApplicationPayload<ExtArgs>, T, "upsert", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>


    /**
     * Count the number of Applications.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ApplicationCountArgs} args - Arguments to filter Applications to count.
     * @example
     * // Count the number of Applications
     * const count = await prisma.application.count({
     *   where: {
     *     // ... the filter for the Applications we want to count
     *   }
     * })
    **/
    count<T extends ApplicationCountArgs>(
      args?: Subset<T, ApplicationCountArgs>,
    ): Prisma.PrismaPromise<
      T extends $Utils.Record<'select', any>
        ? T['select'] extends true
          ? number
          : GetScalarType<T['select'], ApplicationCountAggregateOutputType>
        : number
    >

    /**
     * Allows you to perform aggregations operations on a Application.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ApplicationAggregateArgs} args - Select which aggregations you would like to apply and on what fields.
     * @example
     * // Ordered by age ascending
     * // Where email contains prisma.io
     * // Limited to the 10 users
     * const aggregations = await prisma.user.aggregate({
     *   _avg: {
     *     age: true,
     *   },
     *   where: {
     *     email: {
     *       contains: "prisma.io",
     *     },
     *   },
     *   orderBy: {
     *     age: "asc",
     *   },
     *   take: 10,
     * })
    **/
    aggregate<T extends ApplicationAggregateArgs>(args: Subset<T, ApplicationAggregateArgs>): Prisma.PrismaPromise<GetApplicationAggregateType<T>>

    /**
     * Group by Application.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ApplicationGroupByArgs} args - Group by arguments.
     * @example
     * // Group by city, order by createdAt, get count
     * const result = await prisma.user.groupBy({
     *   by: ['city', 'createdAt'],
     *   orderBy: {
     *     createdAt: true
     *   },
     *   _count: {
     *     _all: true
     *   },
     * })
     * 
    **/
    groupBy<
      T extends ApplicationGroupByArgs,
      HasSelectOrTake extends Or<
        Extends<'skip', Keys<T>>,
        Extends<'take', Keys<T>>
      >,
      OrderByArg extends True extends HasSelectOrTake
        ? { orderBy: ApplicationGroupByArgs['orderBy'] }
        : { orderBy?: ApplicationGroupByArgs['orderBy'] },
      OrderFields extends ExcludeUnderscoreKeys<Keys<MaybeTupleToUnion<T['orderBy']>>>,
      ByFields extends MaybeTupleToUnion<T['by']>,
      ByValid extends Has<ByFields, OrderFields>,
      HavingFields extends GetHavingFields<T['having']>,
      HavingValid extends Has<ByFields, HavingFields>,
      ByEmpty extends T['by'] extends never[] ? True : False,
      InputErrors extends ByEmpty extends True
      ? `Error: "by" must not be empty.`
      : HavingValid extends False
      ? {
          [P in HavingFields]: P extends ByFields
            ? never
            : P extends string
            ? `Error: Field "${P}" used in "having" needs to be provided in "by".`
            : [
                Error,
                'Field ',
                P,
                ` in "having" needs to be provided in "by"`,
              ]
        }[HavingFields]
      : 'take' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "take", you also need to provide "orderBy"'
      : 'skip' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "skip", you also need to provide "orderBy"'
      : ByValid extends True
      ? {}
      : {
          [P in OrderFields]: P extends ByFields
            ? never
            : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
        }[OrderFields]
    >(args: SubsetIntersection<T, ApplicationGroupByArgs, OrderByArg> & InputErrors): {} extends InputErrors ? GetApplicationGroupByPayload<T> : Prisma.PrismaPromise<InputErrors>
  /**
   * Fields of the Application model
   */
  readonly fields: ApplicationFieldRefs;
  }

  /**
   * The delegate class that acts as a "Promise-like" for Application.
   * Why is this prefixed with `Prisma__`?
   * Because we want to prevent naming conflicts as mentioned in
   * https://github.com/prisma/prisma-client-js/issues/707
   */
  export interface Prisma__ApplicationClient<T, Null = never, ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs, GlobalOmitOptions = {}> extends Prisma.PrismaPromise<T> {
    readonly [Symbol.toStringTag]: "PrismaPromise"
    /**
     * Attaches callbacks for the resolution and/or rejection of the Promise.
     * @param onfulfilled The callback to execute when the Promise is resolved.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of which ever callback is executed.
     */
    then<TResult1 = T, TResult2 = never>(onfulfilled?: ((value: T) => TResult1 | PromiseLike<TResult1>) | undefined | null, onrejected?: ((reason: any) => TResult2 | PromiseLike<TResult2>) | undefined | null): $Utils.JsPromise<TResult1 | TResult2>
    /**
     * Attaches a callback for only the rejection of the Promise.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of the callback.
     */
    catch<TResult = never>(onrejected?: ((reason: any) => TResult | PromiseLike<TResult>) | undefined | null): $Utils.JsPromise<T | TResult>
    /**
     * Attaches a callback that is invoked when the Promise is settled (fulfilled or rejected). The
     * resolved value cannot be modified from the callback.
     * @param onfinally The callback to execute when the Promise is settled (fulfilled or rejected).
     * @returns A Promise for the completion of the callback.
     */
    finally(onfinally?: (() => void) | undefined | null): $Utils.JsPromise<T>
  }




  /**
   * Fields of the Application model
   */ 
  interface ApplicationFieldRefs {
    readonly id: FieldRef<"Application", 'Int'>
    readonly name: FieldRef<"Application", 'String'>
    readonly phone: FieldRef<"Application", 'String'>
    readonly status: FieldRef<"Application", 'ApplicationStatus'>
    readonly propertyType: FieldRef<"Application", 'String'>
    readonly propertyId: FieldRef<"Application", 'Int'>
    readonly link: FieldRef<"Application", 'String'>
    readonly createdAt: FieldRef<"Application", 'DateTime'>
    readonly updatedAt: FieldRef<"Application", 'DateTime'>
  }
    

  // Custom InputTypes
  /**
   * Application findUnique
   */
  export type ApplicationFindUniqueArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Application
     */
    select?: ApplicationSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Application
     */
    omit?: ApplicationOmit<ExtArgs> | null
    /**
     * Filter, which Application to fetch.
     */
    where: ApplicationWhereUniqueInput
  }

  /**
   * Application findUniqueOrThrow
   */
  export type ApplicationFindUniqueOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Application
     */
    select?: ApplicationSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Application
     */
    omit?: ApplicationOmit<ExtArgs> | null
    /**
     * Filter, which Application to fetch.
     */
    where: ApplicationWhereUniqueInput
  }

  /**
   * Application findFirst
   */
  export type ApplicationFindFirstArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Application
     */
    select?: ApplicationSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Application
     */
    omit?: ApplicationOmit<ExtArgs> | null
    /**
     * Filter, which Application to fetch.
     */
    where?: ApplicationWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Applications to fetch.
     */
    orderBy?: ApplicationOrderByWithRelationInput | ApplicationOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for Applications.
     */
    cursor?: ApplicationWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Applications from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Applications.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of Applications.
     */
    distinct?: ApplicationScalarFieldEnum | ApplicationScalarFieldEnum[]
  }

  /**
   * Application findFirstOrThrow
   */
  export type ApplicationFindFirstOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Application
     */
    select?: ApplicationSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Application
     */
    omit?: ApplicationOmit<ExtArgs> | null
    /**
     * Filter, which Application to fetch.
     */
    where?: ApplicationWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Applications to fetch.
     */
    orderBy?: ApplicationOrderByWithRelationInput | ApplicationOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for Applications.
     */
    cursor?: ApplicationWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Applications from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Applications.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of Applications.
     */
    distinct?: ApplicationScalarFieldEnum | ApplicationScalarFieldEnum[]
  }

  /**
   * Application findMany
   */
  export type ApplicationFindManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Application
     */
    select?: ApplicationSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Application
     */
    omit?: ApplicationOmit<ExtArgs> | null
    /**
     * Filter, which Applications to fetch.
     */
    where?: ApplicationWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Applications to fetch.
     */
    orderBy?: ApplicationOrderByWithRelationInput | ApplicationOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for listing Applications.
     */
    cursor?: ApplicationWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Applications from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Applications.
     */
    skip?: number
    distinct?: ApplicationScalarFieldEnum | ApplicationScalarFieldEnum[]
  }

  /**
   * Application create
   */
  export type ApplicationCreateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Application
     */
    select?: ApplicationSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Application
     */
    omit?: ApplicationOmit<ExtArgs> | null
    /**
     * The data needed to create a Application.
     */
    data: XOR<ApplicationCreateInput, ApplicationUncheckedCreateInput>
  }

  /**
   * Application createMany
   */
  export type ApplicationCreateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to create many Applications.
     */
    data: ApplicationCreateManyInput | ApplicationCreateManyInput[]
    skipDuplicates?: boolean
  }

  /**
   * Application createManyAndReturn
   */
  export type ApplicationCreateManyAndReturnArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Application
     */
    select?: ApplicationSelectCreateManyAndReturn<ExtArgs> | null
    /**
     * Omit specific fields from the Application
     */
    omit?: ApplicationOmit<ExtArgs> | null
    /**
     * The data used to create many Applications.
     */
    data: ApplicationCreateManyInput | ApplicationCreateManyInput[]
    skipDuplicates?: boolean
  }

  /**
   * Application update
   */
  export type ApplicationUpdateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Application
     */
    select?: ApplicationSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Application
     */
    omit?: ApplicationOmit<ExtArgs> | null
    /**
     * The data needed to update a Application.
     */
    data: XOR<ApplicationUpdateInput, ApplicationUncheckedUpdateInput>
    /**
     * Choose, which Application to update.
     */
    where: ApplicationWhereUniqueInput
  }

  /**
   * Application updateMany
   */
  export type ApplicationUpdateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to update Applications.
     */
    data: XOR<ApplicationUpdateManyMutationInput, ApplicationUncheckedUpdateManyInput>
    /**
     * Filter which Applications to update
     */
    where?: ApplicationWhereInput
    /**
     * Limit how many Applications to update.
     */
    limit?: number
  }

  /**
   * Application updateManyAndReturn
   */
  export type ApplicationUpdateManyAndReturnArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Application
     */
    select?: ApplicationSelectUpdateManyAndReturn<ExtArgs> | null
    /**
     * Omit specific fields from the Application
     */
    omit?: ApplicationOmit<ExtArgs> | null
    /**
     * The data used to update Applications.
     */
    data: XOR<ApplicationUpdateManyMutationInput, ApplicationUncheckedUpdateManyInput>
    /**
     * Filter which Applications to update
     */
    where?: ApplicationWhereInput
    /**
     * Limit how many Applications to update.
     */
    limit?: number
  }

  /**
   * Application upsert
   */
  export type ApplicationUpsertArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Application
     */
    select?: ApplicationSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Application
     */
    omit?: ApplicationOmit<ExtArgs> | null
    /**
     * The filter to search for the Application to update in case it exists.
     */
    where: ApplicationWhereUniqueInput
    /**
     * In case the Application found by the `where` argument doesn't exist, create a new Application with this data.
     */
    create: XOR<ApplicationCreateInput, ApplicationUncheckedCreateInput>
    /**
     * In case the Application was found with the provided `where` argument, update it with this data.
     */
    update: XOR<ApplicationUpdateInput, ApplicationUncheckedUpdateInput>
  }

  /**
   * Application delete
   */
  export type ApplicationDeleteArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Application
     */
    select?: ApplicationSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Application
     */
    omit?: ApplicationOmit<ExtArgs> | null
    /**
     * Filter which Application to delete.
     */
    where: ApplicationWhereUniqueInput
  }

  /**
   * Application deleteMany
   */
  export type ApplicationDeleteManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which Applications to delete
     */
    where?: ApplicationWhereInput
    /**
     * Limit how many Applications to delete.
     */
    limit?: number
  }

  /**
   * Application without action
   */
  export type ApplicationDefaultArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Application
     */
    select?: ApplicationSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Application
     */
    omit?: ApplicationOmit<ExtArgs> | null
  }


  /**
   * Model Image
   */

  export type AggregateImage = {
    _count: ImageCountAggregateOutputType | null
    _avg: ImageAvgAggregateOutputType | null
    _sum: ImageSumAggregateOutputType | null
    _min: ImageMinAggregateOutputType | null
    _max: ImageMaxAggregateOutputType | null
  }

  export type ImageAvgAggregateOutputType = {
    id: number | null
    newBuildingComplexId: number | null
    newBuildingApartmentId: number | null
    readyApartmentId: number | null
    rentalApartmentId: number | null
    countryPropertyId: number | null
    commercialPropertyId: number | null
  }

  export type ImageSumAggregateOutputType = {
    id: number | null
    newBuildingComplexId: number | null
    newBuildingApartmentId: number | null
    readyApartmentId: number | null
    rentalApartmentId: number | null
    countryPropertyId: number | null
    commercialPropertyId: number | null
  }

  export type ImageMinAggregateOutputType = {
    id: number | null
    url: string | null
    newBuildingComplexId: number | null
    newBuildingApartmentId: number | null
    readyApartmentId: number | null
    rentalApartmentId: number | null
    countryPropertyId: number | null
    commercialPropertyId: number | null
    createdAt: Date | null
  }

  export type ImageMaxAggregateOutputType = {
    id: number | null
    url: string | null
    newBuildingComplexId: number | null
    newBuildingApartmentId: number | null
    readyApartmentId: number | null
    rentalApartmentId: number | null
    countryPropertyId: number | null
    commercialPropertyId: number | null
    createdAt: Date | null
  }

  export type ImageCountAggregateOutputType = {
    id: number
    url: number
    newBuildingComplexId: number
    newBuildingApartmentId: number
    readyApartmentId: number
    rentalApartmentId: number
    countryPropertyId: number
    commercialPropertyId: number
    createdAt: number
    _all: number
  }


  export type ImageAvgAggregateInputType = {
    id?: true
    newBuildingComplexId?: true
    newBuildingApartmentId?: true
    readyApartmentId?: true
    rentalApartmentId?: true
    countryPropertyId?: true
    commercialPropertyId?: true
  }

  export type ImageSumAggregateInputType = {
    id?: true
    newBuildingComplexId?: true
    newBuildingApartmentId?: true
    readyApartmentId?: true
    rentalApartmentId?: true
    countryPropertyId?: true
    commercialPropertyId?: true
  }

  export type ImageMinAggregateInputType = {
    id?: true
    url?: true
    newBuildingComplexId?: true
    newBuildingApartmentId?: true
    readyApartmentId?: true
    rentalApartmentId?: true
    countryPropertyId?: true
    commercialPropertyId?: true
    createdAt?: true
  }

  export type ImageMaxAggregateInputType = {
    id?: true
    url?: true
    newBuildingComplexId?: true
    newBuildingApartmentId?: true
    readyApartmentId?: true
    rentalApartmentId?: true
    countryPropertyId?: true
    commercialPropertyId?: true
    createdAt?: true
  }

  export type ImageCountAggregateInputType = {
    id?: true
    url?: true
    newBuildingComplexId?: true
    newBuildingApartmentId?: true
    readyApartmentId?: true
    rentalApartmentId?: true
    countryPropertyId?: true
    commercialPropertyId?: true
    createdAt?: true
    _all?: true
  }

  export type ImageAggregateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which Image to aggregate.
     */
    where?: ImageWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Images to fetch.
     */
    orderBy?: ImageOrderByWithRelationInput | ImageOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the start position
     */
    cursor?: ImageWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Images from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Images.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Count returned Images
    **/
    _count?: true | ImageCountAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to average
    **/
    _avg?: ImageAvgAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to sum
    **/
    _sum?: ImageSumAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the minimum value
    **/
    _min?: ImageMinAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the maximum value
    **/
    _max?: ImageMaxAggregateInputType
  }

  export type GetImageAggregateType<T extends ImageAggregateArgs> = {
        [P in keyof T & keyof AggregateImage]: P extends '_count' | 'count'
      ? T[P] extends true
        ? number
        : GetScalarType<T[P], AggregateImage[P]>
      : GetScalarType<T[P], AggregateImage[P]>
  }




  export type ImageGroupByArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    where?: ImageWhereInput
    orderBy?: ImageOrderByWithAggregationInput | ImageOrderByWithAggregationInput[]
    by: ImageScalarFieldEnum[] | ImageScalarFieldEnum
    having?: ImageScalarWhereWithAggregatesInput
    take?: number
    skip?: number
    _count?: ImageCountAggregateInputType | true
    _avg?: ImageAvgAggregateInputType
    _sum?: ImageSumAggregateInputType
    _min?: ImageMinAggregateInputType
    _max?: ImageMaxAggregateInputType
  }

  export type ImageGroupByOutputType = {
    id: number
    url: string
    newBuildingComplexId: number | null
    newBuildingApartmentId: number | null
    readyApartmentId: number | null
    rentalApartmentId: number | null
    countryPropertyId: number | null
    commercialPropertyId: number | null
    createdAt: Date
    _count: ImageCountAggregateOutputType | null
    _avg: ImageAvgAggregateOutputType | null
    _sum: ImageSumAggregateOutputType | null
    _min: ImageMinAggregateOutputType | null
    _max: ImageMaxAggregateOutputType | null
  }

  type GetImageGroupByPayload<T extends ImageGroupByArgs> = Prisma.PrismaPromise<
    Array<
      PickEnumerable<ImageGroupByOutputType, T['by']> &
        {
          [P in ((keyof T) & (keyof ImageGroupByOutputType))]: P extends '_count'
            ? T[P] extends boolean
              ? number
              : GetScalarType<T[P], ImageGroupByOutputType[P]>
            : GetScalarType<T[P], ImageGroupByOutputType[P]>
        }
      >
    >


  export type ImageSelect<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    url?: boolean
    newBuildingComplexId?: boolean
    newBuildingApartmentId?: boolean
    readyApartmentId?: boolean
    rentalApartmentId?: boolean
    countryPropertyId?: boolean
    commercialPropertyId?: boolean
    createdAt?: boolean
    newBuildingComplex?: boolean | Image$newBuildingComplexArgs<ExtArgs>
    newBuildingApartment?: boolean | Image$newBuildingApartmentArgs<ExtArgs>
    readyApartment?: boolean | Image$readyApartmentArgs<ExtArgs>
    rentalApartment?: boolean | Image$rentalApartmentArgs<ExtArgs>
    countryProperty?: boolean | Image$countryPropertyArgs<ExtArgs>
    commercialProperty?: boolean | Image$commercialPropertyArgs<ExtArgs>
  }, ExtArgs["result"]["image"]>

  export type ImageSelectCreateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    url?: boolean
    newBuildingComplexId?: boolean
    newBuildingApartmentId?: boolean
    readyApartmentId?: boolean
    rentalApartmentId?: boolean
    countryPropertyId?: boolean
    commercialPropertyId?: boolean
    createdAt?: boolean
    newBuildingComplex?: boolean | Image$newBuildingComplexArgs<ExtArgs>
    newBuildingApartment?: boolean | Image$newBuildingApartmentArgs<ExtArgs>
    readyApartment?: boolean | Image$readyApartmentArgs<ExtArgs>
    rentalApartment?: boolean | Image$rentalApartmentArgs<ExtArgs>
    countryProperty?: boolean | Image$countryPropertyArgs<ExtArgs>
    commercialProperty?: boolean | Image$commercialPropertyArgs<ExtArgs>
  }, ExtArgs["result"]["image"]>

  export type ImageSelectUpdateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    url?: boolean
    newBuildingComplexId?: boolean
    newBuildingApartmentId?: boolean
    readyApartmentId?: boolean
    rentalApartmentId?: boolean
    countryPropertyId?: boolean
    commercialPropertyId?: boolean
    createdAt?: boolean
    newBuildingComplex?: boolean | Image$newBuildingComplexArgs<ExtArgs>
    newBuildingApartment?: boolean | Image$newBuildingApartmentArgs<ExtArgs>
    readyApartment?: boolean | Image$readyApartmentArgs<ExtArgs>
    rentalApartment?: boolean | Image$rentalApartmentArgs<ExtArgs>
    countryProperty?: boolean | Image$countryPropertyArgs<ExtArgs>
    commercialProperty?: boolean | Image$commercialPropertyArgs<ExtArgs>
  }, ExtArgs["result"]["image"]>

  export type ImageSelectScalar = {
    id?: boolean
    url?: boolean
    newBuildingComplexId?: boolean
    newBuildingApartmentId?: boolean
    readyApartmentId?: boolean
    rentalApartmentId?: boolean
    countryPropertyId?: boolean
    commercialPropertyId?: boolean
    createdAt?: boolean
  }

  export type ImageOmit<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetOmit<"id" | "url" | "newBuildingComplexId" | "newBuildingApartmentId" | "readyApartmentId" | "rentalApartmentId" | "countryPropertyId" | "commercialPropertyId" | "createdAt", ExtArgs["result"]["image"]>
  export type ImageInclude<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    newBuildingComplex?: boolean | Image$newBuildingComplexArgs<ExtArgs>
    newBuildingApartment?: boolean | Image$newBuildingApartmentArgs<ExtArgs>
    readyApartment?: boolean | Image$readyApartmentArgs<ExtArgs>
    rentalApartment?: boolean | Image$rentalApartmentArgs<ExtArgs>
    countryProperty?: boolean | Image$countryPropertyArgs<ExtArgs>
    commercialProperty?: boolean | Image$commercialPropertyArgs<ExtArgs>
  }
  export type ImageIncludeCreateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    newBuildingComplex?: boolean | Image$newBuildingComplexArgs<ExtArgs>
    newBuildingApartment?: boolean | Image$newBuildingApartmentArgs<ExtArgs>
    readyApartment?: boolean | Image$readyApartmentArgs<ExtArgs>
    rentalApartment?: boolean | Image$rentalApartmentArgs<ExtArgs>
    countryProperty?: boolean | Image$countryPropertyArgs<ExtArgs>
    commercialProperty?: boolean | Image$commercialPropertyArgs<ExtArgs>
  }
  export type ImageIncludeUpdateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    newBuildingComplex?: boolean | Image$newBuildingComplexArgs<ExtArgs>
    newBuildingApartment?: boolean | Image$newBuildingApartmentArgs<ExtArgs>
    readyApartment?: boolean | Image$readyApartmentArgs<ExtArgs>
    rentalApartment?: boolean | Image$rentalApartmentArgs<ExtArgs>
    countryProperty?: boolean | Image$countryPropertyArgs<ExtArgs>
    commercialProperty?: boolean | Image$commercialPropertyArgs<ExtArgs>
  }

  export type $ImagePayload<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    name: "Image"
    objects: {
      newBuildingComplex: Prisma.$NewBuildingComplexPayload<ExtArgs> | null
      newBuildingApartment: Prisma.$NewBuildingApartmentPayload<ExtArgs> | null
      readyApartment: Prisma.$ReadyApartmentPayload<ExtArgs> | null
      rentalApartment: Prisma.$RentalApartmentPayload<ExtArgs> | null
      countryProperty: Prisma.$CountryPropertyPayload<ExtArgs> | null
      commercialProperty: Prisma.$CommercialPropertyPayload<ExtArgs> | null
    }
    scalars: $Extensions.GetPayloadResult<{
      id: number
      url: string
      newBuildingComplexId: number | null
      newBuildingApartmentId: number | null
      readyApartmentId: number | null
      rentalApartmentId: number | null
      countryPropertyId: number | null
      commercialPropertyId: number | null
      createdAt: Date
    }, ExtArgs["result"]["image"]>
    composites: {}
  }

  type ImageGetPayload<S extends boolean | null | undefined | ImageDefaultArgs> = $Result.GetResult<Prisma.$ImagePayload, S>

  type ImageCountArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> =
    Omit<ImageFindManyArgs, 'select' | 'include' | 'distinct' | 'omit'> & {
      select?: ImageCountAggregateInputType | true
    }

  export interface ImageDelegate<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs, GlobalOmitOptions = {}> {
    [K: symbol]: { types: Prisma.TypeMap<ExtArgs>['model']['Image'], meta: { name: 'Image' } }
    /**
     * Find zero or one Image that matches the filter.
     * @param {ImageFindUniqueArgs} args - Arguments to find a Image
     * @example
     * // Get one Image
     * const image = await prisma.image.findUnique({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUnique<T extends ImageFindUniqueArgs>(args: SelectSubset<T, ImageFindUniqueArgs<ExtArgs>>): Prisma__ImageClient<$Result.GetResult<Prisma.$ImagePayload<ExtArgs>, T, "findUnique", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>

    /**
     * Find one Image that matches the filter or throw an error with `error.code='P2025'`
     * if no matches were found.
     * @param {ImageFindUniqueOrThrowArgs} args - Arguments to find a Image
     * @example
     * // Get one Image
     * const image = await prisma.image.findUniqueOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUniqueOrThrow<T extends ImageFindUniqueOrThrowArgs>(args: SelectSubset<T, ImageFindUniqueOrThrowArgs<ExtArgs>>): Prisma__ImageClient<$Result.GetResult<Prisma.$ImagePayload<ExtArgs>, T, "findUniqueOrThrow", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Find the first Image that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ImageFindFirstArgs} args - Arguments to find a Image
     * @example
     * // Get one Image
     * const image = await prisma.image.findFirst({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirst<T extends ImageFindFirstArgs>(args?: SelectSubset<T, ImageFindFirstArgs<ExtArgs>>): Prisma__ImageClient<$Result.GetResult<Prisma.$ImagePayload<ExtArgs>, T, "findFirst", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>

    /**
     * Find the first Image that matches the filter or
     * throw `PrismaKnownClientError` with `P2025` code if no matches were found.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ImageFindFirstOrThrowArgs} args - Arguments to find a Image
     * @example
     * // Get one Image
     * const image = await prisma.image.findFirstOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirstOrThrow<T extends ImageFindFirstOrThrowArgs>(args?: SelectSubset<T, ImageFindFirstOrThrowArgs<ExtArgs>>): Prisma__ImageClient<$Result.GetResult<Prisma.$ImagePayload<ExtArgs>, T, "findFirstOrThrow", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Find zero or more Images that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ImageFindManyArgs} args - Arguments to filter and select certain fields only.
     * @example
     * // Get all Images
     * const images = await prisma.image.findMany()
     * 
     * // Get first 10 Images
     * const images = await prisma.image.findMany({ take: 10 })
     * 
     * // Only select the `id`
     * const imageWithIdOnly = await prisma.image.findMany({ select: { id: true } })
     * 
     */
    findMany<T extends ImageFindManyArgs>(args?: SelectSubset<T, ImageFindManyArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$ImagePayload<ExtArgs>, T, "findMany", GlobalOmitOptions>>

    /**
     * Create a Image.
     * @param {ImageCreateArgs} args - Arguments to create a Image.
     * @example
     * // Create one Image
     * const Image = await prisma.image.create({
     *   data: {
     *     // ... data to create a Image
     *   }
     * })
     * 
     */
    create<T extends ImageCreateArgs>(args: SelectSubset<T, ImageCreateArgs<ExtArgs>>): Prisma__ImageClient<$Result.GetResult<Prisma.$ImagePayload<ExtArgs>, T, "create", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Create many Images.
     * @param {ImageCreateManyArgs} args - Arguments to create many Images.
     * @example
     * // Create many Images
     * const image = await prisma.image.createMany({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     *     
     */
    createMany<T extends ImageCreateManyArgs>(args?: SelectSubset<T, ImageCreateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Create many Images and returns the data saved in the database.
     * @param {ImageCreateManyAndReturnArgs} args - Arguments to create many Images.
     * @example
     * // Create many Images
     * const image = await prisma.image.createManyAndReturn({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * 
     * // Create many Images and only return the `id`
     * const imageWithIdOnly = await prisma.image.createManyAndReturn({
     *   select: { id: true },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * 
     */
    createManyAndReturn<T extends ImageCreateManyAndReturnArgs>(args?: SelectSubset<T, ImageCreateManyAndReturnArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$ImagePayload<ExtArgs>, T, "createManyAndReturn", GlobalOmitOptions>>

    /**
     * Delete a Image.
     * @param {ImageDeleteArgs} args - Arguments to delete one Image.
     * @example
     * // Delete one Image
     * const Image = await prisma.image.delete({
     *   where: {
     *     // ... filter to delete one Image
     *   }
     * })
     * 
     */
    delete<T extends ImageDeleteArgs>(args: SelectSubset<T, ImageDeleteArgs<ExtArgs>>): Prisma__ImageClient<$Result.GetResult<Prisma.$ImagePayload<ExtArgs>, T, "delete", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Update one Image.
     * @param {ImageUpdateArgs} args - Arguments to update one Image.
     * @example
     * // Update one Image
     * const image = await prisma.image.update({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    update<T extends ImageUpdateArgs>(args: SelectSubset<T, ImageUpdateArgs<ExtArgs>>): Prisma__ImageClient<$Result.GetResult<Prisma.$ImagePayload<ExtArgs>, T, "update", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Delete zero or more Images.
     * @param {ImageDeleteManyArgs} args - Arguments to filter Images to delete.
     * @example
     * // Delete a few Images
     * const { count } = await prisma.image.deleteMany({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     * 
     */
    deleteMany<T extends ImageDeleteManyArgs>(args?: SelectSubset<T, ImageDeleteManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Update zero or more Images.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ImageUpdateManyArgs} args - Arguments to update one or more rows.
     * @example
     * // Update many Images
     * const image = await prisma.image.updateMany({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    updateMany<T extends ImageUpdateManyArgs>(args: SelectSubset<T, ImageUpdateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Update zero or more Images and returns the data updated in the database.
     * @param {ImageUpdateManyAndReturnArgs} args - Arguments to update many Images.
     * @example
     * // Update many Images
     * const image = await prisma.image.updateManyAndReturn({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * 
     * // Update zero or more Images and only return the `id`
     * const imageWithIdOnly = await prisma.image.updateManyAndReturn({
     *   select: { id: true },
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * 
     */
    updateManyAndReturn<T extends ImageUpdateManyAndReturnArgs>(args: SelectSubset<T, ImageUpdateManyAndReturnArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$ImagePayload<ExtArgs>, T, "updateManyAndReturn", GlobalOmitOptions>>

    /**
     * Create or update one Image.
     * @param {ImageUpsertArgs} args - Arguments to update or create a Image.
     * @example
     * // Update or create a Image
     * const image = await prisma.image.upsert({
     *   create: {
     *     // ... data to create a Image
     *   },
     *   update: {
     *     // ... in case it already exists, update
     *   },
     *   where: {
     *     // ... the filter for the Image we want to update
     *   }
     * })
     */
    upsert<T extends ImageUpsertArgs>(args: SelectSubset<T, ImageUpsertArgs<ExtArgs>>): Prisma__ImageClient<$Result.GetResult<Prisma.$ImagePayload<ExtArgs>, T, "upsert", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>


    /**
     * Count the number of Images.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ImageCountArgs} args - Arguments to filter Images to count.
     * @example
     * // Count the number of Images
     * const count = await prisma.image.count({
     *   where: {
     *     // ... the filter for the Images we want to count
     *   }
     * })
    **/
    count<T extends ImageCountArgs>(
      args?: Subset<T, ImageCountArgs>,
    ): Prisma.PrismaPromise<
      T extends $Utils.Record<'select', any>
        ? T['select'] extends true
          ? number
          : GetScalarType<T['select'], ImageCountAggregateOutputType>
        : number
    >

    /**
     * Allows you to perform aggregations operations on a Image.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ImageAggregateArgs} args - Select which aggregations you would like to apply and on what fields.
     * @example
     * // Ordered by age ascending
     * // Where email contains prisma.io
     * // Limited to the 10 users
     * const aggregations = await prisma.user.aggregate({
     *   _avg: {
     *     age: true,
     *   },
     *   where: {
     *     email: {
     *       contains: "prisma.io",
     *     },
     *   },
     *   orderBy: {
     *     age: "asc",
     *   },
     *   take: 10,
     * })
    **/
    aggregate<T extends ImageAggregateArgs>(args: Subset<T, ImageAggregateArgs>): Prisma.PrismaPromise<GetImageAggregateType<T>>

    /**
     * Group by Image.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ImageGroupByArgs} args - Group by arguments.
     * @example
     * // Group by city, order by createdAt, get count
     * const result = await prisma.user.groupBy({
     *   by: ['city', 'createdAt'],
     *   orderBy: {
     *     createdAt: true
     *   },
     *   _count: {
     *     _all: true
     *   },
     * })
     * 
    **/
    groupBy<
      T extends ImageGroupByArgs,
      HasSelectOrTake extends Or<
        Extends<'skip', Keys<T>>,
        Extends<'take', Keys<T>>
      >,
      OrderByArg extends True extends HasSelectOrTake
        ? { orderBy: ImageGroupByArgs['orderBy'] }
        : { orderBy?: ImageGroupByArgs['orderBy'] },
      OrderFields extends ExcludeUnderscoreKeys<Keys<MaybeTupleToUnion<T['orderBy']>>>,
      ByFields extends MaybeTupleToUnion<T['by']>,
      ByValid extends Has<ByFields, OrderFields>,
      HavingFields extends GetHavingFields<T['having']>,
      HavingValid extends Has<ByFields, HavingFields>,
      ByEmpty extends T['by'] extends never[] ? True : False,
      InputErrors extends ByEmpty extends True
      ? `Error: "by" must not be empty.`
      : HavingValid extends False
      ? {
          [P in HavingFields]: P extends ByFields
            ? never
            : P extends string
            ? `Error: Field "${P}" used in "having" needs to be provided in "by".`
            : [
                Error,
                'Field ',
                P,
                ` in "having" needs to be provided in "by"`,
              ]
        }[HavingFields]
      : 'take' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "take", you also need to provide "orderBy"'
      : 'skip' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "skip", you also need to provide "orderBy"'
      : ByValid extends True
      ? {}
      : {
          [P in OrderFields]: P extends ByFields
            ? never
            : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
        }[OrderFields]
    >(args: SubsetIntersection<T, ImageGroupByArgs, OrderByArg> & InputErrors): {} extends InputErrors ? GetImageGroupByPayload<T> : Prisma.PrismaPromise<InputErrors>
  /**
   * Fields of the Image model
   */
  readonly fields: ImageFieldRefs;
  }

  /**
   * The delegate class that acts as a "Promise-like" for Image.
   * Why is this prefixed with `Prisma__`?
   * Because we want to prevent naming conflicts as mentioned in
   * https://github.com/prisma/prisma-client-js/issues/707
   */
  export interface Prisma__ImageClient<T, Null = never, ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs, GlobalOmitOptions = {}> extends Prisma.PrismaPromise<T> {
    readonly [Symbol.toStringTag]: "PrismaPromise"
    newBuildingComplex<T extends Image$newBuildingComplexArgs<ExtArgs> = {}>(args?: Subset<T, Image$newBuildingComplexArgs<ExtArgs>>): Prisma__NewBuildingComplexClient<$Result.GetResult<Prisma.$NewBuildingComplexPayload<ExtArgs>, T, "findUniqueOrThrow", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>
    newBuildingApartment<T extends Image$newBuildingApartmentArgs<ExtArgs> = {}>(args?: Subset<T, Image$newBuildingApartmentArgs<ExtArgs>>): Prisma__NewBuildingApartmentClient<$Result.GetResult<Prisma.$NewBuildingApartmentPayload<ExtArgs>, T, "findUniqueOrThrow", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>
    readyApartment<T extends Image$readyApartmentArgs<ExtArgs> = {}>(args?: Subset<T, Image$readyApartmentArgs<ExtArgs>>): Prisma__ReadyApartmentClient<$Result.GetResult<Prisma.$ReadyApartmentPayload<ExtArgs>, T, "findUniqueOrThrow", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>
    rentalApartment<T extends Image$rentalApartmentArgs<ExtArgs> = {}>(args?: Subset<T, Image$rentalApartmentArgs<ExtArgs>>): Prisma__RentalApartmentClient<$Result.GetResult<Prisma.$RentalApartmentPayload<ExtArgs>, T, "findUniqueOrThrow", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>
    countryProperty<T extends Image$countryPropertyArgs<ExtArgs> = {}>(args?: Subset<T, Image$countryPropertyArgs<ExtArgs>>): Prisma__CountryPropertyClient<$Result.GetResult<Prisma.$CountryPropertyPayload<ExtArgs>, T, "findUniqueOrThrow", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>
    commercialProperty<T extends Image$commercialPropertyArgs<ExtArgs> = {}>(args?: Subset<T, Image$commercialPropertyArgs<ExtArgs>>): Prisma__CommercialPropertyClient<$Result.GetResult<Prisma.$CommercialPropertyPayload<ExtArgs>, T, "findUniqueOrThrow", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>
    /**
     * Attaches callbacks for the resolution and/or rejection of the Promise.
     * @param onfulfilled The callback to execute when the Promise is resolved.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of which ever callback is executed.
     */
    then<TResult1 = T, TResult2 = never>(onfulfilled?: ((value: T) => TResult1 | PromiseLike<TResult1>) | undefined | null, onrejected?: ((reason: any) => TResult2 | PromiseLike<TResult2>) | undefined | null): $Utils.JsPromise<TResult1 | TResult2>
    /**
     * Attaches a callback for only the rejection of the Promise.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of the callback.
     */
    catch<TResult = never>(onrejected?: ((reason: any) => TResult | PromiseLike<TResult>) | undefined | null): $Utils.JsPromise<T | TResult>
    /**
     * Attaches a callback that is invoked when the Promise is settled (fulfilled or rejected). The
     * resolved value cannot be modified from the callback.
     * @param onfinally The callback to execute when the Promise is settled (fulfilled or rejected).
     * @returns A Promise for the completion of the callback.
     */
    finally(onfinally?: (() => void) | undefined | null): $Utils.JsPromise<T>
  }




  /**
   * Fields of the Image model
   */ 
  interface ImageFieldRefs {
    readonly id: FieldRef<"Image", 'Int'>
    readonly url: FieldRef<"Image", 'String'>
    readonly newBuildingComplexId: FieldRef<"Image", 'Int'>
    readonly newBuildingApartmentId: FieldRef<"Image", 'Int'>
    readonly readyApartmentId: FieldRef<"Image", 'Int'>
    readonly rentalApartmentId: FieldRef<"Image", 'Int'>
    readonly countryPropertyId: FieldRef<"Image", 'Int'>
    readonly commercialPropertyId: FieldRef<"Image", 'Int'>
    readonly createdAt: FieldRef<"Image", 'DateTime'>
  }
    

  // Custom InputTypes
  /**
   * Image findUnique
   */
  export type ImageFindUniqueArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Image
     */
    select?: ImageSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Image
     */
    omit?: ImageOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ImageInclude<ExtArgs> | null
    /**
     * Filter, which Image to fetch.
     */
    where: ImageWhereUniqueInput
  }

  /**
   * Image findUniqueOrThrow
   */
  export type ImageFindUniqueOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Image
     */
    select?: ImageSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Image
     */
    omit?: ImageOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ImageInclude<ExtArgs> | null
    /**
     * Filter, which Image to fetch.
     */
    where: ImageWhereUniqueInput
  }

  /**
   * Image findFirst
   */
  export type ImageFindFirstArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Image
     */
    select?: ImageSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Image
     */
    omit?: ImageOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ImageInclude<ExtArgs> | null
    /**
     * Filter, which Image to fetch.
     */
    where?: ImageWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Images to fetch.
     */
    orderBy?: ImageOrderByWithRelationInput | ImageOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for Images.
     */
    cursor?: ImageWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Images from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Images.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of Images.
     */
    distinct?: ImageScalarFieldEnum | ImageScalarFieldEnum[]
  }

  /**
   * Image findFirstOrThrow
   */
  export type ImageFindFirstOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Image
     */
    select?: ImageSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Image
     */
    omit?: ImageOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ImageInclude<ExtArgs> | null
    /**
     * Filter, which Image to fetch.
     */
    where?: ImageWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Images to fetch.
     */
    orderBy?: ImageOrderByWithRelationInput | ImageOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for Images.
     */
    cursor?: ImageWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Images from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Images.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of Images.
     */
    distinct?: ImageScalarFieldEnum | ImageScalarFieldEnum[]
  }

  /**
   * Image findMany
   */
  export type ImageFindManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Image
     */
    select?: ImageSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Image
     */
    omit?: ImageOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ImageInclude<ExtArgs> | null
    /**
     * Filter, which Images to fetch.
     */
    where?: ImageWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Images to fetch.
     */
    orderBy?: ImageOrderByWithRelationInput | ImageOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for listing Images.
     */
    cursor?: ImageWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Images from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Images.
     */
    skip?: number
    distinct?: ImageScalarFieldEnum | ImageScalarFieldEnum[]
  }

  /**
   * Image create
   */
  export type ImageCreateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Image
     */
    select?: ImageSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Image
     */
    omit?: ImageOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ImageInclude<ExtArgs> | null
    /**
     * The data needed to create a Image.
     */
    data: XOR<ImageCreateInput, ImageUncheckedCreateInput>
  }

  /**
   * Image createMany
   */
  export type ImageCreateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to create many Images.
     */
    data: ImageCreateManyInput | ImageCreateManyInput[]
    skipDuplicates?: boolean
  }

  /**
   * Image createManyAndReturn
   */
  export type ImageCreateManyAndReturnArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Image
     */
    select?: ImageSelectCreateManyAndReturn<ExtArgs> | null
    /**
     * Omit specific fields from the Image
     */
    omit?: ImageOmit<ExtArgs> | null
    /**
     * The data used to create many Images.
     */
    data: ImageCreateManyInput | ImageCreateManyInput[]
    skipDuplicates?: boolean
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ImageIncludeCreateManyAndReturn<ExtArgs> | null
  }

  /**
   * Image update
   */
  export type ImageUpdateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Image
     */
    select?: ImageSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Image
     */
    omit?: ImageOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ImageInclude<ExtArgs> | null
    /**
     * The data needed to update a Image.
     */
    data: XOR<ImageUpdateInput, ImageUncheckedUpdateInput>
    /**
     * Choose, which Image to update.
     */
    where: ImageWhereUniqueInput
  }

  /**
   * Image updateMany
   */
  export type ImageUpdateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to update Images.
     */
    data: XOR<ImageUpdateManyMutationInput, ImageUncheckedUpdateManyInput>
    /**
     * Filter which Images to update
     */
    where?: ImageWhereInput
    /**
     * Limit how many Images to update.
     */
    limit?: number
  }

  /**
   * Image updateManyAndReturn
   */
  export type ImageUpdateManyAndReturnArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Image
     */
    select?: ImageSelectUpdateManyAndReturn<ExtArgs> | null
    /**
     * Omit specific fields from the Image
     */
    omit?: ImageOmit<ExtArgs> | null
    /**
     * The data used to update Images.
     */
    data: XOR<ImageUpdateManyMutationInput, ImageUncheckedUpdateManyInput>
    /**
     * Filter which Images to update
     */
    where?: ImageWhereInput
    /**
     * Limit how many Images to update.
     */
    limit?: number
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ImageIncludeUpdateManyAndReturn<ExtArgs> | null
  }

  /**
   * Image upsert
   */
  export type ImageUpsertArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Image
     */
    select?: ImageSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Image
     */
    omit?: ImageOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ImageInclude<ExtArgs> | null
    /**
     * The filter to search for the Image to update in case it exists.
     */
    where: ImageWhereUniqueInput
    /**
     * In case the Image found by the `where` argument doesn't exist, create a new Image with this data.
     */
    create: XOR<ImageCreateInput, ImageUncheckedCreateInput>
    /**
     * In case the Image was found with the provided `where` argument, update it with this data.
     */
    update: XOR<ImageUpdateInput, ImageUncheckedUpdateInput>
  }

  /**
   * Image delete
   */
  export type ImageDeleteArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Image
     */
    select?: ImageSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Image
     */
    omit?: ImageOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ImageInclude<ExtArgs> | null
    /**
     * Filter which Image to delete.
     */
    where: ImageWhereUniqueInput
  }

  /**
   * Image deleteMany
   */
  export type ImageDeleteManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which Images to delete
     */
    where?: ImageWhereInput
    /**
     * Limit how many Images to delete.
     */
    limit?: number
  }

  /**
   * Image.newBuildingComplex
   */
  export type Image$newBuildingComplexArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingComplex
     */
    select?: NewBuildingComplexSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingComplex
     */
    omit?: NewBuildingComplexOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NewBuildingComplexInclude<ExtArgs> | null
    where?: NewBuildingComplexWhereInput
  }

  /**
   * Image.newBuildingApartment
   */
  export type Image$newBuildingApartmentArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingApartment
     */
    select?: NewBuildingApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingApartment
     */
    omit?: NewBuildingApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NewBuildingApartmentInclude<ExtArgs> | null
    where?: NewBuildingApartmentWhereInput
  }

  /**
   * Image.readyApartment
   */
  export type Image$readyApartmentArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the ReadyApartment
     */
    select?: ReadyApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the ReadyApartment
     */
    omit?: ReadyApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ReadyApartmentInclude<ExtArgs> | null
    where?: ReadyApartmentWhereInput
  }

  /**
   * Image.rentalApartment
   */
  export type Image$rentalApartmentArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the RentalApartment
     */
    select?: RentalApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the RentalApartment
     */
    omit?: RentalApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: RentalApartmentInclude<ExtArgs> | null
    where?: RentalApartmentWhereInput
  }

  /**
   * Image.countryProperty
   */
  export type Image$countryPropertyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CountryProperty
     */
    select?: CountryPropertySelect<ExtArgs> | null
    /**
     * Omit specific fields from the CountryProperty
     */
    omit?: CountryPropertyOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: CountryPropertyInclude<ExtArgs> | null
    where?: CountryPropertyWhereInput
  }

  /**
   * Image.commercialProperty
   */
  export type Image$commercialPropertyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CommercialProperty
     */
    select?: CommercialPropertySelect<ExtArgs> | null
    /**
     * Omit specific fields from the CommercialProperty
     */
    omit?: CommercialPropertyOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: CommercialPropertyInclude<ExtArgs> | null
    where?: CommercialPropertyWhereInput
  }

  /**
   * Image without action
   */
  export type ImageDefaultArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Image
     */
    select?: ImageSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Image
     */
    omit?: ImageOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ImageInclude<ExtArgs> | null
  }


  /**
   * Model NewBuildingComplex
   */

  export type AggregateNewBuildingComplex = {
    _count: NewBuildingComplexCountAggregateOutputType | null
    _avg: NewBuildingComplexAvgAggregateOutputType | null
    _sum: NewBuildingComplexSumAggregateOutputType | null
    _min: NewBuildingComplexMinAggregateOutputType | null
    _max: NewBuildingComplexMaxAggregateOutputType | null
  }

  export type NewBuildingComplexAvgAggregateOutputType = {
    id: number | null
    metroDistance: number | null
    priceFrom: number | null
    areaFrom: number | null
    floors: number | null
    totalApartments: number | null
    availableApartments: number | null
    lat: number | null
    lng: number | null
    height: number | null
  }

  export type NewBuildingComplexSumAggregateOutputType = {
    id: number | null
    metroDistance: number | null
    priceFrom: number | null
    areaFrom: number | null
    floors: number | null
    totalApartments: number | null
    availableApartments: number | null
    lat: number | null
    lng: number | null
    height: number | null
  }

  export type NewBuildingComplexMinAggregateOutputType = {
    id: number | null
    name: string | null
    address: string | null
    district: string | null
    metro: string | null
    metroDistance: number | null
    city: string | null
    developer: string | null
    priceFrom: number | null
    areaFrom: number | null
    buildingClass: string | null
    floors: number | null
    totalApartments: number | null
    availableApartments: number | null
    lat: number | null
    lng: number | null
    completionDate: Date | null
    height: number | null
    hasParking: boolean | null
    description: string | null
    createdAt: Date | null
    updatedAt: Date | null
  }

  export type NewBuildingComplexMaxAggregateOutputType = {
    id: number | null
    name: string | null
    address: string | null
    district: string | null
    metro: string | null
    metroDistance: number | null
    city: string | null
    developer: string | null
    priceFrom: number | null
    areaFrom: number | null
    buildingClass: string | null
    floors: number | null
    totalApartments: number | null
    availableApartments: number | null
    lat: number | null
    lng: number | null
    completionDate: Date | null
    height: number | null
    hasParking: boolean | null
    description: string | null
    createdAt: Date | null
    updatedAt: Date | null
  }

  export type NewBuildingComplexCountAggregateOutputType = {
    id: number
    name: number
    address: number
    district: number
    metro: number
    metroDistance: number
    city: number
    developer: number
    priceFrom: number
    areaFrom: number
    buildingClass: number
    floors: number
    totalApartments: number
    availableApartments: number
    lat: number
    lng: number
    completionDate: number
    height: number
    hasParking: number
    description: number
    createdAt: number
    updatedAt: number
    _all: number
  }


  export type NewBuildingComplexAvgAggregateInputType = {
    id?: true
    metroDistance?: true
    priceFrom?: true
    areaFrom?: true
    floors?: true
    totalApartments?: true
    availableApartments?: true
    lat?: true
    lng?: true
    height?: true
  }

  export type NewBuildingComplexSumAggregateInputType = {
    id?: true
    metroDistance?: true
    priceFrom?: true
    areaFrom?: true
    floors?: true
    totalApartments?: true
    availableApartments?: true
    lat?: true
    lng?: true
    height?: true
  }

  export type NewBuildingComplexMinAggregateInputType = {
    id?: true
    name?: true
    address?: true
    district?: true
    metro?: true
    metroDistance?: true
    city?: true
    developer?: true
    priceFrom?: true
    areaFrom?: true
    buildingClass?: true
    floors?: true
    totalApartments?: true
    availableApartments?: true
    lat?: true
    lng?: true
    completionDate?: true
    height?: true
    hasParking?: true
    description?: true
    createdAt?: true
    updatedAt?: true
  }

  export type NewBuildingComplexMaxAggregateInputType = {
    id?: true
    name?: true
    address?: true
    district?: true
    metro?: true
    metroDistance?: true
    city?: true
    developer?: true
    priceFrom?: true
    areaFrom?: true
    buildingClass?: true
    floors?: true
    totalApartments?: true
    availableApartments?: true
    lat?: true
    lng?: true
    completionDate?: true
    height?: true
    hasParking?: true
    description?: true
    createdAt?: true
    updatedAt?: true
  }

  export type NewBuildingComplexCountAggregateInputType = {
    id?: true
    name?: true
    address?: true
    district?: true
    metro?: true
    metroDistance?: true
    city?: true
    developer?: true
    priceFrom?: true
    areaFrom?: true
    buildingClass?: true
    floors?: true
    totalApartments?: true
    availableApartments?: true
    lat?: true
    lng?: true
    completionDate?: true
    height?: true
    hasParking?: true
    description?: true
    createdAt?: true
    updatedAt?: true
    _all?: true
  }

  export type NewBuildingComplexAggregateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which NewBuildingComplex to aggregate.
     */
    where?: NewBuildingComplexWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of NewBuildingComplexes to fetch.
     */
    orderBy?: NewBuildingComplexOrderByWithRelationInput | NewBuildingComplexOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the start position
     */
    cursor?: NewBuildingComplexWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` NewBuildingComplexes from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` NewBuildingComplexes.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Count returned NewBuildingComplexes
    **/
    _count?: true | NewBuildingComplexCountAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to average
    **/
    _avg?: NewBuildingComplexAvgAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to sum
    **/
    _sum?: NewBuildingComplexSumAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the minimum value
    **/
    _min?: NewBuildingComplexMinAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the maximum value
    **/
    _max?: NewBuildingComplexMaxAggregateInputType
  }

  export type GetNewBuildingComplexAggregateType<T extends NewBuildingComplexAggregateArgs> = {
        [P in keyof T & keyof AggregateNewBuildingComplex]: P extends '_count' | 'count'
      ? T[P] extends true
        ? number
        : GetScalarType<T[P], AggregateNewBuildingComplex[P]>
      : GetScalarType<T[P], AggregateNewBuildingComplex[P]>
  }




  export type NewBuildingComplexGroupByArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    where?: NewBuildingComplexWhereInput
    orderBy?: NewBuildingComplexOrderByWithAggregationInput | NewBuildingComplexOrderByWithAggregationInput[]
    by: NewBuildingComplexScalarFieldEnum[] | NewBuildingComplexScalarFieldEnum
    having?: NewBuildingComplexScalarWhereWithAggregatesInput
    take?: number
    skip?: number
    _count?: NewBuildingComplexCountAggregateInputType | true
    _avg?: NewBuildingComplexAvgAggregateInputType
    _sum?: NewBuildingComplexSumAggregateInputType
    _min?: NewBuildingComplexMinAggregateInputType
    _max?: NewBuildingComplexMaxAggregateInputType
  }

  export type NewBuildingComplexGroupByOutputType = {
    id: number
    name: string
    address: string
    district: string | null
    metro: string | null
    metroDistance: number | null
    city: string | null
    developer: string
    priceFrom: number
    areaFrom: number | null
    buildingClass: string | null
    floors: number | null
    totalApartments: number | null
    availableApartments: number | null
    lat: number | null
    lng: number | null
    completionDate: Date | null
    height: number | null
    hasParking: boolean
    description: string | null
    createdAt: Date
    updatedAt: Date
    _count: NewBuildingComplexCountAggregateOutputType | null
    _avg: NewBuildingComplexAvgAggregateOutputType | null
    _sum: NewBuildingComplexSumAggregateOutputType | null
    _min: NewBuildingComplexMinAggregateOutputType | null
    _max: NewBuildingComplexMaxAggregateOutputType | null
  }

  type GetNewBuildingComplexGroupByPayload<T extends NewBuildingComplexGroupByArgs> = Prisma.PrismaPromise<
    Array<
      PickEnumerable<NewBuildingComplexGroupByOutputType, T['by']> &
        {
          [P in ((keyof T) & (keyof NewBuildingComplexGroupByOutputType))]: P extends '_count'
            ? T[P] extends boolean
              ? number
              : GetScalarType<T[P], NewBuildingComplexGroupByOutputType[P]>
            : GetScalarType<T[P], NewBuildingComplexGroupByOutputType[P]>
        }
      >
    >


  export type NewBuildingComplexSelect<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    name?: boolean
    address?: boolean
    district?: boolean
    metro?: boolean
    metroDistance?: boolean
    city?: boolean
    developer?: boolean
    priceFrom?: boolean
    areaFrom?: boolean
    buildingClass?: boolean
    floors?: boolean
    totalApartments?: boolean
    availableApartments?: boolean
    lat?: boolean
    lng?: boolean
    completionDate?: boolean
    height?: boolean
    hasParking?: boolean
    description?: boolean
    createdAt?: boolean
    updatedAt?: boolean
    images?: boolean | NewBuildingComplex$imagesArgs<ExtArgs>
    apartments?: boolean | NewBuildingComplex$apartmentsArgs<ExtArgs>
    nearbyPlaces?: boolean | NewBuildingComplex$nearbyPlacesArgs<ExtArgs>
    _count?: boolean | NewBuildingComplexCountOutputTypeDefaultArgs<ExtArgs>
  }, ExtArgs["result"]["newBuildingComplex"]>

  export type NewBuildingComplexSelectCreateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    name?: boolean
    address?: boolean
    district?: boolean
    metro?: boolean
    metroDistance?: boolean
    city?: boolean
    developer?: boolean
    priceFrom?: boolean
    areaFrom?: boolean
    buildingClass?: boolean
    floors?: boolean
    totalApartments?: boolean
    availableApartments?: boolean
    lat?: boolean
    lng?: boolean
    completionDate?: boolean
    height?: boolean
    hasParking?: boolean
    description?: boolean
    createdAt?: boolean
    updatedAt?: boolean
  }, ExtArgs["result"]["newBuildingComplex"]>

  export type NewBuildingComplexSelectUpdateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    name?: boolean
    address?: boolean
    district?: boolean
    metro?: boolean
    metroDistance?: boolean
    city?: boolean
    developer?: boolean
    priceFrom?: boolean
    areaFrom?: boolean
    buildingClass?: boolean
    floors?: boolean
    totalApartments?: boolean
    availableApartments?: boolean
    lat?: boolean
    lng?: boolean
    completionDate?: boolean
    height?: boolean
    hasParking?: boolean
    description?: boolean
    createdAt?: boolean
    updatedAt?: boolean
  }, ExtArgs["result"]["newBuildingComplex"]>

  export type NewBuildingComplexSelectScalar = {
    id?: boolean
    name?: boolean
    address?: boolean
    district?: boolean
    metro?: boolean
    metroDistance?: boolean
    city?: boolean
    developer?: boolean
    priceFrom?: boolean
    areaFrom?: boolean
    buildingClass?: boolean
    floors?: boolean
    totalApartments?: boolean
    availableApartments?: boolean
    lat?: boolean
    lng?: boolean
    completionDate?: boolean
    height?: boolean
    hasParking?: boolean
    description?: boolean
    createdAt?: boolean
    updatedAt?: boolean
  }

  export type NewBuildingComplexOmit<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetOmit<"id" | "name" | "address" | "district" | "metro" | "metroDistance" | "city" | "developer" | "priceFrom" | "areaFrom" | "buildingClass" | "floors" | "totalApartments" | "availableApartments" | "lat" | "lng" | "completionDate" | "height" | "hasParking" | "description" | "createdAt" | "updatedAt", ExtArgs["result"]["newBuildingComplex"]>
  export type NewBuildingComplexInclude<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    images?: boolean | NewBuildingComplex$imagesArgs<ExtArgs>
    apartments?: boolean | NewBuildingComplex$apartmentsArgs<ExtArgs>
    nearbyPlaces?: boolean | NewBuildingComplex$nearbyPlacesArgs<ExtArgs>
    _count?: boolean | NewBuildingComplexCountOutputTypeDefaultArgs<ExtArgs>
  }
  export type NewBuildingComplexIncludeCreateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {}
  export type NewBuildingComplexIncludeUpdateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {}

  export type $NewBuildingComplexPayload<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    name: "NewBuildingComplex"
    objects: {
      images: Prisma.$ImagePayload<ExtArgs>[]
      apartments: Prisma.$NewBuildingApartmentPayload<ExtArgs>[]
      nearbyPlaces: Prisma.$NearbyPlacePayload<ExtArgs>[]
    }
    scalars: $Extensions.GetPayloadResult<{
      id: number
      name: string
      address: string
      district: string | null
      metro: string | null
      metroDistance: number | null
      city: string | null
      developer: string
      priceFrom: number
      areaFrom: number | null
      buildingClass: string | null
      floors: number | null
      totalApartments: number | null
      availableApartments: number | null
      lat: number | null
      lng: number | null
      completionDate: Date | null
      height: number | null
      hasParking: boolean
      description: string | null
      createdAt: Date
      updatedAt: Date
    }, ExtArgs["result"]["newBuildingComplex"]>
    composites: {}
  }

  type NewBuildingComplexGetPayload<S extends boolean | null | undefined | NewBuildingComplexDefaultArgs> = $Result.GetResult<Prisma.$NewBuildingComplexPayload, S>

  type NewBuildingComplexCountArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> =
    Omit<NewBuildingComplexFindManyArgs, 'select' | 'include' | 'distinct' | 'omit'> & {
      select?: NewBuildingComplexCountAggregateInputType | true
    }

  export interface NewBuildingComplexDelegate<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs, GlobalOmitOptions = {}> {
    [K: symbol]: { types: Prisma.TypeMap<ExtArgs>['model']['NewBuildingComplex'], meta: { name: 'NewBuildingComplex' } }
    /**
     * Find zero or one NewBuildingComplex that matches the filter.
     * @param {NewBuildingComplexFindUniqueArgs} args - Arguments to find a NewBuildingComplex
     * @example
     * // Get one NewBuildingComplex
     * const newBuildingComplex = await prisma.newBuildingComplex.findUnique({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUnique<T extends NewBuildingComplexFindUniqueArgs>(args: SelectSubset<T, NewBuildingComplexFindUniqueArgs<ExtArgs>>): Prisma__NewBuildingComplexClient<$Result.GetResult<Prisma.$NewBuildingComplexPayload<ExtArgs>, T, "findUnique", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>

    /**
     * Find one NewBuildingComplex that matches the filter or throw an error with `error.code='P2025'`
     * if no matches were found.
     * @param {NewBuildingComplexFindUniqueOrThrowArgs} args - Arguments to find a NewBuildingComplex
     * @example
     * // Get one NewBuildingComplex
     * const newBuildingComplex = await prisma.newBuildingComplex.findUniqueOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUniqueOrThrow<T extends NewBuildingComplexFindUniqueOrThrowArgs>(args: SelectSubset<T, NewBuildingComplexFindUniqueOrThrowArgs<ExtArgs>>): Prisma__NewBuildingComplexClient<$Result.GetResult<Prisma.$NewBuildingComplexPayload<ExtArgs>, T, "findUniqueOrThrow", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Find the first NewBuildingComplex that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {NewBuildingComplexFindFirstArgs} args - Arguments to find a NewBuildingComplex
     * @example
     * // Get one NewBuildingComplex
     * const newBuildingComplex = await prisma.newBuildingComplex.findFirst({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirst<T extends NewBuildingComplexFindFirstArgs>(args?: SelectSubset<T, NewBuildingComplexFindFirstArgs<ExtArgs>>): Prisma__NewBuildingComplexClient<$Result.GetResult<Prisma.$NewBuildingComplexPayload<ExtArgs>, T, "findFirst", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>

    /**
     * Find the first NewBuildingComplex that matches the filter or
     * throw `PrismaKnownClientError` with `P2025` code if no matches were found.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {NewBuildingComplexFindFirstOrThrowArgs} args - Arguments to find a NewBuildingComplex
     * @example
     * // Get one NewBuildingComplex
     * const newBuildingComplex = await prisma.newBuildingComplex.findFirstOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirstOrThrow<T extends NewBuildingComplexFindFirstOrThrowArgs>(args?: SelectSubset<T, NewBuildingComplexFindFirstOrThrowArgs<ExtArgs>>): Prisma__NewBuildingComplexClient<$Result.GetResult<Prisma.$NewBuildingComplexPayload<ExtArgs>, T, "findFirstOrThrow", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Find zero or more NewBuildingComplexes that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {NewBuildingComplexFindManyArgs} args - Arguments to filter and select certain fields only.
     * @example
     * // Get all NewBuildingComplexes
     * const newBuildingComplexes = await prisma.newBuildingComplex.findMany()
     * 
     * // Get first 10 NewBuildingComplexes
     * const newBuildingComplexes = await prisma.newBuildingComplex.findMany({ take: 10 })
     * 
     * // Only select the `id`
     * const newBuildingComplexWithIdOnly = await prisma.newBuildingComplex.findMany({ select: { id: true } })
     * 
     */
    findMany<T extends NewBuildingComplexFindManyArgs>(args?: SelectSubset<T, NewBuildingComplexFindManyArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$NewBuildingComplexPayload<ExtArgs>, T, "findMany", GlobalOmitOptions>>

    /**
     * Create a NewBuildingComplex.
     * @param {NewBuildingComplexCreateArgs} args - Arguments to create a NewBuildingComplex.
     * @example
     * // Create one NewBuildingComplex
     * const NewBuildingComplex = await prisma.newBuildingComplex.create({
     *   data: {
     *     // ... data to create a NewBuildingComplex
     *   }
     * })
     * 
     */
    create<T extends NewBuildingComplexCreateArgs>(args: SelectSubset<T, NewBuildingComplexCreateArgs<ExtArgs>>): Prisma__NewBuildingComplexClient<$Result.GetResult<Prisma.$NewBuildingComplexPayload<ExtArgs>, T, "create", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Create many NewBuildingComplexes.
     * @param {NewBuildingComplexCreateManyArgs} args - Arguments to create many NewBuildingComplexes.
     * @example
     * // Create many NewBuildingComplexes
     * const newBuildingComplex = await prisma.newBuildingComplex.createMany({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     *     
     */
    createMany<T extends NewBuildingComplexCreateManyArgs>(args?: SelectSubset<T, NewBuildingComplexCreateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Create many NewBuildingComplexes and returns the data saved in the database.
     * @param {NewBuildingComplexCreateManyAndReturnArgs} args - Arguments to create many NewBuildingComplexes.
     * @example
     * // Create many NewBuildingComplexes
     * const newBuildingComplex = await prisma.newBuildingComplex.createManyAndReturn({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * 
     * // Create many NewBuildingComplexes and only return the `id`
     * const newBuildingComplexWithIdOnly = await prisma.newBuildingComplex.createManyAndReturn({
     *   select: { id: true },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * 
     */
    createManyAndReturn<T extends NewBuildingComplexCreateManyAndReturnArgs>(args?: SelectSubset<T, NewBuildingComplexCreateManyAndReturnArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$NewBuildingComplexPayload<ExtArgs>, T, "createManyAndReturn", GlobalOmitOptions>>

    /**
     * Delete a NewBuildingComplex.
     * @param {NewBuildingComplexDeleteArgs} args - Arguments to delete one NewBuildingComplex.
     * @example
     * // Delete one NewBuildingComplex
     * const NewBuildingComplex = await prisma.newBuildingComplex.delete({
     *   where: {
     *     // ... filter to delete one NewBuildingComplex
     *   }
     * })
     * 
     */
    delete<T extends NewBuildingComplexDeleteArgs>(args: SelectSubset<T, NewBuildingComplexDeleteArgs<ExtArgs>>): Prisma__NewBuildingComplexClient<$Result.GetResult<Prisma.$NewBuildingComplexPayload<ExtArgs>, T, "delete", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Update one NewBuildingComplex.
     * @param {NewBuildingComplexUpdateArgs} args - Arguments to update one NewBuildingComplex.
     * @example
     * // Update one NewBuildingComplex
     * const newBuildingComplex = await prisma.newBuildingComplex.update({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    update<T extends NewBuildingComplexUpdateArgs>(args: SelectSubset<T, NewBuildingComplexUpdateArgs<ExtArgs>>): Prisma__NewBuildingComplexClient<$Result.GetResult<Prisma.$NewBuildingComplexPayload<ExtArgs>, T, "update", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Delete zero or more NewBuildingComplexes.
     * @param {NewBuildingComplexDeleteManyArgs} args - Arguments to filter NewBuildingComplexes to delete.
     * @example
     * // Delete a few NewBuildingComplexes
     * const { count } = await prisma.newBuildingComplex.deleteMany({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     * 
     */
    deleteMany<T extends NewBuildingComplexDeleteManyArgs>(args?: SelectSubset<T, NewBuildingComplexDeleteManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Update zero or more NewBuildingComplexes.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {NewBuildingComplexUpdateManyArgs} args - Arguments to update one or more rows.
     * @example
     * // Update many NewBuildingComplexes
     * const newBuildingComplex = await prisma.newBuildingComplex.updateMany({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    updateMany<T extends NewBuildingComplexUpdateManyArgs>(args: SelectSubset<T, NewBuildingComplexUpdateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Update zero or more NewBuildingComplexes and returns the data updated in the database.
     * @param {NewBuildingComplexUpdateManyAndReturnArgs} args - Arguments to update many NewBuildingComplexes.
     * @example
     * // Update many NewBuildingComplexes
     * const newBuildingComplex = await prisma.newBuildingComplex.updateManyAndReturn({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * 
     * // Update zero or more NewBuildingComplexes and only return the `id`
     * const newBuildingComplexWithIdOnly = await prisma.newBuildingComplex.updateManyAndReturn({
     *   select: { id: true },
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * 
     */
    updateManyAndReturn<T extends NewBuildingComplexUpdateManyAndReturnArgs>(args: SelectSubset<T, NewBuildingComplexUpdateManyAndReturnArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$NewBuildingComplexPayload<ExtArgs>, T, "updateManyAndReturn", GlobalOmitOptions>>

    /**
     * Create or update one NewBuildingComplex.
     * @param {NewBuildingComplexUpsertArgs} args - Arguments to update or create a NewBuildingComplex.
     * @example
     * // Update or create a NewBuildingComplex
     * const newBuildingComplex = await prisma.newBuildingComplex.upsert({
     *   create: {
     *     // ... data to create a NewBuildingComplex
     *   },
     *   update: {
     *     // ... in case it already exists, update
     *   },
     *   where: {
     *     // ... the filter for the NewBuildingComplex we want to update
     *   }
     * })
     */
    upsert<T extends NewBuildingComplexUpsertArgs>(args: SelectSubset<T, NewBuildingComplexUpsertArgs<ExtArgs>>): Prisma__NewBuildingComplexClient<$Result.GetResult<Prisma.$NewBuildingComplexPayload<ExtArgs>, T, "upsert", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>


    /**
     * Count the number of NewBuildingComplexes.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {NewBuildingComplexCountArgs} args - Arguments to filter NewBuildingComplexes to count.
     * @example
     * // Count the number of NewBuildingComplexes
     * const count = await prisma.newBuildingComplex.count({
     *   where: {
     *     // ... the filter for the NewBuildingComplexes we want to count
     *   }
     * })
    **/
    count<T extends NewBuildingComplexCountArgs>(
      args?: Subset<T, NewBuildingComplexCountArgs>,
    ): Prisma.PrismaPromise<
      T extends $Utils.Record<'select', any>
        ? T['select'] extends true
          ? number
          : GetScalarType<T['select'], NewBuildingComplexCountAggregateOutputType>
        : number
    >

    /**
     * Allows you to perform aggregations operations on a NewBuildingComplex.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {NewBuildingComplexAggregateArgs} args - Select which aggregations you would like to apply and on what fields.
     * @example
     * // Ordered by age ascending
     * // Where email contains prisma.io
     * // Limited to the 10 users
     * const aggregations = await prisma.user.aggregate({
     *   _avg: {
     *     age: true,
     *   },
     *   where: {
     *     email: {
     *       contains: "prisma.io",
     *     },
     *   },
     *   orderBy: {
     *     age: "asc",
     *   },
     *   take: 10,
     * })
    **/
    aggregate<T extends NewBuildingComplexAggregateArgs>(args: Subset<T, NewBuildingComplexAggregateArgs>): Prisma.PrismaPromise<GetNewBuildingComplexAggregateType<T>>

    /**
     * Group by NewBuildingComplex.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {NewBuildingComplexGroupByArgs} args - Group by arguments.
     * @example
     * // Group by city, order by createdAt, get count
     * const result = await prisma.user.groupBy({
     *   by: ['city', 'createdAt'],
     *   orderBy: {
     *     createdAt: true
     *   },
     *   _count: {
     *     _all: true
     *   },
     * })
     * 
    **/
    groupBy<
      T extends NewBuildingComplexGroupByArgs,
      HasSelectOrTake extends Or<
        Extends<'skip', Keys<T>>,
        Extends<'take', Keys<T>>
      >,
      OrderByArg extends True extends HasSelectOrTake
        ? { orderBy: NewBuildingComplexGroupByArgs['orderBy'] }
        : { orderBy?: NewBuildingComplexGroupByArgs['orderBy'] },
      OrderFields extends ExcludeUnderscoreKeys<Keys<MaybeTupleToUnion<T['orderBy']>>>,
      ByFields extends MaybeTupleToUnion<T['by']>,
      ByValid extends Has<ByFields, OrderFields>,
      HavingFields extends GetHavingFields<T['having']>,
      HavingValid extends Has<ByFields, HavingFields>,
      ByEmpty extends T['by'] extends never[] ? True : False,
      InputErrors extends ByEmpty extends True
      ? `Error: "by" must not be empty.`
      : HavingValid extends False
      ? {
          [P in HavingFields]: P extends ByFields
            ? never
            : P extends string
            ? `Error: Field "${P}" used in "having" needs to be provided in "by".`
            : [
                Error,
                'Field ',
                P,
                ` in "having" needs to be provided in "by"`,
              ]
        }[HavingFields]
      : 'take' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "take", you also need to provide "orderBy"'
      : 'skip' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "skip", you also need to provide "orderBy"'
      : ByValid extends True
      ? {}
      : {
          [P in OrderFields]: P extends ByFields
            ? never
            : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
        }[OrderFields]
    >(args: SubsetIntersection<T, NewBuildingComplexGroupByArgs, OrderByArg> & InputErrors): {} extends InputErrors ? GetNewBuildingComplexGroupByPayload<T> : Prisma.PrismaPromise<InputErrors>
  /**
   * Fields of the NewBuildingComplex model
   */
  readonly fields: NewBuildingComplexFieldRefs;
  }

  /**
   * The delegate class that acts as a "Promise-like" for NewBuildingComplex.
   * Why is this prefixed with `Prisma__`?
   * Because we want to prevent naming conflicts as mentioned in
   * https://github.com/prisma/prisma-client-js/issues/707
   */
  export interface Prisma__NewBuildingComplexClient<T, Null = never, ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs, GlobalOmitOptions = {}> extends Prisma.PrismaPromise<T> {
    readonly [Symbol.toStringTag]: "PrismaPromise"
    images<T extends NewBuildingComplex$imagesArgs<ExtArgs> = {}>(args?: Subset<T, NewBuildingComplex$imagesArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$ImagePayload<ExtArgs>, T, "findMany", GlobalOmitOptions> | Null>
    apartments<T extends NewBuildingComplex$apartmentsArgs<ExtArgs> = {}>(args?: Subset<T, NewBuildingComplex$apartmentsArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$NewBuildingApartmentPayload<ExtArgs>, T, "findMany", GlobalOmitOptions> | Null>
    nearbyPlaces<T extends NewBuildingComplex$nearbyPlacesArgs<ExtArgs> = {}>(args?: Subset<T, NewBuildingComplex$nearbyPlacesArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$NearbyPlacePayload<ExtArgs>, T, "findMany", GlobalOmitOptions> | Null>
    /**
     * Attaches callbacks for the resolution and/or rejection of the Promise.
     * @param onfulfilled The callback to execute when the Promise is resolved.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of which ever callback is executed.
     */
    then<TResult1 = T, TResult2 = never>(onfulfilled?: ((value: T) => TResult1 | PromiseLike<TResult1>) | undefined | null, onrejected?: ((reason: any) => TResult2 | PromiseLike<TResult2>) | undefined | null): $Utils.JsPromise<TResult1 | TResult2>
    /**
     * Attaches a callback for only the rejection of the Promise.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of the callback.
     */
    catch<TResult = never>(onrejected?: ((reason: any) => TResult | PromiseLike<TResult>) | undefined | null): $Utils.JsPromise<T | TResult>
    /**
     * Attaches a callback that is invoked when the Promise is settled (fulfilled or rejected). The
     * resolved value cannot be modified from the callback.
     * @param onfinally The callback to execute when the Promise is settled (fulfilled or rejected).
     * @returns A Promise for the completion of the callback.
     */
    finally(onfinally?: (() => void) | undefined | null): $Utils.JsPromise<T>
  }




  /**
   * Fields of the NewBuildingComplex model
   */ 
  interface NewBuildingComplexFieldRefs {
    readonly id: FieldRef<"NewBuildingComplex", 'Int'>
    readonly name: FieldRef<"NewBuildingComplex", 'String'>
    readonly address: FieldRef<"NewBuildingComplex", 'String'>
    readonly district: FieldRef<"NewBuildingComplex", 'String'>
    readonly metro: FieldRef<"NewBuildingComplex", 'String'>
    readonly metroDistance: FieldRef<"NewBuildingComplex", 'Int'>
    readonly city: FieldRef<"NewBuildingComplex", 'String'>
    readonly developer: FieldRef<"NewBuildingComplex", 'String'>
    readonly priceFrom: FieldRef<"NewBuildingComplex", 'Int'>
    readonly areaFrom: FieldRef<"NewBuildingComplex", 'Int'>
    readonly buildingClass: FieldRef<"NewBuildingComplex", 'String'>
    readonly floors: FieldRef<"NewBuildingComplex", 'Int'>
    readonly totalApartments: FieldRef<"NewBuildingComplex", 'Int'>
    readonly availableApartments: FieldRef<"NewBuildingComplex", 'Int'>
    readonly lat: FieldRef<"NewBuildingComplex", 'Float'>
    readonly lng: FieldRef<"NewBuildingComplex", 'Float'>
    readonly completionDate: FieldRef<"NewBuildingComplex", 'DateTime'>
    readonly height: FieldRef<"NewBuildingComplex", 'Int'>
    readonly hasParking: FieldRef<"NewBuildingComplex", 'Boolean'>
    readonly description: FieldRef<"NewBuildingComplex", 'String'>
    readonly createdAt: FieldRef<"NewBuildingComplex", 'DateTime'>
    readonly updatedAt: FieldRef<"NewBuildingComplex", 'DateTime'>
  }
    

  // Custom InputTypes
  /**
   * NewBuildingComplex findUnique
   */
  export type NewBuildingComplexFindUniqueArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingComplex
     */
    select?: NewBuildingComplexSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingComplex
     */
    omit?: NewBuildingComplexOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NewBuildingComplexInclude<ExtArgs> | null
    /**
     * Filter, which NewBuildingComplex to fetch.
     */
    where: NewBuildingComplexWhereUniqueInput
  }

  /**
   * NewBuildingComplex findUniqueOrThrow
   */
  export type NewBuildingComplexFindUniqueOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingComplex
     */
    select?: NewBuildingComplexSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingComplex
     */
    omit?: NewBuildingComplexOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NewBuildingComplexInclude<ExtArgs> | null
    /**
     * Filter, which NewBuildingComplex to fetch.
     */
    where: NewBuildingComplexWhereUniqueInput
  }

  /**
   * NewBuildingComplex findFirst
   */
  export type NewBuildingComplexFindFirstArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingComplex
     */
    select?: NewBuildingComplexSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingComplex
     */
    omit?: NewBuildingComplexOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NewBuildingComplexInclude<ExtArgs> | null
    /**
     * Filter, which NewBuildingComplex to fetch.
     */
    where?: NewBuildingComplexWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of NewBuildingComplexes to fetch.
     */
    orderBy?: NewBuildingComplexOrderByWithRelationInput | NewBuildingComplexOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for NewBuildingComplexes.
     */
    cursor?: NewBuildingComplexWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` NewBuildingComplexes from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` NewBuildingComplexes.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of NewBuildingComplexes.
     */
    distinct?: NewBuildingComplexScalarFieldEnum | NewBuildingComplexScalarFieldEnum[]
  }

  /**
   * NewBuildingComplex findFirstOrThrow
   */
  export type NewBuildingComplexFindFirstOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingComplex
     */
    select?: NewBuildingComplexSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingComplex
     */
    omit?: NewBuildingComplexOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NewBuildingComplexInclude<ExtArgs> | null
    /**
     * Filter, which NewBuildingComplex to fetch.
     */
    where?: NewBuildingComplexWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of NewBuildingComplexes to fetch.
     */
    orderBy?: NewBuildingComplexOrderByWithRelationInput | NewBuildingComplexOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for NewBuildingComplexes.
     */
    cursor?: NewBuildingComplexWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` NewBuildingComplexes from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` NewBuildingComplexes.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of NewBuildingComplexes.
     */
    distinct?: NewBuildingComplexScalarFieldEnum | NewBuildingComplexScalarFieldEnum[]
  }

  /**
   * NewBuildingComplex findMany
   */
  export type NewBuildingComplexFindManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingComplex
     */
    select?: NewBuildingComplexSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingComplex
     */
    omit?: NewBuildingComplexOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NewBuildingComplexInclude<ExtArgs> | null
    /**
     * Filter, which NewBuildingComplexes to fetch.
     */
    where?: NewBuildingComplexWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of NewBuildingComplexes to fetch.
     */
    orderBy?: NewBuildingComplexOrderByWithRelationInput | NewBuildingComplexOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for listing NewBuildingComplexes.
     */
    cursor?: NewBuildingComplexWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` NewBuildingComplexes from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` NewBuildingComplexes.
     */
    skip?: number
    distinct?: NewBuildingComplexScalarFieldEnum | NewBuildingComplexScalarFieldEnum[]
  }

  /**
   * NewBuildingComplex create
   */
  export type NewBuildingComplexCreateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingComplex
     */
    select?: NewBuildingComplexSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingComplex
     */
    omit?: NewBuildingComplexOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NewBuildingComplexInclude<ExtArgs> | null
    /**
     * The data needed to create a NewBuildingComplex.
     */
    data: XOR<NewBuildingComplexCreateInput, NewBuildingComplexUncheckedCreateInput>
  }

  /**
   * NewBuildingComplex createMany
   */
  export type NewBuildingComplexCreateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to create many NewBuildingComplexes.
     */
    data: NewBuildingComplexCreateManyInput | NewBuildingComplexCreateManyInput[]
    skipDuplicates?: boolean
  }

  /**
   * NewBuildingComplex createManyAndReturn
   */
  export type NewBuildingComplexCreateManyAndReturnArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingComplex
     */
    select?: NewBuildingComplexSelectCreateManyAndReturn<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingComplex
     */
    omit?: NewBuildingComplexOmit<ExtArgs> | null
    /**
     * The data used to create many NewBuildingComplexes.
     */
    data: NewBuildingComplexCreateManyInput | NewBuildingComplexCreateManyInput[]
    skipDuplicates?: boolean
  }

  /**
   * NewBuildingComplex update
   */
  export type NewBuildingComplexUpdateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingComplex
     */
    select?: NewBuildingComplexSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingComplex
     */
    omit?: NewBuildingComplexOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NewBuildingComplexInclude<ExtArgs> | null
    /**
     * The data needed to update a NewBuildingComplex.
     */
    data: XOR<NewBuildingComplexUpdateInput, NewBuildingComplexUncheckedUpdateInput>
    /**
     * Choose, which NewBuildingComplex to update.
     */
    where: NewBuildingComplexWhereUniqueInput
  }

  /**
   * NewBuildingComplex updateMany
   */
  export type NewBuildingComplexUpdateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to update NewBuildingComplexes.
     */
    data: XOR<NewBuildingComplexUpdateManyMutationInput, NewBuildingComplexUncheckedUpdateManyInput>
    /**
     * Filter which NewBuildingComplexes to update
     */
    where?: NewBuildingComplexWhereInput
    /**
     * Limit how many NewBuildingComplexes to update.
     */
    limit?: number
  }

  /**
   * NewBuildingComplex updateManyAndReturn
   */
  export type NewBuildingComplexUpdateManyAndReturnArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingComplex
     */
    select?: NewBuildingComplexSelectUpdateManyAndReturn<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingComplex
     */
    omit?: NewBuildingComplexOmit<ExtArgs> | null
    /**
     * The data used to update NewBuildingComplexes.
     */
    data: XOR<NewBuildingComplexUpdateManyMutationInput, NewBuildingComplexUncheckedUpdateManyInput>
    /**
     * Filter which NewBuildingComplexes to update
     */
    where?: NewBuildingComplexWhereInput
    /**
     * Limit how many NewBuildingComplexes to update.
     */
    limit?: number
  }

  /**
   * NewBuildingComplex upsert
   */
  export type NewBuildingComplexUpsertArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingComplex
     */
    select?: NewBuildingComplexSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingComplex
     */
    omit?: NewBuildingComplexOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NewBuildingComplexInclude<ExtArgs> | null
    /**
     * The filter to search for the NewBuildingComplex to update in case it exists.
     */
    where: NewBuildingComplexWhereUniqueInput
    /**
     * In case the NewBuildingComplex found by the `where` argument doesn't exist, create a new NewBuildingComplex with this data.
     */
    create: XOR<NewBuildingComplexCreateInput, NewBuildingComplexUncheckedCreateInput>
    /**
     * In case the NewBuildingComplex was found with the provided `where` argument, update it with this data.
     */
    update: XOR<NewBuildingComplexUpdateInput, NewBuildingComplexUncheckedUpdateInput>
  }

  /**
   * NewBuildingComplex delete
   */
  export type NewBuildingComplexDeleteArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingComplex
     */
    select?: NewBuildingComplexSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingComplex
     */
    omit?: NewBuildingComplexOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NewBuildingComplexInclude<ExtArgs> | null
    /**
     * Filter which NewBuildingComplex to delete.
     */
    where: NewBuildingComplexWhereUniqueInput
  }

  /**
   * NewBuildingComplex deleteMany
   */
  export type NewBuildingComplexDeleteManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which NewBuildingComplexes to delete
     */
    where?: NewBuildingComplexWhereInput
    /**
     * Limit how many NewBuildingComplexes to delete.
     */
    limit?: number
  }

  /**
   * NewBuildingComplex.images
   */
  export type NewBuildingComplex$imagesArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Image
     */
    select?: ImageSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Image
     */
    omit?: ImageOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ImageInclude<ExtArgs> | null
    where?: ImageWhereInput
    orderBy?: ImageOrderByWithRelationInput | ImageOrderByWithRelationInput[]
    cursor?: ImageWhereUniqueInput
    take?: number
    skip?: number
    distinct?: ImageScalarFieldEnum | ImageScalarFieldEnum[]
  }

  /**
   * NewBuildingComplex.apartments
   */
  export type NewBuildingComplex$apartmentsArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingApartment
     */
    select?: NewBuildingApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingApartment
     */
    omit?: NewBuildingApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NewBuildingApartmentInclude<ExtArgs> | null
    where?: NewBuildingApartmentWhereInput
    orderBy?: NewBuildingApartmentOrderByWithRelationInput | NewBuildingApartmentOrderByWithRelationInput[]
    cursor?: NewBuildingApartmentWhereUniqueInput
    take?: number
    skip?: number
    distinct?: NewBuildingApartmentScalarFieldEnum | NewBuildingApartmentScalarFieldEnum[]
  }

  /**
   * NewBuildingComplex.nearbyPlaces
   */
  export type NewBuildingComplex$nearbyPlacesArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NearbyPlace
     */
    select?: NearbyPlaceSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NearbyPlace
     */
    omit?: NearbyPlaceOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NearbyPlaceInclude<ExtArgs> | null
    where?: NearbyPlaceWhereInput
    orderBy?: NearbyPlaceOrderByWithRelationInput | NearbyPlaceOrderByWithRelationInput[]
    cursor?: NearbyPlaceWhereUniqueInput
    take?: number
    skip?: number
    distinct?: NearbyPlaceScalarFieldEnum | NearbyPlaceScalarFieldEnum[]
  }

  /**
   * NewBuildingComplex without action
   */
  export type NewBuildingComplexDefaultArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingComplex
     */
    select?: NewBuildingComplexSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingComplex
     */
    omit?: NewBuildingComplexOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NewBuildingComplexInclude<ExtArgs> | null
  }


  /**
   * Model NewBuildingApartment
   */

  export type AggregateNewBuildingApartment = {
    _count: NewBuildingApartmentCountAggregateOutputType | null
    _avg: NewBuildingApartmentAvgAggregateOutputType | null
    _sum: NewBuildingApartmentSumAggregateOutputType | null
    _min: NewBuildingApartmentMinAggregateOutputType | null
    _max: NewBuildingApartmentMaxAggregateOutputType | null
  }

  export type NewBuildingApartmentAvgAggregateOutputType = {
    id: number | null
    complexId: number | null
    bedrooms: number | null
    area: number | null
    price: number | null
    pricePerM2: number | null
    floor: number | null
    totalFloors: number | null
    apartmentNumber: number | null
    lat: number | null
    lng: number | null
  }

  export type NewBuildingApartmentSumAggregateOutputType = {
    id: number | null
    complexId: number | null
    bedrooms: number | null
    area: number | null
    price: number | null
    pricePerM2: number | null
    floor: number | null
    totalFloors: number | null
    apartmentNumber: number | null
    lat: number | null
    lng: number | null
  }

  export type NewBuildingApartmentMinAggregateOutputType = {
    id: number | null
    complexId: number | null
    title: string | null
    bedrooms: number | null
    area: number | null
    price: number | null
    pricePerM2: number | null
    floor: number | null
    totalFloors: number | null
    city: string | null
    apartmentNumber: number | null
    lat: number | null
    lng: number | null
    type: string | null
    createdAt: Date | null
    updatedAt: Date | null
  }

  export type NewBuildingApartmentMaxAggregateOutputType = {
    id: number | null
    complexId: number | null
    title: string | null
    bedrooms: number | null
    area: number | null
    price: number | null
    pricePerM2: number | null
    floor: number | null
    totalFloors: number | null
    city: string | null
    apartmentNumber: number | null
    lat: number | null
    lng: number | null
    type: string | null
    createdAt: Date | null
    updatedAt: Date | null
  }

  export type NewBuildingApartmentCountAggregateOutputType = {
    id: number
    complexId: number
    title: number
    bedrooms: number
    area: number
    price: number
    pricePerM2: number
    floor: number
    totalFloors: number
    city: number
    apartmentNumber: number
    lat: number
    lng: number
    type: number
    createdAt: number
    updatedAt: number
    _all: number
  }


  export type NewBuildingApartmentAvgAggregateInputType = {
    id?: true
    complexId?: true
    bedrooms?: true
    area?: true
    price?: true
    pricePerM2?: true
    floor?: true
    totalFloors?: true
    apartmentNumber?: true
    lat?: true
    lng?: true
  }

  export type NewBuildingApartmentSumAggregateInputType = {
    id?: true
    complexId?: true
    bedrooms?: true
    area?: true
    price?: true
    pricePerM2?: true
    floor?: true
    totalFloors?: true
    apartmentNumber?: true
    lat?: true
    lng?: true
  }

  export type NewBuildingApartmentMinAggregateInputType = {
    id?: true
    complexId?: true
    title?: true
    bedrooms?: true
    area?: true
    price?: true
    pricePerM2?: true
    floor?: true
    totalFloors?: true
    city?: true
    apartmentNumber?: true
    lat?: true
    lng?: true
    type?: true
    createdAt?: true
    updatedAt?: true
  }

  export type NewBuildingApartmentMaxAggregateInputType = {
    id?: true
    complexId?: true
    title?: true
    bedrooms?: true
    area?: true
    price?: true
    pricePerM2?: true
    floor?: true
    totalFloors?: true
    city?: true
    apartmentNumber?: true
    lat?: true
    lng?: true
    type?: true
    createdAt?: true
    updatedAt?: true
  }

  export type NewBuildingApartmentCountAggregateInputType = {
    id?: true
    complexId?: true
    title?: true
    bedrooms?: true
    area?: true
    price?: true
    pricePerM2?: true
    floor?: true
    totalFloors?: true
    city?: true
    apartmentNumber?: true
    lat?: true
    lng?: true
    type?: true
    createdAt?: true
    updatedAt?: true
    _all?: true
  }

  export type NewBuildingApartmentAggregateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which NewBuildingApartment to aggregate.
     */
    where?: NewBuildingApartmentWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of NewBuildingApartments to fetch.
     */
    orderBy?: NewBuildingApartmentOrderByWithRelationInput | NewBuildingApartmentOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the start position
     */
    cursor?: NewBuildingApartmentWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` NewBuildingApartments from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` NewBuildingApartments.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Count returned NewBuildingApartments
    **/
    _count?: true | NewBuildingApartmentCountAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to average
    **/
    _avg?: NewBuildingApartmentAvgAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to sum
    **/
    _sum?: NewBuildingApartmentSumAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the minimum value
    **/
    _min?: NewBuildingApartmentMinAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the maximum value
    **/
    _max?: NewBuildingApartmentMaxAggregateInputType
  }

  export type GetNewBuildingApartmentAggregateType<T extends NewBuildingApartmentAggregateArgs> = {
        [P in keyof T & keyof AggregateNewBuildingApartment]: P extends '_count' | 'count'
      ? T[P] extends true
        ? number
        : GetScalarType<T[P], AggregateNewBuildingApartment[P]>
      : GetScalarType<T[P], AggregateNewBuildingApartment[P]>
  }




  export type NewBuildingApartmentGroupByArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    where?: NewBuildingApartmentWhereInput
    orderBy?: NewBuildingApartmentOrderByWithAggregationInput | NewBuildingApartmentOrderByWithAggregationInput[]
    by: NewBuildingApartmentScalarFieldEnum[] | NewBuildingApartmentScalarFieldEnum
    having?: NewBuildingApartmentScalarWhereWithAggregatesInput
    take?: number
    skip?: number
    _count?: NewBuildingApartmentCountAggregateInputType | true
    _avg?: NewBuildingApartmentAvgAggregateInputType
    _sum?: NewBuildingApartmentSumAggregateInputType
    _min?: NewBuildingApartmentMinAggregateInputType
    _max?: NewBuildingApartmentMaxAggregateInputType
  }

  export type NewBuildingApartmentGroupByOutputType = {
    id: number
    complexId: number
    title: string
    bedrooms: number
    area: number
    price: number
    pricePerM2: number
    floor: number
    totalFloors: number
    city: string | null
    apartmentNumber: number
    lat: number | null
    lng: number | null
    type: string
    createdAt: Date
    updatedAt: Date
    _count: NewBuildingApartmentCountAggregateOutputType | null
    _avg: NewBuildingApartmentAvgAggregateOutputType | null
    _sum: NewBuildingApartmentSumAggregateOutputType | null
    _min: NewBuildingApartmentMinAggregateOutputType | null
    _max: NewBuildingApartmentMaxAggregateOutputType | null
  }

  type GetNewBuildingApartmentGroupByPayload<T extends NewBuildingApartmentGroupByArgs> = Prisma.PrismaPromise<
    Array<
      PickEnumerable<NewBuildingApartmentGroupByOutputType, T['by']> &
        {
          [P in ((keyof T) & (keyof NewBuildingApartmentGroupByOutputType))]: P extends '_count'
            ? T[P] extends boolean
              ? number
              : GetScalarType<T[P], NewBuildingApartmentGroupByOutputType[P]>
            : GetScalarType<T[P], NewBuildingApartmentGroupByOutputType[P]>
        }
      >
    >


  export type NewBuildingApartmentSelect<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    complexId?: boolean
    title?: boolean
    bedrooms?: boolean
    area?: boolean
    price?: boolean
    pricePerM2?: boolean
    floor?: boolean
    totalFloors?: boolean
    city?: boolean
    apartmentNumber?: boolean
    lat?: boolean
    lng?: boolean
    type?: boolean
    createdAt?: boolean
    updatedAt?: boolean
    complex?: boolean | NewBuildingComplexDefaultArgs<ExtArgs>
    images?: boolean | NewBuildingApartment$imagesArgs<ExtArgs>
    _count?: boolean | NewBuildingApartmentCountOutputTypeDefaultArgs<ExtArgs>
  }, ExtArgs["result"]["newBuildingApartment"]>

  export type NewBuildingApartmentSelectCreateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    complexId?: boolean
    title?: boolean
    bedrooms?: boolean
    area?: boolean
    price?: boolean
    pricePerM2?: boolean
    floor?: boolean
    totalFloors?: boolean
    city?: boolean
    apartmentNumber?: boolean
    lat?: boolean
    lng?: boolean
    type?: boolean
    createdAt?: boolean
    updatedAt?: boolean
    complex?: boolean | NewBuildingComplexDefaultArgs<ExtArgs>
  }, ExtArgs["result"]["newBuildingApartment"]>

  export type NewBuildingApartmentSelectUpdateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    complexId?: boolean
    title?: boolean
    bedrooms?: boolean
    area?: boolean
    price?: boolean
    pricePerM2?: boolean
    floor?: boolean
    totalFloors?: boolean
    city?: boolean
    apartmentNumber?: boolean
    lat?: boolean
    lng?: boolean
    type?: boolean
    createdAt?: boolean
    updatedAt?: boolean
    complex?: boolean | NewBuildingComplexDefaultArgs<ExtArgs>
  }, ExtArgs["result"]["newBuildingApartment"]>

  export type NewBuildingApartmentSelectScalar = {
    id?: boolean
    complexId?: boolean
    title?: boolean
    bedrooms?: boolean
    area?: boolean
    price?: boolean
    pricePerM2?: boolean
    floor?: boolean
    totalFloors?: boolean
    city?: boolean
    apartmentNumber?: boolean
    lat?: boolean
    lng?: boolean
    type?: boolean
    createdAt?: boolean
    updatedAt?: boolean
  }

  export type NewBuildingApartmentOmit<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetOmit<"id" | "complexId" | "title" | "bedrooms" | "area" | "price" | "pricePerM2" | "floor" | "totalFloors" | "city" | "apartmentNumber" | "lat" | "lng" | "type" | "createdAt" | "updatedAt", ExtArgs["result"]["newBuildingApartment"]>
  export type NewBuildingApartmentInclude<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    complex?: boolean | NewBuildingComplexDefaultArgs<ExtArgs>
    images?: boolean | NewBuildingApartment$imagesArgs<ExtArgs>
    _count?: boolean | NewBuildingApartmentCountOutputTypeDefaultArgs<ExtArgs>
  }
  export type NewBuildingApartmentIncludeCreateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    complex?: boolean | NewBuildingComplexDefaultArgs<ExtArgs>
  }
  export type NewBuildingApartmentIncludeUpdateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    complex?: boolean | NewBuildingComplexDefaultArgs<ExtArgs>
  }

  export type $NewBuildingApartmentPayload<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    name: "NewBuildingApartment"
    objects: {
      complex: Prisma.$NewBuildingComplexPayload<ExtArgs>
      images: Prisma.$ImagePayload<ExtArgs>[]
    }
    scalars: $Extensions.GetPayloadResult<{
      id: number
      complexId: number
      title: string
      bedrooms: number
      area: number
      price: number
      pricePerM2: number
      floor: number
      totalFloors: number
      city: string | null
      apartmentNumber: number
      lat: number | null
      lng: number | null
      type: string
      createdAt: Date
      updatedAt: Date
    }, ExtArgs["result"]["newBuildingApartment"]>
    composites: {}
  }

  type NewBuildingApartmentGetPayload<S extends boolean | null | undefined | NewBuildingApartmentDefaultArgs> = $Result.GetResult<Prisma.$NewBuildingApartmentPayload, S>

  type NewBuildingApartmentCountArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> =
    Omit<NewBuildingApartmentFindManyArgs, 'select' | 'include' | 'distinct' | 'omit'> & {
      select?: NewBuildingApartmentCountAggregateInputType | true
    }

  export interface NewBuildingApartmentDelegate<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs, GlobalOmitOptions = {}> {
    [K: symbol]: { types: Prisma.TypeMap<ExtArgs>['model']['NewBuildingApartment'], meta: { name: 'NewBuildingApartment' } }
    /**
     * Find zero or one NewBuildingApartment that matches the filter.
     * @param {NewBuildingApartmentFindUniqueArgs} args - Arguments to find a NewBuildingApartment
     * @example
     * // Get one NewBuildingApartment
     * const newBuildingApartment = await prisma.newBuildingApartment.findUnique({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUnique<T extends NewBuildingApartmentFindUniqueArgs>(args: SelectSubset<T, NewBuildingApartmentFindUniqueArgs<ExtArgs>>): Prisma__NewBuildingApartmentClient<$Result.GetResult<Prisma.$NewBuildingApartmentPayload<ExtArgs>, T, "findUnique", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>

    /**
     * Find one NewBuildingApartment that matches the filter or throw an error with `error.code='P2025'`
     * if no matches were found.
     * @param {NewBuildingApartmentFindUniqueOrThrowArgs} args - Arguments to find a NewBuildingApartment
     * @example
     * // Get one NewBuildingApartment
     * const newBuildingApartment = await prisma.newBuildingApartment.findUniqueOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUniqueOrThrow<T extends NewBuildingApartmentFindUniqueOrThrowArgs>(args: SelectSubset<T, NewBuildingApartmentFindUniqueOrThrowArgs<ExtArgs>>): Prisma__NewBuildingApartmentClient<$Result.GetResult<Prisma.$NewBuildingApartmentPayload<ExtArgs>, T, "findUniqueOrThrow", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Find the first NewBuildingApartment that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {NewBuildingApartmentFindFirstArgs} args - Arguments to find a NewBuildingApartment
     * @example
     * // Get one NewBuildingApartment
     * const newBuildingApartment = await prisma.newBuildingApartment.findFirst({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirst<T extends NewBuildingApartmentFindFirstArgs>(args?: SelectSubset<T, NewBuildingApartmentFindFirstArgs<ExtArgs>>): Prisma__NewBuildingApartmentClient<$Result.GetResult<Prisma.$NewBuildingApartmentPayload<ExtArgs>, T, "findFirst", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>

    /**
     * Find the first NewBuildingApartment that matches the filter or
     * throw `PrismaKnownClientError` with `P2025` code if no matches were found.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {NewBuildingApartmentFindFirstOrThrowArgs} args - Arguments to find a NewBuildingApartment
     * @example
     * // Get one NewBuildingApartment
     * const newBuildingApartment = await prisma.newBuildingApartment.findFirstOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirstOrThrow<T extends NewBuildingApartmentFindFirstOrThrowArgs>(args?: SelectSubset<T, NewBuildingApartmentFindFirstOrThrowArgs<ExtArgs>>): Prisma__NewBuildingApartmentClient<$Result.GetResult<Prisma.$NewBuildingApartmentPayload<ExtArgs>, T, "findFirstOrThrow", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Find zero or more NewBuildingApartments that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {NewBuildingApartmentFindManyArgs} args - Arguments to filter and select certain fields only.
     * @example
     * // Get all NewBuildingApartments
     * const newBuildingApartments = await prisma.newBuildingApartment.findMany()
     * 
     * // Get first 10 NewBuildingApartments
     * const newBuildingApartments = await prisma.newBuildingApartment.findMany({ take: 10 })
     * 
     * // Only select the `id`
     * const newBuildingApartmentWithIdOnly = await prisma.newBuildingApartment.findMany({ select: { id: true } })
     * 
     */
    findMany<T extends NewBuildingApartmentFindManyArgs>(args?: SelectSubset<T, NewBuildingApartmentFindManyArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$NewBuildingApartmentPayload<ExtArgs>, T, "findMany", GlobalOmitOptions>>

    /**
     * Create a NewBuildingApartment.
     * @param {NewBuildingApartmentCreateArgs} args - Arguments to create a NewBuildingApartment.
     * @example
     * // Create one NewBuildingApartment
     * const NewBuildingApartment = await prisma.newBuildingApartment.create({
     *   data: {
     *     // ... data to create a NewBuildingApartment
     *   }
     * })
     * 
     */
    create<T extends NewBuildingApartmentCreateArgs>(args: SelectSubset<T, NewBuildingApartmentCreateArgs<ExtArgs>>): Prisma__NewBuildingApartmentClient<$Result.GetResult<Prisma.$NewBuildingApartmentPayload<ExtArgs>, T, "create", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Create many NewBuildingApartments.
     * @param {NewBuildingApartmentCreateManyArgs} args - Arguments to create many NewBuildingApartments.
     * @example
     * // Create many NewBuildingApartments
     * const newBuildingApartment = await prisma.newBuildingApartment.createMany({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     *     
     */
    createMany<T extends NewBuildingApartmentCreateManyArgs>(args?: SelectSubset<T, NewBuildingApartmentCreateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Create many NewBuildingApartments and returns the data saved in the database.
     * @param {NewBuildingApartmentCreateManyAndReturnArgs} args - Arguments to create many NewBuildingApartments.
     * @example
     * // Create many NewBuildingApartments
     * const newBuildingApartment = await prisma.newBuildingApartment.createManyAndReturn({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * 
     * // Create many NewBuildingApartments and only return the `id`
     * const newBuildingApartmentWithIdOnly = await prisma.newBuildingApartment.createManyAndReturn({
     *   select: { id: true },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * 
     */
    createManyAndReturn<T extends NewBuildingApartmentCreateManyAndReturnArgs>(args?: SelectSubset<T, NewBuildingApartmentCreateManyAndReturnArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$NewBuildingApartmentPayload<ExtArgs>, T, "createManyAndReturn", GlobalOmitOptions>>

    /**
     * Delete a NewBuildingApartment.
     * @param {NewBuildingApartmentDeleteArgs} args - Arguments to delete one NewBuildingApartment.
     * @example
     * // Delete one NewBuildingApartment
     * const NewBuildingApartment = await prisma.newBuildingApartment.delete({
     *   where: {
     *     // ... filter to delete one NewBuildingApartment
     *   }
     * })
     * 
     */
    delete<T extends NewBuildingApartmentDeleteArgs>(args: SelectSubset<T, NewBuildingApartmentDeleteArgs<ExtArgs>>): Prisma__NewBuildingApartmentClient<$Result.GetResult<Prisma.$NewBuildingApartmentPayload<ExtArgs>, T, "delete", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Update one NewBuildingApartment.
     * @param {NewBuildingApartmentUpdateArgs} args - Arguments to update one NewBuildingApartment.
     * @example
     * // Update one NewBuildingApartment
     * const newBuildingApartment = await prisma.newBuildingApartment.update({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    update<T extends NewBuildingApartmentUpdateArgs>(args: SelectSubset<T, NewBuildingApartmentUpdateArgs<ExtArgs>>): Prisma__NewBuildingApartmentClient<$Result.GetResult<Prisma.$NewBuildingApartmentPayload<ExtArgs>, T, "update", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Delete zero or more NewBuildingApartments.
     * @param {NewBuildingApartmentDeleteManyArgs} args - Arguments to filter NewBuildingApartments to delete.
     * @example
     * // Delete a few NewBuildingApartments
     * const { count } = await prisma.newBuildingApartment.deleteMany({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     * 
     */
    deleteMany<T extends NewBuildingApartmentDeleteManyArgs>(args?: SelectSubset<T, NewBuildingApartmentDeleteManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Update zero or more NewBuildingApartments.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {NewBuildingApartmentUpdateManyArgs} args - Arguments to update one or more rows.
     * @example
     * // Update many NewBuildingApartments
     * const newBuildingApartment = await prisma.newBuildingApartment.updateMany({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    updateMany<T extends NewBuildingApartmentUpdateManyArgs>(args: SelectSubset<T, NewBuildingApartmentUpdateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Update zero or more NewBuildingApartments and returns the data updated in the database.
     * @param {NewBuildingApartmentUpdateManyAndReturnArgs} args - Arguments to update many NewBuildingApartments.
     * @example
     * // Update many NewBuildingApartments
     * const newBuildingApartment = await prisma.newBuildingApartment.updateManyAndReturn({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * 
     * // Update zero or more NewBuildingApartments and only return the `id`
     * const newBuildingApartmentWithIdOnly = await prisma.newBuildingApartment.updateManyAndReturn({
     *   select: { id: true },
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * 
     */
    updateManyAndReturn<T extends NewBuildingApartmentUpdateManyAndReturnArgs>(args: SelectSubset<T, NewBuildingApartmentUpdateManyAndReturnArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$NewBuildingApartmentPayload<ExtArgs>, T, "updateManyAndReturn", GlobalOmitOptions>>

    /**
     * Create or update one NewBuildingApartment.
     * @param {NewBuildingApartmentUpsertArgs} args - Arguments to update or create a NewBuildingApartment.
     * @example
     * // Update or create a NewBuildingApartment
     * const newBuildingApartment = await prisma.newBuildingApartment.upsert({
     *   create: {
     *     // ... data to create a NewBuildingApartment
     *   },
     *   update: {
     *     // ... in case it already exists, update
     *   },
     *   where: {
     *     // ... the filter for the NewBuildingApartment we want to update
     *   }
     * })
     */
    upsert<T extends NewBuildingApartmentUpsertArgs>(args: SelectSubset<T, NewBuildingApartmentUpsertArgs<ExtArgs>>): Prisma__NewBuildingApartmentClient<$Result.GetResult<Prisma.$NewBuildingApartmentPayload<ExtArgs>, T, "upsert", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>


    /**
     * Count the number of NewBuildingApartments.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {NewBuildingApartmentCountArgs} args - Arguments to filter NewBuildingApartments to count.
     * @example
     * // Count the number of NewBuildingApartments
     * const count = await prisma.newBuildingApartment.count({
     *   where: {
     *     // ... the filter for the NewBuildingApartments we want to count
     *   }
     * })
    **/
    count<T extends NewBuildingApartmentCountArgs>(
      args?: Subset<T, NewBuildingApartmentCountArgs>,
    ): Prisma.PrismaPromise<
      T extends $Utils.Record<'select', any>
        ? T['select'] extends true
          ? number
          : GetScalarType<T['select'], NewBuildingApartmentCountAggregateOutputType>
        : number
    >

    /**
     * Allows you to perform aggregations operations on a NewBuildingApartment.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {NewBuildingApartmentAggregateArgs} args - Select which aggregations you would like to apply and on what fields.
     * @example
     * // Ordered by age ascending
     * // Where email contains prisma.io
     * // Limited to the 10 users
     * const aggregations = await prisma.user.aggregate({
     *   _avg: {
     *     age: true,
     *   },
     *   where: {
     *     email: {
     *       contains: "prisma.io",
     *     },
     *   },
     *   orderBy: {
     *     age: "asc",
     *   },
     *   take: 10,
     * })
    **/
    aggregate<T extends NewBuildingApartmentAggregateArgs>(args: Subset<T, NewBuildingApartmentAggregateArgs>): Prisma.PrismaPromise<GetNewBuildingApartmentAggregateType<T>>

    /**
     * Group by NewBuildingApartment.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {NewBuildingApartmentGroupByArgs} args - Group by arguments.
     * @example
     * // Group by city, order by createdAt, get count
     * const result = await prisma.user.groupBy({
     *   by: ['city', 'createdAt'],
     *   orderBy: {
     *     createdAt: true
     *   },
     *   _count: {
     *     _all: true
     *   },
     * })
     * 
    **/
    groupBy<
      T extends NewBuildingApartmentGroupByArgs,
      HasSelectOrTake extends Or<
        Extends<'skip', Keys<T>>,
        Extends<'take', Keys<T>>
      >,
      OrderByArg extends True extends HasSelectOrTake
        ? { orderBy: NewBuildingApartmentGroupByArgs['orderBy'] }
        : { orderBy?: NewBuildingApartmentGroupByArgs['orderBy'] },
      OrderFields extends ExcludeUnderscoreKeys<Keys<MaybeTupleToUnion<T['orderBy']>>>,
      ByFields extends MaybeTupleToUnion<T['by']>,
      ByValid extends Has<ByFields, OrderFields>,
      HavingFields extends GetHavingFields<T['having']>,
      HavingValid extends Has<ByFields, HavingFields>,
      ByEmpty extends T['by'] extends never[] ? True : False,
      InputErrors extends ByEmpty extends True
      ? `Error: "by" must not be empty.`
      : HavingValid extends False
      ? {
          [P in HavingFields]: P extends ByFields
            ? never
            : P extends string
            ? `Error: Field "${P}" used in "having" needs to be provided in "by".`
            : [
                Error,
                'Field ',
                P,
                ` in "having" needs to be provided in "by"`,
              ]
        }[HavingFields]
      : 'take' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "take", you also need to provide "orderBy"'
      : 'skip' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "skip", you also need to provide "orderBy"'
      : ByValid extends True
      ? {}
      : {
          [P in OrderFields]: P extends ByFields
            ? never
            : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
        }[OrderFields]
    >(args: SubsetIntersection<T, NewBuildingApartmentGroupByArgs, OrderByArg> & InputErrors): {} extends InputErrors ? GetNewBuildingApartmentGroupByPayload<T> : Prisma.PrismaPromise<InputErrors>
  /**
   * Fields of the NewBuildingApartment model
   */
  readonly fields: NewBuildingApartmentFieldRefs;
  }

  /**
   * The delegate class that acts as a "Promise-like" for NewBuildingApartment.
   * Why is this prefixed with `Prisma__`?
   * Because we want to prevent naming conflicts as mentioned in
   * https://github.com/prisma/prisma-client-js/issues/707
   */
  export interface Prisma__NewBuildingApartmentClient<T, Null = never, ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs, GlobalOmitOptions = {}> extends Prisma.PrismaPromise<T> {
    readonly [Symbol.toStringTag]: "PrismaPromise"
    complex<T extends NewBuildingComplexDefaultArgs<ExtArgs> = {}>(args?: Subset<T, NewBuildingComplexDefaultArgs<ExtArgs>>): Prisma__NewBuildingComplexClient<$Result.GetResult<Prisma.$NewBuildingComplexPayload<ExtArgs>, T, "findUniqueOrThrow", GlobalOmitOptions> | Null, Null, ExtArgs, GlobalOmitOptions>
    images<T extends NewBuildingApartment$imagesArgs<ExtArgs> = {}>(args?: Subset<T, NewBuildingApartment$imagesArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$ImagePayload<ExtArgs>, T, "findMany", GlobalOmitOptions> | Null>
    /**
     * Attaches callbacks for the resolution and/or rejection of the Promise.
     * @param onfulfilled The callback to execute when the Promise is resolved.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of which ever callback is executed.
     */
    then<TResult1 = T, TResult2 = never>(onfulfilled?: ((value: T) => TResult1 | PromiseLike<TResult1>) | undefined | null, onrejected?: ((reason: any) => TResult2 | PromiseLike<TResult2>) | undefined | null): $Utils.JsPromise<TResult1 | TResult2>
    /**
     * Attaches a callback for only the rejection of the Promise.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of the callback.
     */
    catch<TResult = never>(onrejected?: ((reason: any) => TResult | PromiseLike<TResult>) | undefined | null): $Utils.JsPromise<T | TResult>
    /**
     * Attaches a callback that is invoked when the Promise is settled (fulfilled or rejected). The
     * resolved value cannot be modified from the callback.
     * @param onfinally The callback to execute when the Promise is settled (fulfilled or rejected).
     * @returns A Promise for the completion of the callback.
     */
    finally(onfinally?: (() => void) | undefined | null): $Utils.JsPromise<T>
  }




  /**
   * Fields of the NewBuildingApartment model
   */ 
  interface NewBuildingApartmentFieldRefs {
    readonly id: FieldRef<"NewBuildingApartment", 'Int'>
    readonly complexId: FieldRef<"NewBuildingApartment", 'Int'>
    readonly title: FieldRef<"NewBuildingApartment", 'String'>
    readonly bedrooms: FieldRef<"NewBuildingApartment", 'Int'>
    readonly area: FieldRef<"NewBuildingApartment", 'Int'>
    readonly price: FieldRef<"NewBuildingApartment", 'Int'>
    readonly pricePerM2: FieldRef<"NewBuildingApartment", 'Int'>
    readonly floor: FieldRef<"NewBuildingApartment", 'Int'>
    readonly totalFloors: FieldRef<"NewBuildingApartment", 'Int'>
    readonly city: FieldRef<"NewBuildingApartment", 'String'>
    readonly apartmentNumber: FieldRef<"NewBuildingApartment", 'Int'>
    readonly lat: FieldRef<"NewBuildingApartment", 'Float'>
    readonly lng: FieldRef<"NewBuildingApartment", 'Float'>
    readonly type: FieldRef<"NewBuildingApartment", 'String'>
    readonly createdAt: FieldRef<"NewBuildingApartment", 'DateTime'>
    readonly updatedAt: FieldRef<"NewBuildingApartment", 'DateTime'>
  }
    

  // Custom InputTypes
  /**
   * NewBuildingApartment findUnique
   */
  export type NewBuildingApartmentFindUniqueArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingApartment
     */
    select?: NewBuildingApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingApartment
     */
    omit?: NewBuildingApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NewBuildingApartmentInclude<ExtArgs> | null
    /**
     * Filter, which NewBuildingApartment to fetch.
     */
    where: NewBuildingApartmentWhereUniqueInput
  }

  /**
   * NewBuildingApartment findUniqueOrThrow
   */
  export type NewBuildingApartmentFindUniqueOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingApartment
     */
    select?: NewBuildingApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingApartment
     */
    omit?: NewBuildingApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NewBuildingApartmentInclude<ExtArgs> | null
    /**
     * Filter, which NewBuildingApartment to fetch.
     */
    where: NewBuildingApartmentWhereUniqueInput
  }

  /**
   * NewBuildingApartment findFirst
   */
  export type NewBuildingApartmentFindFirstArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingApartment
     */
    select?: NewBuildingApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingApartment
     */
    omit?: NewBuildingApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NewBuildingApartmentInclude<ExtArgs> | null
    /**
     * Filter, which NewBuildingApartment to fetch.
     */
    where?: NewBuildingApartmentWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of NewBuildingApartments to fetch.
     */
    orderBy?: NewBuildingApartmentOrderByWithRelationInput | NewBuildingApartmentOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for NewBuildingApartments.
     */
    cursor?: NewBuildingApartmentWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` NewBuildingApartments from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` NewBuildingApartments.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of NewBuildingApartments.
     */
    distinct?: NewBuildingApartmentScalarFieldEnum | NewBuildingApartmentScalarFieldEnum[]
  }

  /**
   * NewBuildingApartment findFirstOrThrow
   */
  export type NewBuildingApartmentFindFirstOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingApartment
     */
    select?: NewBuildingApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingApartment
     */
    omit?: NewBuildingApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NewBuildingApartmentInclude<ExtArgs> | null
    /**
     * Filter, which NewBuildingApartment to fetch.
     */
    where?: NewBuildingApartmentWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of NewBuildingApartments to fetch.
     */
    orderBy?: NewBuildingApartmentOrderByWithRelationInput | NewBuildingApartmentOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for NewBuildingApartments.
     */
    cursor?: NewBuildingApartmentWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` NewBuildingApartments from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` NewBuildingApartments.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of NewBuildingApartments.
     */
    distinct?: NewBuildingApartmentScalarFieldEnum | NewBuildingApartmentScalarFieldEnum[]
  }

  /**
   * NewBuildingApartment findMany
   */
  export type NewBuildingApartmentFindManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingApartment
     */
    select?: NewBuildingApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingApartment
     */
    omit?: NewBuildingApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NewBuildingApartmentInclude<ExtArgs> | null
    /**
     * Filter, which NewBuildingApartments to fetch.
     */
    where?: NewBuildingApartmentWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of NewBuildingApartments to fetch.
     */
    orderBy?: NewBuildingApartmentOrderByWithRelationInput | NewBuildingApartmentOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for listing NewBuildingApartments.
     */
    cursor?: NewBuildingApartmentWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` NewBuildingApartments from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` NewBuildingApartments.
     */
    skip?: number
    distinct?: NewBuildingApartmentScalarFieldEnum | NewBuildingApartmentScalarFieldEnum[]
  }

  /**
   * NewBuildingApartment create
   */
  export type NewBuildingApartmentCreateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingApartment
     */
    select?: NewBuildingApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingApartment
     */
    omit?: NewBuildingApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NewBuildingApartmentInclude<ExtArgs> | null
    /**
     * The data needed to create a NewBuildingApartment.
     */
    data: XOR<NewBuildingApartmentCreateInput, NewBuildingApartmentUncheckedCreateInput>
  }

  /**
   * NewBuildingApartment createMany
   */
  export type NewBuildingApartmentCreateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to create many NewBuildingApartments.
     */
    data: NewBuildingApartmentCreateManyInput | NewBuildingApartmentCreateManyInput[]
    skipDuplicates?: boolean
  }

  /**
   * NewBuildingApartment createManyAndReturn
   */
  export type NewBuildingApartmentCreateManyAndReturnArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingApartment
     */
    select?: NewBuildingApartmentSelectCreateManyAndReturn<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingApartment
     */
    omit?: NewBuildingApartmentOmit<ExtArgs> | null
    /**
     * The data used to create many NewBuildingApartments.
     */
    data: NewBuildingApartmentCreateManyInput | NewBuildingApartmentCreateManyInput[]
    skipDuplicates?: boolean
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NewBuildingApartmentIncludeCreateManyAndReturn<ExtArgs> | null
  }

  /**
   * NewBuildingApartment update
   */
  export type NewBuildingApartmentUpdateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingApartment
     */
    select?: NewBuildingApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingApartment
     */
    omit?: NewBuildingApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NewBuildingApartmentInclude<ExtArgs> | null
    /**
     * The data needed to update a NewBuildingApartment.
     */
    data: XOR<NewBuildingApartmentUpdateInput, NewBuildingApartmentUncheckedUpdateInput>
    /**
     * Choose, which NewBuildingApartment to update.
     */
    where: NewBuildingApartmentWhereUniqueInput
  }

  /**
   * NewBuildingApartment updateMany
   */
  export type NewBuildingApartmentUpdateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to update NewBuildingApartments.
     */
    data: XOR<NewBuildingApartmentUpdateManyMutationInput, NewBuildingApartmentUncheckedUpdateManyInput>
    /**
     * Filter which NewBuildingApartments to update
     */
    where?: NewBuildingApartmentWhereInput
    /**
     * Limit how many NewBuildingApartments to update.
     */
    limit?: number
  }

  /**
   * NewBuildingApartment updateManyAndReturn
   */
  export type NewBuildingApartmentUpdateManyAndReturnArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingApartment
     */
    select?: NewBuildingApartmentSelectUpdateManyAndReturn<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingApartment
     */
    omit?: NewBuildingApartmentOmit<ExtArgs> | null
    /**
     * The data used to update NewBuildingApartments.
     */
    data: XOR<NewBuildingApartmentUpdateManyMutationInput, NewBuildingApartmentUncheckedUpdateManyInput>
    /**
     * Filter which NewBuildingApartments to update
     */
    where?: NewBuildingApartmentWhereInput
    /**
     * Limit how many NewBuildingApartments to update.
     */
    limit?: number
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NewBuildingApartmentIncludeUpdateManyAndReturn<ExtArgs> | null
  }

  /**
   * NewBuildingApartment upsert
   */
  export type NewBuildingApartmentUpsertArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingApartment
     */
    select?: NewBuildingApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingApartment
     */
    omit?: NewBuildingApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NewBuildingApartmentInclude<ExtArgs> | null
    /**
     * The filter to search for the NewBuildingApartment to update in case it exists.
     */
    where: NewBuildingApartmentWhereUniqueInput
    /**
     * In case the NewBuildingApartment found by the `where` argument doesn't exist, create a new NewBuildingApartment with this data.
     */
    create: XOR<NewBuildingApartmentCreateInput, NewBuildingApartmentUncheckedCreateInput>
    /**
     * In case the NewBuildingApartment was found with the provided `where` argument, update it with this data.
     */
    update: XOR<NewBuildingApartmentUpdateInput, NewBuildingApartmentUncheckedUpdateInput>
  }

  /**
   * NewBuildingApartment delete
   */
  export type NewBuildingApartmentDeleteArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingApartment
     */
    select?: NewBuildingApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingApartment
     */
    omit?: NewBuildingApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NewBuildingApartmentInclude<ExtArgs> | null
    /**
     * Filter which NewBuildingApartment to delete.
     */
    where: NewBuildingApartmentWhereUniqueInput
  }

  /**
   * NewBuildingApartment deleteMany
   */
  export type NewBuildingApartmentDeleteManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which NewBuildingApartments to delete
     */
    where?: NewBuildingApartmentWhereInput
    /**
     * Limit how many NewBuildingApartments to delete.
     */
    limit?: number
  }

  /**
   * NewBuildingApartment.images
   */
  export type NewBuildingApartment$imagesArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Image
     */
    select?: ImageSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Image
     */
    omit?: ImageOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ImageInclude<ExtArgs> | null
    where?: ImageWhereInput
    orderBy?: ImageOrderByWithRelationInput | ImageOrderByWithRelationInput[]
    cursor?: ImageWhereUniqueInput
    take?: number
    skip?: number
    distinct?: ImageScalarFieldEnum | ImageScalarFieldEnum[]
  }

  /**
   * NewBuildingApartment without action
   */
  export type NewBuildingApartmentDefaultArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NewBuildingApartment
     */
    select?: NewBuildingApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NewBuildingApartment
     */
    omit?: NewBuildingApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NewBuildingApartmentInclude<ExtArgs> | null
  }


  /**
   * Model NearbyPlace
   */

  export type AggregateNearbyPlace = {
    _count: NearbyPlaceCountAggregateOutputType | null
    _avg: NearbyPlaceAvgAggregateOutputType | null
    _sum: NearbyPlaceSumAggregateOutputType | null
    _min: NearbyPlaceMinAggregateOutputType | null
    _max: NearbyPlaceMaxAggregateOutputType | null
  }

  export type NearbyPlaceAvgAggregateOutputType = {
    id: number | null
    complexId: number | null
    distance: number | null
  }

  export type NearbyPlaceSumAggregateOutputType = {
    id: number | null
    complexId: number | null
    distance: number | null
  }

  export type NearbyPlaceMinAggregateOutputType = {
    id: number | null
    complexId: number | null
    name: string | null
    category: string | null
    distance: number | null
    icon: string | null
    createdAt: Date | null
  }

  export type NearbyPlaceMaxAggregateOutputType = {
    id: number | null
    complexId: number | null
    name: string | null
    category: string | null
    distance: number | null
    icon: string | null
    createdAt: Date | null
  }

  export type NearbyPlaceCountAggregateOutputType = {
    id: number
    complexId: number
    name: number
    category: number
    distance: number
    icon: number
    createdAt: number
    _all: number
  }


  export type NearbyPlaceAvgAggregateInputType = {
    id?: true
    complexId?: true
    distance?: true
  }

  export type NearbyPlaceSumAggregateInputType = {
    id?: true
    complexId?: true
    distance?: true
  }

  export type NearbyPlaceMinAggregateInputType = {
    id?: true
    complexId?: true
    name?: true
    category?: true
    distance?: true
    icon?: true
    createdAt?: true
  }

  export type NearbyPlaceMaxAggregateInputType = {
    id?: true
    complexId?: true
    name?: true
    category?: true
    distance?: true
    icon?: true
    createdAt?: true
  }

  export type NearbyPlaceCountAggregateInputType = {
    id?: true
    complexId?: true
    name?: true
    category?: true
    distance?: true
    icon?: true
    createdAt?: true
    _all?: true
  }

  export type NearbyPlaceAggregateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which NearbyPlace to aggregate.
     */
    where?: NearbyPlaceWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of NearbyPlaces to fetch.
     */
    orderBy?: NearbyPlaceOrderByWithRelationInput | NearbyPlaceOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the start position
     */
    cursor?: NearbyPlaceWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` NearbyPlaces from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` NearbyPlaces.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Count returned NearbyPlaces
    **/
    _count?: true | NearbyPlaceCountAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to average
    **/
    _avg?: NearbyPlaceAvgAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to sum
    **/
    _sum?: NearbyPlaceSumAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the minimum value
    **/
    _min?: NearbyPlaceMinAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the maximum value
    **/
    _max?: NearbyPlaceMaxAggregateInputType
  }

  export type GetNearbyPlaceAggregateType<T extends NearbyPlaceAggregateArgs> = {
        [P in keyof T & keyof AggregateNearbyPlace]: P extends '_count' | 'count'
      ? T[P] extends true
        ? number
        : GetScalarType<T[P], AggregateNearbyPlace[P]>
      : GetScalarType<T[P], AggregateNearbyPlace[P]>
  }




  export type NearbyPlaceGroupByArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    where?: NearbyPlaceWhereInput
    orderBy?: NearbyPlaceOrderByWithAggregationInput | NearbyPlaceOrderByWithAggregationInput[]
    by: NearbyPlaceScalarFieldEnum[] | NearbyPlaceScalarFieldEnum
    having?: NearbyPlaceScalarWhereWithAggregatesInput
    take?: number
    skip?: number
    _count?: NearbyPlaceCountAggregateInputType | true
    _avg?: NearbyPlaceAvgAggregateInputType
    _sum?: NearbyPlaceSumAggregateInputType
    _min?: NearbyPlaceMinAggregateInputType
    _max?: NearbyPlaceMaxAggregateInputType
  }

  export type NearbyPlaceGroupByOutputType = {
    id: number
    complexId: number
    name: string
    category: string
    distance: number | null
    icon: string | null
    createdAt: Date
    _count: NearbyPlaceCountAggregateOutputType | null
    _avg: NearbyPlaceAvgAggregateOutputType | null
    _sum: NearbyPlaceSumAggregateOutputType | null
    _min: NearbyPlaceMinAggregateOutputType | null
    _max: NearbyPlaceMaxAggregateOutputType | null
  }

  type GetNearbyPlaceGroupByPayload<T extends NearbyPlaceGroupByArgs> = Prisma.PrismaPromise<
    Array<
      PickEnumerable<NearbyPlaceGroupByOutputType, T['by']> &
        {
          [P in ((keyof T) & (keyof NearbyPlaceGroupByOutputType))]: P extends '_count'
            ? T[P] extends boolean
              ? number
              : GetScalarType<T[P], NearbyPlaceGroupByOutputType[P]>
            : GetScalarType<T[P], NearbyPlaceGroupByOutputType[P]>
        }
      >
    >


  export type NearbyPlaceSelect<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    complexId?: boolean
    name?: boolean
    category?: boolean
    distance?: boolean
    icon?: boolean
    createdAt?: boolean
    complex?: boolean | NewBuildingComplexDefaultArgs<ExtArgs>
  }, ExtArgs["result"]["nearbyPlace"]>

  export type NearbyPlaceSelectCreateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    complexId?: boolean
    name?: boolean
    category?: boolean
    distance?: boolean
    icon?: boolean
    createdAt?: boolean
    complex?: boolean | NewBuildingComplexDefaultArgs<ExtArgs>
  }, ExtArgs["result"]["nearbyPlace"]>

  export type NearbyPlaceSelectUpdateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    complexId?: boolean
    name?: boolean
    category?: boolean
    distance?: boolean
    icon?: boolean
    createdAt?: boolean
    complex?: boolean | NewBuildingComplexDefaultArgs<ExtArgs>
  }, ExtArgs["result"]["nearbyPlace"]>

  export type NearbyPlaceSelectScalar = {
    id?: boolean
    complexId?: boolean
    name?: boolean
    category?: boolean
    distance?: boolean
    icon?: boolean
    createdAt?: boolean
  }

  export type NearbyPlaceOmit<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetOmit<"id" | "complexId" | "name" | "category" | "distance" | "icon" | "createdAt", ExtArgs["result"]["nearbyPlace"]>
  export type NearbyPlaceInclude<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    complex?: boolean | NewBuildingComplexDefaultArgs<ExtArgs>
  }
  export type NearbyPlaceIncludeCreateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    complex?: boolean | NewBuildingComplexDefaultArgs<ExtArgs>
  }
  export type NearbyPlaceIncludeUpdateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    complex?: boolean | NewBuildingComplexDefaultArgs<ExtArgs>
  }

  export type $NearbyPlacePayload<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    name: "NearbyPlace"
    objects: {
      complex: Prisma.$NewBuildingComplexPayload<ExtArgs>
    }
    scalars: $Extensions.GetPayloadResult<{
      id: number
      complexId: number
      name: string
      category: string
      distance: number | null
      icon: string | null
      createdAt: Date
    }, ExtArgs["result"]["nearbyPlace"]>
    composites: {}
  }

  type NearbyPlaceGetPayload<S extends boolean | null | undefined | NearbyPlaceDefaultArgs> = $Result.GetResult<Prisma.$NearbyPlacePayload, S>

  type NearbyPlaceCountArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> =
    Omit<NearbyPlaceFindManyArgs, 'select' | 'include' | 'distinct' | 'omit'> & {
      select?: NearbyPlaceCountAggregateInputType | true
    }

  export interface NearbyPlaceDelegate<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs, GlobalOmitOptions = {}> {
    [K: symbol]: { types: Prisma.TypeMap<ExtArgs>['model']['NearbyPlace'], meta: { name: 'NearbyPlace' } }
    /**
     * Find zero or one NearbyPlace that matches the filter.
     * @param {NearbyPlaceFindUniqueArgs} args - Arguments to find a NearbyPlace
     * @example
     * // Get one NearbyPlace
     * const nearbyPlace = await prisma.nearbyPlace.findUnique({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUnique<T extends NearbyPlaceFindUniqueArgs>(args: SelectSubset<T, NearbyPlaceFindUniqueArgs<ExtArgs>>): Prisma__NearbyPlaceClient<$Result.GetResult<Prisma.$NearbyPlacePayload<ExtArgs>, T, "findUnique", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>

    /**
     * Find one NearbyPlace that matches the filter or throw an error with `error.code='P2025'`
     * if no matches were found.
     * @param {NearbyPlaceFindUniqueOrThrowArgs} args - Arguments to find a NearbyPlace
     * @example
     * // Get one NearbyPlace
     * const nearbyPlace = await prisma.nearbyPlace.findUniqueOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUniqueOrThrow<T extends NearbyPlaceFindUniqueOrThrowArgs>(args: SelectSubset<T, NearbyPlaceFindUniqueOrThrowArgs<ExtArgs>>): Prisma__NearbyPlaceClient<$Result.GetResult<Prisma.$NearbyPlacePayload<ExtArgs>, T, "findUniqueOrThrow", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Find the first NearbyPlace that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {NearbyPlaceFindFirstArgs} args - Arguments to find a NearbyPlace
     * @example
     * // Get one NearbyPlace
     * const nearbyPlace = await prisma.nearbyPlace.findFirst({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirst<T extends NearbyPlaceFindFirstArgs>(args?: SelectSubset<T, NearbyPlaceFindFirstArgs<ExtArgs>>): Prisma__NearbyPlaceClient<$Result.GetResult<Prisma.$NearbyPlacePayload<ExtArgs>, T, "findFirst", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>

    /**
     * Find the first NearbyPlace that matches the filter or
     * throw `PrismaKnownClientError` with `P2025` code if no matches were found.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {NearbyPlaceFindFirstOrThrowArgs} args - Arguments to find a NearbyPlace
     * @example
     * // Get one NearbyPlace
     * const nearbyPlace = await prisma.nearbyPlace.findFirstOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirstOrThrow<T extends NearbyPlaceFindFirstOrThrowArgs>(args?: SelectSubset<T, NearbyPlaceFindFirstOrThrowArgs<ExtArgs>>): Prisma__NearbyPlaceClient<$Result.GetResult<Prisma.$NearbyPlacePayload<ExtArgs>, T, "findFirstOrThrow", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Find zero or more NearbyPlaces that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {NearbyPlaceFindManyArgs} args - Arguments to filter and select certain fields only.
     * @example
     * // Get all NearbyPlaces
     * const nearbyPlaces = await prisma.nearbyPlace.findMany()
     * 
     * // Get first 10 NearbyPlaces
     * const nearbyPlaces = await prisma.nearbyPlace.findMany({ take: 10 })
     * 
     * // Only select the `id`
     * const nearbyPlaceWithIdOnly = await prisma.nearbyPlace.findMany({ select: { id: true } })
     * 
     */
    findMany<T extends NearbyPlaceFindManyArgs>(args?: SelectSubset<T, NearbyPlaceFindManyArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$NearbyPlacePayload<ExtArgs>, T, "findMany", GlobalOmitOptions>>

    /**
     * Create a NearbyPlace.
     * @param {NearbyPlaceCreateArgs} args - Arguments to create a NearbyPlace.
     * @example
     * // Create one NearbyPlace
     * const NearbyPlace = await prisma.nearbyPlace.create({
     *   data: {
     *     // ... data to create a NearbyPlace
     *   }
     * })
     * 
     */
    create<T extends NearbyPlaceCreateArgs>(args: SelectSubset<T, NearbyPlaceCreateArgs<ExtArgs>>): Prisma__NearbyPlaceClient<$Result.GetResult<Prisma.$NearbyPlacePayload<ExtArgs>, T, "create", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Create many NearbyPlaces.
     * @param {NearbyPlaceCreateManyArgs} args - Arguments to create many NearbyPlaces.
     * @example
     * // Create many NearbyPlaces
     * const nearbyPlace = await prisma.nearbyPlace.createMany({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     *     
     */
    createMany<T extends NearbyPlaceCreateManyArgs>(args?: SelectSubset<T, NearbyPlaceCreateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Create many NearbyPlaces and returns the data saved in the database.
     * @param {NearbyPlaceCreateManyAndReturnArgs} args - Arguments to create many NearbyPlaces.
     * @example
     * // Create many NearbyPlaces
     * const nearbyPlace = await prisma.nearbyPlace.createManyAndReturn({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * 
     * // Create many NearbyPlaces and only return the `id`
     * const nearbyPlaceWithIdOnly = await prisma.nearbyPlace.createManyAndReturn({
     *   select: { id: true },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * 
     */
    createManyAndReturn<T extends NearbyPlaceCreateManyAndReturnArgs>(args?: SelectSubset<T, NearbyPlaceCreateManyAndReturnArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$NearbyPlacePayload<ExtArgs>, T, "createManyAndReturn", GlobalOmitOptions>>

    /**
     * Delete a NearbyPlace.
     * @param {NearbyPlaceDeleteArgs} args - Arguments to delete one NearbyPlace.
     * @example
     * // Delete one NearbyPlace
     * const NearbyPlace = await prisma.nearbyPlace.delete({
     *   where: {
     *     // ... filter to delete one NearbyPlace
     *   }
     * })
     * 
     */
    delete<T extends NearbyPlaceDeleteArgs>(args: SelectSubset<T, NearbyPlaceDeleteArgs<ExtArgs>>): Prisma__NearbyPlaceClient<$Result.GetResult<Prisma.$NearbyPlacePayload<ExtArgs>, T, "delete", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Update one NearbyPlace.
     * @param {NearbyPlaceUpdateArgs} args - Arguments to update one NearbyPlace.
     * @example
     * // Update one NearbyPlace
     * const nearbyPlace = await prisma.nearbyPlace.update({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    update<T extends NearbyPlaceUpdateArgs>(args: SelectSubset<T, NearbyPlaceUpdateArgs<ExtArgs>>): Prisma__NearbyPlaceClient<$Result.GetResult<Prisma.$NearbyPlacePayload<ExtArgs>, T, "update", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Delete zero or more NearbyPlaces.
     * @param {NearbyPlaceDeleteManyArgs} args - Arguments to filter NearbyPlaces to delete.
     * @example
     * // Delete a few NearbyPlaces
     * const { count } = await prisma.nearbyPlace.deleteMany({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     * 
     */
    deleteMany<T extends NearbyPlaceDeleteManyArgs>(args?: SelectSubset<T, NearbyPlaceDeleteManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Update zero or more NearbyPlaces.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {NearbyPlaceUpdateManyArgs} args - Arguments to update one or more rows.
     * @example
     * // Update many NearbyPlaces
     * const nearbyPlace = await prisma.nearbyPlace.updateMany({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    updateMany<T extends NearbyPlaceUpdateManyArgs>(args: SelectSubset<T, NearbyPlaceUpdateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Update zero or more NearbyPlaces and returns the data updated in the database.
     * @param {NearbyPlaceUpdateManyAndReturnArgs} args - Arguments to update many NearbyPlaces.
     * @example
     * // Update many NearbyPlaces
     * const nearbyPlace = await prisma.nearbyPlace.updateManyAndReturn({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * 
     * // Update zero or more NearbyPlaces and only return the `id`
     * const nearbyPlaceWithIdOnly = await prisma.nearbyPlace.updateManyAndReturn({
     *   select: { id: true },
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * 
     */
    updateManyAndReturn<T extends NearbyPlaceUpdateManyAndReturnArgs>(args: SelectSubset<T, NearbyPlaceUpdateManyAndReturnArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$NearbyPlacePayload<ExtArgs>, T, "updateManyAndReturn", GlobalOmitOptions>>

    /**
     * Create or update one NearbyPlace.
     * @param {NearbyPlaceUpsertArgs} args - Arguments to update or create a NearbyPlace.
     * @example
     * // Update or create a NearbyPlace
     * const nearbyPlace = await prisma.nearbyPlace.upsert({
     *   create: {
     *     // ... data to create a NearbyPlace
     *   },
     *   update: {
     *     // ... in case it already exists, update
     *   },
     *   where: {
     *     // ... the filter for the NearbyPlace we want to update
     *   }
     * })
     */
    upsert<T extends NearbyPlaceUpsertArgs>(args: SelectSubset<T, NearbyPlaceUpsertArgs<ExtArgs>>): Prisma__NearbyPlaceClient<$Result.GetResult<Prisma.$NearbyPlacePayload<ExtArgs>, T, "upsert", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>


    /**
     * Count the number of NearbyPlaces.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {NearbyPlaceCountArgs} args - Arguments to filter NearbyPlaces to count.
     * @example
     * // Count the number of NearbyPlaces
     * const count = await prisma.nearbyPlace.count({
     *   where: {
     *     // ... the filter for the NearbyPlaces we want to count
     *   }
     * })
    **/
    count<T extends NearbyPlaceCountArgs>(
      args?: Subset<T, NearbyPlaceCountArgs>,
    ): Prisma.PrismaPromise<
      T extends $Utils.Record<'select', any>
        ? T['select'] extends true
          ? number
          : GetScalarType<T['select'], NearbyPlaceCountAggregateOutputType>
        : number
    >

    /**
     * Allows you to perform aggregations operations on a NearbyPlace.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {NearbyPlaceAggregateArgs} args - Select which aggregations you would like to apply and on what fields.
     * @example
     * // Ordered by age ascending
     * // Where email contains prisma.io
     * // Limited to the 10 users
     * const aggregations = await prisma.user.aggregate({
     *   _avg: {
     *     age: true,
     *   },
     *   where: {
     *     email: {
     *       contains: "prisma.io",
     *     },
     *   },
     *   orderBy: {
     *     age: "asc",
     *   },
     *   take: 10,
     * })
    **/
    aggregate<T extends NearbyPlaceAggregateArgs>(args: Subset<T, NearbyPlaceAggregateArgs>): Prisma.PrismaPromise<GetNearbyPlaceAggregateType<T>>

    /**
     * Group by NearbyPlace.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {NearbyPlaceGroupByArgs} args - Group by arguments.
     * @example
     * // Group by city, order by createdAt, get count
     * const result = await prisma.user.groupBy({
     *   by: ['city', 'createdAt'],
     *   orderBy: {
     *     createdAt: true
     *   },
     *   _count: {
     *     _all: true
     *   },
     * })
     * 
    **/
    groupBy<
      T extends NearbyPlaceGroupByArgs,
      HasSelectOrTake extends Or<
        Extends<'skip', Keys<T>>,
        Extends<'take', Keys<T>>
      >,
      OrderByArg extends True extends HasSelectOrTake
        ? { orderBy: NearbyPlaceGroupByArgs['orderBy'] }
        : { orderBy?: NearbyPlaceGroupByArgs['orderBy'] },
      OrderFields extends ExcludeUnderscoreKeys<Keys<MaybeTupleToUnion<T['orderBy']>>>,
      ByFields extends MaybeTupleToUnion<T['by']>,
      ByValid extends Has<ByFields, OrderFields>,
      HavingFields extends GetHavingFields<T['having']>,
      HavingValid extends Has<ByFields, HavingFields>,
      ByEmpty extends T['by'] extends never[] ? True : False,
      InputErrors extends ByEmpty extends True
      ? `Error: "by" must not be empty.`
      : HavingValid extends False
      ? {
          [P in HavingFields]: P extends ByFields
            ? never
            : P extends string
            ? `Error: Field "${P}" used in "having" needs to be provided in "by".`
            : [
                Error,
                'Field ',
                P,
                ` in "having" needs to be provided in "by"`,
              ]
        }[HavingFields]
      : 'take' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "take", you also need to provide "orderBy"'
      : 'skip' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "skip", you also need to provide "orderBy"'
      : ByValid extends True
      ? {}
      : {
          [P in OrderFields]: P extends ByFields
            ? never
            : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
        }[OrderFields]
    >(args: SubsetIntersection<T, NearbyPlaceGroupByArgs, OrderByArg> & InputErrors): {} extends InputErrors ? GetNearbyPlaceGroupByPayload<T> : Prisma.PrismaPromise<InputErrors>
  /**
   * Fields of the NearbyPlace model
   */
  readonly fields: NearbyPlaceFieldRefs;
  }

  /**
   * The delegate class that acts as a "Promise-like" for NearbyPlace.
   * Why is this prefixed with `Prisma__`?
   * Because we want to prevent naming conflicts as mentioned in
   * https://github.com/prisma/prisma-client-js/issues/707
   */
  export interface Prisma__NearbyPlaceClient<T, Null = never, ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs, GlobalOmitOptions = {}> extends Prisma.PrismaPromise<T> {
    readonly [Symbol.toStringTag]: "PrismaPromise"
    complex<T extends NewBuildingComplexDefaultArgs<ExtArgs> = {}>(args?: Subset<T, NewBuildingComplexDefaultArgs<ExtArgs>>): Prisma__NewBuildingComplexClient<$Result.GetResult<Prisma.$NewBuildingComplexPayload<ExtArgs>, T, "findUniqueOrThrow", GlobalOmitOptions> | Null, Null, ExtArgs, GlobalOmitOptions>
    /**
     * Attaches callbacks for the resolution and/or rejection of the Promise.
     * @param onfulfilled The callback to execute when the Promise is resolved.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of which ever callback is executed.
     */
    then<TResult1 = T, TResult2 = never>(onfulfilled?: ((value: T) => TResult1 | PromiseLike<TResult1>) | undefined | null, onrejected?: ((reason: any) => TResult2 | PromiseLike<TResult2>) | undefined | null): $Utils.JsPromise<TResult1 | TResult2>
    /**
     * Attaches a callback for only the rejection of the Promise.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of the callback.
     */
    catch<TResult = never>(onrejected?: ((reason: any) => TResult | PromiseLike<TResult>) | undefined | null): $Utils.JsPromise<T | TResult>
    /**
     * Attaches a callback that is invoked when the Promise is settled (fulfilled or rejected). The
     * resolved value cannot be modified from the callback.
     * @param onfinally The callback to execute when the Promise is settled (fulfilled or rejected).
     * @returns A Promise for the completion of the callback.
     */
    finally(onfinally?: (() => void) | undefined | null): $Utils.JsPromise<T>
  }




  /**
   * Fields of the NearbyPlace model
   */ 
  interface NearbyPlaceFieldRefs {
    readonly id: FieldRef<"NearbyPlace", 'Int'>
    readonly complexId: FieldRef<"NearbyPlace", 'Int'>
    readonly name: FieldRef<"NearbyPlace", 'String'>
    readonly category: FieldRef<"NearbyPlace", 'String'>
    readonly distance: FieldRef<"NearbyPlace", 'Int'>
    readonly icon: FieldRef<"NearbyPlace", 'String'>
    readonly createdAt: FieldRef<"NearbyPlace", 'DateTime'>
  }
    

  // Custom InputTypes
  /**
   * NearbyPlace findUnique
   */
  export type NearbyPlaceFindUniqueArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NearbyPlace
     */
    select?: NearbyPlaceSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NearbyPlace
     */
    omit?: NearbyPlaceOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NearbyPlaceInclude<ExtArgs> | null
    /**
     * Filter, which NearbyPlace to fetch.
     */
    where: NearbyPlaceWhereUniqueInput
  }

  /**
   * NearbyPlace findUniqueOrThrow
   */
  export type NearbyPlaceFindUniqueOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NearbyPlace
     */
    select?: NearbyPlaceSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NearbyPlace
     */
    omit?: NearbyPlaceOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NearbyPlaceInclude<ExtArgs> | null
    /**
     * Filter, which NearbyPlace to fetch.
     */
    where: NearbyPlaceWhereUniqueInput
  }

  /**
   * NearbyPlace findFirst
   */
  export type NearbyPlaceFindFirstArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NearbyPlace
     */
    select?: NearbyPlaceSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NearbyPlace
     */
    omit?: NearbyPlaceOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NearbyPlaceInclude<ExtArgs> | null
    /**
     * Filter, which NearbyPlace to fetch.
     */
    where?: NearbyPlaceWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of NearbyPlaces to fetch.
     */
    orderBy?: NearbyPlaceOrderByWithRelationInput | NearbyPlaceOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for NearbyPlaces.
     */
    cursor?: NearbyPlaceWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` NearbyPlaces from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` NearbyPlaces.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of NearbyPlaces.
     */
    distinct?: NearbyPlaceScalarFieldEnum | NearbyPlaceScalarFieldEnum[]
  }

  /**
   * NearbyPlace findFirstOrThrow
   */
  export type NearbyPlaceFindFirstOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NearbyPlace
     */
    select?: NearbyPlaceSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NearbyPlace
     */
    omit?: NearbyPlaceOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NearbyPlaceInclude<ExtArgs> | null
    /**
     * Filter, which NearbyPlace to fetch.
     */
    where?: NearbyPlaceWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of NearbyPlaces to fetch.
     */
    orderBy?: NearbyPlaceOrderByWithRelationInput | NearbyPlaceOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for NearbyPlaces.
     */
    cursor?: NearbyPlaceWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` NearbyPlaces from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` NearbyPlaces.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of NearbyPlaces.
     */
    distinct?: NearbyPlaceScalarFieldEnum | NearbyPlaceScalarFieldEnum[]
  }

  /**
   * NearbyPlace findMany
   */
  export type NearbyPlaceFindManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NearbyPlace
     */
    select?: NearbyPlaceSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NearbyPlace
     */
    omit?: NearbyPlaceOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NearbyPlaceInclude<ExtArgs> | null
    /**
     * Filter, which NearbyPlaces to fetch.
     */
    where?: NearbyPlaceWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of NearbyPlaces to fetch.
     */
    orderBy?: NearbyPlaceOrderByWithRelationInput | NearbyPlaceOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for listing NearbyPlaces.
     */
    cursor?: NearbyPlaceWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` NearbyPlaces from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` NearbyPlaces.
     */
    skip?: number
    distinct?: NearbyPlaceScalarFieldEnum | NearbyPlaceScalarFieldEnum[]
  }

  /**
   * NearbyPlace create
   */
  export type NearbyPlaceCreateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NearbyPlace
     */
    select?: NearbyPlaceSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NearbyPlace
     */
    omit?: NearbyPlaceOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NearbyPlaceInclude<ExtArgs> | null
    /**
     * The data needed to create a NearbyPlace.
     */
    data: XOR<NearbyPlaceCreateInput, NearbyPlaceUncheckedCreateInput>
  }

  /**
   * NearbyPlace createMany
   */
  export type NearbyPlaceCreateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to create many NearbyPlaces.
     */
    data: NearbyPlaceCreateManyInput | NearbyPlaceCreateManyInput[]
    skipDuplicates?: boolean
  }

  /**
   * NearbyPlace createManyAndReturn
   */
  export type NearbyPlaceCreateManyAndReturnArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NearbyPlace
     */
    select?: NearbyPlaceSelectCreateManyAndReturn<ExtArgs> | null
    /**
     * Omit specific fields from the NearbyPlace
     */
    omit?: NearbyPlaceOmit<ExtArgs> | null
    /**
     * The data used to create many NearbyPlaces.
     */
    data: NearbyPlaceCreateManyInput | NearbyPlaceCreateManyInput[]
    skipDuplicates?: boolean
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NearbyPlaceIncludeCreateManyAndReturn<ExtArgs> | null
  }

  /**
   * NearbyPlace update
   */
  export type NearbyPlaceUpdateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NearbyPlace
     */
    select?: NearbyPlaceSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NearbyPlace
     */
    omit?: NearbyPlaceOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NearbyPlaceInclude<ExtArgs> | null
    /**
     * The data needed to update a NearbyPlace.
     */
    data: XOR<NearbyPlaceUpdateInput, NearbyPlaceUncheckedUpdateInput>
    /**
     * Choose, which NearbyPlace to update.
     */
    where: NearbyPlaceWhereUniqueInput
  }

  /**
   * NearbyPlace updateMany
   */
  export type NearbyPlaceUpdateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to update NearbyPlaces.
     */
    data: XOR<NearbyPlaceUpdateManyMutationInput, NearbyPlaceUncheckedUpdateManyInput>
    /**
     * Filter which NearbyPlaces to update
     */
    where?: NearbyPlaceWhereInput
    /**
     * Limit how many NearbyPlaces to update.
     */
    limit?: number
  }

  /**
   * NearbyPlace updateManyAndReturn
   */
  export type NearbyPlaceUpdateManyAndReturnArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NearbyPlace
     */
    select?: NearbyPlaceSelectUpdateManyAndReturn<ExtArgs> | null
    /**
     * Omit specific fields from the NearbyPlace
     */
    omit?: NearbyPlaceOmit<ExtArgs> | null
    /**
     * The data used to update NearbyPlaces.
     */
    data: XOR<NearbyPlaceUpdateManyMutationInput, NearbyPlaceUncheckedUpdateManyInput>
    /**
     * Filter which NearbyPlaces to update
     */
    where?: NearbyPlaceWhereInput
    /**
     * Limit how many NearbyPlaces to update.
     */
    limit?: number
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NearbyPlaceIncludeUpdateManyAndReturn<ExtArgs> | null
  }

  /**
   * NearbyPlace upsert
   */
  export type NearbyPlaceUpsertArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NearbyPlace
     */
    select?: NearbyPlaceSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NearbyPlace
     */
    omit?: NearbyPlaceOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NearbyPlaceInclude<ExtArgs> | null
    /**
     * The filter to search for the NearbyPlace to update in case it exists.
     */
    where: NearbyPlaceWhereUniqueInput
    /**
     * In case the NearbyPlace found by the `where` argument doesn't exist, create a new NearbyPlace with this data.
     */
    create: XOR<NearbyPlaceCreateInput, NearbyPlaceUncheckedCreateInput>
    /**
     * In case the NearbyPlace was found with the provided `where` argument, update it with this data.
     */
    update: XOR<NearbyPlaceUpdateInput, NearbyPlaceUncheckedUpdateInput>
  }

  /**
   * NearbyPlace delete
   */
  export type NearbyPlaceDeleteArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NearbyPlace
     */
    select?: NearbyPlaceSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NearbyPlace
     */
    omit?: NearbyPlaceOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NearbyPlaceInclude<ExtArgs> | null
    /**
     * Filter which NearbyPlace to delete.
     */
    where: NearbyPlaceWhereUniqueInput
  }

  /**
   * NearbyPlace deleteMany
   */
  export type NearbyPlaceDeleteManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which NearbyPlaces to delete
     */
    where?: NearbyPlaceWhereInput
    /**
     * Limit how many NearbyPlaces to delete.
     */
    limit?: number
  }

  /**
   * NearbyPlace without action
   */
  export type NearbyPlaceDefaultArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the NearbyPlace
     */
    select?: NearbyPlaceSelect<ExtArgs> | null
    /**
     * Omit specific fields from the NearbyPlace
     */
    omit?: NearbyPlaceOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: NearbyPlaceInclude<ExtArgs> | null
  }


  /**
   * Model Review
   */

  export type AggregateReview = {
    _count: ReviewCountAggregateOutputType | null
    _avg: ReviewAvgAggregateOutputType | null
    _sum: ReviewSumAggregateOutputType | null
    _min: ReviewMinAggregateOutputType | null
    _max: ReviewMaxAggregateOutputType | null
  }

  export type ReviewAvgAggregateOutputType = {
    id: number | null
    rating: number | null
  }

  export type ReviewSumAggregateOutputType = {
    id: number | null
    rating: number | null
  }

  export type ReviewMinAggregateOutputType = {
    id: number | null
    authorName: string | null
    rating: number | null
    comment: string | null
    createdAt: Date | null
  }

  export type ReviewMaxAggregateOutputType = {
    id: number | null
    authorName: string | null
    rating: number | null
    comment: string | null
    createdAt: Date | null
  }

  export type ReviewCountAggregateOutputType = {
    id: number
    authorName: number
    rating: number
    comment: number
    createdAt: number
    _all: number
  }


  export type ReviewAvgAggregateInputType = {
    id?: true
    rating?: true
  }

  export type ReviewSumAggregateInputType = {
    id?: true
    rating?: true
  }

  export type ReviewMinAggregateInputType = {
    id?: true
    authorName?: true
    rating?: true
    comment?: true
    createdAt?: true
  }

  export type ReviewMaxAggregateInputType = {
    id?: true
    authorName?: true
    rating?: true
    comment?: true
    createdAt?: true
  }

  export type ReviewCountAggregateInputType = {
    id?: true
    authorName?: true
    rating?: true
    comment?: true
    createdAt?: true
    _all?: true
  }

  export type ReviewAggregateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which Review to aggregate.
     */
    where?: ReviewWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Reviews to fetch.
     */
    orderBy?: ReviewOrderByWithRelationInput | ReviewOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the start position
     */
    cursor?: ReviewWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Reviews from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Reviews.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Count returned Reviews
    **/
    _count?: true | ReviewCountAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to average
    **/
    _avg?: ReviewAvgAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to sum
    **/
    _sum?: ReviewSumAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the minimum value
    **/
    _min?: ReviewMinAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the maximum value
    **/
    _max?: ReviewMaxAggregateInputType
  }

  export type GetReviewAggregateType<T extends ReviewAggregateArgs> = {
        [P in keyof T & keyof AggregateReview]: P extends '_count' | 'count'
      ? T[P] extends true
        ? number
        : GetScalarType<T[P], AggregateReview[P]>
      : GetScalarType<T[P], AggregateReview[P]>
  }




  export type ReviewGroupByArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    where?: ReviewWhereInput
    orderBy?: ReviewOrderByWithAggregationInput | ReviewOrderByWithAggregationInput[]
    by: ReviewScalarFieldEnum[] | ReviewScalarFieldEnum
    having?: ReviewScalarWhereWithAggregatesInput
    take?: number
    skip?: number
    _count?: ReviewCountAggregateInputType | true
    _avg?: ReviewAvgAggregateInputType
    _sum?: ReviewSumAggregateInputType
    _min?: ReviewMinAggregateInputType
    _max?: ReviewMaxAggregateInputType
  }

  export type ReviewGroupByOutputType = {
    id: number
    authorName: string | null
    rating: number
    comment: string | null
    createdAt: Date
    _count: ReviewCountAggregateOutputType | null
    _avg: ReviewAvgAggregateOutputType | null
    _sum: ReviewSumAggregateOutputType | null
    _min: ReviewMinAggregateOutputType | null
    _max: ReviewMaxAggregateOutputType | null
  }

  type GetReviewGroupByPayload<T extends ReviewGroupByArgs> = Prisma.PrismaPromise<
    Array<
      PickEnumerable<ReviewGroupByOutputType, T['by']> &
        {
          [P in ((keyof T) & (keyof ReviewGroupByOutputType))]: P extends '_count'
            ? T[P] extends boolean
              ? number
              : GetScalarType<T[P], ReviewGroupByOutputType[P]>
            : GetScalarType<T[P], ReviewGroupByOutputType[P]>
        }
      >
    >


  export type ReviewSelect<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    authorName?: boolean
    rating?: boolean
    comment?: boolean
    createdAt?: boolean
  }, ExtArgs["result"]["review"]>

  export type ReviewSelectCreateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    authorName?: boolean
    rating?: boolean
    comment?: boolean
    createdAt?: boolean
  }, ExtArgs["result"]["review"]>

  export type ReviewSelectUpdateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    authorName?: boolean
    rating?: boolean
    comment?: boolean
    createdAt?: boolean
  }, ExtArgs["result"]["review"]>

  export type ReviewSelectScalar = {
    id?: boolean
    authorName?: boolean
    rating?: boolean
    comment?: boolean
    createdAt?: boolean
  }

  export type ReviewOmit<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetOmit<"id" | "authorName" | "rating" | "comment" | "createdAt", ExtArgs["result"]["review"]>

  export type $ReviewPayload<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    name: "Review"
    objects: {}
    scalars: $Extensions.GetPayloadResult<{
      id: number
      authorName: string | null
      rating: number
      comment: string | null
      createdAt: Date
    }, ExtArgs["result"]["review"]>
    composites: {}
  }

  type ReviewGetPayload<S extends boolean | null | undefined | ReviewDefaultArgs> = $Result.GetResult<Prisma.$ReviewPayload, S>

  type ReviewCountArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> =
    Omit<ReviewFindManyArgs, 'select' | 'include' | 'distinct' | 'omit'> & {
      select?: ReviewCountAggregateInputType | true
    }

  export interface ReviewDelegate<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs, GlobalOmitOptions = {}> {
    [K: symbol]: { types: Prisma.TypeMap<ExtArgs>['model']['Review'], meta: { name: 'Review' } }
    /**
     * Find zero or one Review that matches the filter.
     * @param {ReviewFindUniqueArgs} args - Arguments to find a Review
     * @example
     * // Get one Review
     * const review = await prisma.review.findUnique({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUnique<T extends ReviewFindUniqueArgs>(args: SelectSubset<T, ReviewFindUniqueArgs<ExtArgs>>): Prisma__ReviewClient<$Result.GetResult<Prisma.$ReviewPayload<ExtArgs>, T, "findUnique", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>

    /**
     * Find one Review that matches the filter or throw an error with `error.code='P2025'`
     * if no matches were found.
     * @param {ReviewFindUniqueOrThrowArgs} args - Arguments to find a Review
     * @example
     * // Get one Review
     * const review = await prisma.review.findUniqueOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUniqueOrThrow<T extends ReviewFindUniqueOrThrowArgs>(args: SelectSubset<T, ReviewFindUniqueOrThrowArgs<ExtArgs>>): Prisma__ReviewClient<$Result.GetResult<Prisma.$ReviewPayload<ExtArgs>, T, "findUniqueOrThrow", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Find the first Review that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ReviewFindFirstArgs} args - Arguments to find a Review
     * @example
     * // Get one Review
     * const review = await prisma.review.findFirst({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirst<T extends ReviewFindFirstArgs>(args?: SelectSubset<T, ReviewFindFirstArgs<ExtArgs>>): Prisma__ReviewClient<$Result.GetResult<Prisma.$ReviewPayload<ExtArgs>, T, "findFirst", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>

    /**
     * Find the first Review that matches the filter or
     * throw `PrismaKnownClientError` with `P2025` code if no matches were found.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ReviewFindFirstOrThrowArgs} args - Arguments to find a Review
     * @example
     * // Get one Review
     * const review = await prisma.review.findFirstOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirstOrThrow<T extends ReviewFindFirstOrThrowArgs>(args?: SelectSubset<T, ReviewFindFirstOrThrowArgs<ExtArgs>>): Prisma__ReviewClient<$Result.GetResult<Prisma.$ReviewPayload<ExtArgs>, T, "findFirstOrThrow", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Find zero or more Reviews that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ReviewFindManyArgs} args - Arguments to filter and select certain fields only.
     * @example
     * // Get all Reviews
     * const reviews = await prisma.review.findMany()
     * 
     * // Get first 10 Reviews
     * const reviews = await prisma.review.findMany({ take: 10 })
     * 
     * // Only select the `id`
     * const reviewWithIdOnly = await prisma.review.findMany({ select: { id: true } })
     * 
     */
    findMany<T extends ReviewFindManyArgs>(args?: SelectSubset<T, ReviewFindManyArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$ReviewPayload<ExtArgs>, T, "findMany", GlobalOmitOptions>>

    /**
     * Create a Review.
     * @param {ReviewCreateArgs} args - Arguments to create a Review.
     * @example
     * // Create one Review
     * const Review = await prisma.review.create({
     *   data: {
     *     // ... data to create a Review
     *   }
     * })
     * 
     */
    create<T extends ReviewCreateArgs>(args: SelectSubset<T, ReviewCreateArgs<ExtArgs>>): Prisma__ReviewClient<$Result.GetResult<Prisma.$ReviewPayload<ExtArgs>, T, "create", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Create many Reviews.
     * @param {ReviewCreateManyArgs} args - Arguments to create many Reviews.
     * @example
     * // Create many Reviews
     * const review = await prisma.review.createMany({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     *     
     */
    createMany<T extends ReviewCreateManyArgs>(args?: SelectSubset<T, ReviewCreateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Create many Reviews and returns the data saved in the database.
     * @param {ReviewCreateManyAndReturnArgs} args - Arguments to create many Reviews.
     * @example
     * // Create many Reviews
     * const review = await prisma.review.createManyAndReturn({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * 
     * // Create many Reviews and only return the `id`
     * const reviewWithIdOnly = await prisma.review.createManyAndReturn({
     *   select: { id: true },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * 
     */
    createManyAndReturn<T extends ReviewCreateManyAndReturnArgs>(args?: SelectSubset<T, ReviewCreateManyAndReturnArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$ReviewPayload<ExtArgs>, T, "createManyAndReturn", GlobalOmitOptions>>

    /**
     * Delete a Review.
     * @param {ReviewDeleteArgs} args - Arguments to delete one Review.
     * @example
     * // Delete one Review
     * const Review = await prisma.review.delete({
     *   where: {
     *     // ... filter to delete one Review
     *   }
     * })
     * 
     */
    delete<T extends ReviewDeleteArgs>(args: SelectSubset<T, ReviewDeleteArgs<ExtArgs>>): Prisma__ReviewClient<$Result.GetResult<Prisma.$ReviewPayload<ExtArgs>, T, "delete", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Update one Review.
     * @param {ReviewUpdateArgs} args - Arguments to update one Review.
     * @example
     * // Update one Review
     * const review = await prisma.review.update({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    update<T extends ReviewUpdateArgs>(args: SelectSubset<T, ReviewUpdateArgs<ExtArgs>>): Prisma__ReviewClient<$Result.GetResult<Prisma.$ReviewPayload<ExtArgs>, T, "update", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Delete zero or more Reviews.
     * @param {ReviewDeleteManyArgs} args - Arguments to filter Reviews to delete.
     * @example
     * // Delete a few Reviews
     * const { count } = await prisma.review.deleteMany({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     * 
     */
    deleteMany<T extends ReviewDeleteManyArgs>(args?: SelectSubset<T, ReviewDeleteManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Update zero or more Reviews.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ReviewUpdateManyArgs} args - Arguments to update one or more rows.
     * @example
     * // Update many Reviews
     * const review = await prisma.review.updateMany({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    updateMany<T extends ReviewUpdateManyArgs>(args: SelectSubset<T, ReviewUpdateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Update zero or more Reviews and returns the data updated in the database.
     * @param {ReviewUpdateManyAndReturnArgs} args - Arguments to update many Reviews.
     * @example
     * // Update many Reviews
     * const review = await prisma.review.updateManyAndReturn({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * 
     * // Update zero or more Reviews and only return the `id`
     * const reviewWithIdOnly = await prisma.review.updateManyAndReturn({
     *   select: { id: true },
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * 
     */
    updateManyAndReturn<T extends ReviewUpdateManyAndReturnArgs>(args: SelectSubset<T, ReviewUpdateManyAndReturnArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$ReviewPayload<ExtArgs>, T, "updateManyAndReturn", GlobalOmitOptions>>

    /**
     * Create or update one Review.
     * @param {ReviewUpsertArgs} args - Arguments to update or create a Review.
     * @example
     * // Update or create a Review
     * const review = await prisma.review.upsert({
     *   create: {
     *     // ... data to create a Review
     *   },
     *   update: {
     *     // ... in case it already exists, update
     *   },
     *   where: {
     *     // ... the filter for the Review we want to update
     *   }
     * })
     */
    upsert<T extends ReviewUpsertArgs>(args: SelectSubset<T, ReviewUpsertArgs<ExtArgs>>): Prisma__ReviewClient<$Result.GetResult<Prisma.$ReviewPayload<ExtArgs>, T, "upsert", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>


    /**
     * Count the number of Reviews.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ReviewCountArgs} args - Arguments to filter Reviews to count.
     * @example
     * // Count the number of Reviews
     * const count = await prisma.review.count({
     *   where: {
     *     // ... the filter for the Reviews we want to count
     *   }
     * })
    **/
    count<T extends ReviewCountArgs>(
      args?: Subset<T, ReviewCountArgs>,
    ): Prisma.PrismaPromise<
      T extends $Utils.Record<'select', any>
        ? T['select'] extends true
          ? number
          : GetScalarType<T['select'], ReviewCountAggregateOutputType>
        : number
    >

    /**
     * Allows you to perform aggregations operations on a Review.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ReviewAggregateArgs} args - Select which aggregations you would like to apply and on what fields.
     * @example
     * // Ordered by age ascending
     * // Where email contains prisma.io
     * // Limited to the 10 users
     * const aggregations = await prisma.user.aggregate({
     *   _avg: {
     *     age: true,
     *   },
     *   where: {
     *     email: {
     *       contains: "prisma.io",
     *     },
     *   },
     *   orderBy: {
     *     age: "asc",
     *   },
     *   take: 10,
     * })
    **/
    aggregate<T extends ReviewAggregateArgs>(args: Subset<T, ReviewAggregateArgs>): Prisma.PrismaPromise<GetReviewAggregateType<T>>

    /**
     * Group by Review.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ReviewGroupByArgs} args - Group by arguments.
     * @example
     * // Group by city, order by createdAt, get count
     * const result = await prisma.user.groupBy({
     *   by: ['city', 'createdAt'],
     *   orderBy: {
     *     createdAt: true
     *   },
     *   _count: {
     *     _all: true
     *   },
     * })
     * 
    **/
    groupBy<
      T extends ReviewGroupByArgs,
      HasSelectOrTake extends Or<
        Extends<'skip', Keys<T>>,
        Extends<'take', Keys<T>>
      >,
      OrderByArg extends True extends HasSelectOrTake
        ? { orderBy: ReviewGroupByArgs['orderBy'] }
        : { orderBy?: ReviewGroupByArgs['orderBy'] },
      OrderFields extends ExcludeUnderscoreKeys<Keys<MaybeTupleToUnion<T['orderBy']>>>,
      ByFields extends MaybeTupleToUnion<T['by']>,
      ByValid extends Has<ByFields, OrderFields>,
      HavingFields extends GetHavingFields<T['having']>,
      HavingValid extends Has<ByFields, HavingFields>,
      ByEmpty extends T['by'] extends never[] ? True : False,
      InputErrors extends ByEmpty extends True
      ? `Error: "by" must not be empty.`
      : HavingValid extends False
      ? {
          [P in HavingFields]: P extends ByFields
            ? never
            : P extends string
            ? `Error: Field "${P}" used in "having" needs to be provided in "by".`
            : [
                Error,
                'Field ',
                P,
                ` in "having" needs to be provided in "by"`,
              ]
        }[HavingFields]
      : 'take' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "take", you also need to provide "orderBy"'
      : 'skip' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "skip", you also need to provide "orderBy"'
      : ByValid extends True
      ? {}
      : {
          [P in OrderFields]: P extends ByFields
            ? never
            : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
        }[OrderFields]
    >(args: SubsetIntersection<T, ReviewGroupByArgs, OrderByArg> & InputErrors): {} extends InputErrors ? GetReviewGroupByPayload<T> : Prisma.PrismaPromise<InputErrors>
  /**
   * Fields of the Review model
   */
  readonly fields: ReviewFieldRefs;
  }

  /**
   * The delegate class that acts as a "Promise-like" for Review.
   * Why is this prefixed with `Prisma__`?
   * Because we want to prevent naming conflicts as mentioned in
   * https://github.com/prisma/prisma-client-js/issues/707
   */
  export interface Prisma__ReviewClient<T, Null = never, ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs, GlobalOmitOptions = {}> extends Prisma.PrismaPromise<T> {
    readonly [Symbol.toStringTag]: "PrismaPromise"
    /**
     * Attaches callbacks for the resolution and/or rejection of the Promise.
     * @param onfulfilled The callback to execute when the Promise is resolved.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of which ever callback is executed.
     */
    then<TResult1 = T, TResult2 = never>(onfulfilled?: ((value: T) => TResult1 | PromiseLike<TResult1>) | undefined | null, onrejected?: ((reason: any) => TResult2 | PromiseLike<TResult2>) | undefined | null): $Utils.JsPromise<TResult1 | TResult2>
    /**
     * Attaches a callback for only the rejection of the Promise.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of the callback.
     */
    catch<TResult = never>(onrejected?: ((reason: any) => TResult | PromiseLike<TResult>) | undefined | null): $Utils.JsPromise<T | TResult>
    /**
     * Attaches a callback that is invoked when the Promise is settled (fulfilled or rejected). The
     * resolved value cannot be modified from the callback.
     * @param onfinally The callback to execute when the Promise is settled (fulfilled or rejected).
     * @returns A Promise for the completion of the callback.
     */
    finally(onfinally?: (() => void) | undefined | null): $Utils.JsPromise<T>
  }




  /**
   * Fields of the Review model
   */ 
  interface ReviewFieldRefs {
    readonly id: FieldRef<"Review", 'Int'>
    readonly authorName: FieldRef<"Review", 'String'>
    readonly rating: FieldRef<"Review", 'Int'>
    readonly comment: FieldRef<"Review", 'String'>
    readonly createdAt: FieldRef<"Review", 'DateTime'>
  }
    

  // Custom InputTypes
  /**
   * Review findUnique
   */
  export type ReviewFindUniqueArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Review
     */
    select?: ReviewSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Review
     */
    omit?: ReviewOmit<ExtArgs> | null
    /**
     * Filter, which Review to fetch.
     */
    where: ReviewWhereUniqueInput
  }

  /**
   * Review findUniqueOrThrow
   */
  export type ReviewFindUniqueOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Review
     */
    select?: ReviewSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Review
     */
    omit?: ReviewOmit<ExtArgs> | null
    /**
     * Filter, which Review to fetch.
     */
    where: ReviewWhereUniqueInput
  }

  /**
   * Review findFirst
   */
  export type ReviewFindFirstArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Review
     */
    select?: ReviewSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Review
     */
    omit?: ReviewOmit<ExtArgs> | null
    /**
     * Filter, which Review to fetch.
     */
    where?: ReviewWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Reviews to fetch.
     */
    orderBy?: ReviewOrderByWithRelationInput | ReviewOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for Reviews.
     */
    cursor?: ReviewWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Reviews from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Reviews.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of Reviews.
     */
    distinct?: ReviewScalarFieldEnum | ReviewScalarFieldEnum[]
  }

  /**
   * Review findFirstOrThrow
   */
  export type ReviewFindFirstOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Review
     */
    select?: ReviewSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Review
     */
    omit?: ReviewOmit<ExtArgs> | null
    /**
     * Filter, which Review to fetch.
     */
    where?: ReviewWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Reviews to fetch.
     */
    orderBy?: ReviewOrderByWithRelationInput | ReviewOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for Reviews.
     */
    cursor?: ReviewWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Reviews from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Reviews.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of Reviews.
     */
    distinct?: ReviewScalarFieldEnum | ReviewScalarFieldEnum[]
  }

  /**
   * Review findMany
   */
  export type ReviewFindManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Review
     */
    select?: ReviewSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Review
     */
    omit?: ReviewOmit<ExtArgs> | null
    /**
     * Filter, which Reviews to fetch.
     */
    where?: ReviewWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of Reviews to fetch.
     */
    orderBy?: ReviewOrderByWithRelationInput | ReviewOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for listing Reviews.
     */
    cursor?: ReviewWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` Reviews from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` Reviews.
     */
    skip?: number
    distinct?: ReviewScalarFieldEnum | ReviewScalarFieldEnum[]
  }

  /**
   * Review create
   */
  export type ReviewCreateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Review
     */
    select?: ReviewSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Review
     */
    omit?: ReviewOmit<ExtArgs> | null
    /**
     * The data needed to create a Review.
     */
    data: XOR<ReviewCreateInput, ReviewUncheckedCreateInput>
  }

  /**
   * Review createMany
   */
  export type ReviewCreateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to create many Reviews.
     */
    data: ReviewCreateManyInput | ReviewCreateManyInput[]
    skipDuplicates?: boolean
  }

  /**
   * Review createManyAndReturn
   */
  export type ReviewCreateManyAndReturnArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Review
     */
    select?: ReviewSelectCreateManyAndReturn<ExtArgs> | null
    /**
     * Omit specific fields from the Review
     */
    omit?: ReviewOmit<ExtArgs> | null
    /**
     * The data used to create many Reviews.
     */
    data: ReviewCreateManyInput | ReviewCreateManyInput[]
    skipDuplicates?: boolean
  }

  /**
   * Review update
   */
  export type ReviewUpdateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Review
     */
    select?: ReviewSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Review
     */
    omit?: ReviewOmit<ExtArgs> | null
    /**
     * The data needed to update a Review.
     */
    data: XOR<ReviewUpdateInput, ReviewUncheckedUpdateInput>
    /**
     * Choose, which Review to update.
     */
    where: ReviewWhereUniqueInput
  }

  /**
   * Review updateMany
   */
  export type ReviewUpdateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to update Reviews.
     */
    data: XOR<ReviewUpdateManyMutationInput, ReviewUncheckedUpdateManyInput>
    /**
     * Filter which Reviews to update
     */
    where?: ReviewWhereInput
    /**
     * Limit how many Reviews to update.
     */
    limit?: number
  }

  /**
   * Review updateManyAndReturn
   */
  export type ReviewUpdateManyAndReturnArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Review
     */
    select?: ReviewSelectUpdateManyAndReturn<ExtArgs> | null
    /**
     * Omit specific fields from the Review
     */
    omit?: ReviewOmit<ExtArgs> | null
    /**
     * The data used to update Reviews.
     */
    data: XOR<ReviewUpdateManyMutationInput, ReviewUncheckedUpdateManyInput>
    /**
     * Filter which Reviews to update
     */
    where?: ReviewWhereInput
    /**
     * Limit how many Reviews to update.
     */
    limit?: number
  }

  /**
   * Review upsert
   */
  export type ReviewUpsertArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Review
     */
    select?: ReviewSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Review
     */
    omit?: ReviewOmit<ExtArgs> | null
    /**
     * The filter to search for the Review to update in case it exists.
     */
    where: ReviewWhereUniqueInput
    /**
     * In case the Review found by the `where` argument doesn't exist, create a new Review with this data.
     */
    create: XOR<ReviewCreateInput, ReviewUncheckedCreateInput>
    /**
     * In case the Review was found with the provided `where` argument, update it with this data.
     */
    update: XOR<ReviewUpdateInput, ReviewUncheckedUpdateInput>
  }

  /**
   * Review delete
   */
  export type ReviewDeleteArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Review
     */
    select?: ReviewSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Review
     */
    omit?: ReviewOmit<ExtArgs> | null
    /**
     * Filter which Review to delete.
     */
    where: ReviewWhereUniqueInput
  }

  /**
   * Review deleteMany
   */
  export type ReviewDeleteManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which Reviews to delete
     */
    where?: ReviewWhereInput
    /**
     * Limit how many Reviews to delete.
     */
    limit?: number
  }

  /**
   * Review without action
   */
  export type ReviewDefaultArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Review
     */
    select?: ReviewSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Review
     */
    omit?: ReviewOmit<ExtArgs> | null
  }


  /**
   * Model ReadyApartment
   */

  export type AggregateReadyApartment = {
    _count: ReadyApartmentCountAggregateOutputType | null
    _avg: ReadyApartmentAvgAggregateOutputType | null
    _sum: ReadyApartmentSumAggregateOutputType | null
    _min: ReadyApartmentMinAggregateOutputType | null
    _max: ReadyApartmentMaxAggregateOutputType | null
  }

  export type ReadyApartmentAvgAggregateOutputType = {
    id: number | null
    area: number | null
    price: number | null
    pricePerM2: number | null
    bedrooms: number | null
    floor: number | null
    totalFloors: number | null
    lat: number | null
    lng: number | null
    metroDistance: number | null
  }

  export type ReadyApartmentSumAggregateOutputType = {
    id: number | null
    area: number | null
    price: number | null
    pricePerM2: number | null
    bedrooms: number | null
    floor: number | null
    totalFloors: number | null
    lat: number | null
    lng: number | null
    metroDistance: number | null
  }

  export type ReadyApartmentMinAggregateOutputType = {
    id: number | null
    title: string | null
    complexName: string | null
    address: string | null
    city: string | null
    area: number | null
    price: number | null
    pricePerM2: number | null
    bedrooms: number | null
    floor: number | null
    totalFloors: number | null
    lat: number | null
    lng: number | null
    metro: string | null
    metroDistance: number | null
    description: string | null
    developer: string | null
    createdAt: Date | null
    updatedAt: Date | null
  }

  export type ReadyApartmentMaxAggregateOutputType = {
    id: number | null
    title: string | null
    complexName: string | null
    address: string | null
    city: string | null
    area: number | null
    price: number | null
    pricePerM2: number | null
    bedrooms: number | null
    floor: number | null
    totalFloors: number | null
    lat: number | null
    lng: number | null
    metro: string | null
    metroDistance: number | null
    description: string | null
    developer: string | null
    createdAt: Date | null
    updatedAt: Date | null
  }

  export type ReadyApartmentCountAggregateOutputType = {
    id: number
    title: number
    complexName: number
    address: number
    city: number
    area: number
    price: number
    pricePerM2: number
    bedrooms: number
    floor: number
    totalFloors: number
    lat: number
    lng: number
    metro: number
    metroDistance: number
    description: number
    developer: number
    createdAt: number
    updatedAt: number
    _all: number
  }


  export type ReadyApartmentAvgAggregateInputType = {
    id?: true
    area?: true
    price?: true
    pricePerM2?: true
    bedrooms?: true
    floor?: true
    totalFloors?: true
    lat?: true
    lng?: true
    metroDistance?: true
  }

  export type ReadyApartmentSumAggregateInputType = {
    id?: true
    area?: true
    price?: true
    pricePerM2?: true
    bedrooms?: true
    floor?: true
    totalFloors?: true
    lat?: true
    lng?: true
    metroDistance?: true
  }

  export type ReadyApartmentMinAggregateInputType = {
    id?: true
    title?: true
    complexName?: true
    address?: true
    city?: true
    area?: true
    price?: true
    pricePerM2?: true
    bedrooms?: true
    floor?: true
    totalFloors?: true
    lat?: true
    lng?: true
    metro?: true
    metroDistance?: true
    description?: true
    developer?: true
    createdAt?: true
    updatedAt?: true
  }

  export type ReadyApartmentMaxAggregateInputType = {
    id?: true
    title?: true
    complexName?: true
    address?: true
    city?: true
    area?: true
    price?: true
    pricePerM2?: true
    bedrooms?: true
    floor?: true
    totalFloors?: true
    lat?: true
    lng?: true
    metro?: true
    metroDistance?: true
    description?: true
    developer?: true
    createdAt?: true
    updatedAt?: true
  }

  export type ReadyApartmentCountAggregateInputType = {
    id?: true
    title?: true
    complexName?: true
    address?: true
    city?: true
    area?: true
    price?: true
    pricePerM2?: true
    bedrooms?: true
    floor?: true
    totalFloors?: true
    lat?: true
    lng?: true
    metro?: true
    metroDistance?: true
    description?: true
    developer?: true
    createdAt?: true
    updatedAt?: true
    _all?: true
  }

  export type ReadyApartmentAggregateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which ReadyApartment to aggregate.
     */
    where?: ReadyApartmentWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of ReadyApartments to fetch.
     */
    orderBy?: ReadyApartmentOrderByWithRelationInput | ReadyApartmentOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the start position
     */
    cursor?: ReadyApartmentWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` ReadyApartments from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` ReadyApartments.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Count returned ReadyApartments
    **/
    _count?: true | ReadyApartmentCountAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to average
    **/
    _avg?: ReadyApartmentAvgAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to sum
    **/
    _sum?: ReadyApartmentSumAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the minimum value
    **/
    _min?: ReadyApartmentMinAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the maximum value
    **/
    _max?: ReadyApartmentMaxAggregateInputType
  }

  export type GetReadyApartmentAggregateType<T extends ReadyApartmentAggregateArgs> = {
        [P in keyof T & keyof AggregateReadyApartment]: P extends '_count' | 'count'
      ? T[P] extends true
        ? number
        : GetScalarType<T[P], AggregateReadyApartment[P]>
      : GetScalarType<T[P], AggregateReadyApartment[P]>
  }




  export type ReadyApartmentGroupByArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    where?: ReadyApartmentWhereInput
    orderBy?: ReadyApartmentOrderByWithAggregationInput | ReadyApartmentOrderByWithAggregationInput[]
    by: ReadyApartmentScalarFieldEnum[] | ReadyApartmentScalarFieldEnum
    having?: ReadyApartmentScalarWhereWithAggregatesInput
    take?: number
    skip?: number
    _count?: ReadyApartmentCountAggregateInputType | true
    _avg?: ReadyApartmentAvgAggregateInputType
    _sum?: ReadyApartmentSumAggregateInputType
    _min?: ReadyApartmentMinAggregateInputType
    _max?: ReadyApartmentMaxAggregateInputType
  }

  export type ReadyApartmentGroupByOutputType = {
    id: number
    title: string
    complexName: string | null
    address: string
    city: string | null
    area: number
    price: number
    pricePerM2: number
    bedrooms: number
    floor: number
    totalFloors: number
    lat: number | null
    lng: number | null
    metro: string | null
    metroDistance: number | null
    description: string | null
    developer: string | null
    createdAt: Date
    updatedAt: Date
    _count: ReadyApartmentCountAggregateOutputType | null
    _avg: ReadyApartmentAvgAggregateOutputType | null
    _sum: ReadyApartmentSumAggregateOutputType | null
    _min: ReadyApartmentMinAggregateOutputType | null
    _max: ReadyApartmentMaxAggregateOutputType | null
  }

  type GetReadyApartmentGroupByPayload<T extends ReadyApartmentGroupByArgs> = Prisma.PrismaPromise<
    Array<
      PickEnumerable<ReadyApartmentGroupByOutputType, T['by']> &
        {
          [P in ((keyof T) & (keyof ReadyApartmentGroupByOutputType))]: P extends '_count'
            ? T[P] extends boolean
              ? number
              : GetScalarType<T[P], ReadyApartmentGroupByOutputType[P]>
            : GetScalarType<T[P], ReadyApartmentGroupByOutputType[P]>
        }
      >
    >


  export type ReadyApartmentSelect<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    title?: boolean
    complexName?: boolean
    address?: boolean
    city?: boolean
    area?: boolean
    price?: boolean
    pricePerM2?: boolean
    bedrooms?: boolean
    floor?: boolean
    totalFloors?: boolean
    lat?: boolean
    lng?: boolean
    metro?: boolean
    metroDistance?: boolean
    description?: boolean
    developer?: boolean
    createdAt?: boolean
    updatedAt?: boolean
    images?: boolean | ReadyApartment$imagesArgs<ExtArgs>
    _count?: boolean | ReadyApartmentCountOutputTypeDefaultArgs<ExtArgs>
  }, ExtArgs["result"]["readyApartment"]>

  export type ReadyApartmentSelectCreateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    title?: boolean
    complexName?: boolean
    address?: boolean
    city?: boolean
    area?: boolean
    price?: boolean
    pricePerM2?: boolean
    bedrooms?: boolean
    floor?: boolean
    totalFloors?: boolean
    lat?: boolean
    lng?: boolean
    metro?: boolean
    metroDistance?: boolean
    description?: boolean
    developer?: boolean
    createdAt?: boolean
    updatedAt?: boolean
  }, ExtArgs["result"]["readyApartment"]>

  export type ReadyApartmentSelectUpdateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    title?: boolean
    complexName?: boolean
    address?: boolean
    city?: boolean
    area?: boolean
    price?: boolean
    pricePerM2?: boolean
    bedrooms?: boolean
    floor?: boolean
    totalFloors?: boolean
    lat?: boolean
    lng?: boolean
    metro?: boolean
    metroDistance?: boolean
    description?: boolean
    developer?: boolean
    createdAt?: boolean
    updatedAt?: boolean
  }, ExtArgs["result"]["readyApartment"]>

  export type ReadyApartmentSelectScalar = {
    id?: boolean
    title?: boolean
    complexName?: boolean
    address?: boolean
    city?: boolean
    area?: boolean
    price?: boolean
    pricePerM2?: boolean
    bedrooms?: boolean
    floor?: boolean
    totalFloors?: boolean
    lat?: boolean
    lng?: boolean
    metro?: boolean
    metroDistance?: boolean
    description?: boolean
    developer?: boolean
    createdAt?: boolean
    updatedAt?: boolean
  }

  export type ReadyApartmentOmit<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetOmit<"id" | "title" | "complexName" | "address" | "city" | "area" | "price" | "pricePerM2" | "bedrooms" | "floor" | "totalFloors" | "lat" | "lng" | "metro" | "metroDistance" | "description" | "developer" | "createdAt" | "updatedAt", ExtArgs["result"]["readyApartment"]>
  export type ReadyApartmentInclude<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    images?: boolean | ReadyApartment$imagesArgs<ExtArgs>
    _count?: boolean | ReadyApartmentCountOutputTypeDefaultArgs<ExtArgs>
  }
  export type ReadyApartmentIncludeCreateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {}
  export type ReadyApartmentIncludeUpdateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {}

  export type $ReadyApartmentPayload<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    name: "ReadyApartment"
    objects: {
      images: Prisma.$ImagePayload<ExtArgs>[]
    }
    scalars: $Extensions.GetPayloadResult<{
      id: number
      title: string
      complexName: string | null
      address: string
      city: string | null
      area: number
      price: number
      pricePerM2: number
      bedrooms: number
      floor: number
      totalFloors: number
      lat: number | null
      lng: number | null
      metro: string | null
      metroDistance: number | null
      description: string | null
      developer: string | null
      createdAt: Date
      updatedAt: Date
    }, ExtArgs["result"]["readyApartment"]>
    composites: {}
  }

  type ReadyApartmentGetPayload<S extends boolean | null | undefined | ReadyApartmentDefaultArgs> = $Result.GetResult<Prisma.$ReadyApartmentPayload, S>

  type ReadyApartmentCountArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> =
    Omit<ReadyApartmentFindManyArgs, 'select' | 'include' | 'distinct' | 'omit'> & {
      select?: ReadyApartmentCountAggregateInputType | true
    }

  export interface ReadyApartmentDelegate<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs, GlobalOmitOptions = {}> {
    [K: symbol]: { types: Prisma.TypeMap<ExtArgs>['model']['ReadyApartment'], meta: { name: 'ReadyApartment' } }
    /**
     * Find zero or one ReadyApartment that matches the filter.
     * @param {ReadyApartmentFindUniqueArgs} args - Arguments to find a ReadyApartment
     * @example
     * // Get one ReadyApartment
     * const readyApartment = await prisma.readyApartment.findUnique({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUnique<T extends ReadyApartmentFindUniqueArgs>(args: SelectSubset<T, ReadyApartmentFindUniqueArgs<ExtArgs>>): Prisma__ReadyApartmentClient<$Result.GetResult<Prisma.$ReadyApartmentPayload<ExtArgs>, T, "findUnique", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>

    /**
     * Find one ReadyApartment that matches the filter or throw an error with `error.code='P2025'`
     * if no matches were found.
     * @param {ReadyApartmentFindUniqueOrThrowArgs} args - Arguments to find a ReadyApartment
     * @example
     * // Get one ReadyApartment
     * const readyApartment = await prisma.readyApartment.findUniqueOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUniqueOrThrow<T extends ReadyApartmentFindUniqueOrThrowArgs>(args: SelectSubset<T, ReadyApartmentFindUniqueOrThrowArgs<ExtArgs>>): Prisma__ReadyApartmentClient<$Result.GetResult<Prisma.$ReadyApartmentPayload<ExtArgs>, T, "findUniqueOrThrow", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Find the first ReadyApartment that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ReadyApartmentFindFirstArgs} args - Arguments to find a ReadyApartment
     * @example
     * // Get one ReadyApartment
     * const readyApartment = await prisma.readyApartment.findFirst({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirst<T extends ReadyApartmentFindFirstArgs>(args?: SelectSubset<T, ReadyApartmentFindFirstArgs<ExtArgs>>): Prisma__ReadyApartmentClient<$Result.GetResult<Prisma.$ReadyApartmentPayload<ExtArgs>, T, "findFirst", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>

    /**
     * Find the first ReadyApartment that matches the filter or
     * throw `PrismaKnownClientError` with `P2025` code if no matches were found.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ReadyApartmentFindFirstOrThrowArgs} args - Arguments to find a ReadyApartment
     * @example
     * // Get one ReadyApartment
     * const readyApartment = await prisma.readyApartment.findFirstOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirstOrThrow<T extends ReadyApartmentFindFirstOrThrowArgs>(args?: SelectSubset<T, ReadyApartmentFindFirstOrThrowArgs<ExtArgs>>): Prisma__ReadyApartmentClient<$Result.GetResult<Prisma.$ReadyApartmentPayload<ExtArgs>, T, "findFirstOrThrow", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Find zero or more ReadyApartments that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ReadyApartmentFindManyArgs} args - Arguments to filter and select certain fields only.
     * @example
     * // Get all ReadyApartments
     * const readyApartments = await prisma.readyApartment.findMany()
     * 
     * // Get first 10 ReadyApartments
     * const readyApartments = await prisma.readyApartment.findMany({ take: 10 })
     * 
     * // Only select the `id`
     * const readyApartmentWithIdOnly = await prisma.readyApartment.findMany({ select: { id: true } })
     * 
     */
    findMany<T extends ReadyApartmentFindManyArgs>(args?: SelectSubset<T, ReadyApartmentFindManyArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$ReadyApartmentPayload<ExtArgs>, T, "findMany", GlobalOmitOptions>>

    /**
     * Create a ReadyApartment.
     * @param {ReadyApartmentCreateArgs} args - Arguments to create a ReadyApartment.
     * @example
     * // Create one ReadyApartment
     * const ReadyApartment = await prisma.readyApartment.create({
     *   data: {
     *     // ... data to create a ReadyApartment
     *   }
     * })
     * 
     */
    create<T extends ReadyApartmentCreateArgs>(args: SelectSubset<T, ReadyApartmentCreateArgs<ExtArgs>>): Prisma__ReadyApartmentClient<$Result.GetResult<Prisma.$ReadyApartmentPayload<ExtArgs>, T, "create", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Create many ReadyApartments.
     * @param {ReadyApartmentCreateManyArgs} args - Arguments to create many ReadyApartments.
     * @example
     * // Create many ReadyApartments
     * const readyApartment = await prisma.readyApartment.createMany({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     *     
     */
    createMany<T extends ReadyApartmentCreateManyArgs>(args?: SelectSubset<T, ReadyApartmentCreateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Create many ReadyApartments and returns the data saved in the database.
     * @param {ReadyApartmentCreateManyAndReturnArgs} args - Arguments to create many ReadyApartments.
     * @example
     * // Create many ReadyApartments
     * const readyApartment = await prisma.readyApartment.createManyAndReturn({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * 
     * // Create many ReadyApartments and only return the `id`
     * const readyApartmentWithIdOnly = await prisma.readyApartment.createManyAndReturn({
     *   select: { id: true },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * 
     */
    createManyAndReturn<T extends ReadyApartmentCreateManyAndReturnArgs>(args?: SelectSubset<T, ReadyApartmentCreateManyAndReturnArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$ReadyApartmentPayload<ExtArgs>, T, "createManyAndReturn", GlobalOmitOptions>>

    /**
     * Delete a ReadyApartment.
     * @param {ReadyApartmentDeleteArgs} args - Arguments to delete one ReadyApartment.
     * @example
     * // Delete one ReadyApartment
     * const ReadyApartment = await prisma.readyApartment.delete({
     *   where: {
     *     // ... filter to delete one ReadyApartment
     *   }
     * })
     * 
     */
    delete<T extends ReadyApartmentDeleteArgs>(args: SelectSubset<T, ReadyApartmentDeleteArgs<ExtArgs>>): Prisma__ReadyApartmentClient<$Result.GetResult<Prisma.$ReadyApartmentPayload<ExtArgs>, T, "delete", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Update one ReadyApartment.
     * @param {ReadyApartmentUpdateArgs} args - Arguments to update one ReadyApartment.
     * @example
     * // Update one ReadyApartment
     * const readyApartment = await prisma.readyApartment.update({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    update<T extends ReadyApartmentUpdateArgs>(args: SelectSubset<T, ReadyApartmentUpdateArgs<ExtArgs>>): Prisma__ReadyApartmentClient<$Result.GetResult<Prisma.$ReadyApartmentPayload<ExtArgs>, T, "update", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Delete zero or more ReadyApartments.
     * @param {ReadyApartmentDeleteManyArgs} args - Arguments to filter ReadyApartments to delete.
     * @example
     * // Delete a few ReadyApartments
     * const { count } = await prisma.readyApartment.deleteMany({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     * 
     */
    deleteMany<T extends ReadyApartmentDeleteManyArgs>(args?: SelectSubset<T, ReadyApartmentDeleteManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Update zero or more ReadyApartments.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ReadyApartmentUpdateManyArgs} args - Arguments to update one or more rows.
     * @example
     * // Update many ReadyApartments
     * const readyApartment = await prisma.readyApartment.updateMany({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    updateMany<T extends ReadyApartmentUpdateManyArgs>(args: SelectSubset<T, ReadyApartmentUpdateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Update zero or more ReadyApartments and returns the data updated in the database.
     * @param {ReadyApartmentUpdateManyAndReturnArgs} args - Arguments to update many ReadyApartments.
     * @example
     * // Update many ReadyApartments
     * const readyApartment = await prisma.readyApartment.updateManyAndReturn({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * 
     * // Update zero or more ReadyApartments and only return the `id`
     * const readyApartmentWithIdOnly = await prisma.readyApartment.updateManyAndReturn({
     *   select: { id: true },
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * 
     */
    updateManyAndReturn<T extends ReadyApartmentUpdateManyAndReturnArgs>(args: SelectSubset<T, ReadyApartmentUpdateManyAndReturnArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$ReadyApartmentPayload<ExtArgs>, T, "updateManyAndReturn", GlobalOmitOptions>>

    /**
     * Create or update one ReadyApartment.
     * @param {ReadyApartmentUpsertArgs} args - Arguments to update or create a ReadyApartment.
     * @example
     * // Update or create a ReadyApartment
     * const readyApartment = await prisma.readyApartment.upsert({
     *   create: {
     *     // ... data to create a ReadyApartment
     *   },
     *   update: {
     *     // ... in case it already exists, update
     *   },
     *   where: {
     *     // ... the filter for the ReadyApartment we want to update
     *   }
     * })
     */
    upsert<T extends ReadyApartmentUpsertArgs>(args: SelectSubset<T, ReadyApartmentUpsertArgs<ExtArgs>>): Prisma__ReadyApartmentClient<$Result.GetResult<Prisma.$ReadyApartmentPayload<ExtArgs>, T, "upsert", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>


    /**
     * Count the number of ReadyApartments.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ReadyApartmentCountArgs} args - Arguments to filter ReadyApartments to count.
     * @example
     * // Count the number of ReadyApartments
     * const count = await prisma.readyApartment.count({
     *   where: {
     *     // ... the filter for the ReadyApartments we want to count
     *   }
     * })
    **/
    count<T extends ReadyApartmentCountArgs>(
      args?: Subset<T, ReadyApartmentCountArgs>,
    ): Prisma.PrismaPromise<
      T extends $Utils.Record<'select', any>
        ? T['select'] extends true
          ? number
          : GetScalarType<T['select'], ReadyApartmentCountAggregateOutputType>
        : number
    >

    /**
     * Allows you to perform aggregations operations on a ReadyApartment.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ReadyApartmentAggregateArgs} args - Select which aggregations you would like to apply and on what fields.
     * @example
     * // Ordered by age ascending
     * // Where email contains prisma.io
     * // Limited to the 10 users
     * const aggregations = await prisma.user.aggregate({
     *   _avg: {
     *     age: true,
     *   },
     *   where: {
     *     email: {
     *       contains: "prisma.io",
     *     },
     *   },
     *   orderBy: {
     *     age: "asc",
     *   },
     *   take: 10,
     * })
    **/
    aggregate<T extends ReadyApartmentAggregateArgs>(args: Subset<T, ReadyApartmentAggregateArgs>): Prisma.PrismaPromise<GetReadyApartmentAggregateType<T>>

    /**
     * Group by ReadyApartment.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ReadyApartmentGroupByArgs} args - Group by arguments.
     * @example
     * // Group by city, order by createdAt, get count
     * const result = await prisma.user.groupBy({
     *   by: ['city', 'createdAt'],
     *   orderBy: {
     *     createdAt: true
     *   },
     *   _count: {
     *     _all: true
     *   },
     * })
     * 
    **/
    groupBy<
      T extends ReadyApartmentGroupByArgs,
      HasSelectOrTake extends Or<
        Extends<'skip', Keys<T>>,
        Extends<'take', Keys<T>>
      >,
      OrderByArg extends True extends HasSelectOrTake
        ? { orderBy: ReadyApartmentGroupByArgs['orderBy'] }
        : { orderBy?: ReadyApartmentGroupByArgs['orderBy'] },
      OrderFields extends ExcludeUnderscoreKeys<Keys<MaybeTupleToUnion<T['orderBy']>>>,
      ByFields extends MaybeTupleToUnion<T['by']>,
      ByValid extends Has<ByFields, OrderFields>,
      HavingFields extends GetHavingFields<T['having']>,
      HavingValid extends Has<ByFields, HavingFields>,
      ByEmpty extends T['by'] extends never[] ? True : False,
      InputErrors extends ByEmpty extends True
      ? `Error: "by" must not be empty.`
      : HavingValid extends False
      ? {
          [P in HavingFields]: P extends ByFields
            ? never
            : P extends string
            ? `Error: Field "${P}" used in "having" needs to be provided in "by".`
            : [
                Error,
                'Field ',
                P,
                ` in "having" needs to be provided in "by"`,
              ]
        }[HavingFields]
      : 'take' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "take", you also need to provide "orderBy"'
      : 'skip' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "skip", you also need to provide "orderBy"'
      : ByValid extends True
      ? {}
      : {
          [P in OrderFields]: P extends ByFields
            ? never
            : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
        }[OrderFields]
    >(args: SubsetIntersection<T, ReadyApartmentGroupByArgs, OrderByArg> & InputErrors): {} extends InputErrors ? GetReadyApartmentGroupByPayload<T> : Prisma.PrismaPromise<InputErrors>
  /**
   * Fields of the ReadyApartment model
   */
  readonly fields: ReadyApartmentFieldRefs;
  }

  /**
   * The delegate class that acts as a "Promise-like" for ReadyApartment.
   * Why is this prefixed with `Prisma__`?
   * Because we want to prevent naming conflicts as mentioned in
   * https://github.com/prisma/prisma-client-js/issues/707
   */
  export interface Prisma__ReadyApartmentClient<T, Null = never, ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs, GlobalOmitOptions = {}> extends Prisma.PrismaPromise<T> {
    readonly [Symbol.toStringTag]: "PrismaPromise"
    images<T extends ReadyApartment$imagesArgs<ExtArgs> = {}>(args?: Subset<T, ReadyApartment$imagesArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$ImagePayload<ExtArgs>, T, "findMany", GlobalOmitOptions> | Null>
    /**
     * Attaches callbacks for the resolution and/or rejection of the Promise.
     * @param onfulfilled The callback to execute when the Promise is resolved.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of which ever callback is executed.
     */
    then<TResult1 = T, TResult2 = never>(onfulfilled?: ((value: T) => TResult1 | PromiseLike<TResult1>) | undefined | null, onrejected?: ((reason: any) => TResult2 | PromiseLike<TResult2>) | undefined | null): $Utils.JsPromise<TResult1 | TResult2>
    /**
     * Attaches a callback for only the rejection of the Promise.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of the callback.
     */
    catch<TResult = never>(onrejected?: ((reason: any) => TResult | PromiseLike<TResult>) | undefined | null): $Utils.JsPromise<T | TResult>
    /**
     * Attaches a callback that is invoked when the Promise is settled (fulfilled or rejected). The
     * resolved value cannot be modified from the callback.
     * @param onfinally The callback to execute when the Promise is settled (fulfilled or rejected).
     * @returns A Promise for the completion of the callback.
     */
    finally(onfinally?: (() => void) | undefined | null): $Utils.JsPromise<T>
  }




  /**
   * Fields of the ReadyApartment model
   */ 
  interface ReadyApartmentFieldRefs {
    readonly id: FieldRef<"ReadyApartment", 'Int'>
    readonly title: FieldRef<"ReadyApartment", 'String'>
    readonly complexName: FieldRef<"ReadyApartment", 'String'>
    readonly address: FieldRef<"ReadyApartment", 'String'>
    readonly city: FieldRef<"ReadyApartment", 'String'>
    readonly area: FieldRef<"ReadyApartment", 'Int'>
    readonly price: FieldRef<"ReadyApartment", 'Int'>
    readonly pricePerM2: FieldRef<"ReadyApartment", 'Int'>
    readonly bedrooms: FieldRef<"ReadyApartment", 'Int'>
    readonly floor: FieldRef<"ReadyApartment", 'Int'>
    readonly totalFloors: FieldRef<"ReadyApartment", 'Int'>
    readonly lat: FieldRef<"ReadyApartment", 'Float'>
    readonly lng: FieldRef<"ReadyApartment", 'Float'>
    readonly metro: FieldRef<"ReadyApartment", 'String'>
    readonly metroDistance: FieldRef<"ReadyApartment", 'Int'>
    readonly description: FieldRef<"ReadyApartment", 'String'>
    readonly developer: FieldRef<"ReadyApartment", 'String'>
    readonly createdAt: FieldRef<"ReadyApartment", 'DateTime'>
    readonly updatedAt: FieldRef<"ReadyApartment", 'DateTime'>
  }
    

  // Custom InputTypes
  /**
   * ReadyApartment findUnique
   */
  export type ReadyApartmentFindUniqueArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the ReadyApartment
     */
    select?: ReadyApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the ReadyApartment
     */
    omit?: ReadyApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ReadyApartmentInclude<ExtArgs> | null
    /**
     * Filter, which ReadyApartment to fetch.
     */
    where: ReadyApartmentWhereUniqueInput
  }

  /**
   * ReadyApartment findUniqueOrThrow
   */
  export type ReadyApartmentFindUniqueOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the ReadyApartment
     */
    select?: ReadyApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the ReadyApartment
     */
    omit?: ReadyApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ReadyApartmentInclude<ExtArgs> | null
    /**
     * Filter, which ReadyApartment to fetch.
     */
    where: ReadyApartmentWhereUniqueInput
  }

  /**
   * ReadyApartment findFirst
   */
  export type ReadyApartmentFindFirstArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the ReadyApartment
     */
    select?: ReadyApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the ReadyApartment
     */
    omit?: ReadyApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ReadyApartmentInclude<ExtArgs> | null
    /**
     * Filter, which ReadyApartment to fetch.
     */
    where?: ReadyApartmentWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of ReadyApartments to fetch.
     */
    orderBy?: ReadyApartmentOrderByWithRelationInput | ReadyApartmentOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for ReadyApartments.
     */
    cursor?: ReadyApartmentWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` ReadyApartments from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` ReadyApartments.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of ReadyApartments.
     */
    distinct?: ReadyApartmentScalarFieldEnum | ReadyApartmentScalarFieldEnum[]
  }

  /**
   * ReadyApartment findFirstOrThrow
   */
  export type ReadyApartmentFindFirstOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the ReadyApartment
     */
    select?: ReadyApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the ReadyApartment
     */
    omit?: ReadyApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ReadyApartmentInclude<ExtArgs> | null
    /**
     * Filter, which ReadyApartment to fetch.
     */
    where?: ReadyApartmentWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of ReadyApartments to fetch.
     */
    orderBy?: ReadyApartmentOrderByWithRelationInput | ReadyApartmentOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for ReadyApartments.
     */
    cursor?: ReadyApartmentWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` ReadyApartments from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` ReadyApartments.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of ReadyApartments.
     */
    distinct?: ReadyApartmentScalarFieldEnum | ReadyApartmentScalarFieldEnum[]
  }

  /**
   * ReadyApartment findMany
   */
  export type ReadyApartmentFindManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the ReadyApartment
     */
    select?: ReadyApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the ReadyApartment
     */
    omit?: ReadyApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ReadyApartmentInclude<ExtArgs> | null
    /**
     * Filter, which ReadyApartments to fetch.
     */
    where?: ReadyApartmentWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of ReadyApartments to fetch.
     */
    orderBy?: ReadyApartmentOrderByWithRelationInput | ReadyApartmentOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for listing ReadyApartments.
     */
    cursor?: ReadyApartmentWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` ReadyApartments from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` ReadyApartments.
     */
    skip?: number
    distinct?: ReadyApartmentScalarFieldEnum | ReadyApartmentScalarFieldEnum[]
  }

  /**
   * ReadyApartment create
   */
  export type ReadyApartmentCreateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the ReadyApartment
     */
    select?: ReadyApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the ReadyApartment
     */
    omit?: ReadyApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ReadyApartmentInclude<ExtArgs> | null
    /**
     * The data needed to create a ReadyApartment.
     */
    data: XOR<ReadyApartmentCreateInput, ReadyApartmentUncheckedCreateInput>
  }

  /**
   * ReadyApartment createMany
   */
  export type ReadyApartmentCreateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to create many ReadyApartments.
     */
    data: ReadyApartmentCreateManyInput | ReadyApartmentCreateManyInput[]
    skipDuplicates?: boolean
  }

  /**
   * ReadyApartment createManyAndReturn
   */
  export type ReadyApartmentCreateManyAndReturnArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the ReadyApartment
     */
    select?: ReadyApartmentSelectCreateManyAndReturn<ExtArgs> | null
    /**
     * Omit specific fields from the ReadyApartment
     */
    omit?: ReadyApartmentOmit<ExtArgs> | null
    /**
     * The data used to create many ReadyApartments.
     */
    data: ReadyApartmentCreateManyInput | ReadyApartmentCreateManyInput[]
    skipDuplicates?: boolean
  }

  /**
   * ReadyApartment update
   */
  export type ReadyApartmentUpdateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the ReadyApartment
     */
    select?: ReadyApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the ReadyApartment
     */
    omit?: ReadyApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ReadyApartmentInclude<ExtArgs> | null
    /**
     * The data needed to update a ReadyApartment.
     */
    data: XOR<ReadyApartmentUpdateInput, ReadyApartmentUncheckedUpdateInput>
    /**
     * Choose, which ReadyApartment to update.
     */
    where: ReadyApartmentWhereUniqueInput
  }

  /**
   * ReadyApartment updateMany
   */
  export type ReadyApartmentUpdateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to update ReadyApartments.
     */
    data: XOR<ReadyApartmentUpdateManyMutationInput, ReadyApartmentUncheckedUpdateManyInput>
    /**
     * Filter which ReadyApartments to update
     */
    where?: ReadyApartmentWhereInput
    /**
     * Limit how many ReadyApartments to update.
     */
    limit?: number
  }

  /**
   * ReadyApartment updateManyAndReturn
   */
  export type ReadyApartmentUpdateManyAndReturnArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the ReadyApartment
     */
    select?: ReadyApartmentSelectUpdateManyAndReturn<ExtArgs> | null
    /**
     * Omit specific fields from the ReadyApartment
     */
    omit?: ReadyApartmentOmit<ExtArgs> | null
    /**
     * The data used to update ReadyApartments.
     */
    data: XOR<ReadyApartmentUpdateManyMutationInput, ReadyApartmentUncheckedUpdateManyInput>
    /**
     * Filter which ReadyApartments to update
     */
    where?: ReadyApartmentWhereInput
    /**
     * Limit how many ReadyApartments to update.
     */
    limit?: number
  }

  /**
   * ReadyApartment upsert
   */
  export type ReadyApartmentUpsertArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the ReadyApartment
     */
    select?: ReadyApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the ReadyApartment
     */
    omit?: ReadyApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ReadyApartmentInclude<ExtArgs> | null
    /**
     * The filter to search for the ReadyApartment to update in case it exists.
     */
    where: ReadyApartmentWhereUniqueInput
    /**
     * In case the ReadyApartment found by the `where` argument doesn't exist, create a new ReadyApartment with this data.
     */
    create: XOR<ReadyApartmentCreateInput, ReadyApartmentUncheckedCreateInput>
    /**
     * In case the ReadyApartment was found with the provided `where` argument, update it with this data.
     */
    update: XOR<ReadyApartmentUpdateInput, ReadyApartmentUncheckedUpdateInput>
  }

  /**
   * ReadyApartment delete
   */
  export type ReadyApartmentDeleteArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the ReadyApartment
     */
    select?: ReadyApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the ReadyApartment
     */
    omit?: ReadyApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ReadyApartmentInclude<ExtArgs> | null
    /**
     * Filter which ReadyApartment to delete.
     */
    where: ReadyApartmentWhereUniqueInput
  }

  /**
   * ReadyApartment deleteMany
   */
  export type ReadyApartmentDeleteManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which ReadyApartments to delete
     */
    where?: ReadyApartmentWhereInput
    /**
     * Limit how many ReadyApartments to delete.
     */
    limit?: number
  }

  /**
   * ReadyApartment.images
   */
  export type ReadyApartment$imagesArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Image
     */
    select?: ImageSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Image
     */
    omit?: ImageOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ImageInclude<ExtArgs> | null
    where?: ImageWhereInput
    orderBy?: ImageOrderByWithRelationInput | ImageOrderByWithRelationInput[]
    cursor?: ImageWhereUniqueInput
    take?: number
    skip?: number
    distinct?: ImageScalarFieldEnum | ImageScalarFieldEnum[]
  }

  /**
   * ReadyApartment without action
   */
  export type ReadyApartmentDefaultArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the ReadyApartment
     */
    select?: ReadyApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the ReadyApartment
     */
    omit?: ReadyApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ReadyApartmentInclude<ExtArgs> | null
  }


  /**
   * Model RentalApartment
   */

  export type AggregateRentalApartment = {
    _count: RentalApartmentCountAggregateOutputType | null
    _avg: RentalApartmentAvgAggregateOutputType | null
    _sum: RentalApartmentSumAggregateOutputType | null
    _min: RentalApartmentMinAggregateOutputType | null
    _max: RentalApartmentMaxAggregateOutputType | null
  }

  export type RentalApartmentAvgAggregateOutputType = {
    id: number | null
    area: number | null
    pricePerMonth: number | null
    bedrooms: number | null
    lat: number | null
    lng: number | null
    floor: number | null
    totalFloors: number | null
    metroDistance: number | null
  }

  export type RentalApartmentSumAggregateOutputType = {
    id: number | null
    area: number | null
    pricePerMonth: number | null
    bedrooms: number | null
    lat: number | null
    lng: number | null
    floor: number | null
    totalFloors: number | null
    metroDistance: number | null
  }

  export type RentalApartmentMinAggregateOutputType = {
    id: number | null
    title: string | null
    address: string | null
    area: number | null
    pricePerMonth: number | null
    bedrooms: number | null
    lat: number | null
    lng: number | null
    floor: number | null
    totalFloors: number | null
    city: string | null
    metro: string | null
    metroDistance: number | null
    description: string | null
    createdAt: Date | null
    updatedAt: Date | null
  }

  export type RentalApartmentMaxAggregateOutputType = {
    id: number | null
    title: string | null
    address: string | null
    area: number | null
    pricePerMonth: number | null
    bedrooms: number | null
    lat: number | null
    lng: number | null
    floor: number | null
    totalFloors: number | null
    city: string | null
    metro: string | null
    metroDistance: number | null
    description: string | null
    createdAt: Date | null
    updatedAt: Date | null
  }

  export type RentalApartmentCountAggregateOutputType = {
    id: number
    title: number
    address: number
    area: number
    pricePerMonth: number
    bedrooms: number
    lat: number
    lng: number
    floor: number
    totalFloors: number
    city: number
    metro: number
    metroDistance: number
    description: number
    createdAt: number
    updatedAt: number
    _all: number
  }


  export type RentalApartmentAvgAggregateInputType = {
    id?: true
    area?: true
    pricePerMonth?: true
    bedrooms?: true
    lat?: true
    lng?: true
    floor?: true
    totalFloors?: true
    metroDistance?: true
  }

  export type RentalApartmentSumAggregateInputType = {
    id?: true
    area?: true
    pricePerMonth?: true
    bedrooms?: true
    lat?: true
    lng?: true
    floor?: true
    totalFloors?: true
    metroDistance?: true
  }

  export type RentalApartmentMinAggregateInputType = {
    id?: true
    title?: true
    address?: true
    area?: true
    pricePerMonth?: true
    bedrooms?: true
    lat?: true
    lng?: true
    floor?: true
    totalFloors?: true
    city?: true
    metro?: true
    metroDistance?: true
    description?: true
    createdAt?: true
    updatedAt?: true
  }

  export type RentalApartmentMaxAggregateInputType = {
    id?: true
    title?: true
    address?: true
    area?: true
    pricePerMonth?: true
    bedrooms?: true
    lat?: true
    lng?: true
    floor?: true
    totalFloors?: true
    city?: true
    metro?: true
    metroDistance?: true
    description?: true
    createdAt?: true
    updatedAt?: true
  }

  export type RentalApartmentCountAggregateInputType = {
    id?: true
    title?: true
    address?: true
    area?: true
    pricePerMonth?: true
    bedrooms?: true
    lat?: true
    lng?: true
    floor?: true
    totalFloors?: true
    city?: true
    metro?: true
    metroDistance?: true
    description?: true
    createdAt?: true
    updatedAt?: true
    _all?: true
  }

  export type RentalApartmentAggregateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which RentalApartment to aggregate.
     */
    where?: RentalApartmentWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of RentalApartments to fetch.
     */
    orderBy?: RentalApartmentOrderByWithRelationInput | RentalApartmentOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the start position
     */
    cursor?: RentalApartmentWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` RentalApartments from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` RentalApartments.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Count returned RentalApartments
    **/
    _count?: true | RentalApartmentCountAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to average
    **/
    _avg?: RentalApartmentAvgAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to sum
    **/
    _sum?: RentalApartmentSumAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the minimum value
    **/
    _min?: RentalApartmentMinAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the maximum value
    **/
    _max?: RentalApartmentMaxAggregateInputType
  }

  export type GetRentalApartmentAggregateType<T extends RentalApartmentAggregateArgs> = {
        [P in keyof T & keyof AggregateRentalApartment]: P extends '_count' | 'count'
      ? T[P] extends true
        ? number
        : GetScalarType<T[P], AggregateRentalApartment[P]>
      : GetScalarType<T[P], AggregateRentalApartment[P]>
  }




  export type RentalApartmentGroupByArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    where?: RentalApartmentWhereInput
    orderBy?: RentalApartmentOrderByWithAggregationInput | RentalApartmentOrderByWithAggregationInput[]
    by: RentalApartmentScalarFieldEnum[] | RentalApartmentScalarFieldEnum
    having?: RentalApartmentScalarWhereWithAggregatesInput
    take?: number
    skip?: number
    _count?: RentalApartmentCountAggregateInputType | true
    _avg?: RentalApartmentAvgAggregateInputType
    _sum?: RentalApartmentSumAggregateInputType
    _min?: RentalApartmentMinAggregateInputType
    _max?: RentalApartmentMaxAggregateInputType
  }

  export type RentalApartmentGroupByOutputType = {
    id: number
    title: string
    address: string
    area: number
    pricePerMonth: number
    bedrooms: number
    lat: number | null
    lng: number | null
    floor: number
    totalFloors: number
    city: string | null
    metro: string | null
    metroDistance: number | null
    description: string | null
    createdAt: Date
    updatedAt: Date
    _count: RentalApartmentCountAggregateOutputType | null
    _avg: RentalApartmentAvgAggregateOutputType | null
    _sum: RentalApartmentSumAggregateOutputType | null
    _min: RentalApartmentMinAggregateOutputType | null
    _max: RentalApartmentMaxAggregateOutputType | null
  }

  type GetRentalApartmentGroupByPayload<T extends RentalApartmentGroupByArgs> = Prisma.PrismaPromise<
    Array<
      PickEnumerable<RentalApartmentGroupByOutputType, T['by']> &
        {
          [P in ((keyof T) & (keyof RentalApartmentGroupByOutputType))]: P extends '_count'
            ? T[P] extends boolean
              ? number
              : GetScalarType<T[P], RentalApartmentGroupByOutputType[P]>
            : GetScalarType<T[P], RentalApartmentGroupByOutputType[P]>
        }
      >
    >


  export type RentalApartmentSelect<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    title?: boolean
    address?: boolean
    area?: boolean
    pricePerMonth?: boolean
    bedrooms?: boolean
    lat?: boolean
    lng?: boolean
    floor?: boolean
    totalFloors?: boolean
    city?: boolean
    metro?: boolean
    metroDistance?: boolean
    description?: boolean
    createdAt?: boolean
    updatedAt?: boolean
    images?: boolean | RentalApartment$imagesArgs<ExtArgs>
    _count?: boolean | RentalApartmentCountOutputTypeDefaultArgs<ExtArgs>
  }, ExtArgs["result"]["rentalApartment"]>

  export type RentalApartmentSelectCreateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    title?: boolean
    address?: boolean
    area?: boolean
    pricePerMonth?: boolean
    bedrooms?: boolean
    lat?: boolean
    lng?: boolean
    floor?: boolean
    totalFloors?: boolean
    city?: boolean
    metro?: boolean
    metroDistance?: boolean
    description?: boolean
    createdAt?: boolean
    updatedAt?: boolean
  }, ExtArgs["result"]["rentalApartment"]>

  export type RentalApartmentSelectUpdateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    title?: boolean
    address?: boolean
    area?: boolean
    pricePerMonth?: boolean
    bedrooms?: boolean
    lat?: boolean
    lng?: boolean
    floor?: boolean
    totalFloors?: boolean
    city?: boolean
    metro?: boolean
    metroDistance?: boolean
    description?: boolean
    createdAt?: boolean
    updatedAt?: boolean
  }, ExtArgs["result"]["rentalApartment"]>

  export type RentalApartmentSelectScalar = {
    id?: boolean
    title?: boolean
    address?: boolean
    area?: boolean
    pricePerMonth?: boolean
    bedrooms?: boolean
    lat?: boolean
    lng?: boolean
    floor?: boolean
    totalFloors?: boolean
    city?: boolean
    metro?: boolean
    metroDistance?: boolean
    description?: boolean
    createdAt?: boolean
    updatedAt?: boolean
  }

  export type RentalApartmentOmit<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetOmit<"id" | "title" | "address" | "area" | "pricePerMonth" | "bedrooms" | "lat" | "lng" | "floor" | "totalFloors" | "city" | "metro" | "metroDistance" | "description" | "createdAt" | "updatedAt", ExtArgs["result"]["rentalApartment"]>
  export type RentalApartmentInclude<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    images?: boolean | RentalApartment$imagesArgs<ExtArgs>
    _count?: boolean | RentalApartmentCountOutputTypeDefaultArgs<ExtArgs>
  }
  export type RentalApartmentIncludeCreateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {}
  export type RentalApartmentIncludeUpdateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {}

  export type $RentalApartmentPayload<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    name: "RentalApartment"
    objects: {
      images: Prisma.$ImagePayload<ExtArgs>[]
    }
    scalars: $Extensions.GetPayloadResult<{
      id: number
      title: string
      address: string
      area: number
      pricePerMonth: number
      bedrooms: number
      lat: number | null
      lng: number | null
      floor: number
      totalFloors: number
      city: string | null
      metro: string | null
      metroDistance: number | null
      description: string | null
      createdAt: Date
      updatedAt: Date
    }, ExtArgs["result"]["rentalApartment"]>
    composites: {}
  }

  type RentalApartmentGetPayload<S extends boolean | null | undefined | RentalApartmentDefaultArgs> = $Result.GetResult<Prisma.$RentalApartmentPayload, S>

  type RentalApartmentCountArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> =
    Omit<RentalApartmentFindManyArgs, 'select' | 'include' | 'distinct' | 'omit'> & {
      select?: RentalApartmentCountAggregateInputType | true
    }

  export interface RentalApartmentDelegate<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs, GlobalOmitOptions = {}> {
    [K: symbol]: { types: Prisma.TypeMap<ExtArgs>['model']['RentalApartment'], meta: { name: 'RentalApartment' } }
    /**
     * Find zero or one RentalApartment that matches the filter.
     * @param {RentalApartmentFindUniqueArgs} args - Arguments to find a RentalApartment
     * @example
     * // Get one RentalApartment
     * const rentalApartment = await prisma.rentalApartment.findUnique({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUnique<T extends RentalApartmentFindUniqueArgs>(args: SelectSubset<T, RentalApartmentFindUniqueArgs<ExtArgs>>): Prisma__RentalApartmentClient<$Result.GetResult<Prisma.$RentalApartmentPayload<ExtArgs>, T, "findUnique", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>

    /**
     * Find one RentalApartment that matches the filter or throw an error with `error.code='P2025'`
     * if no matches were found.
     * @param {RentalApartmentFindUniqueOrThrowArgs} args - Arguments to find a RentalApartment
     * @example
     * // Get one RentalApartment
     * const rentalApartment = await prisma.rentalApartment.findUniqueOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUniqueOrThrow<T extends RentalApartmentFindUniqueOrThrowArgs>(args: SelectSubset<T, RentalApartmentFindUniqueOrThrowArgs<ExtArgs>>): Prisma__RentalApartmentClient<$Result.GetResult<Prisma.$RentalApartmentPayload<ExtArgs>, T, "findUniqueOrThrow", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Find the first RentalApartment that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {RentalApartmentFindFirstArgs} args - Arguments to find a RentalApartment
     * @example
     * // Get one RentalApartment
     * const rentalApartment = await prisma.rentalApartment.findFirst({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirst<T extends RentalApartmentFindFirstArgs>(args?: SelectSubset<T, RentalApartmentFindFirstArgs<ExtArgs>>): Prisma__RentalApartmentClient<$Result.GetResult<Prisma.$RentalApartmentPayload<ExtArgs>, T, "findFirst", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>

    /**
     * Find the first RentalApartment that matches the filter or
     * throw `PrismaKnownClientError` with `P2025` code if no matches were found.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {RentalApartmentFindFirstOrThrowArgs} args - Arguments to find a RentalApartment
     * @example
     * // Get one RentalApartment
     * const rentalApartment = await prisma.rentalApartment.findFirstOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirstOrThrow<T extends RentalApartmentFindFirstOrThrowArgs>(args?: SelectSubset<T, RentalApartmentFindFirstOrThrowArgs<ExtArgs>>): Prisma__RentalApartmentClient<$Result.GetResult<Prisma.$RentalApartmentPayload<ExtArgs>, T, "findFirstOrThrow", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Find zero or more RentalApartments that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {RentalApartmentFindManyArgs} args - Arguments to filter and select certain fields only.
     * @example
     * // Get all RentalApartments
     * const rentalApartments = await prisma.rentalApartment.findMany()
     * 
     * // Get first 10 RentalApartments
     * const rentalApartments = await prisma.rentalApartment.findMany({ take: 10 })
     * 
     * // Only select the `id`
     * const rentalApartmentWithIdOnly = await prisma.rentalApartment.findMany({ select: { id: true } })
     * 
     */
    findMany<T extends RentalApartmentFindManyArgs>(args?: SelectSubset<T, RentalApartmentFindManyArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$RentalApartmentPayload<ExtArgs>, T, "findMany", GlobalOmitOptions>>

    /**
     * Create a RentalApartment.
     * @param {RentalApartmentCreateArgs} args - Arguments to create a RentalApartment.
     * @example
     * // Create one RentalApartment
     * const RentalApartment = await prisma.rentalApartment.create({
     *   data: {
     *     // ... data to create a RentalApartment
     *   }
     * })
     * 
     */
    create<T extends RentalApartmentCreateArgs>(args: SelectSubset<T, RentalApartmentCreateArgs<ExtArgs>>): Prisma__RentalApartmentClient<$Result.GetResult<Prisma.$RentalApartmentPayload<ExtArgs>, T, "create", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Create many RentalApartments.
     * @param {RentalApartmentCreateManyArgs} args - Arguments to create many RentalApartments.
     * @example
     * // Create many RentalApartments
     * const rentalApartment = await prisma.rentalApartment.createMany({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     *     
     */
    createMany<T extends RentalApartmentCreateManyArgs>(args?: SelectSubset<T, RentalApartmentCreateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Create many RentalApartments and returns the data saved in the database.
     * @param {RentalApartmentCreateManyAndReturnArgs} args - Arguments to create many RentalApartments.
     * @example
     * // Create many RentalApartments
     * const rentalApartment = await prisma.rentalApartment.createManyAndReturn({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * 
     * // Create many RentalApartments and only return the `id`
     * const rentalApartmentWithIdOnly = await prisma.rentalApartment.createManyAndReturn({
     *   select: { id: true },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * 
     */
    createManyAndReturn<T extends RentalApartmentCreateManyAndReturnArgs>(args?: SelectSubset<T, RentalApartmentCreateManyAndReturnArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$RentalApartmentPayload<ExtArgs>, T, "createManyAndReturn", GlobalOmitOptions>>

    /**
     * Delete a RentalApartment.
     * @param {RentalApartmentDeleteArgs} args - Arguments to delete one RentalApartment.
     * @example
     * // Delete one RentalApartment
     * const RentalApartment = await prisma.rentalApartment.delete({
     *   where: {
     *     // ... filter to delete one RentalApartment
     *   }
     * })
     * 
     */
    delete<T extends RentalApartmentDeleteArgs>(args: SelectSubset<T, RentalApartmentDeleteArgs<ExtArgs>>): Prisma__RentalApartmentClient<$Result.GetResult<Prisma.$RentalApartmentPayload<ExtArgs>, T, "delete", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Update one RentalApartment.
     * @param {RentalApartmentUpdateArgs} args - Arguments to update one RentalApartment.
     * @example
     * // Update one RentalApartment
     * const rentalApartment = await prisma.rentalApartment.update({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    update<T extends RentalApartmentUpdateArgs>(args: SelectSubset<T, RentalApartmentUpdateArgs<ExtArgs>>): Prisma__RentalApartmentClient<$Result.GetResult<Prisma.$RentalApartmentPayload<ExtArgs>, T, "update", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Delete zero or more RentalApartments.
     * @param {RentalApartmentDeleteManyArgs} args - Arguments to filter RentalApartments to delete.
     * @example
     * // Delete a few RentalApartments
     * const { count } = await prisma.rentalApartment.deleteMany({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     * 
     */
    deleteMany<T extends RentalApartmentDeleteManyArgs>(args?: SelectSubset<T, RentalApartmentDeleteManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Update zero or more RentalApartments.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {RentalApartmentUpdateManyArgs} args - Arguments to update one or more rows.
     * @example
     * // Update many RentalApartments
     * const rentalApartment = await prisma.rentalApartment.updateMany({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    updateMany<T extends RentalApartmentUpdateManyArgs>(args: SelectSubset<T, RentalApartmentUpdateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Update zero or more RentalApartments and returns the data updated in the database.
     * @param {RentalApartmentUpdateManyAndReturnArgs} args - Arguments to update many RentalApartments.
     * @example
     * // Update many RentalApartments
     * const rentalApartment = await prisma.rentalApartment.updateManyAndReturn({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * 
     * // Update zero or more RentalApartments and only return the `id`
     * const rentalApartmentWithIdOnly = await prisma.rentalApartment.updateManyAndReturn({
     *   select: { id: true },
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * 
     */
    updateManyAndReturn<T extends RentalApartmentUpdateManyAndReturnArgs>(args: SelectSubset<T, RentalApartmentUpdateManyAndReturnArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$RentalApartmentPayload<ExtArgs>, T, "updateManyAndReturn", GlobalOmitOptions>>

    /**
     * Create or update one RentalApartment.
     * @param {RentalApartmentUpsertArgs} args - Arguments to update or create a RentalApartment.
     * @example
     * // Update or create a RentalApartment
     * const rentalApartment = await prisma.rentalApartment.upsert({
     *   create: {
     *     // ... data to create a RentalApartment
     *   },
     *   update: {
     *     // ... in case it already exists, update
     *   },
     *   where: {
     *     // ... the filter for the RentalApartment we want to update
     *   }
     * })
     */
    upsert<T extends RentalApartmentUpsertArgs>(args: SelectSubset<T, RentalApartmentUpsertArgs<ExtArgs>>): Prisma__RentalApartmentClient<$Result.GetResult<Prisma.$RentalApartmentPayload<ExtArgs>, T, "upsert", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>


    /**
     * Count the number of RentalApartments.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {RentalApartmentCountArgs} args - Arguments to filter RentalApartments to count.
     * @example
     * // Count the number of RentalApartments
     * const count = await prisma.rentalApartment.count({
     *   where: {
     *     // ... the filter for the RentalApartments we want to count
     *   }
     * })
    **/
    count<T extends RentalApartmentCountArgs>(
      args?: Subset<T, RentalApartmentCountArgs>,
    ): Prisma.PrismaPromise<
      T extends $Utils.Record<'select', any>
        ? T['select'] extends true
          ? number
          : GetScalarType<T['select'], RentalApartmentCountAggregateOutputType>
        : number
    >

    /**
     * Allows you to perform aggregations operations on a RentalApartment.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {RentalApartmentAggregateArgs} args - Select which aggregations you would like to apply and on what fields.
     * @example
     * // Ordered by age ascending
     * // Where email contains prisma.io
     * // Limited to the 10 users
     * const aggregations = await prisma.user.aggregate({
     *   _avg: {
     *     age: true,
     *   },
     *   where: {
     *     email: {
     *       contains: "prisma.io",
     *     },
     *   },
     *   orderBy: {
     *     age: "asc",
     *   },
     *   take: 10,
     * })
    **/
    aggregate<T extends RentalApartmentAggregateArgs>(args: Subset<T, RentalApartmentAggregateArgs>): Prisma.PrismaPromise<GetRentalApartmentAggregateType<T>>

    /**
     * Group by RentalApartment.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {RentalApartmentGroupByArgs} args - Group by arguments.
     * @example
     * // Group by city, order by createdAt, get count
     * const result = await prisma.user.groupBy({
     *   by: ['city', 'createdAt'],
     *   orderBy: {
     *     createdAt: true
     *   },
     *   _count: {
     *     _all: true
     *   },
     * })
     * 
    **/
    groupBy<
      T extends RentalApartmentGroupByArgs,
      HasSelectOrTake extends Or<
        Extends<'skip', Keys<T>>,
        Extends<'take', Keys<T>>
      >,
      OrderByArg extends True extends HasSelectOrTake
        ? { orderBy: RentalApartmentGroupByArgs['orderBy'] }
        : { orderBy?: RentalApartmentGroupByArgs['orderBy'] },
      OrderFields extends ExcludeUnderscoreKeys<Keys<MaybeTupleToUnion<T['orderBy']>>>,
      ByFields extends MaybeTupleToUnion<T['by']>,
      ByValid extends Has<ByFields, OrderFields>,
      HavingFields extends GetHavingFields<T['having']>,
      HavingValid extends Has<ByFields, HavingFields>,
      ByEmpty extends T['by'] extends never[] ? True : False,
      InputErrors extends ByEmpty extends True
      ? `Error: "by" must not be empty.`
      : HavingValid extends False
      ? {
          [P in HavingFields]: P extends ByFields
            ? never
            : P extends string
            ? `Error: Field "${P}" used in "having" needs to be provided in "by".`
            : [
                Error,
                'Field ',
                P,
                ` in "having" needs to be provided in "by"`,
              ]
        }[HavingFields]
      : 'take' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "take", you also need to provide "orderBy"'
      : 'skip' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "skip", you also need to provide "orderBy"'
      : ByValid extends True
      ? {}
      : {
          [P in OrderFields]: P extends ByFields
            ? never
            : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
        }[OrderFields]
    >(args: SubsetIntersection<T, RentalApartmentGroupByArgs, OrderByArg> & InputErrors): {} extends InputErrors ? GetRentalApartmentGroupByPayload<T> : Prisma.PrismaPromise<InputErrors>
  /**
   * Fields of the RentalApartment model
   */
  readonly fields: RentalApartmentFieldRefs;
  }

  /**
   * The delegate class that acts as a "Promise-like" for RentalApartment.
   * Why is this prefixed with `Prisma__`?
   * Because we want to prevent naming conflicts as mentioned in
   * https://github.com/prisma/prisma-client-js/issues/707
   */
  export interface Prisma__RentalApartmentClient<T, Null = never, ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs, GlobalOmitOptions = {}> extends Prisma.PrismaPromise<T> {
    readonly [Symbol.toStringTag]: "PrismaPromise"
    images<T extends RentalApartment$imagesArgs<ExtArgs> = {}>(args?: Subset<T, RentalApartment$imagesArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$ImagePayload<ExtArgs>, T, "findMany", GlobalOmitOptions> | Null>
    /**
     * Attaches callbacks for the resolution and/or rejection of the Promise.
     * @param onfulfilled The callback to execute when the Promise is resolved.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of which ever callback is executed.
     */
    then<TResult1 = T, TResult2 = never>(onfulfilled?: ((value: T) => TResult1 | PromiseLike<TResult1>) | undefined | null, onrejected?: ((reason: any) => TResult2 | PromiseLike<TResult2>) | undefined | null): $Utils.JsPromise<TResult1 | TResult2>
    /**
     * Attaches a callback for only the rejection of the Promise.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of the callback.
     */
    catch<TResult = never>(onrejected?: ((reason: any) => TResult | PromiseLike<TResult>) | undefined | null): $Utils.JsPromise<T | TResult>
    /**
     * Attaches a callback that is invoked when the Promise is settled (fulfilled or rejected). The
     * resolved value cannot be modified from the callback.
     * @param onfinally The callback to execute when the Promise is settled (fulfilled or rejected).
     * @returns A Promise for the completion of the callback.
     */
    finally(onfinally?: (() => void) | undefined | null): $Utils.JsPromise<T>
  }




  /**
   * Fields of the RentalApartment model
   */ 
  interface RentalApartmentFieldRefs {
    readonly id: FieldRef<"RentalApartment", 'Int'>
    readonly title: FieldRef<"RentalApartment", 'String'>
    readonly address: FieldRef<"RentalApartment", 'String'>
    readonly area: FieldRef<"RentalApartment", 'Int'>
    readonly pricePerMonth: FieldRef<"RentalApartment", 'Int'>
    readonly bedrooms: FieldRef<"RentalApartment", 'Int'>
    readonly lat: FieldRef<"RentalApartment", 'Float'>
    readonly lng: FieldRef<"RentalApartment", 'Float'>
    readonly floor: FieldRef<"RentalApartment", 'Int'>
    readonly totalFloors: FieldRef<"RentalApartment", 'Int'>
    readonly city: FieldRef<"RentalApartment", 'String'>
    readonly metro: FieldRef<"RentalApartment", 'String'>
    readonly metroDistance: FieldRef<"RentalApartment", 'Int'>
    readonly description: FieldRef<"RentalApartment", 'String'>
    readonly createdAt: FieldRef<"RentalApartment", 'DateTime'>
    readonly updatedAt: FieldRef<"RentalApartment", 'DateTime'>
  }
    

  // Custom InputTypes
  /**
   * RentalApartment findUnique
   */
  export type RentalApartmentFindUniqueArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the RentalApartment
     */
    select?: RentalApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the RentalApartment
     */
    omit?: RentalApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: RentalApartmentInclude<ExtArgs> | null
    /**
     * Filter, which RentalApartment to fetch.
     */
    where: RentalApartmentWhereUniqueInput
  }

  /**
   * RentalApartment findUniqueOrThrow
   */
  export type RentalApartmentFindUniqueOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the RentalApartment
     */
    select?: RentalApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the RentalApartment
     */
    omit?: RentalApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: RentalApartmentInclude<ExtArgs> | null
    /**
     * Filter, which RentalApartment to fetch.
     */
    where: RentalApartmentWhereUniqueInput
  }

  /**
   * RentalApartment findFirst
   */
  export type RentalApartmentFindFirstArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the RentalApartment
     */
    select?: RentalApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the RentalApartment
     */
    omit?: RentalApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: RentalApartmentInclude<ExtArgs> | null
    /**
     * Filter, which RentalApartment to fetch.
     */
    where?: RentalApartmentWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of RentalApartments to fetch.
     */
    orderBy?: RentalApartmentOrderByWithRelationInput | RentalApartmentOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for RentalApartments.
     */
    cursor?: RentalApartmentWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` RentalApartments from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` RentalApartments.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of RentalApartments.
     */
    distinct?: RentalApartmentScalarFieldEnum | RentalApartmentScalarFieldEnum[]
  }

  /**
   * RentalApartment findFirstOrThrow
   */
  export type RentalApartmentFindFirstOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the RentalApartment
     */
    select?: RentalApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the RentalApartment
     */
    omit?: RentalApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: RentalApartmentInclude<ExtArgs> | null
    /**
     * Filter, which RentalApartment to fetch.
     */
    where?: RentalApartmentWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of RentalApartments to fetch.
     */
    orderBy?: RentalApartmentOrderByWithRelationInput | RentalApartmentOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for RentalApartments.
     */
    cursor?: RentalApartmentWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` RentalApartments from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` RentalApartments.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of RentalApartments.
     */
    distinct?: RentalApartmentScalarFieldEnum | RentalApartmentScalarFieldEnum[]
  }

  /**
   * RentalApartment findMany
   */
  export type RentalApartmentFindManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the RentalApartment
     */
    select?: RentalApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the RentalApartment
     */
    omit?: RentalApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: RentalApartmentInclude<ExtArgs> | null
    /**
     * Filter, which RentalApartments to fetch.
     */
    where?: RentalApartmentWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of RentalApartments to fetch.
     */
    orderBy?: RentalApartmentOrderByWithRelationInput | RentalApartmentOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for listing RentalApartments.
     */
    cursor?: RentalApartmentWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` RentalApartments from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` RentalApartments.
     */
    skip?: number
    distinct?: RentalApartmentScalarFieldEnum | RentalApartmentScalarFieldEnum[]
  }

  /**
   * RentalApartment create
   */
  export type RentalApartmentCreateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the RentalApartment
     */
    select?: RentalApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the RentalApartment
     */
    omit?: RentalApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: RentalApartmentInclude<ExtArgs> | null
    /**
     * The data needed to create a RentalApartment.
     */
    data: XOR<RentalApartmentCreateInput, RentalApartmentUncheckedCreateInput>
  }

  /**
   * RentalApartment createMany
   */
  export type RentalApartmentCreateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to create many RentalApartments.
     */
    data: RentalApartmentCreateManyInput | RentalApartmentCreateManyInput[]
    skipDuplicates?: boolean
  }

  /**
   * RentalApartment createManyAndReturn
   */
  export type RentalApartmentCreateManyAndReturnArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the RentalApartment
     */
    select?: RentalApartmentSelectCreateManyAndReturn<ExtArgs> | null
    /**
     * Omit specific fields from the RentalApartment
     */
    omit?: RentalApartmentOmit<ExtArgs> | null
    /**
     * The data used to create many RentalApartments.
     */
    data: RentalApartmentCreateManyInput | RentalApartmentCreateManyInput[]
    skipDuplicates?: boolean
  }

  /**
   * RentalApartment update
   */
  export type RentalApartmentUpdateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the RentalApartment
     */
    select?: RentalApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the RentalApartment
     */
    omit?: RentalApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: RentalApartmentInclude<ExtArgs> | null
    /**
     * The data needed to update a RentalApartment.
     */
    data: XOR<RentalApartmentUpdateInput, RentalApartmentUncheckedUpdateInput>
    /**
     * Choose, which RentalApartment to update.
     */
    where: RentalApartmentWhereUniqueInput
  }

  /**
   * RentalApartment updateMany
   */
  export type RentalApartmentUpdateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to update RentalApartments.
     */
    data: XOR<RentalApartmentUpdateManyMutationInput, RentalApartmentUncheckedUpdateManyInput>
    /**
     * Filter which RentalApartments to update
     */
    where?: RentalApartmentWhereInput
    /**
     * Limit how many RentalApartments to update.
     */
    limit?: number
  }

  /**
   * RentalApartment updateManyAndReturn
   */
  export type RentalApartmentUpdateManyAndReturnArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the RentalApartment
     */
    select?: RentalApartmentSelectUpdateManyAndReturn<ExtArgs> | null
    /**
     * Omit specific fields from the RentalApartment
     */
    omit?: RentalApartmentOmit<ExtArgs> | null
    /**
     * The data used to update RentalApartments.
     */
    data: XOR<RentalApartmentUpdateManyMutationInput, RentalApartmentUncheckedUpdateManyInput>
    /**
     * Filter which RentalApartments to update
     */
    where?: RentalApartmentWhereInput
    /**
     * Limit how many RentalApartments to update.
     */
    limit?: number
  }

  /**
   * RentalApartment upsert
   */
  export type RentalApartmentUpsertArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the RentalApartment
     */
    select?: RentalApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the RentalApartment
     */
    omit?: RentalApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: RentalApartmentInclude<ExtArgs> | null
    /**
     * The filter to search for the RentalApartment to update in case it exists.
     */
    where: RentalApartmentWhereUniqueInput
    /**
     * In case the RentalApartment found by the `where` argument doesn't exist, create a new RentalApartment with this data.
     */
    create: XOR<RentalApartmentCreateInput, RentalApartmentUncheckedCreateInput>
    /**
     * In case the RentalApartment was found with the provided `where` argument, update it with this data.
     */
    update: XOR<RentalApartmentUpdateInput, RentalApartmentUncheckedUpdateInput>
  }

  /**
   * RentalApartment delete
   */
  export type RentalApartmentDeleteArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the RentalApartment
     */
    select?: RentalApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the RentalApartment
     */
    omit?: RentalApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: RentalApartmentInclude<ExtArgs> | null
    /**
     * Filter which RentalApartment to delete.
     */
    where: RentalApartmentWhereUniqueInput
  }

  /**
   * RentalApartment deleteMany
   */
  export type RentalApartmentDeleteManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which RentalApartments to delete
     */
    where?: RentalApartmentWhereInput
    /**
     * Limit how many RentalApartments to delete.
     */
    limit?: number
  }

  /**
   * RentalApartment.images
   */
  export type RentalApartment$imagesArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Image
     */
    select?: ImageSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Image
     */
    omit?: ImageOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ImageInclude<ExtArgs> | null
    where?: ImageWhereInput
    orderBy?: ImageOrderByWithRelationInput | ImageOrderByWithRelationInput[]
    cursor?: ImageWhereUniqueInput
    take?: number
    skip?: number
    distinct?: ImageScalarFieldEnum | ImageScalarFieldEnum[]
  }

  /**
   * RentalApartment without action
   */
  export type RentalApartmentDefaultArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the RentalApartment
     */
    select?: RentalApartmentSelect<ExtArgs> | null
    /**
     * Omit specific fields from the RentalApartment
     */
    omit?: RentalApartmentOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: RentalApartmentInclude<ExtArgs> | null
  }


  /**
   * Model CountryProperty
   */

  export type AggregateCountryProperty = {
    _count: CountryPropertyCountAggregateOutputType | null
    _avg: CountryPropertyAvgAggregateOutputType | null
    _sum: CountryPropertySumAggregateOutputType | null
    _min: CountryPropertyMinAggregateOutputType | null
    _max: CountryPropertyMaxAggregateOutputType | null
  }

  export type CountryPropertyAvgAggregateOutputType = {
    id: number | null
    metroDistance: number | null
    price: number | null
    lat: number | null
    lng: number | null
    landArea: number | null
    bedrooms: number | null
    totalFloors: number | null
    pricePerM2: number | null
  }

  export type CountryPropertySumAggregateOutputType = {
    id: number | null
    metroDistance: number | null
    price: number | null
    lat: number | null
    lng: number | null
    landArea: number | null
    bedrooms: number | null
    totalFloors: number | null
    pricePerM2: number | null
  }

  export type CountryPropertyMinAggregateOutputType = {
    id: number | null
    title: string | null
    address: string | null
    metro: string | null
    metroDistance: number | null
    city: string | null
    price: number | null
    lat: number | null
    lng: number | null
    landArea: number | null
    bedrooms: number | null
    totalFloors: number | null
    pricePerM2: number | null
    description: string | null
    createdAt: Date | null
    updatedAt: Date | null
  }

  export type CountryPropertyMaxAggregateOutputType = {
    id: number | null
    title: string | null
    address: string | null
    metro: string | null
    metroDistance: number | null
    city: string | null
    price: number | null
    lat: number | null
    lng: number | null
    landArea: number | null
    bedrooms: number | null
    totalFloors: number | null
    pricePerM2: number | null
    description: string | null
    createdAt: Date | null
    updatedAt: Date | null
  }

  export type CountryPropertyCountAggregateOutputType = {
    id: number
    title: number
    address: number
    metro: number
    metroDistance: number
    city: number
    price: number
    lat: number
    lng: number
    landArea: number
    bedrooms: number
    totalFloors: number
    pricePerM2: number
    description: number
    createdAt: number
    updatedAt: number
    _all: number
  }


  export type CountryPropertyAvgAggregateInputType = {
    id?: true
    metroDistance?: true
    price?: true
    lat?: true
    lng?: true
    landArea?: true
    bedrooms?: true
    totalFloors?: true
    pricePerM2?: true
  }

  export type CountryPropertySumAggregateInputType = {
    id?: true
    metroDistance?: true
    price?: true
    lat?: true
    lng?: true
    landArea?: true
    bedrooms?: true
    totalFloors?: true
    pricePerM2?: true
  }

  export type CountryPropertyMinAggregateInputType = {
    id?: true
    title?: true
    address?: true
    metro?: true
    metroDistance?: true
    city?: true
    price?: true
    lat?: true
    lng?: true
    landArea?: true
    bedrooms?: true
    totalFloors?: true
    pricePerM2?: true
    description?: true
    createdAt?: true
    updatedAt?: true
  }

  export type CountryPropertyMaxAggregateInputType = {
    id?: true
    title?: true
    address?: true
    metro?: true
    metroDistance?: true
    city?: true
    price?: true
    lat?: true
    lng?: true
    landArea?: true
    bedrooms?: true
    totalFloors?: true
    pricePerM2?: true
    description?: true
    createdAt?: true
    updatedAt?: true
  }

  export type CountryPropertyCountAggregateInputType = {
    id?: true
    title?: true
    address?: true
    metro?: true
    metroDistance?: true
    city?: true
    price?: true
    lat?: true
    lng?: true
    landArea?: true
    bedrooms?: true
    totalFloors?: true
    pricePerM2?: true
    description?: true
    createdAt?: true
    updatedAt?: true
    _all?: true
  }

  export type CountryPropertyAggregateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which CountryProperty to aggregate.
     */
    where?: CountryPropertyWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of CountryProperties to fetch.
     */
    orderBy?: CountryPropertyOrderByWithRelationInput | CountryPropertyOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the start position
     */
    cursor?: CountryPropertyWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` CountryProperties from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` CountryProperties.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Count returned CountryProperties
    **/
    _count?: true | CountryPropertyCountAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to average
    **/
    _avg?: CountryPropertyAvgAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to sum
    **/
    _sum?: CountryPropertySumAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the minimum value
    **/
    _min?: CountryPropertyMinAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the maximum value
    **/
    _max?: CountryPropertyMaxAggregateInputType
  }

  export type GetCountryPropertyAggregateType<T extends CountryPropertyAggregateArgs> = {
        [P in keyof T & keyof AggregateCountryProperty]: P extends '_count' | 'count'
      ? T[P] extends true
        ? number
        : GetScalarType<T[P], AggregateCountryProperty[P]>
      : GetScalarType<T[P], AggregateCountryProperty[P]>
  }




  export type CountryPropertyGroupByArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    where?: CountryPropertyWhereInput
    orderBy?: CountryPropertyOrderByWithAggregationInput | CountryPropertyOrderByWithAggregationInput[]
    by: CountryPropertyScalarFieldEnum[] | CountryPropertyScalarFieldEnum
    having?: CountryPropertyScalarWhereWithAggregatesInput
    take?: number
    skip?: number
    _count?: CountryPropertyCountAggregateInputType | true
    _avg?: CountryPropertyAvgAggregateInputType
    _sum?: CountryPropertySumAggregateInputType
    _min?: CountryPropertyMinAggregateInputType
    _max?: CountryPropertyMaxAggregateInputType
  }

  export type CountryPropertyGroupByOutputType = {
    id: number
    title: string
    address: string
    metro: string | null
    metroDistance: number | null
    city: string | null
    price: number
    lat: number | null
    lng: number | null
    landArea: number
    bedrooms: number
    totalFloors: number
    pricePerM2: number
    description: string | null
    createdAt: Date
    updatedAt: Date
    _count: CountryPropertyCountAggregateOutputType | null
    _avg: CountryPropertyAvgAggregateOutputType | null
    _sum: CountryPropertySumAggregateOutputType | null
    _min: CountryPropertyMinAggregateOutputType | null
    _max: CountryPropertyMaxAggregateOutputType | null
  }

  type GetCountryPropertyGroupByPayload<T extends CountryPropertyGroupByArgs> = Prisma.PrismaPromise<
    Array<
      PickEnumerable<CountryPropertyGroupByOutputType, T['by']> &
        {
          [P in ((keyof T) & (keyof CountryPropertyGroupByOutputType))]: P extends '_count'
            ? T[P] extends boolean
              ? number
              : GetScalarType<T[P], CountryPropertyGroupByOutputType[P]>
            : GetScalarType<T[P], CountryPropertyGroupByOutputType[P]>
        }
      >
    >


  export type CountryPropertySelect<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    title?: boolean
    address?: boolean
    metro?: boolean
    metroDistance?: boolean
    city?: boolean
    price?: boolean
    lat?: boolean
    lng?: boolean
    landArea?: boolean
    bedrooms?: boolean
    totalFloors?: boolean
    pricePerM2?: boolean
    description?: boolean
    createdAt?: boolean
    updatedAt?: boolean
    images?: boolean | CountryProperty$imagesArgs<ExtArgs>
    _count?: boolean | CountryPropertyCountOutputTypeDefaultArgs<ExtArgs>
  }, ExtArgs["result"]["countryProperty"]>

  export type CountryPropertySelectCreateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    title?: boolean
    address?: boolean
    metro?: boolean
    metroDistance?: boolean
    city?: boolean
    price?: boolean
    lat?: boolean
    lng?: boolean
    landArea?: boolean
    bedrooms?: boolean
    totalFloors?: boolean
    pricePerM2?: boolean
    description?: boolean
    createdAt?: boolean
    updatedAt?: boolean
  }, ExtArgs["result"]["countryProperty"]>

  export type CountryPropertySelectUpdateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    title?: boolean
    address?: boolean
    metro?: boolean
    metroDistance?: boolean
    city?: boolean
    price?: boolean
    lat?: boolean
    lng?: boolean
    landArea?: boolean
    bedrooms?: boolean
    totalFloors?: boolean
    pricePerM2?: boolean
    description?: boolean
    createdAt?: boolean
    updatedAt?: boolean
  }, ExtArgs["result"]["countryProperty"]>

  export type CountryPropertySelectScalar = {
    id?: boolean
    title?: boolean
    address?: boolean
    metro?: boolean
    metroDistance?: boolean
    city?: boolean
    price?: boolean
    lat?: boolean
    lng?: boolean
    landArea?: boolean
    bedrooms?: boolean
    totalFloors?: boolean
    pricePerM2?: boolean
    description?: boolean
    createdAt?: boolean
    updatedAt?: boolean
  }

  export type CountryPropertyOmit<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetOmit<"id" | "title" | "address" | "metro" | "metroDistance" | "city" | "price" | "lat" | "lng" | "landArea" | "bedrooms" | "totalFloors" | "pricePerM2" | "description" | "createdAt" | "updatedAt", ExtArgs["result"]["countryProperty"]>
  export type CountryPropertyInclude<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    images?: boolean | CountryProperty$imagesArgs<ExtArgs>
    _count?: boolean | CountryPropertyCountOutputTypeDefaultArgs<ExtArgs>
  }
  export type CountryPropertyIncludeCreateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {}
  export type CountryPropertyIncludeUpdateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {}

  export type $CountryPropertyPayload<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    name: "CountryProperty"
    objects: {
      images: Prisma.$ImagePayload<ExtArgs>[]
    }
    scalars: $Extensions.GetPayloadResult<{
      id: number
      title: string
      address: string
      metro: string | null
      metroDistance: number | null
      city: string | null
      price: number
      lat: number | null
      lng: number | null
      landArea: number
      bedrooms: number
      totalFloors: number
      pricePerM2: number
      description: string | null
      createdAt: Date
      updatedAt: Date
    }, ExtArgs["result"]["countryProperty"]>
    composites: {}
  }

  type CountryPropertyGetPayload<S extends boolean | null | undefined | CountryPropertyDefaultArgs> = $Result.GetResult<Prisma.$CountryPropertyPayload, S>

  type CountryPropertyCountArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> =
    Omit<CountryPropertyFindManyArgs, 'select' | 'include' | 'distinct' | 'omit'> & {
      select?: CountryPropertyCountAggregateInputType | true
    }

  export interface CountryPropertyDelegate<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs, GlobalOmitOptions = {}> {
    [K: symbol]: { types: Prisma.TypeMap<ExtArgs>['model']['CountryProperty'], meta: { name: 'CountryProperty' } }
    /**
     * Find zero or one CountryProperty that matches the filter.
     * @param {CountryPropertyFindUniqueArgs} args - Arguments to find a CountryProperty
     * @example
     * // Get one CountryProperty
     * const countryProperty = await prisma.countryProperty.findUnique({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUnique<T extends CountryPropertyFindUniqueArgs>(args: SelectSubset<T, CountryPropertyFindUniqueArgs<ExtArgs>>): Prisma__CountryPropertyClient<$Result.GetResult<Prisma.$CountryPropertyPayload<ExtArgs>, T, "findUnique", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>

    /**
     * Find one CountryProperty that matches the filter or throw an error with `error.code='P2025'`
     * if no matches were found.
     * @param {CountryPropertyFindUniqueOrThrowArgs} args - Arguments to find a CountryProperty
     * @example
     * // Get one CountryProperty
     * const countryProperty = await prisma.countryProperty.findUniqueOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUniqueOrThrow<T extends CountryPropertyFindUniqueOrThrowArgs>(args: SelectSubset<T, CountryPropertyFindUniqueOrThrowArgs<ExtArgs>>): Prisma__CountryPropertyClient<$Result.GetResult<Prisma.$CountryPropertyPayload<ExtArgs>, T, "findUniqueOrThrow", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Find the first CountryProperty that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CountryPropertyFindFirstArgs} args - Arguments to find a CountryProperty
     * @example
     * // Get one CountryProperty
     * const countryProperty = await prisma.countryProperty.findFirst({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirst<T extends CountryPropertyFindFirstArgs>(args?: SelectSubset<T, CountryPropertyFindFirstArgs<ExtArgs>>): Prisma__CountryPropertyClient<$Result.GetResult<Prisma.$CountryPropertyPayload<ExtArgs>, T, "findFirst", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>

    /**
     * Find the first CountryProperty that matches the filter or
     * throw `PrismaKnownClientError` with `P2025` code if no matches were found.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CountryPropertyFindFirstOrThrowArgs} args - Arguments to find a CountryProperty
     * @example
     * // Get one CountryProperty
     * const countryProperty = await prisma.countryProperty.findFirstOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirstOrThrow<T extends CountryPropertyFindFirstOrThrowArgs>(args?: SelectSubset<T, CountryPropertyFindFirstOrThrowArgs<ExtArgs>>): Prisma__CountryPropertyClient<$Result.GetResult<Prisma.$CountryPropertyPayload<ExtArgs>, T, "findFirstOrThrow", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Find zero or more CountryProperties that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CountryPropertyFindManyArgs} args - Arguments to filter and select certain fields only.
     * @example
     * // Get all CountryProperties
     * const countryProperties = await prisma.countryProperty.findMany()
     * 
     * // Get first 10 CountryProperties
     * const countryProperties = await prisma.countryProperty.findMany({ take: 10 })
     * 
     * // Only select the `id`
     * const countryPropertyWithIdOnly = await prisma.countryProperty.findMany({ select: { id: true } })
     * 
     */
    findMany<T extends CountryPropertyFindManyArgs>(args?: SelectSubset<T, CountryPropertyFindManyArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$CountryPropertyPayload<ExtArgs>, T, "findMany", GlobalOmitOptions>>

    /**
     * Create a CountryProperty.
     * @param {CountryPropertyCreateArgs} args - Arguments to create a CountryProperty.
     * @example
     * // Create one CountryProperty
     * const CountryProperty = await prisma.countryProperty.create({
     *   data: {
     *     // ... data to create a CountryProperty
     *   }
     * })
     * 
     */
    create<T extends CountryPropertyCreateArgs>(args: SelectSubset<T, CountryPropertyCreateArgs<ExtArgs>>): Prisma__CountryPropertyClient<$Result.GetResult<Prisma.$CountryPropertyPayload<ExtArgs>, T, "create", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Create many CountryProperties.
     * @param {CountryPropertyCreateManyArgs} args - Arguments to create many CountryProperties.
     * @example
     * // Create many CountryProperties
     * const countryProperty = await prisma.countryProperty.createMany({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     *     
     */
    createMany<T extends CountryPropertyCreateManyArgs>(args?: SelectSubset<T, CountryPropertyCreateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Create many CountryProperties and returns the data saved in the database.
     * @param {CountryPropertyCreateManyAndReturnArgs} args - Arguments to create many CountryProperties.
     * @example
     * // Create many CountryProperties
     * const countryProperty = await prisma.countryProperty.createManyAndReturn({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * 
     * // Create many CountryProperties and only return the `id`
     * const countryPropertyWithIdOnly = await prisma.countryProperty.createManyAndReturn({
     *   select: { id: true },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * 
     */
    createManyAndReturn<T extends CountryPropertyCreateManyAndReturnArgs>(args?: SelectSubset<T, CountryPropertyCreateManyAndReturnArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$CountryPropertyPayload<ExtArgs>, T, "createManyAndReturn", GlobalOmitOptions>>

    /**
     * Delete a CountryProperty.
     * @param {CountryPropertyDeleteArgs} args - Arguments to delete one CountryProperty.
     * @example
     * // Delete one CountryProperty
     * const CountryProperty = await prisma.countryProperty.delete({
     *   where: {
     *     // ... filter to delete one CountryProperty
     *   }
     * })
     * 
     */
    delete<T extends CountryPropertyDeleteArgs>(args: SelectSubset<T, CountryPropertyDeleteArgs<ExtArgs>>): Prisma__CountryPropertyClient<$Result.GetResult<Prisma.$CountryPropertyPayload<ExtArgs>, T, "delete", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Update one CountryProperty.
     * @param {CountryPropertyUpdateArgs} args - Arguments to update one CountryProperty.
     * @example
     * // Update one CountryProperty
     * const countryProperty = await prisma.countryProperty.update({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    update<T extends CountryPropertyUpdateArgs>(args: SelectSubset<T, CountryPropertyUpdateArgs<ExtArgs>>): Prisma__CountryPropertyClient<$Result.GetResult<Prisma.$CountryPropertyPayload<ExtArgs>, T, "update", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Delete zero or more CountryProperties.
     * @param {CountryPropertyDeleteManyArgs} args - Arguments to filter CountryProperties to delete.
     * @example
     * // Delete a few CountryProperties
     * const { count } = await prisma.countryProperty.deleteMany({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     * 
     */
    deleteMany<T extends CountryPropertyDeleteManyArgs>(args?: SelectSubset<T, CountryPropertyDeleteManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Update zero or more CountryProperties.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CountryPropertyUpdateManyArgs} args - Arguments to update one or more rows.
     * @example
     * // Update many CountryProperties
     * const countryProperty = await prisma.countryProperty.updateMany({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    updateMany<T extends CountryPropertyUpdateManyArgs>(args: SelectSubset<T, CountryPropertyUpdateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Update zero or more CountryProperties and returns the data updated in the database.
     * @param {CountryPropertyUpdateManyAndReturnArgs} args - Arguments to update many CountryProperties.
     * @example
     * // Update many CountryProperties
     * const countryProperty = await prisma.countryProperty.updateManyAndReturn({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * 
     * // Update zero or more CountryProperties and only return the `id`
     * const countryPropertyWithIdOnly = await prisma.countryProperty.updateManyAndReturn({
     *   select: { id: true },
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * 
     */
    updateManyAndReturn<T extends CountryPropertyUpdateManyAndReturnArgs>(args: SelectSubset<T, CountryPropertyUpdateManyAndReturnArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$CountryPropertyPayload<ExtArgs>, T, "updateManyAndReturn", GlobalOmitOptions>>

    /**
     * Create or update one CountryProperty.
     * @param {CountryPropertyUpsertArgs} args - Arguments to update or create a CountryProperty.
     * @example
     * // Update or create a CountryProperty
     * const countryProperty = await prisma.countryProperty.upsert({
     *   create: {
     *     // ... data to create a CountryProperty
     *   },
     *   update: {
     *     // ... in case it already exists, update
     *   },
     *   where: {
     *     // ... the filter for the CountryProperty we want to update
     *   }
     * })
     */
    upsert<T extends CountryPropertyUpsertArgs>(args: SelectSubset<T, CountryPropertyUpsertArgs<ExtArgs>>): Prisma__CountryPropertyClient<$Result.GetResult<Prisma.$CountryPropertyPayload<ExtArgs>, T, "upsert", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>


    /**
     * Count the number of CountryProperties.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CountryPropertyCountArgs} args - Arguments to filter CountryProperties to count.
     * @example
     * // Count the number of CountryProperties
     * const count = await prisma.countryProperty.count({
     *   where: {
     *     // ... the filter for the CountryProperties we want to count
     *   }
     * })
    **/
    count<T extends CountryPropertyCountArgs>(
      args?: Subset<T, CountryPropertyCountArgs>,
    ): Prisma.PrismaPromise<
      T extends $Utils.Record<'select', any>
        ? T['select'] extends true
          ? number
          : GetScalarType<T['select'], CountryPropertyCountAggregateOutputType>
        : number
    >

    /**
     * Allows you to perform aggregations operations on a CountryProperty.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CountryPropertyAggregateArgs} args - Select which aggregations you would like to apply and on what fields.
     * @example
     * // Ordered by age ascending
     * // Where email contains prisma.io
     * // Limited to the 10 users
     * const aggregations = await prisma.user.aggregate({
     *   _avg: {
     *     age: true,
     *   },
     *   where: {
     *     email: {
     *       contains: "prisma.io",
     *     },
     *   },
     *   orderBy: {
     *     age: "asc",
     *   },
     *   take: 10,
     * })
    **/
    aggregate<T extends CountryPropertyAggregateArgs>(args: Subset<T, CountryPropertyAggregateArgs>): Prisma.PrismaPromise<GetCountryPropertyAggregateType<T>>

    /**
     * Group by CountryProperty.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CountryPropertyGroupByArgs} args - Group by arguments.
     * @example
     * // Group by city, order by createdAt, get count
     * const result = await prisma.user.groupBy({
     *   by: ['city', 'createdAt'],
     *   orderBy: {
     *     createdAt: true
     *   },
     *   _count: {
     *     _all: true
     *   },
     * })
     * 
    **/
    groupBy<
      T extends CountryPropertyGroupByArgs,
      HasSelectOrTake extends Or<
        Extends<'skip', Keys<T>>,
        Extends<'take', Keys<T>>
      >,
      OrderByArg extends True extends HasSelectOrTake
        ? { orderBy: CountryPropertyGroupByArgs['orderBy'] }
        : { orderBy?: CountryPropertyGroupByArgs['orderBy'] },
      OrderFields extends ExcludeUnderscoreKeys<Keys<MaybeTupleToUnion<T['orderBy']>>>,
      ByFields extends MaybeTupleToUnion<T['by']>,
      ByValid extends Has<ByFields, OrderFields>,
      HavingFields extends GetHavingFields<T['having']>,
      HavingValid extends Has<ByFields, HavingFields>,
      ByEmpty extends T['by'] extends never[] ? True : False,
      InputErrors extends ByEmpty extends True
      ? `Error: "by" must not be empty.`
      : HavingValid extends False
      ? {
          [P in HavingFields]: P extends ByFields
            ? never
            : P extends string
            ? `Error: Field "${P}" used in "having" needs to be provided in "by".`
            : [
                Error,
                'Field ',
                P,
                ` in "having" needs to be provided in "by"`,
              ]
        }[HavingFields]
      : 'take' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "take", you also need to provide "orderBy"'
      : 'skip' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "skip", you also need to provide "orderBy"'
      : ByValid extends True
      ? {}
      : {
          [P in OrderFields]: P extends ByFields
            ? never
            : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
        }[OrderFields]
    >(args: SubsetIntersection<T, CountryPropertyGroupByArgs, OrderByArg> & InputErrors): {} extends InputErrors ? GetCountryPropertyGroupByPayload<T> : Prisma.PrismaPromise<InputErrors>
  /**
   * Fields of the CountryProperty model
   */
  readonly fields: CountryPropertyFieldRefs;
  }

  /**
   * The delegate class that acts as a "Promise-like" for CountryProperty.
   * Why is this prefixed with `Prisma__`?
   * Because we want to prevent naming conflicts as mentioned in
   * https://github.com/prisma/prisma-client-js/issues/707
   */
  export interface Prisma__CountryPropertyClient<T, Null = never, ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs, GlobalOmitOptions = {}> extends Prisma.PrismaPromise<T> {
    readonly [Symbol.toStringTag]: "PrismaPromise"
    images<T extends CountryProperty$imagesArgs<ExtArgs> = {}>(args?: Subset<T, CountryProperty$imagesArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$ImagePayload<ExtArgs>, T, "findMany", GlobalOmitOptions> | Null>
    /**
     * Attaches callbacks for the resolution and/or rejection of the Promise.
     * @param onfulfilled The callback to execute when the Promise is resolved.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of which ever callback is executed.
     */
    then<TResult1 = T, TResult2 = never>(onfulfilled?: ((value: T) => TResult1 | PromiseLike<TResult1>) | undefined | null, onrejected?: ((reason: any) => TResult2 | PromiseLike<TResult2>) | undefined | null): $Utils.JsPromise<TResult1 | TResult2>
    /**
     * Attaches a callback for only the rejection of the Promise.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of the callback.
     */
    catch<TResult = never>(onrejected?: ((reason: any) => TResult | PromiseLike<TResult>) | undefined | null): $Utils.JsPromise<T | TResult>
    /**
     * Attaches a callback that is invoked when the Promise is settled (fulfilled or rejected). The
     * resolved value cannot be modified from the callback.
     * @param onfinally The callback to execute when the Promise is settled (fulfilled or rejected).
     * @returns A Promise for the completion of the callback.
     */
    finally(onfinally?: (() => void) | undefined | null): $Utils.JsPromise<T>
  }




  /**
   * Fields of the CountryProperty model
   */ 
  interface CountryPropertyFieldRefs {
    readonly id: FieldRef<"CountryProperty", 'Int'>
    readonly title: FieldRef<"CountryProperty", 'String'>
    readonly address: FieldRef<"CountryProperty", 'String'>
    readonly metro: FieldRef<"CountryProperty", 'String'>
    readonly metroDistance: FieldRef<"CountryProperty", 'Int'>
    readonly city: FieldRef<"CountryProperty", 'String'>
    readonly price: FieldRef<"CountryProperty", 'Int'>
    readonly lat: FieldRef<"CountryProperty", 'Float'>
    readonly lng: FieldRef<"CountryProperty", 'Float'>
    readonly landArea: FieldRef<"CountryProperty", 'Int'>
    readonly bedrooms: FieldRef<"CountryProperty", 'Int'>
    readonly totalFloors: FieldRef<"CountryProperty", 'Int'>
    readonly pricePerM2: FieldRef<"CountryProperty", 'Int'>
    readonly description: FieldRef<"CountryProperty", 'String'>
    readonly createdAt: FieldRef<"CountryProperty", 'DateTime'>
    readonly updatedAt: FieldRef<"CountryProperty", 'DateTime'>
  }
    

  // Custom InputTypes
  /**
   * CountryProperty findUnique
   */
  export type CountryPropertyFindUniqueArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CountryProperty
     */
    select?: CountryPropertySelect<ExtArgs> | null
    /**
     * Omit specific fields from the CountryProperty
     */
    omit?: CountryPropertyOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: CountryPropertyInclude<ExtArgs> | null
    /**
     * Filter, which CountryProperty to fetch.
     */
    where: CountryPropertyWhereUniqueInput
  }

  /**
   * CountryProperty findUniqueOrThrow
   */
  export type CountryPropertyFindUniqueOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CountryProperty
     */
    select?: CountryPropertySelect<ExtArgs> | null
    /**
     * Omit specific fields from the CountryProperty
     */
    omit?: CountryPropertyOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: CountryPropertyInclude<ExtArgs> | null
    /**
     * Filter, which CountryProperty to fetch.
     */
    where: CountryPropertyWhereUniqueInput
  }

  /**
   * CountryProperty findFirst
   */
  export type CountryPropertyFindFirstArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CountryProperty
     */
    select?: CountryPropertySelect<ExtArgs> | null
    /**
     * Omit specific fields from the CountryProperty
     */
    omit?: CountryPropertyOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: CountryPropertyInclude<ExtArgs> | null
    /**
     * Filter, which CountryProperty to fetch.
     */
    where?: CountryPropertyWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of CountryProperties to fetch.
     */
    orderBy?: CountryPropertyOrderByWithRelationInput | CountryPropertyOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for CountryProperties.
     */
    cursor?: CountryPropertyWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` CountryProperties from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` CountryProperties.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of CountryProperties.
     */
    distinct?: CountryPropertyScalarFieldEnum | CountryPropertyScalarFieldEnum[]
  }

  /**
   * CountryProperty findFirstOrThrow
   */
  export type CountryPropertyFindFirstOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CountryProperty
     */
    select?: CountryPropertySelect<ExtArgs> | null
    /**
     * Omit specific fields from the CountryProperty
     */
    omit?: CountryPropertyOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: CountryPropertyInclude<ExtArgs> | null
    /**
     * Filter, which CountryProperty to fetch.
     */
    where?: CountryPropertyWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of CountryProperties to fetch.
     */
    orderBy?: CountryPropertyOrderByWithRelationInput | CountryPropertyOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for CountryProperties.
     */
    cursor?: CountryPropertyWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` CountryProperties from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` CountryProperties.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of CountryProperties.
     */
    distinct?: CountryPropertyScalarFieldEnum | CountryPropertyScalarFieldEnum[]
  }

  /**
   * CountryProperty findMany
   */
  export type CountryPropertyFindManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CountryProperty
     */
    select?: CountryPropertySelect<ExtArgs> | null
    /**
     * Omit specific fields from the CountryProperty
     */
    omit?: CountryPropertyOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: CountryPropertyInclude<ExtArgs> | null
    /**
     * Filter, which CountryProperties to fetch.
     */
    where?: CountryPropertyWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of CountryProperties to fetch.
     */
    orderBy?: CountryPropertyOrderByWithRelationInput | CountryPropertyOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for listing CountryProperties.
     */
    cursor?: CountryPropertyWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` CountryProperties from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` CountryProperties.
     */
    skip?: number
    distinct?: CountryPropertyScalarFieldEnum | CountryPropertyScalarFieldEnum[]
  }

  /**
   * CountryProperty create
   */
  export type CountryPropertyCreateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CountryProperty
     */
    select?: CountryPropertySelect<ExtArgs> | null
    /**
     * Omit specific fields from the CountryProperty
     */
    omit?: CountryPropertyOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: CountryPropertyInclude<ExtArgs> | null
    /**
     * The data needed to create a CountryProperty.
     */
    data: XOR<CountryPropertyCreateInput, CountryPropertyUncheckedCreateInput>
  }

  /**
   * CountryProperty createMany
   */
  export type CountryPropertyCreateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to create many CountryProperties.
     */
    data: CountryPropertyCreateManyInput | CountryPropertyCreateManyInput[]
    skipDuplicates?: boolean
  }

  /**
   * CountryProperty createManyAndReturn
   */
  export type CountryPropertyCreateManyAndReturnArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CountryProperty
     */
    select?: CountryPropertySelectCreateManyAndReturn<ExtArgs> | null
    /**
     * Omit specific fields from the CountryProperty
     */
    omit?: CountryPropertyOmit<ExtArgs> | null
    /**
     * The data used to create many CountryProperties.
     */
    data: CountryPropertyCreateManyInput | CountryPropertyCreateManyInput[]
    skipDuplicates?: boolean
  }

  /**
   * CountryProperty update
   */
  export type CountryPropertyUpdateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CountryProperty
     */
    select?: CountryPropertySelect<ExtArgs> | null
    /**
     * Omit specific fields from the CountryProperty
     */
    omit?: CountryPropertyOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: CountryPropertyInclude<ExtArgs> | null
    /**
     * The data needed to update a CountryProperty.
     */
    data: XOR<CountryPropertyUpdateInput, CountryPropertyUncheckedUpdateInput>
    /**
     * Choose, which CountryProperty to update.
     */
    where: CountryPropertyWhereUniqueInput
  }

  /**
   * CountryProperty updateMany
   */
  export type CountryPropertyUpdateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to update CountryProperties.
     */
    data: XOR<CountryPropertyUpdateManyMutationInput, CountryPropertyUncheckedUpdateManyInput>
    /**
     * Filter which CountryProperties to update
     */
    where?: CountryPropertyWhereInput
    /**
     * Limit how many CountryProperties to update.
     */
    limit?: number
  }

  /**
   * CountryProperty updateManyAndReturn
   */
  export type CountryPropertyUpdateManyAndReturnArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CountryProperty
     */
    select?: CountryPropertySelectUpdateManyAndReturn<ExtArgs> | null
    /**
     * Omit specific fields from the CountryProperty
     */
    omit?: CountryPropertyOmit<ExtArgs> | null
    /**
     * The data used to update CountryProperties.
     */
    data: XOR<CountryPropertyUpdateManyMutationInput, CountryPropertyUncheckedUpdateManyInput>
    /**
     * Filter which CountryProperties to update
     */
    where?: CountryPropertyWhereInput
    /**
     * Limit how many CountryProperties to update.
     */
    limit?: number
  }

  /**
   * CountryProperty upsert
   */
  export type CountryPropertyUpsertArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CountryProperty
     */
    select?: CountryPropertySelect<ExtArgs> | null
    /**
     * Omit specific fields from the CountryProperty
     */
    omit?: CountryPropertyOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: CountryPropertyInclude<ExtArgs> | null
    /**
     * The filter to search for the CountryProperty to update in case it exists.
     */
    where: CountryPropertyWhereUniqueInput
    /**
     * In case the CountryProperty found by the `where` argument doesn't exist, create a new CountryProperty with this data.
     */
    create: XOR<CountryPropertyCreateInput, CountryPropertyUncheckedCreateInput>
    /**
     * In case the CountryProperty was found with the provided `where` argument, update it with this data.
     */
    update: XOR<CountryPropertyUpdateInput, CountryPropertyUncheckedUpdateInput>
  }

  /**
   * CountryProperty delete
   */
  export type CountryPropertyDeleteArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CountryProperty
     */
    select?: CountryPropertySelect<ExtArgs> | null
    /**
     * Omit specific fields from the CountryProperty
     */
    omit?: CountryPropertyOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: CountryPropertyInclude<ExtArgs> | null
    /**
     * Filter which CountryProperty to delete.
     */
    where: CountryPropertyWhereUniqueInput
  }

  /**
   * CountryProperty deleteMany
   */
  export type CountryPropertyDeleteManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which CountryProperties to delete
     */
    where?: CountryPropertyWhereInput
    /**
     * Limit how many CountryProperties to delete.
     */
    limit?: number
  }

  /**
   * CountryProperty.images
   */
  export type CountryProperty$imagesArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Image
     */
    select?: ImageSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Image
     */
    omit?: ImageOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ImageInclude<ExtArgs> | null
    where?: ImageWhereInput
    orderBy?: ImageOrderByWithRelationInput | ImageOrderByWithRelationInput[]
    cursor?: ImageWhereUniqueInput
    take?: number
    skip?: number
    distinct?: ImageScalarFieldEnum | ImageScalarFieldEnum[]
  }

  /**
   * CountryProperty without action
   */
  export type CountryPropertyDefaultArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CountryProperty
     */
    select?: CountryPropertySelect<ExtArgs> | null
    /**
     * Omit specific fields from the CountryProperty
     */
    omit?: CountryPropertyOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: CountryPropertyInclude<ExtArgs> | null
  }


  /**
   * Model CommercialProperty
   */

  export type AggregateCommercialProperty = {
    _count: CommercialPropertyCountAggregateOutputType | null
    _avg: CommercialPropertyAvgAggregateOutputType | null
    _sum: CommercialPropertySumAggregateOutputType | null
    _min: CommercialPropertyMinAggregateOutputType | null
    _max: CommercialPropertyMaxAggregateOutputType | null
  }

  export type CommercialPropertyAvgAggregateOutputType = {
    id: number | null
    price: number | null
    pricePerM2: number | null
    area: number | null
    lat: number | null
    lng: number | null
    metroDistance: number | null
  }

  export type CommercialPropertySumAggregateOutputType = {
    id: number | null
    price: number | null
    pricePerM2: number | null
    area: number | null
    lat: number | null
    lng: number | null
    metroDistance: number | null
  }

  export type CommercialPropertyMinAggregateOutputType = {
    id: number | null
    title: string | null
    address: string | null
    price: number | null
    pricePerM2: number | null
    area: number | null
    city: string | null
    lat: number | null
    lng: number | null
    hasFinishing: boolean | null
    purpose: string | null
    metro: string | null
    metroDistance: number | null
    description: string | null
    createdAt: Date | null
    updatedAt: Date | null
  }

  export type CommercialPropertyMaxAggregateOutputType = {
    id: number | null
    title: string | null
    address: string | null
    price: number | null
    pricePerM2: number | null
    area: number | null
    city: string | null
    lat: number | null
    lng: number | null
    hasFinishing: boolean | null
    purpose: string | null
    metro: string | null
    metroDistance: number | null
    description: string | null
    createdAt: Date | null
    updatedAt: Date | null
  }

  export type CommercialPropertyCountAggregateOutputType = {
    id: number
    title: number
    address: number
    price: number
    pricePerM2: number
    area: number
    city: number
    lat: number
    lng: number
    hasFinishing: number
    purpose: number
    metro: number
    metroDistance: number
    description: number
    createdAt: number
    updatedAt: number
    _all: number
  }


  export type CommercialPropertyAvgAggregateInputType = {
    id?: true
    price?: true
    pricePerM2?: true
    area?: true
    lat?: true
    lng?: true
    metroDistance?: true
  }

  export type CommercialPropertySumAggregateInputType = {
    id?: true
    price?: true
    pricePerM2?: true
    area?: true
    lat?: true
    lng?: true
    metroDistance?: true
  }

  export type CommercialPropertyMinAggregateInputType = {
    id?: true
    title?: true
    address?: true
    price?: true
    pricePerM2?: true
    area?: true
    city?: true
    lat?: true
    lng?: true
    hasFinishing?: true
    purpose?: true
    metro?: true
    metroDistance?: true
    description?: true
    createdAt?: true
    updatedAt?: true
  }

  export type CommercialPropertyMaxAggregateInputType = {
    id?: true
    title?: true
    address?: true
    price?: true
    pricePerM2?: true
    area?: true
    city?: true
    lat?: true
    lng?: true
    hasFinishing?: true
    purpose?: true
    metro?: true
    metroDistance?: true
    description?: true
    createdAt?: true
    updatedAt?: true
  }

  export type CommercialPropertyCountAggregateInputType = {
    id?: true
    title?: true
    address?: true
    price?: true
    pricePerM2?: true
    area?: true
    city?: true
    lat?: true
    lng?: true
    hasFinishing?: true
    purpose?: true
    metro?: true
    metroDistance?: true
    description?: true
    createdAt?: true
    updatedAt?: true
    _all?: true
  }

  export type CommercialPropertyAggregateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which CommercialProperty to aggregate.
     */
    where?: CommercialPropertyWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of CommercialProperties to fetch.
     */
    orderBy?: CommercialPropertyOrderByWithRelationInput | CommercialPropertyOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the start position
     */
    cursor?: CommercialPropertyWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` CommercialProperties from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` CommercialProperties.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Count returned CommercialProperties
    **/
    _count?: true | CommercialPropertyCountAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to average
    **/
    _avg?: CommercialPropertyAvgAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to sum
    **/
    _sum?: CommercialPropertySumAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the minimum value
    **/
    _min?: CommercialPropertyMinAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the maximum value
    **/
    _max?: CommercialPropertyMaxAggregateInputType
  }

  export type GetCommercialPropertyAggregateType<T extends CommercialPropertyAggregateArgs> = {
        [P in keyof T & keyof AggregateCommercialProperty]: P extends '_count' | 'count'
      ? T[P] extends true
        ? number
        : GetScalarType<T[P], AggregateCommercialProperty[P]>
      : GetScalarType<T[P], AggregateCommercialProperty[P]>
  }




  export type CommercialPropertyGroupByArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    where?: CommercialPropertyWhereInput
    orderBy?: CommercialPropertyOrderByWithAggregationInput | CommercialPropertyOrderByWithAggregationInput[]
    by: CommercialPropertyScalarFieldEnum[] | CommercialPropertyScalarFieldEnum
    having?: CommercialPropertyScalarWhereWithAggregatesInput
    take?: number
    skip?: number
    _count?: CommercialPropertyCountAggregateInputType | true
    _avg?: CommercialPropertyAvgAggregateInputType
    _sum?: CommercialPropertySumAggregateInputType
    _min?: CommercialPropertyMinAggregateInputType
    _max?: CommercialPropertyMaxAggregateInputType
  }

  export type CommercialPropertyGroupByOutputType = {
    id: number
    title: string
    address: string
    price: number
    pricePerM2: number
    area: number
    city: string | null
    lat: number | null
    lng: number | null
    hasFinishing: boolean
    purpose: string | null
    metro: string | null
    metroDistance: number | null
    description: string | null
    createdAt: Date
    updatedAt: Date
    _count: CommercialPropertyCountAggregateOutputType | null
    _avg: CommercialPropertyAvgAggregateOutputType | null
    _sum: CommercialPropertySumAggregateOutputType | null
    _min: CommercialPropertyMinAggregateOutputType | null
    _max: CommercialPropertyMaxAggregateOutputType | null
  }

  type GetCommercialPropertyGroupByPayload<T extends CommercialPropertyGroupByArgs> = Prisma.PrismaPromise<
    Array<
      PickEnumerable<CommercialPropertyGroupByOutputType, T['by']> &
        {
          [P in ((keyof T) & (keyof CommercialPropertyGroupByOutputType))]: P extends '_count'
            ? T[P] extends boolean
              ? number
              : GetScalarType<T[P], CommercialPropertyGroupByOutputType[P]>
            : GetScalarType<T[P], CommercialPropertyGroupByOutputType[P]>
        }
      >
    >


  export type CommercialPropertySelect<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    title?: boolean
    address?: boolean
    price?: boolean
    pricePerM2?: boolean
    area?: boolean
    city?: boolean
    lat?: boolean
    lng?: boolean
    hasFinishing?: boolean
    purpose?: boolean
    metro?: boolean
    metroDistance?: boolean
    description?: boolean
    createdAt?: boolean
    updatedAt?: boolean
    images?: boolean | CommercialProperty$imagesArgs<ExtArgs>
    _count?: boolean | CommercialPropertyCountOutputTypeDefaultArgs<ExtArgs>
  }, ExtArgs["result"]["commercialProperty"]>

  export type CommercialPropertySelectCreateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    title?: boolean
    address?: boolean
    price?: boolean
    pricePerM2?: boolean
    area?: boolean
    city?: boolean
    lat?: boolean
    lng?: boolean
    hasFinishing?: boolean
    purpose?: boolean
    metro?: boolean
    metroDistance?: boolean
    description?: boolean
    createdAt?: boolean
    updatedAt?: boolean
  }, ExtArgs["result"]["commercialProperty"]>

  export type CommercialPropertySelectUpdateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    title?: boolean
    address?: boolean
    price?: boolean
    pricePerM2?: boolean
    area?: boolean
    city?: boolean
    lat?: boolean
    lng?: boolean
    hasFinishing?: boolean
    purpose?: boolean
    metro?: boolean
    metroDistance?: boolean
    description?: boolean
    createdAt?: boolean
    updatedAt?: boolean
  }, ExtArgs["result"]["commercialProperty"]>

  export type CommercialPropertySelectScalar = {
    id?: boolean
    title?: boolean
    address?: boolean
    price?: boolean
    pricePerM2?: boolean
    area?: boolean
    city?: boolean
    lat?: boolean
    lng?: boolean
    hasFinishing?: boolean
    purpose?: boolean
    metro?: boolean
    metroDistance?: boolean
    description?: boolean
    createdAt?: boolean
    updatedAt?: boolean
  }

  export type CommercialPropertyOmit<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetOmit<"id" | "title" | "address" | "price" | "pricePerM2" | "area" | "city" | "lat" | "lng" | "hasFinishing" | "purpose" | "metro" | "metroDistance" | "description" | "createdAt" | "updatedAt", ExtArgs["result"]["commercialProperty"]>
  export type CommercialPropertyInclude<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    images?: boolean | CommercialProperty$imagesArgs<ExtArgs>
    _count?: boolean | CommercialPropertyCountOutputTypeDefaultArgs<ExtArgs>
  }
  export type CommercialPropertyIncludeCreateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {}
  export type CommercialPropertyIncludeUpdateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {}

  export type $CommercialPropertyPayload<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    name: "CommercialProperty"
    objects: {
      images: Prisma.$ImagePayload<ExtArgs>[]
    }
    scalars: $Extensions.GetPayloadResult<{
      id: number
      title: string
      address: string
      price: number
      pricePerM2: number
      area: number
      city: string | null
      lat: number | null
      lng: number | null
      hasFinishing: boolean
      purpose: string | null
      metro: string | null
      metroDistance: number | null
      description: string | null
      createdAt: Date
      updatedAt: Date
    }, ExtArgs["result"]["commercialProperty"]>
    composites: {}
  }

  type CommercialPropertyGetPayload<S extends boolean | null | undefined | CommercialPropertyDefaultArgs> = $Result.GetResult<Prisma.$CommercialPropertyPayload, S>

  type CommercialPropertyCountArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> =
    Omit<CommercialPropertyFindManyArgs, 'select' | 'include' | 'distinct' | 'omit'> & {
      select?: CommercialPropertyCountAggregateInputType | true
    }

  export interface CommercialPropertyDelegate<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs, GlobalOmitOptions = {}> {
    [K: symbol]: { types: Prisma.TypeMap<ExtArgs>['model']['CommercialProperty'], meta: { name: 'CommercialProperty' } }
    /**
     * Find zero or one CommercialProperty that matches the filter.
     * @param {CommercialPropertyFindUniqueArgs} args - Arguments to find a CommercialProperty
     * @example
     * // Get one CommercialProperty
     * const commercialProperty = await prisma.commercialProperty.findUnique({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUnique<T extends CommercialPropertyFindUniqueArgs>(args: SelectSubset<T, CommercialPropertyFindUniqueArgs<ExtArgs>>): Prisma__CommercialPropertyClient<$Result.GetResult<Prisma.$CommercialPropertyPayload<ExtArgs>, T, "findUnique", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>

    /**
     * Find one CommercialProperty that matches the filter or throw an error with `error.code='P2025'`
     * if no matches were found.
     * @param {CommercialPropertyFindUniqueOrThrowArgs} args - Arguments to find a CommercialProperty
     * @example
     * // Get one CommercialProperty
     * const commercialProperty = await prisma.commercialProperty.findUniqueOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUniqueOrThrow<T extends CommercialPropertyFindUniqueOrThrowArgs>(args: SelectSubset<T, CommercialPropertyFindUniqueOrThrowArgs<ExtArgs>>): Prisma__CommercialPropertyClient<$Result.GetResult<Prisma.$CommercialPropertyPayload<ExtArgs>, T, "findUniqueOrThrow", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Find the first CommercialProperty that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CommercialPropertyFindFirstArgs} args - Arguments to find a CommercialProperty
     * @example
     * // Get one CommercialProperty
     * const commercialProperty = await prisma.commercialProperty.findFirst({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirst<T extends CommercialPropertyFindFirstArgs>(args?: SelectSubset<T, CommercialPropertyFindFirstArgs<ExtArgs>>): Prisma__CommercialPropertyClient<$Result.GetResult<Prisma.$CommercialPropertyPayload<ExtArgs>, T, "findFirst", GlobalOmitOptions> | null, null, ExtArgs, GlobalOmitOptions>

    /**
     * Find the first CommercialProperty that matches the filter or
     * throw `PrismaKnownClientError` with `P2025` code if no matches were found.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CommercialPropertyFindFirstOrThrowArgs} args - Arguments to find a CommercialProperty
     * @example
     * // Get one CommercialProperty
     * const commercialProperty = await prisma.commercialProperty.findFirstOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirstOrThrow<T extends CommercialPropertyFindFirstOrThrowArgs>(args?: SelectSubset<T, CommercialPropertyFindFirstOrThrowArgs<ExtArgs>>): Prisma__CommercialPropertyClient<$Result.GetResult<Prisma.$CommercialPropertyPayload<ExtArgs>, T, "findFirstOrThrow", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Find zero or more CommercialProperties that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CommercialPropertyFindManyArgs} args - Arguments to filter and select certain fields only.
     * @example
     * // Get all CommercialProperties
     * const commercialProperties = await prisma.commercialProperty.findMany()
     * 
     * // Get first 10 CommercialProperties
     * const commercialProperties = await prisma.commercialProperty.findMany({ take: 10 })
     * 
     * // Only select the `id`
     * const commercialPropertyWithIdOnly = await prisma.commercialProperty.findMany({ select: { id: true } })
     * 
     */
    findMany<T extends CommercialPropertyFindManyArgs>(args?: SelectSubset<T, CommercialPropertyFindManyArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$CommercialPropertyPayload<ExtArgs>, T, "findMany", GlobalOmitOptions>>

    /**
     * Create a CommercialProperty.
     * @param {CommercialPropertyCreateArgs} args - Arguments to create a CommercialProperty.
     * @example
     * // Create one CommercialProperty
     * const CommercialProperty = await prisma.commercialProperty.create({
     *   data: {
     *     // ... data to create a CommercialProperty
     *   }
     * })
     * 
     */
    create<T extends CommercialPropertyCreateArgs>(args: SelectSubset<T, CommercialPropertyCreateArgs<ExtArgs>>): Prisma__CommercialPropertyClient<$Result.GetResult<Prisma.$CommercialPropertyPayload<ExtArgs>, T, "create", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Create many CommercialProperties.
     * @param {CommercialPropertyCreateManyArgs} args - Arguments to create many CommercialProperties.
     * @example
     * // Create many CommercialProperties
     * const commercialProperty = await prisma.commercialProperty.createMany({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     *     
     */
    createMany<T extends CommercialPropertyCreateManyArgs>(args?: SelectSubset<T, CommercialPropertyCreateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Create many CommercialProperties and returns the data saved in the database.
     * @param {CommercialPropertyCreateManyAndReturnArgs} args - Arguments to create many CommercialProperties.
     * @example
     * // Create many CommercialProperties
     * const commercialProperty = await prisma.commercialProperty.createManyAndReturn({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * 
     * // Create many CommercialProperties and only return the `id`
     * const commercialPropertyWithIdOnly = await prisma.commercialProperty.createManyAndReturn({
     *   select: { id: true },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * 
     */
    createManyAndReturn<T extends CommercialPropertyCreateManyAndReturnArgs>(args?: SelectSubset<T, CommercialPropertyCreateManyAndReturnArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$CommercialPropertyPayload<ExtArgs>, T, "createManyAndReturn", GlobalOmitOptions>>

    /**
     * Delete a CommercialProperty.
     * @param {CommercialPropertyDeleteArgs} args - Arguments to delete one CommercialProperty.
     * @example
     * // Delete one CommercialProperty
     * const CommercialProperty = await prisma.commercialProperty.delete({
     *   where: {
     *     // ... filter to delete one CommercialProperty
     *   }
     * })
     * 
     */
    delete<T extends CommercialPropertyDeleteArgs>(args: SelectSubset<T, CommercialPropertyDeleteArgs<ExtArgs>>): Prisma__CommercialPropertyClient<$Result.GetResult<Prisma.$CommercialPropertyPayload<ExtArgs>, T, "delete", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Update one CommercialProperty.
     * @param {CommercialPropertyUpdateArgs} args - Arguments to update one CommercialProperty.
     * @example
     * // Update one CommercialProperty
     * const commercialProperty = await prisma.commercialProperty.update({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    update<T extends CommercialPropertyUpdateArgs>(args: SelectSubset<T, CommercialPropertyUpdateArgs<ExtArgs>>): Prisma__CommercialPropertyClient<$Result.GetResult<Prisma.$CommercialPropertyPayload<ExtArgs>, T, "update", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>

    /**
     * Delete zero or more CommercialProperties.
     * @param {CommercialPropertyDeleteManyArgs} args - Arguments to filter CommercialProperties to delete.
     * @example
     * // Delete a few CommercialProperties
     * const { count } = await prisma.commercialProperty.deleteMany({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     * 
     */
    deleteMany<T extends CommercialPropertyDeleteManyArgs>(args?: SelectSubset<T, CommercialPropertyDeleteManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Update zero or more CommercialProperties.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CommercialPropertyUpdateManyArgs} args - Arguments to update one or more rows.
     * @example
     * // Update many CommercialProperties
     * const commercialProperty = await prisma.commercialProperty.updateMany({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    updateMany<T extends CommercialPropertyUpdateManyArgs>(args: SelectSubset<T, CommercialPropertyUpdateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Update zero or more CommercialProperties and returns the data updated in the database.
     * @param {CommercialPropertyUpdateManyAndReturnArgs} args - Arguments to update many CommercialProperties.
     * @example
     * // Update many CommercialProperties
     * const commercialProperty = await prisma.commercialProperty.updateManyAndReturn({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * 
     * // Update zero or more CommercialProperties and only return the `id`
     * const commercialPropertyWithIdOnly = await prisma.commercialProperty.updateManyAndReturn({
     *   select: { id: true },
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * 
     */
    updateManyAndReturn<T extends CommercialPropertyUpdateManyAndReturnArgs>(args: SelectSubset<T, CommercialPropertyUpdateManyAndReturnArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$CommercialPropertyPayload<ExtArgs>, T, "updateManyAndReturn", GlobalOmitOptions>>

    /**
     * Create or update one CommercialProperty.
     * @param {CommercialPropertyUpsertArgs} args - Arguments to update or create a CommercialProperty.
     * @example
     * // Update or create a CommercialProperty
     * const commercialProperty = await prisma.commercialProperty.upsert({
     *   create: {
     *     // ... data to create a CommercialProperty
     *   },
     *   update: {
     *     // ... in case it already exists, update
     *   },
     *   where: {
     *     // ... the filter for the CommercialProperty we want to update
     *   }
     * })
     */
    upsert<T extends CommercialPropertyUpsertArgs>(args: SelectSubset<T, CommercialPropertyUpsertArgs<ExtArgs>>): Prisma__CommercialPropertyClient<$Result.GetResult<Prisma.$CommercialPropertyPayload<ExtArgs>, T, "upsert", GlobalOmitOptions>, never, ExtArgs, GlobalOmitOptions>


    /**
     * Count the number of CommercialProperties.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CommercialPropertyCountArgs} args - Arguments to filter CommercialProperties to count.
     * @example
     * // Count the number of CommercialProperties
     * const count = await prisma.commercialProperty.count({
     *   where: {
     *     // ... the filter for the CommercialProperties we want to count
     *   }
     * })
    **/
    count<T extends CommercialPropertyCountArgs>(
      args?: Subset<T, CommercialPropertyCountArgs>,
    ): Prisma.PrismaPromise<
      T extends $Utils.Record<'select', any>
        ? T['select'] extends true
          ? number
          : GetScalarType<T['select'], CommercialPropertyCountAggregateOutputType>
        : number
    >

    /**
     * Allows you to perform aggregations operations on a CommercialProperty.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CommercialPropertyAggregateArgs} args - Select which aggregations you would like to apply and on what fields.
     * @example
     * // Ordered by age ascending
     * // Where email contains prisma.io
     * // Limited to the 10 users
     * const aggregations = await prisma.user.aggregate({
     *   _avg: {
     *     age: true,
     *   },
     *   where: {
     *     email: {
     *       contains: "prisma.io",
     *     },
     *   },
     *   orderBy: {
     *     age: "asc",
     *   },
     *   take: 10,
     * })
    **/
    aggregate<T extends CommercialPropertyAggregateArgs>(args: Subset<T, CommercialPropertyAggregateArgs>): Prisma.PrismaPromise<GetCommercialPropertyAggregateType<T>>

    /**
     * Group by CommercialProperty.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CommercialPropertyGroupByArgs} args - Group by arguments.
     * @example
     * // Group by city, order by createdAt, get count
     * const result = await prisma.user.groupBy({
     *   by: ['city', 'createdAt'],
     *   orderBy: {
     *     createdAt: true
     *   },
     *   _count: {
     *     _all: true
     *   },
     * })
     * 
    **/
    groupBy<
      T extends CommercialPropertyGroupByArgs,
      HasSelectOrTake extends Or<
        Extends<'skip', Keys<T>>,
        Extends<'take', Keys<T>>
      >,
      OrderByArg extends True extends HasSelectOrTake
        ? { orderBy: CommercialPropertyGroupByArgs['orderBy'] }
        : { orderBy?: CommercialPropertyGroupByArgs['orderBy'] },
      OrderFields extends ExcludeUnderscoreKeys<Keys<MaybeTupleToUnion<T['orderBy']>>>,
      ByFields extends MaybeTupleToUnion<T['by']>,
      ByValid extends Has<ByFields, OrderFields>,
      HavingFields extends GetHavingFields<T['having']>,
      HavingValid extends Has<ByFields, HavingFields>,
      ByEmpty extends T['by'] extends never[] ? True : False,
      InputErrors extends ByEmpty extends True
      ? `Error: "by" must not be empty.`
      : HavingValid extends False
      ? {
          [P in HavingFields]: P extends ByFields
            ? never
            : P extends string
            ? `Error: Field "${P}" used in "having" needs to be provided in "by".`
            : [
                Error,
                'Field ',
                P,
                ` in "having" needs to be provided in "by"`,
              ]
        }[HavingFields]
      : 'take' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "take", you also need to provide "orderBy"'
      : 'skip' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "skip", you also need to provide "orderBy"'
      : ByValid extends True
      ? {}
      : {
          [P in OrderFields]: P extends ByFields
            ? never
            : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
        }[OrderFields]
    >(args: SubsetIntersection<T, CommercialPropertyGroupByArgs, OrderByArg> & InputErrors): {} extends InputErrors ? GetCommercialPropertyGroupByPayload<T> : Prisma.PrismaPromise<InputErrors>
  /**
   * Fields of the CommercialProperty model
   */
  readonly fields: CommercialPropertyFieldRefs;
  }

  /**
   * The delegate class that acts as a "Promise-like" for CommercialProperty.
   * Why is this prefixed with `Prisma__`?
   * Because we want to prevent naming conflicts as mentioned in
   * https://github.com/prisma/prisma-client-js/issues/707
   */
  export interface Prisma__CommercialPropertyClient<T, Null = never, ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs, GlobalOmitOptions = {}> extends Prisma.PrismaPromise<T> {
    readonly [Symbol.toStringTag]: "PrismaPromise"
    images<T extends CommercialProperty$imagesArgs<ExtArgs> = {}>(args?: Subset<T, CommercialProperty$imagesArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$ImagePayload<ExtArgs>, T, "findMany", GlobalOmitOptions> | Null>
    /**
     * Attaches callbacks for the resolution and/or rejection of the Promise.
     * @param onfulfilled The callback to execute when the Promise is resolved.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of which ever callback is executed.
     */
    then<TResult1 = T, TResult2 = never>(onfulfilled?: ((value: T) => TResult1 | PromiseLike<TResult1>) | undefined | null, onrejected?: ((reason: any) => TResult2 | PromiseLike<TResult2>) | undefined | null): $Utils.JsPromise<TResult1 | TResult2>
    /**
     * Attaches a callback for only the rejection of the Promise.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of the callback.
     */
    catch<TResult = never>(onrejected?: ((reason: any) => TResult | PromiseLike<TResult>) | undefined | null): $Utils.JsPromise<T | TResult>
    /**
     * Attaches a callback that is invoked when the Promise is settled (fulfilled or rejected). The
     * resolved value cannot be modified from the callback.
     * @param onfinally The callback to execute when the Promise is settled (fulfilled or rejected).
     * @returns A Promise for the completion of the callback.
     */
    finally(onfinally?: (() => void) | undefined | null): $Utils.JsPromise<T>
  }




  /**
   * Fields of the CommercialProperty model
   */ 
  interface CommercialPropertyFieldRefs {
    readonly id: FieldRef<"CommercialProperty", 'Int'>
    readonly title: FieldRef<"CommercialProperty", 'String'>
    readonly address: FieldRef<"CommercialProperty", 'String'>
    readonly price: FieldRef<"CommercialProperty", 'Int'>
    readonly pricePerM2: FieldRef<"CommercialProperty", 'Int'>
    readonly area: FieldRef<"CommercialProperty", 'Int'>
    readonly city: FieldRef<"CommercialProperty", 'String'>
    readonly lat: FieldRef<"CommercialProperty", 'Float'>
    readonly lng: FieldRef<"CommercialProperty", 'Float'>
    readonly hasFinishing: FieldRef<"CommercialProperty", 'Boolean'>
    readonly purpose: FieldRef<"CommercialProperty", 'String'>
    readonly metro: FieldRef<"CommercialProperty", 'String'>
    readonly metroDistance: FieldRef<"CommercialProperty", 'Int'>
    readonly description: FieldRef<"CommercialProperty", 'String'>
    readonly createdAt: FieldRef<"CommercialProperty", 'DateTime'>
    readonly updatedAt: FieldRef<"CommercialProperty", 'DateTime'>
  }
    

  // Custom InputTypes
  /**
   * CommercialProperty findUnique
   */
  export type CommercialPropertyFindUniqueArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CommercialProperty
     */
    select?: CommercialPropertySelect<ExtArgs> | null
    /**
     * Omit specific fields from the CommercialProperty
     */
    omit?: CommercialPropertyOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: CommercialPropertyInclude<ExtArgs> | null
    /**
     * Filter, which CommercialProperty to fetch.
     */
    where: CommercialPropertyWhereUniqueInput
  }

  /**
   * CommercialProperty findUniqueOrThrow
   */
  export type CommercialPropertyFindUniqueOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CommercialProperty
     */
    select?: CommercialPropertySelect<ExtArgs> | null
    /**
     * Omit specific fields from the CommercialProperty
     */
    omit?: CommercialPropertyOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: CommercialPropertyInclude<ExtArgs> | null
    /**
     * Filter, which CommercialProperty to fetch.
     */
    where: CommercialPropertyWhereUniqueInput
  }

  /**
   * CommercialProperty findFirst
   */
  export type CommercialPropertyFindFirstArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CommercialProperty
     */
    select?: CommercialPropertySelect<ExtArgs> | null
    /**
     * Omit specific fields from the CommercialProperty
     */
    omit?: CommercialPropertyOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: CommercialPropertyInclude<ExtArgs> | null
    /**
     * Filter, which CommercialProperty to fetch.
     */
    where?: CommercialPropertyWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of CommercialProperties to fetch.
     */
    orderBy?: CommercialPropertyOrderByWithRelationInput | CommercialPropertyOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for CommercialProperties.
     */
    cursor?: CommercialPropertyWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` CommercialProperties from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` CommercialProperties.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of CommercialProperties.
     */
    distinct?: CommercialPropertyScalarFieldEnum | CommercialPropertyScalarFieldEnum[]
  }

  /**
   * CommercialProperty findFirstOrThrow
   */
  export type CommercialPropertyFindFirstOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CommercialProperty
     */
    select?: CommercialPropertySelect<ExtArgs> | null
    /**
     * Omit specific fields from the CommercialProperty
     */
    omit?: CommercialPropertyOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: CommercialPropertyInclude<ExtArgs> | null
    /**
     * Filter, which CommercialProperty to fetch.
     */
    where?: CommercialPropertyWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of CommercialProperties to fetch.
     */
    orderBy?: CommercialPropertyOrderByWithRelationInput | CommercialPropertyOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for CommercialProperties.
     */
    cursor?: CommercialPropertyWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` CommercialProperties from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` CommercialProperties.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of CommercialProperties.
     */
    distinct?: CommercialPropertyScalarFieldEnum | CommercialPropertyScalarFieldEnum[]
  }

  /**
   * CommercialProperty findMany
   */
  export type CommercialPropertyFindManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CommercialProperty
     */
    select?: CommercialPropertySelect<ExtArgs> | null
    /**
     * Omit specific fields from the CommercialProperty
     */
    omit?: CommercialPropertyOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: CommercialPropertyInclude<ExtArgs> | null
    /**
     * Filter, which CommercialProperties to fetch.
     */
    where?: CommercialPropertyWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of CommercialProperties to fetch.
     */
    orderBy?: CommercialPropertyOrderByWithRelationInput | CommercialPropertyOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for listing CommercialProperties.
     */
    cursor?: CommercialPropertyWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` CommercialProperties from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` CommercialProperties.
     */
    skip?: number
    distinct?: CommercialPropertyScalarFieldEnum | CommercialPropertyScalarFieldEnum[]
  }

  /**
   * CommercialProperty create
   */
  export type CommercialPropertyCreateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CommercialProperty
     */
    select?: CommercialPropertySelect<ExtArgs> | null
    /**
     * Omit specific fields from the CommercialProperty
     */
    omit?: CommercialPropertyOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: CommercialPropertyInclude<ExtArgs> | null
    /**
     * The data needed to create a CommercialProperty.
     */
    data: XOR<CommercialPropertyCreateInput, CommercialPropertyUncheckedCreateInput>
  }

  /**
   * CommercialProperty createMany
   */
  export type CommercialPropertyCreateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to create many CommercialProperties.
     */
    data: CommercialPropertyCreateManyInput | CommercialPropertyCreateManyInput[]
    skipDuplicates?: boolean
  }

  /**
   * CommercialProperty createManyAndReturn
   */
  export type CommercialPropertyCreateManyAndReturnArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CommercialProperty
     */
    select?: CommercialPropertySelectCreateManyAndReturn<ExtArgs> | null
    /**
     * Omit specific fields from the CommercialProperty
     */
    omit?: CommercialPropertyOmit<ExtArgs> | null
    /**
     * The data used to create many CommercialProperties.
     */
    data: CommercialPropertyCreateManyInput | CommercialPropertyCreateManyInput[]
    skipDuplicates?: boolean
  }

  /**
   * CommercialProperty update
   */
  export type CommercialPropertyUpdateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CommercialProperty
     */
    select?: CommercialPropertySelect<ExtArgs> | null
    /**
     * Omit specific fields from the CommercialProperty
     */
    omit?: CommercialPropertyOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: CommercialPropertyInclude<ExtArgs> | null
    /**
     * The data needed to update a CommercialProperty.
     */
    data: XOR<CommercialPropertyUpdateInput, CommercialPropertyUncheckedUpdateInput>
    /**
     * Choose, which CommercialProperty to update.
     */
    where: CommercialPropertyWhereUniqueInput
  }

  /**
   * CommercialProperty updateMany
   */
  export type CommercialPropertyUpdateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to update CommercialProperties.
     */
    data: XOR<CommercialPropertyUpdateManyMutationInput, CommercialPropertyUncheckedUpdateManyInput>
    /**
     * Filter which CommercialProperties to update
     */
    where?: CommercialPropertyWhereInput
    /**
     * Limit how many CommercialProperties to update.
     */
    limit?: number
  }

  /**
   * CommercialProperty updateManyAndReturn
   */
  export type CommercialPropertyUpdateManyAndReturnArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CommercialProperty
     */
    select?: CommercialPropertySelectUpdateManyAndReturn<ExtArgs> | null
    /**
     * Omit specific fields from the CommercialProperty
     */
    omit?: CommercialPropertyOmit<ExtArgs> | null
    /**
     * The data used to update CommercialProperties.
     */
    data: XOR<CommercialPropertyUpdateManyMutationInput, CommercialPropertyUncheckedUpdateManyInput>
    /**
     * Filter which CommercialProperties to update
     */
    where?: CommercialPropertyWhereInput
    /**
     * Limit how many CommercialProperties to update.
     */
    limit?: number
  }

  /**
   * CommercialProperty upsert
   */
  export type CommercialPropertyUpsertArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CommercialProperty
     */
    select?: CommercialPropertySelect<ExtArgs> | null
    /**
     * Omit specific fields from the CommercialProperty
     */
    omit?: CommercialPropertyOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: CommercialPropertyInclude<ExtArgs> | null
    /**
     * The filter to search for the CommercialProperty to update in case it exists.
     */
    where: CommercialPropertyWhereUniqueInput
    /**
     * In case the CommercialProperty found by the `where` argument doesn't exist, create a new CommercialProperty with this data.
     */
    create: XOR<CommercialPropertyCreateInput, CommercialPropertyUncheckedCreateInput>
    /**
     * In case the CommercialProperty was found with the provided `where` argument, update it with this data.
     */
    update: XOR<CommercialPropertyUpdateInput, CommercialPropertyUncheckedUpdateInput>
  }

  /**
   * CommercialProperty delete
   */
  export type CommercialPropertyDeleteArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CommercialProperty
     */
    select?: CommercialPropertySelect<ExtArgs> | null
    /**
     * Omit specific fields from the CommercialProperty
     */
    omit?: CommercialPropertyOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: CommercialPropertyInclude<ExtArgs> | null
    /**
     * Filter which CommercialProperty to delete.
     */
    where: CommercialPropertyWhereUniqueInput
  }

  /**
   * CommercialProperty deleteMany
   */
  export type CommercialPropertyDeleteManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which CommercialProperties to delete
     */
    where?: CommercialPropertyWhereInput
    /**
     * Limit how many CommercialProperties to delete.
     */
    limit?: number
  }

  /**
   * CommercialProperty.images
   */
  export type CommercialProperty$imagesArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the Image
     */
    select?: ImageSelect<ExtArgs> | null
    /**
     * Omit specific fields from the Image
     */
    omit?: ImageOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: ImageInclude<ExtArgs> | null
    where?: ImageWhereInput
    orderBy?: ImageOrderByWithRelationInput | ImageOrderByWithRelationInput[]
    cursor?: ImageWhereUniqueInput
    take?: number
    skip?: number
    distinct?: ImageScalarFieldEnum | ImageScalarFieldEnum[]
  }

  /**
   * CommercialProperty without action
   */
  export type CommercialPropertyDefaultArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the CommercialProperty
     */
    select?: CommercialPropertySelect<ExtArgs> | null
    /**
     * Omit specific fields from the CommercialProperty
     */
    omit?: CommercialPropertyOmit<ExtArgs> | null
    /**
     * Choose, which related nodes to fetch as well
     */
    include?: CommercialPropertyInclude<ExtArgs> | null
  }


  /**
   * Enums
   */

  export const TransactionIsolationLevel: {
    ReadUncommitted: 'ReadUncommitted',
    ReadCommitted: 'ReadCommitted',
    RepeatableRead: 'RepeatableRead',
    Serializable: 'Serializable'
  };

  export type TransactionIsolationLevel = (typeof TransactionIsolationLevel)[keyof typeof TransactionIsolationLevel]


  export const RealtorScalarFieldEnum: {
    id: 'id',
    fullName: 'fullName',
    phone: 'phone',
    email: 'email',
    avatarUrl: 'avatarUrl',
    position: 'position',
    createdAt: 'createdAt',
    updatedAt: 'updatedAt'
  };

  export type RealtorScalarFieldEnum = (typeof RealtorScalarFieldEnum)[keyof typeof RealtorScalarFieldEnum]


  export const ApplicationScalarFieldEnum: {
    id: 'id',
    name: 'name',
    phone: 'phone',
    status: 'status',
    propertyType: 'propertyType',
    propertyId: 'propertyId',
    link: 'link',
    createdAt: 'createdAt',
    updatedAt: 'updatedAt'
  };

  export type ApplicationScalarFieldEnum = (typeof ApplicationScalarFieldEnum)[keyof typeof ApplicationScalarFieldEnum]


  export const ImageScalarFieldEnum: {
    id: 'id',
    url: 'url',
    newBuildingComplexId: 'newBuildingComplexId',
    newBuildingApartmentId: 'newBuildingApartmentId',
    readyApartmentId: 'readyApartmentId',
    rentalApartmentId: 'rentalApartmentId',
    countryPropertyId: 'countryPropertyId',
    commercialPropertyId: 'commercialPropertyId',
    createdAt: 'createdAt'
  };

  export type ImageScalarFieldEnum = (typeof ImageScalarFieldEnum)[keyof typeof ImageScalarFieldEnum]


  export const NewBuildingComplexScalarFieldEnum: {
    id: 'id',
    name: 'name',
    address: 'address',
    district: 'district',
    metro: 'metro',
    metroDistance: 'metroDistance',
    city: 'city',
    developer: 'developer',
    priceFrom: 'priceFrom',
    areaFrom: 'areaFrom',
    buildingClass: 'buildingClass',
    floors: 'floors',
    totalApartments: 'totalApartments',
    availableApartments: 'availableApartments',
    lat: 'lat',
    lng: 'lng',
    completionDate: 'completionDate',
    height: 'height',
    hasParking: 'hasParking',
    description: 'description',
    createdAt: 'createdAt',
    updatedAt: 'updatedAt'
  };

  export type NewBuildingComplexScalarFieldEnum = (typeof NewBuildingComplexScalarFieldEnum)[keyof typeof NewBuildingComplexScalarFieldEnum]


  export const NewBuildingApartmentScalarFieldEnum: {
    id: 'id',
    complexId: 'complexId',
    title: 'title',
    bedrooms: 'bedrooms',
    area: 'area',
    price: 'price',
    pricePerM2: 'pricePerM2',
    floor: 'floor',
    totalFloors: 'totalFloors',
    city: 'city',
    apartmentNumber: 'apartmentNumber',
    lat: 'lat',
    lng: 'lng',
    type: 'type',
    createdAt: 'createdAt',
    updatedAt: 'updatedAt'
  };

  export type NewBuildingApartmentScalarFieldEnum = (typeof NewBuildingApartmentScalarFieldEnum)[keyof typeof NewBuildingApartmentScalarFieldEnum]


  export const NearbyPlaceScalarFieldEnum: {
    id: 'id',
    complexId: 'complexId',
    name: 'name',
    category: 'category',
    distance: 'distance',
    icon: 'icon',
    createdAt: 'createdAt'
  };

  export type NearbyPlaceScalarFieldEnum = (typeof NearbyPlaceScalarFieldEnum)[keyof typeof NearbyPlaceScalarFieldEnum]


  export const ReviewScalarFieldEnum: {
    id: 'id',
    authorName: 'authorName',
    rating: 'rating',
    comment: 'comment',
    createdAt: 'createdAt'
  };

  export type ReviewScalarFieldEnum = (typeof ReviewScalarFieldEnum)[keyof typeof ReviewScalarFieldEnum]


  export const ReadyApartmentScalarFieldEnum: {
    id: 'id',
    title: 'title',
    complexName: 'complexName',
    address: 'address',
    city: 'city',
    area: 'area',
    price: 'price',
    pricePerM2: 'pricePerM2',
    bedrooms: 'bedrooms',
    floor: 'floor',
    totalFloors: 'totalFloors',
    lat: 'lat',
    lng: 'lng',
    metro: 'metro',
    metroDistance: 'metroDistance',
    description: 'description',
    developer: 'developer',
    createdAt: 'createdAt',
    updatedAt: 'updatedAt'
  };

  export type ReadyApartmentScalarFieldEnum = (typeof ReadyApartmentScalarFieldEnum)[keyof typeof ReadyApartmentScalarFieldEnum]


  export const RentalApartmentScalarFieldEnum: {
    id: 'id',
    title: 'title',
    address: 'address',
    area: 'area',
    pricePerMonth: 'pricePerMonth',
    bedrooms: 'bedrooms',
    lat: 'lat',
    lng: 'lng',
    floor: 'floor',
    totalFloors: 'totalFloors',
    city: 'city',
    metro: 'metro',
    metroDistance: 'metroDistance',
    description: 'description',
    createdAt: 'createdAt',
    updatedAt: 'updatedAt'
  };

  export type RentalApartmentScalarFieldEnum = (typeof RentalApartmentScalarFieldEnum)[keyof typeof RentalApartmentScalarFieldEnum]


  export const CountryPropertyScalarFieldEnum: {
    id: 'id',
    title: 'title',
    address: 'address',
    metro: 'metro',
    metroDistance: 'metroDistance',
    city: 'city',
    price: 'price',
    lat: 'lat',
    lng: 'lng',
    landArea: 'landArea',
    bedrooms: 'bedrooms',
    totalFloors: 'totalFloors',
    pricePerM2: 'pricePerM2',
    description: 'description',
    createdAt: 'createdAt',
    updatedAt: 'updatedAt'
  };

  export type CountryPropertyScalarFieldEnum = (typeof CountryPropertyScalarFieldEnum)[keyof typeof CountryPropertyScalarFieldEnum]


  export const CommercialPropertyScalarFieldEnum: {
    id: 'id',
    title: 'title',
    address: 'address',
    price: 'price',
    pricePerM2: 'pricePerM2',
    area: 'area',
    city: 'city',
    lat: 'lat',
    lng: 'lng',
    hasFinishing: 'hasFinishing',
    purpose: 'purpose',
    metro: 'metro',
    metroDistance: 'metroDistance',
    description: 'description',
    createdAt: 'createdAt',
    updatedAt: 'updatedAt'
  };

  export type CommercialPropertyScalarFieldEnum = (typeof CommercialPropertyScalarFieldEnum)[keyof typeof CommercialPropertyScalarFieldEnum]


  export const SortOrder: {
    asc: 'asc',
    desc: 'desc'
  };

  export type SortOrder = (typeof SortOrder)[keyof typeof SortOrder]


  export const QueryMode: {
    default: 'default',
    insensitive: 'insensitive'
  };

  export type QueryMode = (typeof QueryMode)[keyof typeof QueryMode]


  export const NullsOrder: {
    first: 'first',
    last: 'last'
  };

  export type NullsOrder = (typeof NullsOrder)[keyof typeof NullsOrder]


  /**
   * Field references 
   */


  /**
   * Reference to a field of type 'Int'
   */
  export type IntFieldRefInput<$PrismaModel> = FieldRefInputType<$PrismaModel, 'Int'>
    


  /**
   * Reference to a field of type 'Int[]'
   */
  export type ListIntFieldRefInput<$PrismaModel> = FieldRefInputType<$PrismaModel, 'Int[]'>
    


  /**
   * Reference to a field of type 'String'
   */
  export type StringFieldRefInput<$PrismaModel> = FieldRefInputType<$PrismaModel, 'String'>
    


  /**
   * Reference to a field of type 'String[]'
   */
  export type ListStringFieldRefInput<$PrismaModel> = FieldRefInputType<$PrismaModel, 'String[]'>
    


  /**
   * Reference to a field of type 'DateTime'
   */
  export type DateTimeFieldRefInput<$PrismaModel> = FieldRefInputType<$PrismaModel, 'DateTime'>
    


  /**
   * Reference to a field of type 'DateTime[]'
   */
  export type ListDateTimeFieldRefInput<$PrismaModel> = FieldRefInputType<$PrismaModel, 'DateTime[]'>
    


  /**
   * Reference to a field of type 'ApplicationStatus'
   */
  export type EnumApplicationStatusFieldRefInput<$PrismaModel> = FieldRefInputType<$PrismaModel, 'ApplicationStatus'>
    


  /**
   * Reference to a field of type 'ApplicationStatus[]'
   */
  export type ListEnumApplicationStatusFieldRefInput<$PrismaModel> = FieldRefInputType<$PrismaModel, 'ApplicationStatus[]'>
    


  /**
   * Reference to a field of type 'Float'
   */
  export type FloatFieldRefInput<$PrismaModel> = FieldRefInputType<$PrismaModel, 'Float'>
    


  /**
   * Reference to a field of type 'Float[]'
   */
  export type ListFloatFieldRefInput<$PrismaModel> = FieldRefInputType<$PrismaModel, 'Float[]'>
    


  /**
   * Reference to a field of type 'Boolean'
   */
  export type BooleanFieldRefInput<$PrismaModel> = FieldRefInputType<$PrismaModel, 'Boolean'>
    
  /**
   * Deep Input Types
   */


  export type RealtorWhereInput = {
    AND?: RealtorWhereInput | RealtorWhereInput[]
    OR?: RealtorWhereInput[]
    NOT?: RealtorWhereInput | RealtorWhereInput[]
    id?: IntFilter<"Realtor"> | number
    fullName?: StringFilter<"Realtor"> | string
    phone?: StringNullableFilter<"Realtor"> | string | null
    email?: StringNullableFilter<"Realtor"> | string | null
    avatarUrl?: StringNullableFilter<"Realtor"> | string | null
    position?: StringNullableFilter<"Realtor"> | string | null
    createdAt?: DateTimeFilter<"Realtor"> | Date | string
    updatedAt?: DateTimeFilter<"Realtor"> | Date | string
  }

  export type RealtorOrderByWithRelationInput = {
    id?: SortOrder
    fullName?: SortOrder
    phone?: SortOrderInput | SortOrder
    email?: SortOrderInput | SortOrder
    avatarUrl?: SortOrderInput | SortOrder
    position?: SortOrderInput | SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
  }

  export type RealtorWhereUniqueInput = Prisma.AtLeast<{
    id?: number
    AND?: RealtorWhereInput | RealtorWhereInput[]
    OR?: RealtorWhereInput[]
    NOT?: RealtorWhereInput | RealtorWhereInput[]
    fullName?: StringFilter<"Realtor"> | string
    phone?: StringNullableFilter<"Realtor"> | string | null
    email?: StringNullableFilter<"Realtor"> | string | null
    avatarUrl?: StringNullableFilter<"Realtor"> | string | null
    position?: StringNullableFilter<"Realtor"> | string | null
    createdAt?: DateTimeFilter<"Realtor"> | Date | string
    updatedAt?: DateTimeFilter<"Realtor"> | Date | string
  }, "id">

  export type RealtorOrderByWithAggregationInput = {
    id?: SortOrder
    fullName?: SortOrder
    phone?: SortOrderInput | SortOrder
    email?: SortOrderInput | SortOrder
    avatarUrl?: SortOrderInput | SortOrder
    position?: SortOrderInput | SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
    _count?: RealtorCountOrderByAggregateInput
    _avg?: RealtorAvgOrderByAggregateInput
    _max?: RealtorMaxOrderByAggregateInput
    _min?: RealtorMinOrderByAggregateInput
    _sum?: RealtorSumOrderByAggregateInput
  }

  export type RealtorScalarWhereWithAggregatesInput = {
    AND?: RealtorScalarWhereWithAggregatesInput | RealtorScalarWhereWithAggregatesInput[]
    OR?: RealtorScalarWhereWithAggregatesInput[]
    NOT?: RealtorScalarWhereWithAggregatesInput | RealtorScalarWhereWithAggregatesInput[]
    id?: IntWithAggregatesFilter<"Realtor"> | number
    fullName?: StringWithAggregatesFilter<"Realtor"> | string
    phone?: StringNullableWithAggregatesFilter<"Realtor"> | string | null
    email?: StringNullableWithAggregatesFilter<"Realtor"> | string | null
    avatarUrl?: StringNullableWithAggregatesFilter<"Realtor"> | string | null
    position?: StringNullableWithAggregatesFilter<"Realtor"> | string | null
    createdAt?: DateTimeWithAggregatesFilter<"Realtor"> | Date | string
    updatedAt?: DateTimeWithAggregatesFilter<"Realtor"> | Date | string
  }

  export type ApplicationWhereInput = {
    AND?: ApplicationWhereInput | ApplicationWhereInput[]
    OR?: ApplicationWhereInput[]
    NOT?: ApplicationWhereInput | ApplicationWhereInput[]
    id?: IntFilter<"Application"> | number
    name?: StringFilter<"Application"> | string
    phone?: StringFilter<"Application"> | string
    status?: EnumApplicationStatusFilter<"Application"> | $Enums.ApplicationStatus
    propertyType?: StringNullableFilter<"Application"> | string | null
    propertyId?: IntNullableFilter<"Application"> | number | null
    link?: StringFilter<"Application"> | string
    createdAt?: DateTimeFilter<"Application"> | Date | string
    updatedAt?: DateTimeFilter<"Application"> | Date | string
  }

  export type ApplicationOrderByWithRelationInput = {
    id?: SortOrder
    name?: SortOrder
    phone?: SortOrder
    status?: SortOrder
    propertyType?: SortOrderInput | SortOrder
    propertyId?: SortOrderInput | SortOrder
    link?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
  }

  export type ApplicationWhereUniqueInput = Prisma.AtLeast<{
    id?: number
    AND?: ApplicationWhereInput | ApplicationWhereInput[]
    OR?: ApplicationWhereInput[]
    NOT?: ApplicationWhereInput | ApplicationWhereInput[]
    name?: StringFilter<"Application"> | string
    phone?: StringFilter<"Application"> | string
    status?: EnumApplicationStatusFilter<"Application"> | $Enums.ApplicationStatus
    propertyType?: StringNullableFilter<"Application"> | string | null
    propertyId?: IntNullableFilter<"Application"> | number | null
    link?: StringFilter<"Application"> | string
    createdAt?: DateTimeFilter<"Application"> | Date | string
    updatedAt?: DateTimeFilter<"Application"> | Date | string
  }, "id">

  export type ApplicationOrderByWithAggregationInput = {
    id?: SortOrder
    name?: SortOrder
    phone?: SortOrder
    status?: SortOrder
    propertyType?: SortOrderInput | SortOrder
    propertyId?: SortOrderInput | SortOrder
    link?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
    _count?: ApplicationCountOrderByAggregateInput
    _avg?: ApplicationAvgOrderByAggregateInput
    _max?: ApplicationMaxOrderByAggregateInput
    _min?: ApplicationMinOrderByAggregateInput
    _sum?: ApplicationSumOrderByAggregateInput
  }

  export type ApplicationScalarWhereWithAggregatesInput = {
    AND?: ApplicationScalarWhereWithAggregatesInput | ApplicationScalarWhereWithAggregatesInput[]
    OR?: ApplicationScalarWhereWithAggregatesInput[]
    NOT?: ApplicationScalarWhereWithAggregatesInput | ApplicationScalarWhereWithAggregatesInput[]
    id?: IntWithAggregatesFilter<"Application"> | number
    name?: StringWithAggregatesFilter<"Application"> | string
    phone?: StringWithAggregatesFilter<"Application"> | string
    status?: EnumApplicationStatusWithAggregatesFilter<"Application"> | $Enums.ApplicationStatus
    propertyType?: StringNullableWithAggregatesFilter<"Application"> | string | null
    propertyId?: IntNullableWithAggregatesFilter<"Application"> | number | null
    link?: StringWithAggregatesFilter<"Application"> | string
    createdAt?: DateTimeWithAggregatesFilter<"Application"> | Date | string
    updatedAt?: DateTimeWithAggregatesFilter<"Application"> | Date | string
  }

  export type ImageWhereInput = {
    AND?: ImageWhereInput | ImageWhereInput[]
    OR?: ImageWhereInput[]
    NOT?: ImageWhereInput | ImageWhereInput[]
    id?: IntFilter<"Image"> | number
    url?: StringFilter<"Image"> | string
    newBuildingComplexId?: IntNullableFilter<"Image"> | number | null
    newBuildingApartmentId?: IntNullableFilter<"Image"> | number | null
    readyApartmentId?: IntNullableFilter<"Image"> | number | null
    rentalApartmentId?: IntNullableFilter<"Image"> | number | null
    countryPropertyId?: IntNullableFilter<"Image"> | number | null
    commercialPropertyId?: IntNullableFilter<"Image"> | number | null
    createdAt?: DateTimeFilter<"Image"> | Date | string
    newBuildingComplex?: XOR<NewBuildingComplexNullableScalarRelationFilter, NewBuildingComplexWhereInput> | null
    newBuildingApartment?: XOR<NewBuildingApartmentNullableScalarRelationFilter, NewBuildingApartmentWhereInput> | null
    readyApartment?: XOR<ReadyApartmentNullableScalarRelationFilter, ReadyApartmentWhereInput> | null
    rentalApartment?: XOR<RentalApartmentNullableScalarRelationFilter, RentalApartmentWhereInput> | null
    countryProperty?: XOR<CountryPropertyNullableScalarRelationFilter, CountryPropertyWhereInput> | null
    commercialProperty?: XOR<CommercialPropertyNullableScalarRelationFilter, CommercialPropertyWhereInput> | null
  }

  export type ImageOrderByWithRelationInput = {
    id?: SortOrder
    url?: SortOrder
    newBuildingComplexId?: SortOrderInput | SortOrder
    newBuildingApartmentId?: SortOrderInput | SortOrder
    readyApartmentId?: SortOrderInput | SortOrder
    rentalApartmentId?: SortOrderInput | SortOrder
    countryPropertyId?: SortOrderInput | SortOrder
    commercialPropertyId?: SortOrderInput | SortOrder
    createdAt?: SortOrder
    newBuildingComplex?: NewBuildingComplexOrderByWithRelationInput
    newBuildingApartment?: NewBuildingApartmentOrderByWithRelationInput
    readyApartment?: ReadyApartmentOrderByWithRelationInput
    rentalApartment?: RentalApartmentOrderByWithRelationInput
    countryProperty?: CountryPropertyOrderByWithRelationInput
    commercialProperty?: CommercialPropertyOrderByWithRelationInput
  }

  export type ImageWhereUniqueInput = Prisma.AtLeast<{
    id?: number
    AND?: ImageWhereInput | ImageWhereInput[]
    OR?: ImageWhereInput[]
    NOT?: ImageWhereInput | ImageWhereInput[]
    url?: StringFilter<"Image"> | string
    newBuildingComplexId?: IntNullableFilter<"Image"> | number | null
    newBuildingApartmentId?: IntNullableFilter<"Image"> | number | null
    readyApartmentId?: IntNullableFilter<"Image"> | number | null
    rentalApartmentId?: IntNullableFilter<"Image"> | number | null
    countryPropertyId?: IntNullableFilter<"Image"> | number | null
    commercialPropertyId?: IntNullableFilter<"Image"> | number | null
    createdAt?: DateTimeFilter<"Image"> | Date | string
    newBuildingComplex?: XOR<NewBuildingComplexNullableScalarRelationFilter, NewBuildingComplexWhereInput> | null
    newBuildingApartment?: XOR<NewBuildingApartmentNullableScalarRelationFilter, NewBuildingApartmentWhereInput> | null
    readyApartment?: XOR<ReadyApartmentNullableScalarRelationFilter, ReadyApartmentWhereInput> | null
    rentalApartment?: XOR<RentalApartmentNullableScalarRelationFilter, RentalApartmentWhereInput> | null
    countryProperty?: XOR<CountryPropertyNullableScalarRelationFilter, CountryPropertyWhereInput> | null
    commercialProperty?: XOR<CommercialPropertyNullableScalarRelationFilter, CommercialPropertyWhereInput> | null
  }, "id">

  export type ImageOrderByWithAggregationInput = {
    id?: SortOrder
    url?: SortOrder
    newBuildingComplexId?: SortOrderInput | SortOrder
    newBuildingApartmentId?: SortOrderInput | SortOrder
    readyApartmentId?: SortOrderInput | SortOrder
    rentalApartmentId?: SortOrderInput | SortOrder
    countryPropertyId?: SortOrderInput | SortOrder
    commercialPropertyId?: SortOrderInput | SortOrder
    createdAt?: SortOrder
    _count?: ImageCountOrderByAggregateInput
    _avg?: ImageAvgOrderByAggregateInput
    _max?: ImageMaxOrderByAggregateInput
    _min?: ImageMinOrderByAggregateInput
    _sum?: ImageSumOrderByAggregateInput
  }

  export type ImageScalarWhereWithAggregatesInput = {
    AND?: ImageScalarWhereWithAggregatesInput | ImageScalarWhereWithAggregatesInput[]
    OR?: ImageScalarWhereWithAggregatesInput[]
    NOT?: ImageScalarWhereWithAggregatesInput | ImageScalarWhereWithAggregatesInput[]
    id?: IntWithAggregatesFilter<"Image"> | number
    url?: StringWithAggregatesFilter<"Image"> | string
    newBuildingComplexId?: IntNullableWithAggregatesFilter<"Image"> | number | null
    newBuildingApartmentId?: IntNullableWithAggregatesFilter<"Image"> | number | null
    readyApartmentId?: IntNullableWithAggregatesFilter<"Image"> | number | null
    rentalApartmentId?: IntNullableWithAggregatesFilter<"Image"> | number | null
    countryPropertyId?: IntNullableWithAggregatesFilter<"Image"> | number | null
    commercialPropertyId?: IntNullableWithAggregatesFilter<"Image"> | number | null
    createdAt?: DateTimeWithAggregatesFilter<"Image"> | Date | string
  }

  export type NewBuildingComplexWhereInput = {
    AND?: NewBuildingComplexWhereInput | NewBuildingComplexWhereInput[]
    OR?: NewBuildingComplexWhereInput[]
    NOT?: NewBuildingComplexWhereInput | NewBuildingComplexWhereInput[]
    id?: IntFilter<"NewBuildingComplex"> | number
    name?: StringFilter<"NewBuildingComplex"> | string
    address?: StringFilter<"NewBuildingComplex"> | string
    district?: StringNullableFilter<"NewBuildingComplex"> | string | null
    metro?: StringNullableFilter<"NewBuildingComplex"> | string | null
    metroDistance?: IntNullableFilter<"NewBuildingComplex"> | number | null
    city?: StringNullableFilter<"NewBuildingComplex"> | string | null
    developer?: StringFilter<"NewBuildingComplex"> | string
    priceFrom?: IntFilter<"NewBuildingComplex"> | number
    areaFrom?: IntNullableFilter<"NewBuildingComplex"> | number | null
    buildingClass?: StringNullableFilter<"NewBuildingComplex"> | string | null
    floors?: IntNullableFilter<"NewBuildingComplex"> | number | null
    totalApartments?: IntNullableFilter<"NewBuildingComplex"> | number | null
    availableApartments?: IntNullableFilter<"NewBuildingComplex"> | number | null
    lat?: FloatNullableFilter<"NewBuildingComplex"> | number | null
    lng?: FloatNullableFilter<"NewBuildingComplex"> | number | null
    completionDate?: DateTimeNullableFilter<"NewBuildingComplex"> | Date | string | null
    height?: IntNullableFilter<"NewBuildingComplex"> | number | null
    hasParking?: BoolFilter<"NewBuildingComplex"> | boolean
    description?: StringNullableFilter<"NewBuildingComplex"> | string | null
    createdAt?: DateTimeFilter<"NewBuildingComplex"> | Date | string
    updatedAt?: DateTimeFilter<"NewBuildingComplex"> | Date | string
    images?: ImageListRelationFilter
    apartments?: NewBuildingApartmentListRelationFilter
    nearbyPlaces?: NearbyPlaceListRelationFilter
  }

  export type NewBuildingComplexOrderByWithRelationInput = {
    id?: SortOrder
    name?: SortOrder
    address?: SortOrder
    district?: SortOrderInput | SortOrder
    metro?: SortOrderInput | SortOrder
    metroDistance?: SortOrderInput | SortOrder
    city?: SortOrderInput | SortOrder
    developer?: SortOrder
    priceFrom?: SortOrder
    areaFrom?: SortOrderInput | SortOrder
    buildingClass?: SortOrderInput | SortOrder
    floors?: SortOrderInput | SortOrder
    totalApartments?: SortOrderInput | SortOrder
    availableApartments?: SortOrderInput | SortOrder
    lat?: SortOrderInput | SortOrder
    lng?: SortOrderInput | SortOrder
    completionDate?: SortOrderInput | SortOrder
    height?: SortOrderInput | SortOrder
    hasParking?: SortOrder
    description?: SortOrderInput | SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
    images?: ImageOrderByRelationAggregateInput
    apartments?: NewBuildingApartmentOrderByRelationAggregateInput
    nearbyPlaces?: NearbyPlaceOrderByRelationAggregateInput
  }

  export type NewBuildingComplexWhereUniqueInput = Prisma.AtLeast<{
    id?: number
    AND?: NewBuildingComplexWhereInput | NewBuildingComplexWhereInput[]
    OR?: NewBuildingComplexWhereInput[]
    NOT?: NewBuildingComplexWhereInput | NewBuildingComplexWhereInput[]
    name?: StringFilter<"NewBuildingComplex"> | string
    address?: StringFilter<"NewBuildingComplex"> | string
    district?: StringNullableFilter<"NewBuildingComplex"> | string | null
    metro?: StringNullableFilter<"NewBuildingComplex"> | string | null
    metroDistance?: IntNullableFilter<"NewBuildingComplex"> | number | null
    city?: StringNullableFilter<"NewBuildingComplex"> | string | null
    developer?: StringFilter<"NewBuildingComplex"> | string
    priceFrom?: IntFilter<"NewBuildingComplex"> | number
    areaFrom?: IntNullableFilter<"NewBuildingComplex"> | number | null
    buildingClass?: StringNullableFilter<"NewBuildingComplex"> | string | null
    floors?: IntNullableFilter<"NewBuildingComplex"> | number | null
    totalApartments?: IntNullableFilter<"NewBuildingComplex"> | number | null
    availableApartments?: IntNullableFilter<"NewBuildingComplex"> | number | null
    lat?: FloatNullableFilter<"NewBuildingComplex"> | number | null
    lng?: FloatNullableFilter<"NewBuildingComplex"> | number | null
    completionDate?: DateTimeNullableFilter<"NewBuildingComplex"> | Date | string | null
    height?: IntNullableFilter<"NewBuildingComplex"> | number | null
    hasParking?: BoolFilter<"NewBuildingComplex"> | boolean
    description?: StringNullableFilter<"NewBuildingComplex"> | string | null
    createdAt?: DateTimeFilter<"NewBuildingComplex"> | Date | string
    updatedAt?: DateTimeFilter<"NewBuildingComplex"> | Date | string
    images?: ImageListRelationFilter
    apartments?: NewBuildingApartmentListRelationFilter
    nearbyPlaces?: NearbyPlaceListRelationFilter
  }, "id">

  export type NewBuildingComplexOrderByWithAggregationInput = {
    id?: SortOrder
    name?: SortOrder
    address?: SortOrder
    district?: SortOrderInput | SortOrder
    metro?: SortOrderInput | SortOrder
    metroDistance?: SortOrderInput | SortOrder
    city?: SortOrderInput | SortOrder
    developer?: SortOrder
    priceFrom?: SortOrder
    areaFrom?: SortOrderInput | SortOrder
    buildingClass?: SortOrderInput | SortOrder
    floors?: SortOrderInput | SortOrder
    totalApartments?: SortOrderInput | SortOrder
    availableApartments?: SortOrderInput | SortOrder
    lat?: SortOrderInput | SortOrder
    lng?: SortOrderInput | SortOrder
    completionDate?: SortOrderInput | SortOrder
    height?: SortOrderInput | SortOrder
    hasParking?: SortOrder
    description?: SortOrderInput | SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
    _count?: NewBuildingComplexCountOrderByAggregateInput
    _avg?: NewBuildingComplexAvgOrderByAggregateInput
    _max?: NewBuildingComplexMaxOrderByAggregateInput
    _min?: NewBuildingComplexMinOrderByAggregateInput
    _sum?: NewBuildingComplexSumOrderByAggregateInput
  }

  export type NewBuildingComplexScalarWhereWithAggregatesInput = {
    AND?: NewBuildingComplexScalarWhereWithAggregatesInput | NewBuildingComplexScalarWhereWithAggregatesInput[]
    OR?: NewBuildingComplexScalarWhereWithAggregatesInput[]
    NOT?: NewBuildingComplexScalarWhereWithAggregatesInput | NewBuildingComplexScalarWhereWithAggregatesInput[]
    id?: IntWithAggregatesFilter<"NewBuildingComplex"> | number
    name?: StringWithAggregatesFilter<"NewBuildingComplex"> | string
    address?: StringWithAggregatesFilter<"NewBuildingComplex"> | string
    district?: StringNullableWithAggregatesFilter<"NewBuildingComplex"> | string | null
    metro?: StringNullableWithAggregatesFilter<"NewBuildingComplex"> | string | null
    metroDistance?: IntNullableWithAggregatesFilter<"NewBuildingComplex"> | number | null
    city?: StringNullableWithAggregatesFilter<"NewBuildingComplex"> | string | null
    developer?: StringWithAggregatesFilter<"NewBuildingComplex"> | string
    priceFrom?: IntWithAggregatesFilter<"NewBuildingComplex"> | number
    areaFrom?: IntNullableWithAggregatesFilter<"NewBuildingComplex"> | number | null
    buildingClass?: StringNullableWithAggregatesFilter<"NewBuildingComplex"> | string | null
    floors?: IntNullableWithAggregatesFilter<"NewBuildingComplex"> | number | null
    totalApartments?: IntNullableWithAggregatesFilter<"NewBuildingComplex"> | number | null
    availableApartments?: IntNullableWithAggregatesFilter<"NewBuildingComplex"> | number | null
    lat?: FloatNullableWithAggregatesFilter<"NewBuildingComplex"> | number | null
    lng?: FloatNullableWithAggregatesFilter<"NewBuildingComplex"> | number | null
    completionDate?: DateTimeNullableWithAggregatesFilter<"NewBuildingComplex"> | Date | string | null
    height?: IntNullableWithAggregatesFilter<"NewBuildingComplex"> | number | null
    hasParking?: BoolWithAggregatesFilter<"NewBuildingComplex"> | boolean
    description?: StringNullableWithAggregatesFilter<"NewBuildingComplex"> | string | null
    createdAt?: DateTimeWithAggregatesFilter<"NewBuildingComplex"> | Date | string
    updatedAt?: DateTimeWithAggregatesFilter<"NewBuildingComplex"> | Date | string
  }

  export type NewBuildingApartmentWhereInput = {
    AND?: NewBuildingApartmentWhereInput | NewBuildingApartmentWhereInput[]
    OR?: NewBuildingApartmentWhereInput[]
    NOT?: NewBuildingApartmentWhereInput | NewBuildingApartmentWhereInput[]
    id?: IntFilter<"NewBuildingApartment"> | number
    complexId?: IntFilter<"NewBuildingApartment"> | number
    title?: StringFilter<"NewBuildingApartment"> | string
    bedrooms?: IntFilter<"NewBuildingApartment"> | number
    area?: IntFilter<"NewBuildingApartment"> | number
    price?: IntFilter<"NewBuildingApartment"> | number
    pricePerM2?: IntFilter<"NewBuildingApartment"> | number
    floor?: IntFilter<"NewBuildingApartment"> | number
    totalFloors?: IntFilter<"NewBuildingApartment"> | number
    city?: StringNullableFilter<"NewBuildingApartment"> | string | null
    apartmentNumber?: IntFilter<"NewBuildingApartment"> | number
    lat?: FloatNullableFilter<"NewBuildingApartment"> | number | null
    lng?: FloatNullableFilter<"NewBuildingApartment"> | number | null
    type?: StringFilter<"NewBuildingApartment"> | string
    createdAt?: DateTimeFilter<"NewBuildingApartment"> | Date | string
    updatedAt?: DateTimeFilter<"NewBuildingApartment"> | Date | string
    complex?: XOR<NewBuildingComplexScalarRelationFilter, NewBuildingComplexWhereInput>
    images?: ImageListRelationFilter
  }

  export type NewBuildingApartmentOrderByWithRelationInput = {
    id?: SortOrder
    complexId?: SortOrder
    title?: SortOrder
    bedrooms?: SortOrder
    area?: SortOrder
    price?: SortOrder
    pricePerM2?: SortOrder
    floor?: SortOrder
    totalFloors?: SortOrder
    city?: SortOrderInput | SortOrder
    apartmentNumber?: SortOrder
    lat?: SortOrderInput | SortOrder
    lng?: SortOrderInput | SortOrder
    type?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
    complex?: NewBuildingComplexOrderByWithRelationInput
    images?: ImageOrderByRelationAggregateInput
  }

  export type NewBuildingApartmentWhereUniqueInput = Prisma.AtLeast<{
    id?: number
    AND?: NewBuildingApartmentWhereInput | NewBuildingApartmentWhereInput[]
    OR?: NewBuildingApartmentWhereInput[]
    NOT?: NewBuildingApartmentWhereInput | NewBuildingApartmentWhereInput[]
    complexId?: IntFilter<"NewBuildingApartment"> | number
    title?: StringFilter<"NewBuildingApartment"> | string
    bedrooms?: IntFilter<"NewBuildingApartment"> | number
    area?: IntFilter<"NewBuildingApartment"> | number
    price?: IntFilter<"NewBuildingApartment"> | number
    pricePerM2?: IntFilter<"NewBuildingApartment"> | number
    floor?: IntFilter<"NewBuildingApartment"> | number
    totalFloors?: IntFilter<"NewBuildingApartment"> | number
    city?: StringNullableFilter<"NewBuildingApartment"> | string | null
    apartmentNumber?: IntFilter<"NewBuildingApartment"> | number
    lat?: FloatNullableFilter<"NewBuildingApartment"> | number | null
    lng?: FloatNullableFilter<"NewBuildingApartment"> | number | null
    type?: StringFilter<"NewBuildingApartment"> | string
    createdAt?: DateTimeFilter<"NewBuildingApartment"> | Date | string
    updatedAt?: DateTimeFilter<"NewBuildingApartment"> | Date | string
    complex?: XOR<NewBuildingComplexScalarRelationFilter, NewBuildingComplexWhereInput>
    images?: ImageListRelationFilter
  }, "id">

  export type NewBuildingApartmentOrderByWithAggregationInput = {
    id?: SortOrder
    complexId?: SortOrder
    title?: SortOrder
    bedrooms?: SortOrder
    area?: SortOrder
    price?: SortOrder
    pricePerM2?: SortOrder
    floor?: SortOrder
    totalFloors?: SortOrder
    city?: SortOrderInput | SortOrder
    apartmentNumber?: SortOrder
    lat?: SortOrderInput | SortOrder
    lng?: SortOrderInput | SortOrder
    type?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
    _count?: NewBuildingApartmentCountOrderByAggregateInput
    _avg?: NewBuildingApartmentAvgOrderByAggregateInput
    _max?: NewBuildingApartmentMaxOrderByAggregateInput
    _min?: NewBuildingApartmentMinOrderByAggregateInput
    _sum?: NewBuildingApartmentSumOrderByAggregateInput
  }

  export type NewBuildingApartmentScalarWhereWithAggregatesInput = {
    AND?: NewBuildingApartmentScalarWhereWithAggregatesInput | NewBuildingApartmentScalarWhereWithAggregatesInput[]
    OR?: NewBuildingApartmentScalarWhereWithAggregatesInput[]
    NOT?: NewBuildingApartmentScalarWhereWithAggregatesInput | NewBuildingApartmentScalarWhereWithAggregatesInput[]
    id?: IntWithAggregatesFilter<"NewBuildingApartment"> | number
    complexId?: IntWithAggregatesFilter<"NewBuildingApartment"> | number
    title?: StringWithAggregatesFilter<"NewBuildingApartment"> | string
    bedrooms?: IntWithAggregatesFilter<"NewBuildingApartment"> | number
    area?: IntWithAggregatesFilter<"NewBuildingApartment"> | number
    price?: IntWithAggregatesFilter<"NewBuildingApartment"> | number
    pricePerM2?: IntWithAggregatesFilter<"NewBuildingApartment"> | number
    floor?: IntWithAggregatesFilter<"NewBuildingApartment"> | number
    totalFloors?: IntWithAggregatesFilter<"NewBuildingApartment"> | number
    city?: StringNullableWithAggregatesFilter<"NewBuildingApartment"> | string | null
    apartmentNumber?: IntWithAggregatesFilter<"NewBuildingApartment"> | number
    lat?: FloatNullableWithAggregatesFilter<"NewBuildingApartment"> | number | null
    lng?: FloatNullableWithAggregatesFilter<"NewBuildingApartment"> | number | null
    type?: StringWithAggregatesFilter<"NewBuildingApartment"> | string
    createdAt?: DateTimeWithAggregatesFilter<"NewBuildingApartment"> | Date | string
    updatedAt?: DateTimeWithAggregatesFilter<"NewBuildingApartment"> | Date | string
  }

  export type NearbyPlaceWhereInput = {
    AND?: NearbyPlaceWhereInput | NearbyPlaceWhereInput[]
    OR?: NearbyPlaceWhereInput[]
    NOT?: NearbyPlaceWhereInput | NearbyPlaceWhereInput[]
    id?: IntFilter<"NearbyPlace"> | number
    complexId?: IntFilter<"NearbyPlace"> | number
    name?: StringFilter<"NearbyPlace"> | string
    category?: StringFilter<"NearbyPlace"> | string
    distance?: IntNullableFilter<"NearbyPlace"> | number | null
    icon?: StringNullableFilter<"NearbyPlace"> | string | null
    createdAt?: DateTimeFilter<"NearbyPlace"> | Date | string
    complex?: XOR<NewBuildingComplexScalarRelationFilter, NewBuildingComplexWhereInput>
  }

  export type NearbyPlaceOrderByWithRelationInput = {
    id?: SortOrder
    complexId?: SortOrder
    name?: SortOrder
    category?: SortOrder
    distance?: SortOrderInput | SortOrder
    icon?: SortOrderInput | SortOrder
    createdAt?: SortOrder
    complex?: NewBuildingComplexOrderByWithRelationInput
  }

  export type NearbyPlaceWhereUniqueInput = Prisma.AtLeast<{
    id?: number
    AND?: NearbyPlaceWhereInput | NearbyPlaceWhereInput[]
    OR?: NearbyPlaceWhereInput[]
    NOT?: NearbyPlaceWhereInput | NearbyPlaceWhereInput[]
    complexId?: IntFilter<"NearbyPlace"> | number
    name?: StringFilter<"NearbyPlace"> | string
    category?: StringFilter<"NearbyPlace"> | string
    distance?: IntNullableFilter<"NearbyPlace"> | number | null
    icon?: StringNullableFilter<"NearbyPlace"> | string | null
    createdAt?: DateTimeFilter<"NearbyPlace"> | Date | string
    complex?: XOR<NewBuildingComplexScalarRelationFilter, NewBuildingComplexWhereInput>
  }, "id">

  export type NearbyPlaceOrderByWithAggregationInput = {
    id?: SortOrder
    complexId?: SortOrder
    name?: SortOrder
    category?: SortOrder
    distance?: SortOrderInput | SortOrder
    icon?: SortOrderInput | SortOrder
    createdAt?: SortOrder
    _count?: NearbyPlaceCountOrderByAggregateInput
    _avg?: NearbyPlaceAvgOrderByAggregateInput
    _max?: NearbyPlaceMaxOrderByAggregateInput
    _min?: NearbyPlaceMinOrderByAggregateInput
    _sum?: NearbyPlaceSumOrderByAggregateInput
  }

  export type NearbyPlaceScalarWhereWithAggregatesInput = {
    AND?: NearbyPlaceScalarWhereWithAggregatesInput | NearbyPlaceScalarWhereWithAggregatesInput[]
    OR?: NearbyPlaceScalarWhereWithAggregatesInput[]
    NOT?: NearbyPlaceScalarWhereWithAggregatesInput | NearbyPlaceScalarWhereWithAggregatesInput[]
    id?: IntWithAggregatesFilter<"NearbyPlace"> | number
    complexId?: IntWithAggregatesFilter<"NearbyPlace"> | number
    name?: StringWithAggregatesFilter<"NearbyPlace"> | string
    category?: StringWithAggregatesFilter<"NearbyPlace"> | string
    distance?: IntNullableWithAggregatesFilter<"NearbyPlace"> | number | null
    icon?: StringNullableWithAggregatesFilter<"NearbyPlace"> | string | null
    createdAt?: DateTimeWithAggregatesFilter<"NearbyPlace"> | Date | string
  }

  export type ReviewWhereInput = {
    AND?: ReviewWhereInput | ReviewWhereInput[]
    OR?: ReviewWhereInput[]
    NOT?: ReviewWhereInput | ReviewWhereInput[]
    id?: IntFilter<"Review"> | number
    authorName?: StringNullableFilter<"Review"> | string | null
    rating?: IntFilter<"Review"> | number
    comment?: StringNullableFilter<"Review"> | string | null
    createdAt?: DateTimeFilter<"Review"> | Date | string
  }

  export type ReviewOrderByWithRelationInput = {
    id?: SortOrder
    authorName?: SortOrderInput | SortOrder
    rating?: SortOrder
    comment?: SortOrderInput | SortOrder
    createdAt?: SortOrder
  }

  export type ReviewWhereUniqueInput = Prisma.AtLeast<{
    id?: number
    AND?: ReviewWhereInput | ReviewWhereInput[]
    OR?: ReviewWhereInput[]
    NOT?: ReviewWhereInput | ReviewWhereInput[]
    authorName?: StringNullableFilter<"Review"> | string | null
    rating?: IntFilter<"Review"> | number
    comment?: StringNullableFilter<"Review"> | string | null
    createdAt?: DateTimeFilter<"Review"> | Date | string
  }, "id">

  export type ReviewOrderByWithAggregationInput = {
    id?: SortOrder
    authorName?: SortOrderInput | SortOrder
    rating?: SortOrder
    comment?: SortOrderInput | SortOrder
    createdAt?: SortOrder
    _count?: ReviewCountOrderByAggregateInput
    _avg?: ReviewAvgOrderByAggregateInput
    _max?: ReviewMaxOrderByAggregateInput
    _min?: ReviewMinOrderByAggregateInput
    _sum?: ReviewSumOrderByAggregateInput
  }

  export type ReviewScalarWhereWithAggregatesInput = {
    AND?: ReviewScalarWhereWithAggregatesInput | ReviewScalarWhereWithAggregatesInput[]
    OR?: ReviewScalarWhereWithAggregatesInput[]
    NOT?: ReviewScalarWhereWithAggregatesInput | ReviewScalarWhereWithAggregatesInput[]
    id?: IntWithAggregatesFilter<"Review"> | number
    authorName?: StringNullableWithAggregatesFilter<"Review"> | string | null
    rating?: IntWithAggregatesFilter<"Review"> | number
    comment?: StringNullableWithAggregatesFilter<"Review"> | string | null
    createdAt?: DateTimeWithAggregatesFilter<"Review"> | Date | string
  }

  export type ReadyApartmentWhereInput = {
    AND?: ReadyApartmentWhereInput | ReadyApartmentWhereInput[]
    OR?: ReadyApartmentWhereInput[]
    NOT?: ReadyApartmentWhereInput | ReadyApartmentWhereInput[]
    id?: IntFilter<"ReadyApartment"> | number
    title?: StringFilter<"ReadyApartment"> | string
    complexName?: StringNullableFilter<"ReadyApartment"> | string | null
    address?: StringFilter<"ReadyApartment"> | string
    city?: StringNullableFilter<"ReadyApartment"> | string | null
    area?: IntFilter<"ReadyApartment"> | number
    price?: IntFilter<"ReadyApartment"> | number
    pricePerM2?: IntFilter<"ReadyApartment"> | number
    bedrooms?: IntFilter<"ReadyApartment"> | number
    floor?: IntFilter<"ReadyApartment"> | number
    totalFloors?: IntFilter<"ReadyApartment"> | number
    lat?: FloatNullableFilter<"ReadyApartment"> | number | null
    lng?: FloatNullableFilter<"ReadyApartment"> | number | null
    metro?: StringNullableFilter<"ReadyApartment"> | string | null
    metroDistance?: IntNullableFilter<"ReadyApartment"> | number | null
    description?: StringNullableFilter<"ReadyApartment"> | string | null
    developer?: StringNullableFilter<"ReadyApartment"> | string | null
    createdAt?: DateTimeFilter<"ReadyApartment"> | Date | string
    updatedAt?: DateTimeFilter<"ReadyApartment"> | Date | string
    images?: ImageListRelationFilter
  }

  export type ReadyApartmentOrderByWithRelationInput = {
    id?: SortOrder
    title?: SortOrder
    complexName?: SortOrderInput | SortOrder
    address?: SortOrder
    city?: SortOrderInput | SortOrder
    area?: SortOrder
    price?: SortOrder
    pricePerM2?: SortOrder
    bedrooms?: SortOrder
    floor?: SortOrder
    totalFloors?: SortOrder
    lat?: SortOrderInput | SortOrder
    lng?: SortOrderInput | SortOrder
    metro?: SortOrderInput | SortOrder
    metroDistance?: SortOrderInput | SortOrder
    description?: SortOrderInput | SortOrder
    developer?: SortOrderInput | SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
    images?: ImageOrderByRelationAggregateInput
  }

  export type ReadyApartmentWhereUniqueInput = Prisma.AtLeast<{
    id?: number
    AND?: ReadyApartmentWhereInput | ReadyApartmentWhereInput[]
    OR?: ReadyApartmentWhereInput[]
    NOT?: ReadyApartmentWhereInput | ReadyApartmentWhereInput[]
    title?: StringFilter<"ReadyApartment"> | string
    complexName?: StringNullableFilter<"ReadyApartment"> | string | null
    address?: StringFilter<"ReadyApartment"> | string
    city?: StringNullableFilter<"ReadyApartment"> | string | null
    area?: IntFilter<"ReadyApartment"> | number
    price?: IntFilter<"ReadyApartment"> | number
    pricePerM2?: IntFilter<"ReadyApartment"> | number
    bedrooms?: IntFilter<"ReadyApartment"> | number
    floor?: IntFilter<"ReadyApartment"> | number
    totalFloors?: IntFilter<"ReadyApartment"> | number
    lat?: FloatNullableFilter<"ReadyApartment"> | number | null
    lng?: FloatNullableFilter<"ReadyApartment"> | number | null
    metro?: StringNullableFilter<"ReadyApartment"> | string | null
    metroDistance?: IntNullableFilter<"ReadyApartment"> | number | null
    description?: StringNullableFilter<"ReadyApartment"> | string | null
    developer?: StringNullableFilter<"ReadyApartment"> | string | null
    createdAt?: DateTimeFilter<"ReadyApartment"> | Date | string
    updatedAt?: DateTimeFilter<"ReadyApartment"> | Date | string
    images?: ImageListRelationFilter
  }, "id">

  export type ReadyApartmentOrderByWithAggregationInput = {
    id?: SortOrder
    title?: SortOrder
    complexName?: SortOrderInput | SortOrder
    address?: SortOrder
    city?: SortOrderInput | SortOrder
    area?: SortOrder
    price?: SortOrder
    pricePerM2?: SortOrder
    bedrooms?: SortOrder
    floor?: SortOrder
    totalFloors?: SortOrder
    lat?: SortOrderInput | SortOrder
    lng?: SortOrderInput | SortOrder
    metro?: SortOrderInput | SortOrder
    metroDistance?: SortOrderInput | SortOrder
    description?: SortOrderInput | SortOrder
    developer?: SortOrderInput | SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
    _count?: ReadyApartmentCountOrderByAggregateInput
    _avg?: ReadyApartmentAvgOrderByAggregateInput
    _max?: ReadyApartmentMaxOrderByAggregateInput
    _min?: ReadyApartmentMinOrderByAggregateInput
    _sum?: ReadyApartmentSumOrderByAggregateInput
  }

  export type ReadyApartmentScalarWhereWithAggregatesInput = {
    AND?: ReadyApartmentScalarWhereWithAggregatesInput | ReadyApartmentScalarWhereWithAggregatesInput[]
    OR?: ReadyApartmentScalarWhereWithAggregatesInput[]
    NOT?: ReadyApartmentScalarWhereWithAggregatesInput | ReadyApartmentScalarWhereWithAggregatesInput[]
    id?: IntWithAggregatesFilter<"ReadyApartment"> | number
    title?: StringWithAggregatesFilter<"ReadyApartment"> | string
    complexName?: StringNullableWithAggregatesFilter<"ReadyApartment"> | string | null
    address?: StringWithAggregatesFilter<"ReadyApartment"> | string
    city?: StringNullableWithAggregatesFilter<"ReadyApartment"> | string | null
    area?: IntWithAggregatesFilter<"ReadyApartment"> | number
    price?: IntWithAggregatesFilter<"ReadyApartment"> | number
    pricePerM2?: IntWithAggregatesFilter<"ReadyApartment"> | number
    bedrooms?: IntWithAggregatesFilter<"ReadyApartment"> | number
    floor?: IntWithAggregatesFilter<"ReadyApartment"> | number
    totalFloors?: IntWithAggregatesFilter<"ReadyApartment"> | number
    lat?: FloatNullableWithAggregatesFilter<"ReadyApartment"> | number | null
    lng?: FloatNullableWithAggregatesFilter<"ReadyApartment"> | number | null
    metro?: StringNullableWithAggregatesFilter<"ReadyApartment"> | string | null
    metroDistance?: IntNullableWithAggregatesFilter<"ReadyApartment"> | number | null
    description?: StringNullableWithAggregatesFilter<"ReadyApartment"> | string | null
    developer?: StringNullableWithAggregatesFilter<"ReadyApartment"> | string | null
    createdAt?: DateTimeWithAggregatesFilter<"ReadyApartment"> | Date | string
    updatedAt?: DateTimeWithAggregatesFilter<"ReadyApartment"> | Date | string
  }

  export type RentalApartmentWhereInput = {
    AND?: RentalApartmentWhereInput | RentalApartmentWhereInput[]
    OR?: RentalApartmentWhereInput[]
    NOT?: RentalApartmentWhereInput | RentalApartmentWhereInput[]
    id?: IntFilter<"RentalApartment"> | number
    title?: StringFilter<"RentalApartment"> | string
    address?: StringFilter<"RentalApartment"> | string
    area?: IntFilter<"RentalApartment"> | number
    pricePerMonth?: IntFilter<"RentalApartment"> | number
    bedrooms?: IntFilter<"RentalApartment"> | number
    lat?: FloatNullableFilter<"RentalApartment"> | number | null
    lng?: FloatNullableFilter<"RentalApartment"> | number | null
    floor?: IntFilter<"RentalApartment"> | number
    totalFloors?: IntFilter<"RentalApartment"> | number
    city?: StringNullableFilter<"RentalApartment"> | string | null
    metro?: StringNullableFilter<"RentalApartment"> | string | null
    metroDistance?: IntNullableFilter<"RentalApartment"> | number | null
    description?: StringNullableFilter<"RentalApartment"> | string | null
    createdAt?: DateTimeFilter<"RentalApartment"> | Date | string
    updatedAt?: DateTimeFilter<"RentalApartment"> | Date | string
    images?: ImageListRelationFilter
  }

  export type RentalApartmentOrderByWithRelationInput = {
    id?: SortOrder
    title?: SortOrder
    address?: SortOrder
    area?: SortOrder
    pricePerMonth?: SortOrder
    bedrooms?: SortOrder
    lat?: SortOrderInput | SortOrder
    lng?: SortOrderInput | SortOrder
    floor?: SortOrder
    totalFloors?: SortOrder
    city?: SortOrderInput | SortOrder
    metro?: SortOrderInput | SortOrder
    metroDistance?: SortOrderInput | SortOrder
    description?: SortOrderInput | SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
    images?: ImageOrderByRelationAggregateInput
  }

  export type RentalApartmentWhereUniqueInput = Prisma.AtLeast<{
    id?: number
    AND?: RentalApartmentWhereInput | RentalApartmentWhereInput[]
    OR?: RentalApartmentWhereInput[]
    NOT?: RentalApartmentWhereInput | RentalApartmentWhereInput[]
    title?: StringFilter<"RentalApartment"> | string
    address?: StringFilter<"RentalApartment"> | string
    area?: IntFilter<"RentalApartment"> | number
    pricePerMonth?: IntFilter<"RentalApartment"> | number
    bedrooms?: IntFilter<"RentalApartment"> | number
    lat?: FloatNullableFilter<"RentalApartment"> | number | null
    lng?: FloatNullableFilter<"RentalApartment"> | number | null
    floor?: IntFilter<"RentalApartment"> | number
    totalFloors?: IntFilter<"RentalApartment"> | number
    city?: StringNullableFilter<"RentalApartment"> | string | null
    metro?: StringNullableFilter<"RentalApartment"> | string | null
    metroDistance?: IntNullableFilter<"RentalApartment"> | number | null
    description?: StringNullableFilter<"RentalApartment"> | string | null
    createdAt?: DateTimeFilter<"RentalApartment"> | Date | string
    updatedAt?: DateTimeFilter<"RentalApartment"> | Date | string
    images?: ImageListRelationFilter
  }, "id">

  export type RentalApartmentOrderByWithAggregationInput = {
    id?: SortOrder
    title?: SortOrder
    address?: SortOrder
    area?: SortOrder
    pricePerMonth?: SortOrder
    bedrooms?: SortOrder
    lat?: SortOrderInput | SortOrder
    lng?: SortOrderInput | SortOrder
    floor?: SortOrder
    totalFloors?: SortOrder
    city?: SortOrderInput | SortOrder
    metro?: SortOrderInput | SortOrder
    metroDistance?: SortOrderInput | SortOrder
    description?: SortOrderInput | SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
    _count?: RentalApartmentCountOrderByAggregateInput
    _avg?: RentalApartmentAvgOrderByAggregateInput
    _max?: RentalApartmentMaxOrderByAggregateInput
    _min?: RentalApartmentMinOrderByAggregateInput
    _sum?: RentalApartmentSumOrderByAggregateInput
  }

  export type RentalApartmentScalarWhereWithAggregatesInput = {
    AND?: RentalApartmentScalarWhereWithAggregatesInput | RentalApartmentScalarWhereWithAggregatesInput[]
    OR?: RentalApartmentScalarWhereWithAggregatesInput[]
    NOT?: RentalApartmentScalarWhereWithAggregatesInput | RentalApartmentScalarWhereWithAggregatesInput[]
    id?: IntWithAggregatesFilter<"RentalApartment"> | number
    title?: StringWithAggregatesFilter<"RentalApartment"> | string
    address?: StringWithAggregatesFilter<"RentalApartment"> | string
    area?: IntWithAggregatesFilter<"RentalApartment"> | number
    pricePerMonth?: IntWithAggregatesFilter<"RentalApartment"> | number
    bedrooms?: IntWithAggregatesFilter<"RentalApartment"> | number
    lat?: FloatNullableWithAggregatesFilter<"RentalApartment"> | number | null
    lng?: FloatNullableWithAggregatesFilter<"RentalApartment"> | number | null
    floor?: IntWithAggregatesFilter<"RentalApartment"> | number
    totalFloors?: IntWithAggregatesFilter<"RentalApartment"> | number
    city?: StringNullableWithAggregatesFilter<"RentalApartment"> | string | null
    metro?: StringNullableWithAggregatesFilter<"RentalApartment"> | string | null
    metroDistance?: IntNullableWithAggregatesFilter<"RentalApartment"> | number | null
    description?: StringNullableWithAggregatesFilter<"RentalApartment"> | string | null
    createdAt?: DateTimeWithAggregatesFilter<"RentalApartment"> | Date | string
    updatedAt?: DateTimeWithAggregatesFilter<"RentalApartment"> | Date | string
  }

  export type CountryPropertyWhereInput = {
    AND?: CountryPropertyWhereInput | CountryPropertyWhereInput[]
    OR?: CountryPropertyWhereInput[]
    NOT?: CountryPropertyWhereInput | CountryPropertyWhereInput[]
    id?: IntFilter<"CountryProperty"> | number
    title?: StringFilter<"CountryProperty"> | string
    address?: StringFilter<"CountryProperty"> | string
    metro?: StringNullableFilter<"CountryProperty"> | string | null
    metroDistance?: IntNullableFilter<"CountryProperty"> | number | null
    city?: StringNullableFilter<"CountryProperty"> | string | null
    price?: IntFilter<"CountryProperty"> | number
    lat?: FloatNullableFilter<"CountryProperty"> | number | null
    lng?: FloatNullableFilter<"CountryProperty"> | number | null
    landArea?: IntFilter<"CountryProperty"> | number
    bedrooms?: IntFilter<"CountryProperty"> | number
    totalFloors?: IntFilter<"CountryProperty"> | number
    pricePerM2?: IntFilter<"CountryProperty"> | number
    description?: StringNullableFilter<"CountryProperty"> | string | null
    createdAt?: DateTimeFilter<"CountryProperty"> | Date | string
    updatedAt?: DateTimeFilter<"CountryProperty"> | Date | string
    images?: ImageListRelationFilter
  }

  export type CountryPropertyOrderByWithRelationInput = {
    id?: SortOrder
    title?: SortOrder
    address?: SortOrder
    metro?: SortOrderInput | SortOrder
    metroDistance?: SortOrderInput | SortOrder
    city?: SortOrderInput | SortOrder
    price?: SortOrder
    lat?: SortOrderInput | SortOrder
    lng?: SortOrderInput | SortOrder
    landArea?: SortOrder
    bedrooms?: SortOrder
    totalFloors?: SortOrder
    pricePerM2?: SortOrder
    description?: SortOrderInput | SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
    images?: ImageOrderByRelationAggregateInput
  }

  export type CountryPropertyWhereUniqueInput = Prisma.AtLeast<{
    id?: number
    AND?: CountryPropertyWhereInput | CountryPropertyWhereInput[]
    OR?: CountryPropertyWhereInput[]
    NOT?: CountryPropertyWhereInput | CountryPropertyWhereInput[]
    title?: StringFilter<"CountryProperty"> | string
    address?: StringFilter<"CountryProperty"> | string
    metro?: StringNullableFilter<"CountryProperty"> | string | null
    metroDistance?: IntNullableFilter<"CountryProperty"> | number | null
    city?: StringNullableFilter<"CountryProperty"> | string | null
    price?: IntFilter<"CountryProperty"> | number
    lat?: FloatNullableFilter<"CountryProperty"> | number | null
    lng?: FloatNullableFilter<"CountryProperty"> | number | null
    landArea?: IntFilter<"CountryProperty"> | number
    bedrooms?: IntFilter<"CountryProperty"> | number
    totalFloors?: IntFilter<"CountryProperty"> | number
    pricePerM2?: IntFilter<"CountryProperty"> | number
    description?: StringNullableFilter<"CountryProperty"> | string | null
    createdAt?: DateTimeFilter<"CountryProperty"> | Date | string
    updatedAt?: DateTimeFilter<"CountryProperty"> | Date | string
    images?: ImageListRelationFilter
  }, "id">

  export type CountryPropertyOrderByWithAggregationInput = {
    id?: SortOrder
    title?: SortOrder
    address?: SortOrder
    metro?: SortOrderInput | SortOrder
    metroDistance?: SortOrderInput | SortOrder
    city?: SortOrderInput | SortOrder
    price?: SortOrder
    lat?: SortOrderInput | SortOrder
    lng?: SortOrderInput | SortOrder
    landArea?: SortOrder
    bedrooms?: SortOrder
    totalFloors?: SortOrder
    pricePerM2?: SortOrder
    description?: SortOrderInput | SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
    _count?: CountryPropertyCountOrderByAggregateInput
    _avg?: CountryPropertyAvgOrderByAggregateInput
    _max?: CountryPropertyMaxOrderByAggregateInput
    _min?: CountryPropertyMinOrderByAggregateInput
    _sum?: CountryPropertySumOrderByAggregateInput
  }

  export type CountryPropertyScalarWhereWithAggregatesInput = {
    AND?: CountryPropertyScalarWhereWithAggregatesInput | CountryPropertyScalarWhereWithAggregatesInput[]
    OR?: CountryPropertyScalarWhereWithAggregatesInput[]
    NOT?: CountryPropertyScalarWhereWithAggregatesInput | CountryPropertyScalarWhereWithAggregatesInput[]
    id?: IntWithAggregatesFilter<"CountryProperty"> | number
    title?: StringWithAggregatesFilter<"CountryProperty"> | string
    address?: StringWithAggregatesFilter<"CountryProperty"> | string
    metro?: StringNullableWithAggregatesFilter<"CountryProperty"> | string | null
    metroDistance?: IntNullableWithAggregatesFilter<"CountryProperty"> | number | null
    city?: StringNullableWithAggregatesFilter<"CountryProperty"> | string | null
    price?: IntWithAggregatesFilter<"CountryProperty"> | number
    lat?: FloatNullableWithAggregatesFilter<"CountryProperty"> | number | null
    lng?: FloatNullableWithAggregatesFilter<"CountryProperty"> | number | null
    landArea?: IntWithAggregatesFilter<"CountryProperty"> | number
    bedrooms?: IntWithAggregatesFilter<"CountryProperty"> | number
    totalFloors?: IntWithAggregatesFilter<"CountryProperty"> | number
    pricePerM2?: IntWithAggregatesFilter<"CountryProperty"> | number
    description?: StringNullableWithAggregatesFilter<"CountryProperty"> | string | null
    createdAt?: DateTimeWithAggregatesFilter<"CountryProperty"> | Date | string
    updatedAt?: DateTimeWithAggregatesFilter<"CountryProperty"> | Date | string
  }

  export type CommercialPropertyWhereInput = {
    AND?: CommercialPropertyWhereInput | CommercialPropertyWhereInput[]
    OR?: CommercialPropertyWhereInput[]
    NOT?: CommercialPropertyWhereInput | CommercialPropertyWhereInput[]
    id?: IntFilter<"CommercialProperty"> | number
    title?: StringFilter<"CommercialProperty"> | string
    address?: StringFilter<"CommercialProperty"> | string
    price?: IntFilter<"CommercialProperty"> | number
    pricePerM2?: IntFilter<"CommercialProperty"> | number
    area?: IntFilter<"CommercialProperty"> | number
    city?: StringNullableFilter<"CommercialProperty"> | string | null
    lat?: FloatNullableFilter<"CommercialProperty"> | number | null
    lng?: FloatNullableFilter<"CommercialProperty"> | number | null
    hasFinishing?: BoolFilter<"CommercialProperty"> | boolean
    purpose?: StringNullableFilter<"CommercialProperty"> | string | null
    metro?: StringNullableFilter<"CommercialProperty"> | string | null
    metroDistance?: IntNullableFilter<"CommercialProperty"> | number | null
    description?: StringNullableFilter<"CommercialProperty"> | string | null
    createdAt?: DateTimeFilter<"CommercialProperty"> | Date | string
    updatedAt?: DateTimeFilter<"CommercialProperty"> | Date | string
    images?: ImageListRelationFilter
  }

  export type CommercialPropertyOrderByWithRelationInput = {
    id?: SortOrder
    title?: SortOrder
    address?: SortOrder
    price?: SortOrder
    pricePerM2?: SortOrder
    area?: SortOrder
    city?: SortOrderInput | SortOrder
    lat?: SortOrderInput | SortOrder
    lng?: SortOrderInput | SortOrder
    hasFinishing?: SortOrder
    purpose?: SortOrderInput | SortOrder
    metro?: SortOrderInput | SortOrder
    metroDistance?: SortOrderInput | SortOrder
    description?: SortOrderInput | SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
    images?: ImageOrderByRelationAggregateInput
  }

  export type CommercialPropertyWhereUniqueInput = Prisma.AtLeast<{
    id?: number
    AND?: CommercialPropertyWhereInput | CommercialPropertyWhereInput[]
    OR?: CommercialPropertyWhereInput[]
    NOT?: CommercialPropertyWhereInput | CommercialPropertyWhereInput[]
    title?: StringFilter<"CommercialProperty"> | string
    address?: StringFilter<"CommercialProperty"> | string
    price?: IntFilter<"CommercialProperty"> | number
    pricePerM2?: IntFilter<"CommercialProperty"> | number
    area?: IntFilter<"CommercialProperty"> | number
    city?: StringNullableFilter<"CommercialProperty"> | string | null
    lat?: FloatNullableFilter<"CommercialProperty"> | number | null
    lng?: FloatNullableFilter<"CommercialProperty"> | number | null
    hasFinishing?: BoolFilter<"CommercialProperty"> | boolean
    purpose?: StringNullableFilter<"CommercialProperty"> | string | null
    metro?: StringNullableFilter<"CommercialProperty"> | string | null
    metroDistance?: IntNullableFilter<"CommercialProperty"> | number | null
    description?: StringNullableFilter<"CommercialProperty"> | string | null
    createdAt?: DateTimeFilter<"CommercialProperty"> | Date | string
    updatedAt?: DateTimeFilter<"CommercialProperty"> | Date | string
    images?: ImageListRelationFilter
  }, "id">

  export type CommercialPropertyOrderByWithAggregationInput = {
    id?: SortOrder
    title?: SortOrder
    address?: SortOrder
    price?: SortOrder
    pricePerM2?: SortOrder
    area?: SortOrder
    city?: SortOrderInput | SortOrder
    lat?: SortOrderInput | SortOrder
    lng?: SortOrderInput | SortOrder
    hasFinishing?: SortOrder
    purpose?: SortOrderInput | SortOrder
    metro?: SortOrderInput | SortOrder
    metroDistance?: SortOrderInput | SortOrder
    description?: SortOrderInput | SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
    _count?: CommercialPropertyCountOrderByAggregateInput
    _avg?: CommercialPropertyAvgOrderByAggregateInput
    _max?: CommercialPropertyMaxOrderByAggregateInput
    _min?: CommercialPropertyMinOrderByAggregateInput
    _sum?: CommercialPropertySumOrderByAggregateInput
  }

  export type CommercialPropertyScalarWhereWithAggregatesInput = {
    AND?: CommercialPropertyScalarWhereWithAggregatesInput | CommercialPropertyScalarWhereWithAggregatesInput[]
    OR?: CommercialPropertyScalarWhereWithAggregatesInput[]
    NOT?: CommercialPropertyScalarWhereWithAggregatesInput | CommercialPropertyScalarWhereWithAggregatesInput[]
    id?: IntWithAggregatesFilter<"CommercialProperty"> | number
    title?: StringWithAggregatesFilter<"CommercialProperty"> | string
    address?: StringWithAggregatesFilter<"CommercialProperty"> | string
    price?: IntWithAggregatesFilter<"CommercialProperty"> | number
    pricePerM2?: IntWithAggregatesFilter<"CommercialProperty"> | number
    area?: IntWithAggregatesFilter<"CommercialProperty"> | number
    city?: StringNullableWithAggregatesFilter<"CommercialProperty"> | string | null
    lat?: FloatNullableWithAggregatesFilter<"CommercialProperty"> | number | null
    lng?: FloatNullableWithAggregatesFilter<"CommercialProperty"> | number | null
    hasFinishing?: BoolWithAggregatesFilter<"CommercialProperty"> | boolean
    purpose?: StringNullableWithAggregatesFilter<"CommercialProperty"> | string | null
    metro?: StringNullableWithAggregatesFilter<"CommercialProperty"> | string | null
    metroDistance?: IntNullableWithAggregatesFilter<"CommercialProperty"> | number | null
    description?: StringNullableWithAggregatesFilter<"CommercialProperty"> | string | null
    createdAt?: DateTimeWithAggregatesFilter<"CommercialProperty"> | Date | string
    updatedAt?: DateTimeWithAggregatesFilter<"CommercialProperty"> | Date | string
  }

  export type RealtorCreateInput = {
    fullName: string
    phone?: string | null
    email?: string | null
    avatarUrl?: string | null
    position?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
  }

  export type RealtorUncheckedCreateInput = {
    id?: number
    fullName: string
    phone?: string | null
    email?: string | null
    avatarUrl?: string | null
    position?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
  }

  export type RealtorUpdateInput = {
    fullName?: StringFieldUpdateOperationsInput | string
    phone?: NullableStringFieldUpdateOperationsInput | string | null
    email?: NullableStringFieldUpdateOperationsInput | string | null
    avatarUrl?: NullableStringFieldUpdateOperationsInput | string | null
    position?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type RealtorUncheckedUpdateInput = {
    id?: IntFieldUpdateOperationsInput | number
    fullName?: StringFieldUpdateOperationsInput | string
    phone?: NullableStringFieldUpdateOperationsInput | string | null
    email?: NullableStringFieldUpdateOperationsInput | string | null
    avatarUrl?: NullableStringFieldUpdateOperationsInput | string | null
    position?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type RealtorCreateManyInput = {
    id?: number
    fullName: string
    phone?: string | null
    email?: string | null
    avatarUrl?: string | null
    position?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
  }

  export type RealtorUpdateManyMutationInput = {
    fullName?: StringFieldUpdateOperationsInput | string
    phone?: NullableStringFieldUpdateOperationsInput | string | null
    email?: NullableStringFieldUpdateOperationsInput | string | null
    avatarUrl?: NullableStringFieldUpdateOperationsInput | string | null
    position?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type RealtorUncheckedUpdateManyInput = {
    id?: IntFieldUpdateOperationsInput | number
    fullName?: StringFieldUpdateOperationsInput | string
    phone?: NullableStringFieldUpdateOperationsInput | string | null
    email?: NullableStringFieldUpdateOperationsInput | string | null
    avatarUrl?: NullableStringFieldUpdateOperationsInput | string | null
    position?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ApplicationCreateInput = {
    name: string
    phone: string
    status?: $Enums.ApplicationStatus
    propertyType?: string | null
    propertyId?: number | null
    link: string
    createdAt?: Date | string
    updatedAt?: Date | string
  }

  export type ApplicationUncheckedCreateInput = {
    id?: number
    name: string
    phone: string
    status?: $Enums.ApplicationStatus
    propertyType?: string | null
    propertyId?: number | null
    link: string
    createdAt?: Date | string
    updatedAt?: Date | string
  }

  export type ApplicationUpdateInput = {
    name?: StringFieldUpdateOperationsInput | string
    phone?: StringFieldUpdateOperationsInput | string
    status?: EnumApplicationStatusFieldUpdateOperationsInput | $Enums.ApplicationStatus
    propertyType?: NullableStringFieldUpdateOperationsInput | string | null
    propertyId?: NullableIntFieldUpdateOperationsInput | number | null
    link?: StringFieldUpdateOperationsInput | string
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ApplicationUncheckedUpdateInput = {
    id?: IntFieldUpdateOperationsInput | number
    name?: StringFieldUpdateOperationsInput | string
    phone?: StringFieldUpdateOperationsInput | string
    status?: EnumApplicationStatusFieldUpdateOperationsInput | $Enums.ApplicationStatus
    propertyType?: NullableStringFieldUpdateOperationsInput | string | null
    propertyId?: NullableIntFieldUpdateOperationsInput | number | null
    link?: StringFieldUpdateOperationsInput | string
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ApplicationCreateManyInput = {
    id?: number
    name: string
    phone: string
    status?: $Enums.ApplicationStatus
    propertyType?: string | null
    propertyId?: number | null
    link: string
    createdAt?: Date | string
    updatedAt?: Date | string
  }

  export type ApplicationUpdateManyMutationInput = {
    name?: StringFieldUpdateOperationsInput | string
    phone?: StringFieldUpdateOperationsInput | string
    status?: EnumApplicationStatusFieldUpdateOperationsInput | $Enums.ApplicationStatus
    propertyType?: NullableStringFieldUpdateOperationsInput | string | null
    propertyId?: NullableIntFieldUpdateOperationsInput | number | null
    link?: StringFieldUpdateOperationsInput | string
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ApplicationUncheckedUpdateManyInput = {
    id?: IntFieldUpdateOperationsInput | number
    name?: StringFieldUpdateOperationsInput | string
    phone?: StringFieldUpdateOperationsInput | string
    status?: EnumApplicationStatusFieldUpdateOperationsInput | $Enums.ApplicationStatus
    propertyType?: NullableStringFieldUpdateOperationsInput | string | null
    propertyId?: NullableIntFieldUpdateOperationsInput | number | null
    link?: StringFieldUpdateOperationsInput | string
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ImageCreateInput = {
    url: string
    createdAt?: Date | string
    newBuildingComplex?: NewBuildingComplexCreateNestedOneWithoutImagesInput
    newBuildingApartment?: NewBuildingApartmentCreateNestedOneWithoutImagesInput
    readyApartment?: ReadyApartmentCreateNestedOneWithoutImagesInput
    rentalApartment?: RentalApartmentCreateNestedOneWithoutImagesInput
    countryProperty?: CountryPropertyCreateNestedOneWithoutImagesInput
    commercialProperty?: CommercialPropertyCreateNestedOneWithoutImagesInput
  }

  export type ImageUncheckedCreateInput = {
    id?: number
    url: string
    newBuildingComplexId?: number | null
    newBuildingApartmentId?: number | null
    readyApartmentId?: number | null
    rentalApartmentId?: number | null
    countryPropertyId?: number | null
    commercialPropertyId?: number | null
    createdAt?: Date | string
  }

  export type ImageUpdateInput = {
    url?: StringFieldUpdateOperationsInput | string
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    newBuildingComplex?: NewBuildingComplexUpdateOneWithoutImagesNestedInput
    newBuildingApartment?: NewBuildingApartmentUpdateOneWithoutImagesNestedInput
    readyApartment?: ReadyApartmentUpdateOneWithoutImagesNestedInput
    rentalApartment?: RentalApartmentUpdateOneWithoutImagesNestedInput
    countryProperty?: CountryPropertyUpdateOneWithoutImagesNestedInput
    commercialProperty?: CommercialPropertyUpdateOneWithoutImagesNestedInput
  }

  export type ImageUncheckedUpdateInput = {
    id?: IntFieldUpdateOperationsInput | number
    url?: StringFieldUpdateOperationsInput | string
    newBuildingComplexId?: NullableIntFieldUpdateOperationsInput | number | null
    newBuildingApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    readyApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    rentalApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    countryPropertyId?: NullableIntFieldUpdateOperationsInput | number | null
    commercialPropertyId?: NullableIntFieldUpdateOperationsInput | number | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ImageCreateManyInput = {
    id?: number
    url: string
    newBuildingComplexId?: number | null
    newBuildingApartmentId?: number | null
    readyApartmentId?: number | null
    rentalApartmentId?: number | null
    countryPropertyId?: number | null
    commercialPropertyId?: number | null
    createdAt?: Date | string
  }

  export type ImageUpdateManyMutationInput = {
    url?: StringFieldUpdateOperationsInput | string
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ImageUncheckedUpdateManyInput = {
    id?: IntFieldUpdateOperationsInput | number
    url?: StringFieldUpdateOperationsInput | string
    newBuildingComplexId?: NullableIntFieldUpdateOperationsInput | number | null
    newBuildingApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    readyApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    rentalApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    countryPropertyId?: NullableIntFieldUpdateOperationsInput | number | null
    commercialPropertyId?: NullableIntFieldUpdateOperationsInput | number | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type NewBuildingComplexCreateInput = {
    name: string
    address: string
    district?: string | null
    metro?: string | null
    metroDistance?: number | null
    city?: string | null
    developer: string
    priceFrom: number
    areaFrom?: number | null
    buildingClass?: string | null
    floors?: number | null
    totalApartments?: number | null
    availableApartments?: number | null
    lat?: number | null
    lng?: number | null
    completionDate?: Date | string | null
    height?: number | null
    hasParking?: boolean
    description?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
    images?: ImageCreateNestedManyWithoutNewBuildingComplexInput
    apartments?: NewBuildingApartmentCreateNestedManyWithoutComplexInput
    nearbyPlaces?: NearbyPlaceCreateNestedManyWithoutComplexInput
  }

  export type NewBuildingComplexUncheckedCreateInput = {
    id?: number
    name: string
    address: string
    district?: string | null
    metro?: string | null
    metroDistance?: number | null
    city?: string | null
    developer: string
    priceFrom: number
    areaFrom?: number | null
    buildingClass?: string | null
    floors?: number | null
    totalApartments?: number | null
    availableApartments?: number | null
    lat?: number | null
    lng?: number | null
    completionDate?: Date | string | null
    height?: number | null
    hasParking?: boolean
    description?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
    images?: ImageUncheckedCreateNestedManyWithoutNewBuildingComplexInput
    apartments?: NewBuildingApartmentUncheckedCreateNestedManyWithoutComplexInput
    nearbyPlaces?: NearbyPlaceUncheckedCreateNestedManyWithoutComplexInput
  }

  export type NewBuildingComplexUpdateInput = {
    name?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    district?: NullableStringFieldUpdateOperationsInput | string | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    city?: NullableStringFieldUpdateOperationsInput | string | null
    developer?: StringFieldUpdateOperationsInput | string
    priceFrom?: IntFieldUpdateOperationsInput | number
    areaFrom?: NullableIntFieldUpdateOperationsInput | number | null
    buildingClass?: NullableStringFieldUpdateOperationsInput | string | null
    floors?: NullableIntFieldUpdateOperationsInput | number | null
    totalApartments?: NullableIntFieldUpdateOperationsInput | number | null
    availableApartments?: NullableIntFieldUpdateOperationsInput | number | null
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    completionDate?: NullableDateTimeFieldUpdateOperationsInput | Date | string | null
    height?: NullableIntFieldUpdateOperationsInput | number | null
    hasParking?: BoolFieldUpdateOperationsInput | boolean
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
    images?: ImageUpdateManyWithoutNewBuildingComplexNestedInput
    apartments?: NewBuildingApartmentUpdateManyWithoutComplexNestedInput
    nearbyPlaces?: NearbyPlaceUpdateManyWithoutComplexNestedInput
  }

  export type NewBuildingComplexUncheckedUpdateInput = {
    id?: IntFieldUpdateOperationsInput | number
    name?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    district?: NullableStringFieldUpdateOperationsInput | string | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    city?: NullableStringFieldUpdateOperationsInput | string | null
    developer?: StringFieldUpdateOperationsInput | string
    priceFrom?: IntFieldUpdateOperationsInput | number
    areaFrom?: NullableIntFieldUpdateOperationsInput | number | null
    buildingClass?: NullableStringFieldUpdateOperationsInput | string | null
    floors?: NullableIntFieldUpdateOperationsInput | number | null
    totalApartments?: NullableIntFieldUpdateOperationsInput | number | null
    availableApartments?: NullableIntFieldUpdateOperationsInput | number | null
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    completionDate?: NullableDateTimeFieldUpdateOperationsInput | Date | string | null
    height?: NullableIntFieldUpdateOperationsInput | number | null
    hasParking?: BoolFieldUpdateOperationsInput | boolean
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
    images?: ImageUncheckedUpdateManyWithoutNewBuildingComplexNestedInput
    apartments?: NewBuildingApartmentUncheckedUpdateManyWithoutComplexNestedInput
    nearbyPlaces?: NearbyPlaceUncheckedUpdateManyWithoutComplexNestedInput
  }

  export type NewBuildingComplexCreateManyInput = {
    id?: number
    name: string
    address: string
    district?: string | null
    metro?: string | null
    metroDistance?: number | null
    city?: string | null
    developer: string
    priceFrom: number
    areaFrom?: number | null
    buildingClass?: string | null
    floors?: number | null
    totalApartments?: number | null
    availableApartments?: number | null
    lat?: number | null
    lng?: number | null
    completionDate?: Date | string | null
    height?: number | null
    hasParking?: boolean
    description?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
  }

  export type NewBuildingComplexUpdateManyMutationInput = {
    name?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    district?: NullableStringFieldUpdateOperationsInput | string | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    city?: NullableStringFieldUpdateOperationsInput | string | null
    developer?: StringFieldUpdateOperationsInput | string
    priceFrom?: IntFieldUpdateOperationsInput | number
    areaFrom?: NullableIntFieldUpdateOperationsInput | number | null
    buildingClass?: NullableStringFieldUpdateOperationsInput | string | null
    floors?: NullableIntFieldUpdateOperationsInput | number | null
    totalApartments?: NullableIntFieldUpdateOperationsInput | number | null
    availableApartments?: NullableIntFieldUpdateOperationsInput | number | null
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    completionDate?: NullableDateTimeFieldUpdateOperationsInput | Date | string | null
    height?: NullableIntFieldUpdateOperationsInput | number | null
    hasParking?: BoolFieldUpdateOperationsInput | boolean
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type NewBuildingComplexUncheckedUpdateManyInput = {
    id?: IntFieldUpdateOperationsInput | number
    name?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    district?: NullableStringFieldUpdateOperationsInput | string | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    city?: NullableStringFieldUpdateOperationsInput | string | null
    developer?: StringFieldUpdateOperationsInput | string
    priceFrom?: IntFieldUpdateOperationsInput | number
    areaFrom?: NullableIntFieldUpdateOperationsInput | number | null
    buildingClass?: NullableStringFieldUpdateOperationsInput | string | null
    floors?: NullableIntFieldUpdateOperationsInput | number | null
    totalApartments?: NullableIntFieldUpdateOperationsInput | number | null
    availableApartments?: NullableIntFieldUpdateOperationsInput | number | null
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    completionDate?: NullableDateTimeFieldUpdateOperationsInput | Date | string | null
    height?: NullableIntFieldUpdateOperationsInput | number | null
    hasParking?: BoolFieldUpdateOperationsInput | boolean
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type NewBuildingApartmentCreateInput = {
    title?: string
    bedrooms: number
    area: number
    price: number
    pricePerM2: number
    floor: number
    totalFloors: number
    city?: string | null
    apartmentNumber?: number
    lat?: number | null
    lng?: number | null
    type: string
    createdAt?: Date | string
    updatedAt?: Date | string
    complex: NewBuildingComplexCreateNestedOneWithoutApartmentsInput
    images?: ImageCreateNestedManyWithoutNewBuildingApartmentInput
  }

  export type NewBuildingApartmentUncheckedCreateInput = {
    id?: number
    complexId: number
    title?: string
    bedrooms: number
    area: number
    price: number
    pricePerM2: number
    floor: number
    totalFloors: number
    city?: string | null
    apartmentNumber?: number
    lat?: number | null
    lng?: number | null
    type: string
    createdAt?: Date | string
    updatedAt?: Date | string
    images?: ImageUncheckedCreateNestedManyWithoutNewBuildingApartmentInput
  }

  export type NewBuildingApartmentUpdateInput = {
    title?: StringFieldUpdateOperationsInput | string
    bedrooms?: IntFieldUpdateOperationsInput | number
    area?: IntFieldUpdateOperationsInput | number
    price?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    floor?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    city?: NullableStringFieldUpdateOperationsInput | string | null
    apartmentNumber?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    type?: StringFieldUpdateOperationsInput | string
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
    complex?: NewBuildingComplexUpdateOneRequiredWithoutApartmentsNestedInput
    images?: ImageUpdateManyWithoutNewBuildingApartmentNestedInput
  }

  export type NewBuildingApartmentUncheckedUpdateInput = {
    id?: IntFieldUpdateOperationsInput | number
    complexId?: IntFieldUpdateOperationsInput | number
    title?: StringFieldUpdateOperationsInput | string
    bedrooms?: IntFieldUpdateOperationsInput | number
    area?: IntFieldUpdateOperationsInput | number
    price?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    floor?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    city?: NullableStringFieldUpdateOperationsInput | string | null
    apartmentNumber?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    type?: StringFieldUpdateOperationsInput | string
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
    images?: ImageUncheckedUpdateManyWithoutNewBuildingApartmentNestedInput
  }

  export type NewBuildingApartmentCreateManyInput = {
    id?: number
    complexId: number
    title?: string
    bedrooms: number
    area: number
    price: number
    pricePerM2: number
    floor: number
    totalFloors: number
    city?: string | null
    apartmentNumber?: number
    lat?: number | null
    lng?: number | null
    type: string
    createdAt?: Date | string
    updatedAt?: Date | string
  }

  export type NewBuildingApartmentUpdateManyMutationInput = {
    title?: StringFieldUpdateOperationsInput | string
    bedrooms?: IntFieldUpdateOperationsInput | number
    area?: IntFieldUpdateOperationsInput | number
    price?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    floor?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    city?: NullableStringFieldUpdateOperationsInput | string | null
    apartmentNumber?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    type?: StringFieldUpdateOperationsInput | string
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type NewBuildingApartmentUncheckedUpdateManyInput = {
    id?: IntFieldUpdateOperationsInput | number
    complexId?: IntFieldUpdateOperationsInput | number
    title?: StringFieldUpdateOperationsInput | string
    bedrooms?: IntFieldUpdateOperationsInput | number
    area?: IntFieldUpdateOperationsInput | number
    price?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    floor?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    city?: NullableStringFieldUpdateOperationsInput | string | null
    apartmentNumber?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    type?: StringFieldUpdateOperationsInput | string
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type NearbyPlaceCreateInput = {
    name: string
    category: string
    distance?: number | null
    icon?: string | null
    createdAt?: Date | string
    complex: NewBuildingComplexCreateNestedOneWithoutNearbyPlacesInput
  }

  export type NearbyPlaceUncheckedCreateInput = {
    id?: number
    complexId: number
    name: string
    category: string
    distance?: number | null
    icon?: string | null
    createdAt?: Date | string
  }

  export type NearbyPlaceUpdateInput = {
    name?: StringFieldUpdateOperationsInput | string
    category?: StringFieldUpdateOperationsInput | string
    distance?: NullableIntFieldUpdateOperationsInput | number | null
    icon?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    complex?: NewBuildingComplexUpdateOneRequiredWithoutNearbyPlacesNestedInput
  }

  export type NearbyPlaceUncheckedUpdateInput = {
    id?: IntFieldUpdateOperationsInput | number
    complexId?: IntFieldUpdateOperationsInput | number
    name?: StringFieldUpdateOperationsInput | string
    category?: StringFieldUpdateOperationsInput | string
    distance?: NullableIntFieldUpdateOperationsInput | number | null
    icon?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type NearbyPlaceCreateManyInput = {
    id?: number
    complexId: number
    name: string
    category: string
    distance?: number | null
    icon?: string | null
    createdAt?: Date | string
  }

  export type NearbyPlaceUpdateManyMutationInput = {
    name?: StringFieldUpdateOperationsInput | string
    category?: StringFieldUpdateOperationsInput | string
    distance?: NullableIntFieldUpdateOperationsInput | number | null
    icon?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type NearbyPlaceUncheckedUpdateManyInput = {
    id?: IntFieldUpdateOperationsInput | number
    complexId?: IntFieldUpdateOperationsInput | number
    name?: StringFieldUpdateOperationsInput | string
    category?: StringFieldUpdateOperationsInput | string
    distance?: NullableIntFieldUpdateOperationsInput | number | null
    icon?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ReviewCreateInput = {
    authorName?: string | null
    rating: number
    comment?: string | null
    createdAt?: Date | string
  }

  export type ReviewUncheckedCreateInput = {
    id?: number
    authorName?: string | null
    rating: number
    comment?: string | null
    createdAt?: Date | string
  }

  export type ReviewUpdateInput = {
    authorName?: NullableStringFieldUpdateOperationsInput | string | null
    rating?: IntFieldUpdateOperationsInput | number
    comment?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ReviewUncheckedUpdateInput = {
    id?: IntFieldUpdateOperationsInput | number
    authorName?: NullableStringFieldUpdateOperationsInput | string | null
    rating?: IntFieldUpdateOperationsInput | number
    comment?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ReviewCreateManyInput = {
    id?: number
    authorName?: string | null
    rating: number
    comment?: string | null
    createdAt?: Date | string
  }

  export type ReviewUpdateManyMutationInput = {
    authorName?: NullableStringFieldUpdateOperationsInput | string | null
    rating?: IntFieldUpdateOperationsInput | number
    comment?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ReviewUncheckedUpdateManyInput = {
    id?: IntFieldUpdateOperationsInput | number
    authorName?: NullableStringFieldUpdateOperationsInput | string | null
    rating?: IntFieldUpdateOperationsInput | number
    comment?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ReadyApartmentCreateInput = {
    title: string
    complexName?: string | null
    address: string
    city?: string | null
    area: number
    price: number
    pricePerM2: number
    bedrooms: number
    floor: number
    totalFloors: number
    lat?: number | null
    lng?: number | null
    metro?: string | null
    metroDistance?: number | null
    description?: string | null
    developer?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
    images?: ImageCreateNestedManyWithoutReadyApartmentInput
  }

  export type ReadyApartmentUncheckedCreateInput = {
    id?: number
    title: string
    complexName?: string | null
    address: string
    city?: string | null
    area: number
    price: number
    pricePerM2: number
    bedrooms: number
    floor: number
    totalFloors: number
    lat?: number | null
    lng?: number | null
    metro?: string | null
    metroDistance?: number | null
    description?: string | null
    developer?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
    images?: ImageUncheckedCreateNestedManyWithoutReadyApartmentInput
  }

  export type ReadyApartmentUpdateInput = {
    title?: StringFieldUpdateOperationsInput | string
    complexName?: NullableStringFieldUpdateOperationsInput | string | null
    address?: StringFieldUpdateOperationsInput | string
    city?: NullableStringFieldUpdateOperationsInput | string | null
    area?: IntFieldUpdateOperationsInput | number
    price?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    bedrooms?: IntFieldUpdateOperationsInput | number
    floor?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    description?: NullableStringFieldUpdateOperationsInput | string | null
    developer?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
    images?: ImageUpdateManyWithoutReadyApartmentNestedInput
  }

  export type ReadyApartmentUncheckedUpdateInput = {
    id?: IntFieldUpdateOperationsInput | number
    title?: StringFieldUpdateOperationsInput | string
    complexName?: NullableStringFieldUpdateOperationsInput | string | null
    address?: StringFieldUpdateOperationsInput | string
    city?: NullableStringFieldUpdateOperationsInput | string | null
    area?: IntFieldUpdateOperationsInput | number
    price?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    bedrooms?: IntFieldUpdateOperationsInput | number
    floor?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    description?: NullableStringFieldUpdateOperationsInput | string | null
    developer?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
    images?: ImageUncheckedUpdateManyWithoutReadyApartmentNestedInput
  }

  export type ReadyApartmentCreateManyInput = {
    id?: number
    title: string
    complexName?: string | null
    address: string
    city?: string | null
    area: number
    price: number
    pricePerM2: number
    bedrooms: number
    floor: number
    totalFloors: number
    lat?: number | null
    lng?: number | null
    metro?: string | null
    metroDistance?: number | null
    description?: string | null
    developer?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
  }

  export type ReadyApartmentUpdateManyMutationInput = {
    title?: StringFieldUpdateOperationsInput | string
    complexName?: NullableStringFieldUpdateOperationsInput | string | null
    address?: StringFieldUpdateOperationsInput | string
    city?: NullableStringFieldUpdateOperationsInput | string | null
    area?: IntFieldUpdateOperationsInput | number
    price?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    bedrooms?: IntFieldUpdateOperationsInput | number
    floor?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    description?: NullableStringFieldUpdateOperationsInput | string | null
    developer?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ReadyApartmentUncheckedUpdateManyInput = {
    id?: IntFieldUpdateOperationsInput | number
    title?: StringFieldUpdateOperationsInput | string
    complexName?: NullableStringFieldUpdateOperationsInput | string | null
    address?: StringFieldUpdateOperationsInput | string
    city?: NullableStringFieldUpdateOperationsInput | string | null
    area?: IntFieldUpdateOperationsInput | number
    price?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    bedrooms?: IntFieldUpdateOperationsInput | number
    floor?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    description?: NullableStringFieldUpdateOperationsInput | string | null
    developer?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type RentalApartmentCreateInput = {
    title: string
    address: string
    area: number
    pricePerMonth: number
    bedrooms: number
    lat?: number | null
    lng?: number | null
    floor: number
    totalFloors: number
    city?: string | null
    metro?: string | null
    metroDistance?: number | null
    description?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
    images?: ImageCreateNestedManyWithoutRentalApartmentInput
  }

  export type RentalApartmentUncheckedCreateInput = {
    id?: number
    title: string
    address: string
    area: number
    pricePerMonth: number
    bedrooms: number
    lat?: number | null
    lng?: number | null
    floor: number
    totalFloors: number
    city?: string | null
    metro?: string | null
    metroDistance?: number | null
    description?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
    images?: ImageUncheckedCreateNestedManyWithoutRentalApartmentInput
  }

  export type RentalApartmentUpdateInput = {
    title?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    area?: IntFieldUpdateOperationsInput | number
    pricePerMonth?: IntFieldUpdateOperationsInput | number
    bedrooms?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    floor?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    city?: NullableStringFieldUpdateOperationsInput | string | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
    images?: ImageUpdateManyWithoutRentalApartmentNestedInput
  }

  export type RentalApartmentUncheckedUpdateInput = {
    id?: IntFieldUpdateOperationsInput | number
    title?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    area?: IntFieldUpdateOperationsInput | number
    pricePerMonth?: IntFieldUpdateOperationsInput | number
    bedrooms?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    floor?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    city?: NullableStringFieldUpdateOperationsInput | string | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
    images?: ImageUncheckedUpdateManyWithoutRentalApartmentNestedInput
  }

  export type RentalApartmentCreateManyInput = {
    id?: number
    title: string
    address: string
    area: number
    pricePerMonth: number
    bedrooms: number
    lat?: number | null
    lng?: number | null
    floor: number
    totalFloors: number
    city?: string | null
    metro?: string | null
    metroDistance?: number | null
    description?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
  }

  export type RentalApartmentUpdateManyMutationInput = {
    title?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    area?: IntFieldUpdateOperationsInput | number
    pricePerMonth?: IntFieldUpdateOperationsInput | number
    bedrooms?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    floor?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    city?: NullableStringFieldUpdateOperationsInput | string | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type RentalApartmentUncheckedUpdateManyInput = {
    id?: IntFieldUpdateOperationsInput | number
    title?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    area?: IntFieldUpdateOperationsInput | number
    pricePerMonth?: IntFieldUpdateOperationsInput | number
    bedrooms?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    floor?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    city?: NullableStringFieldUpdateOperationsInput | string | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type CountryPropertyCreateInput = {
    title: string
    address: string
    metro?: string | null
    metroDistance?: number | null
    city?: string | null
    price: number
    lat?: number | null
    lng?: number | null
    landArea: number
    bedrooms: number
    totalFloors: number
    pricePerM2: number
    description?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
    images?: ImageCreateNestedManyWithoutCountryPropertyInput
  }

  export type CountryPropertyUncheckedCreateInput = {
    id?: number
    title: string
    address: string
    metro?: string | null
    metroDistance?: number | null
    city?: string | null
    price: number
    lat?: number | null
    lng?: number | null
    landArea: number
    bedrooms: number
    totalFloors: number
    pricePerM2: number
    description?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
    images?: ImageUncheckedCreateNestedManyWithoutCountryPropertyInput
  }

  export type CountryPropertyUpdateInput = {
    title?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    city?: NullableStringFieldUpdateOperationsInput | string | null
    price?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    landArea?: IntFieldUpdateOperationsInput | number
    bedrooms?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
    images?: ImageUpdateManyWithoutCountryPropertyNestedInput
  }

  export type CountryPropertyUncheckedUpdateInput = {
    id?: IntFieldUpdateOperationsInput | number
    title?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    city?: NullableStringFieldUpdateOperationsInput | string | null
    price?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    landArea?: IntFieldUpdateOperationsInput | number
    bedrooms?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
    images?: ImageUncheckedUpdateManyWithoutCountryPropertyNestedInput
  }

  export type CountryPropertyCreateManyInput = {
    id?: number
    title: string
    address: string
    metro?: string | null
    metroDistance?: number | null
    city?: string | null
    price: number
    lat?: number | null
    lng?: number | null
    landArea: number
    bedrooms: number
    totalFloors: number
    pricePerM2: number
    description?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
  }

  export type CountryPropertyUpdateManyMutationInput = {
    title?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    city?: NullableStringFieldUpdateOperationsInput | string | null
    price?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    landArea?: IntFieldUpdateOperationsInput | number
    bedrooms?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type CountryPropertyUncheckedUpdateManyInput = {
    id?: IntFieldUpdateOperationsInput | number
    title?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    city?: NullableStringFieldUpdateOperationsInput | string | null
    price?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    landArea?: IntFieldUpdateOperationsInput | number
    bedrooms?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type CommercialPropertyCreateInput = {
    title: string
    address: string
    price: number
    pricePerM2: number
    area: number
    city?: string | null
    lat?: number | null
    lng?: number | null
    hasFinishing?: boolean
    purpose?: string | null
    metro?: string | null
    metroDistance?: number | null
    description?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
    images?: ImageCreateNestedManyWithoutCommercialPropertyInput
  }

  export type CommercialPropertyUncheckedCreateInput = {
    id?: number
    title: string
    address: string
    price: number
    pricePerM2: number
    area: number
    city?: string | null
    lat?: number | null
    lng?: number | null
    hasFinishing?: boolean
    purpose?: string | null
    metro?: string | null
    metroDistance?: number | null
    description?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
    images?: ImageUncheckedCreateNestedManyWithoutCommercialPropertyInput
  }

  export type CommercialPropertyUpdateInput = {
    title?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    price?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    area?: IntFieldUpdateOperationsInput | number
    city?: NullableStringFieldUpdateOperationsInput | string | null
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    hasFinishing?: BoolFieldUpdateOperationsInput | boolean
    purpose?: NullableStringFieldUpdateOperationsInput | string | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
    images?: ImageUpdateManyWithoutCommercialPropertyNestedInput
  }

  export type CommercialPropertyUncheckedUpdateInput = {
    id?: IntFieldUpdateOperationsInput | number
    title?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    price?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    area?: IntFieldUpdateOperationsInput | number
    city?: NullableStringFieldUpdateOperationsInput | string | null
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    hasFinishing?: BoolFieldUpdateOperationsInput | boolean
    purpose?: NullableStringFieldUpdateOperationsInput | string | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
    images?: ImageUncheckedUpdateManyWithoutCommercialPropertyNestedInput
  }

  export type CommercialPropertyCreateManyInput = {
    id?: number
    title: string
    address: string
    price: number
    pricePerM2: number
    area: number
    city?: string | null
    lat?: number | null
    lng?: number | null
    hasFinishing?: boolean
    purpose?: string | null
    metro?: string | null
    metroDistance?: number | null
    description?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
  }

  export type CommercialPropertyUpdateManyMutationInput = {
    title?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    price?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    area?: IntFieldUpdateOperationsInput | number
    city?: NullableStringFieldUpdateOperationsInput | string | null
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    hasFinishing?: BoolFieldUpdateOperationsInput | boolean
    purpose?: NullableStringFieldUpdateOperationsInput | string | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type CommercialPropertyUncheckedUpdateManyInput = {
    id?: IntFieldUpdateOperationsInput | number
    title?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    price?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    area?: IntFieldUpdateOperationsInput | number
    city?: NullableStringFieldUpdateOperationsInput | string | null
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    hasFinishing?: BoolFieldUpdateOperationsInput | boolean
    purpose?: NullableStringFieldUpdateOperationsInput | string | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type IntFilter<$PrismaModel = never> = {
    equals?: number | IntFieldRefInput<$PrismaModel>
    in?: number[] | ListIntFieldRefInput<$PrismaModel>
    notIn?: number[] | ListIntFieldRefInput<$PrismaModel>
    lt?: number | IntFieldRefInput<$PrismaModel>
    lte?: number | IntFieldRefInput<$PrismaModel>
    gt?: number | IntFieldRefInput<$PrismaModel>
    gte?: number | IntFieldRefInput<$PrismaModel>
    not?: NestedIntFilter<$PrismaModel> | number
  }

  export type StringFilter<$PrismaModel = never> = {
    equals?: string | StringFieldRefInput<$PrismaModel>
    in?: string[] | ListStringFieldRefInput<$PrismaModel>
    notIn?: string[] | ListStringFieldRefInput<$PrismaModel>
    lt?: string | StringFieldRefInput<$PrismaModel>
    lte?: string | StringFieldRefInput<$PrismaModel>
    gt?: string | StringFieldRefInput<$PrismaModel>
    gte?: string | StringFieldRefInput<$PrismaModel>
    contains?: string | StringFieldRefInput<$PrismaModel>
    startsWith?: string | StringFieldRefInput<$PrismaModel>
    endsWith?: string | StringFieldRefInput<$PrismaModel>
    mode?: QueryMode
    not?: NestedStringFilter<$PrismaModel> | string
  }

  export type StringNullableFilter<$PrismaModel = never> = {
    equals?: string | StringFieldRefInput<$PrismaModel> | null
    in?: string[] | ListStringFieldRefInput<$PrismaModel> | null
    notIn?: string[] | ListStringFieldRefInput<$PrismaModel> | null
    lt?: string | StringFieldRefInput<$PrismaModel>
    lte?: string | StringFieldRefInput<$PrismaModel>
    gt?: string | StringFieldRefInput<$PrismaModel>
    gte?: string | StringFieldRefInput<$PrismaModel>
    contains?: string | StringFieldRefInput<$PrismaModel>
    startsWith?: string | StringFieldRefInput<$PrismaModel>
    endsWith?: string | StringFieldRefInput<$PrismaModel>
    mode?: QueryMode
    not?: NestedStringNullableFilter<$PrismaModel> | string | null
  }

  export type DateTimeFilter<$PrismaModel = never> = {
    equals?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    in?: Date[] | string[] | ListDateTimeFieldRefInput<$PrismaModel>
    notIn?: Date[] | string[] | ListDateTimeFieldRefInput<$PrismaModel>
    lt?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    lte?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    gt?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    gte?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    not?: NestedDateTimeFilter<$PrismaModel> | Date | string
  }

  export type SortOrderInput = {
    sort: SortOrder
    nulls?: NullsOrder
  }

  export type RealtorCountOrderByAggregateInput = {
    id?: SortOrder
    fullName?: SortOrder
    phone?: SortOrder
    email?: SortOrder
    avatarUrl?: SortOrder
    position?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
  }

  export type RealtorAvgOrderByAggregateInput = {
    id?: SortOrder
  }

  export type RealtorMaxOrderByAggregateInput = {
    id?: SortOrder
    fullName?: SortOrder
    phone?: SortOrder
    email?: SortOrder
    avatarUrl?: SortOrder
    position?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
  }

  export type RealtorMinOrderByAggregateInput = {
    id?: SortOrder
    fullName?: SortOrder
    phone?: SortOrder
    email?: SortOrder
    avatarUrl?: SortOrder
    position?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
  }

  export type RealtorSumOrderByAggregateInput = {
    id?: SortOrder
  }

  export type IntWithAggregatesFilter<$PrismaModel = never> = {
    equals?: number | IntFieldRefInput<$PrismaModel>
    in?: number[] | ListIntFieldRefInput<$PrismaModel>
    notIn?: number[] | ListIntFieldRefInput<$PrismaModel>
    lt?: number | IntFieldRefInput<$PrismaModel>
    lte?: number | IntFieldRefInput<$PrismaModel>
    gt?: number | IntFieldRefInput<$PrismaModel>
    gte?: number | IntFieldRefInput<$PrismaModel>
    not?: NestedIntWithAggregatesFilter<$PrismaModel> | number
    _count?: NestedIntFilter<$PrismaModel>
    _avg?: NestedFloatFilter<$PrismaModel>
    _sum?: NestedIntFilter<$PrismaModel>
    _min?: NestedIntFilter<$PrismaModel>
    _max?: NestedIntFilter<$PrismaModel>
  }

  export type StringWithAggregatesFilter<$PrismaModel = never> = {
    equals?: string | StringFieldRefInput<$PrismaModel>
    in?: string[] | ListStringFieldRefInput<$PrismaModel>
    notIn?: string[] | ListStringFieldRefInput<$PrismaModel>
    lt?: string | StringFieldRefInput<$PrismaModel>
    lte?: string | StringFieldRefInput<$PrismaModel>
    gt?: string | StringFieldRefInput<$PrismaModel>
    gte?: string | StringFieldRefInput<$PrismaModel>
    contains?: string | StringFieldRefInput<$PrismaModel>
    startsWith?: string | StringFieldRefInput<$PrismaModel>
    endsWith?: string | StringFieldRefInput<$PrismaModel>
    mode?: QueryMode
    not?: NestedStringWithAggregatesFilter<$PrismaModel> | string
    _count?: NestedIntFilter<$PrismaModel>
    _min?: NestedStringFilter<$PrismaModel>
    _max?: NestedStringFilter<$PrismaModel>
  }

  export type StringNullableWithAggregatesFilter<$PrismaModel = never> = {
    equals?: string | StringFieldRefInput<$PrismaModel> | null
    in?: string[] | ListStringFieldRefInput<$PrismaModel> | null
    notIn?: string[] | ListStringFieldRefInput<$PrismaModel> | null
    lt?: string | StringFieldRefInput<$PrismaModel>
    lte?: string | StringFieldRefInput<$PrismaModel>
    gt?: string | StringFieldRefInput<$PrismaModel>
    gte?: string | StringFieldRefInput<$PrismaModel>
    contains?: string | StringFieldRefInput<$PrismaModel>
    startsWith?: string | StringFieldRefInput<$PrismaModel>
    endsWith?: string | StringFieldRefInput<$PrismaModel>
    mode?: QueryMode
    not?: NestedStringNullableWithAggregatesFilter<$PrismaModel> | string | null
    _count?: NestedIntNullableFilter<$PrismaModel>
    _min?: NestedStringNullableFilter<$PrismaModel>
    _max?: NestedStringNullableFilter<$PrismaModel>
  }

  export type DateTimeWithAggregatesFilter<$PrismaModel = never> = {
    equals?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    in?: Date[] | string[] | ListDateTimeFieldRefInput<$PrismaModel>
    notIn?: Date[] | string[] | ListDateTimeFieldRefInput<$PrismaModel>
    lt?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    lte?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    gt?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    gte?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    not?: NestedDateTimeWithAggregatesFilter<$PrismaModel> | Date | string
    _count?: NestedIntFilter<$PrismaModel>
    _min?: NestedDateTimeFilter<$PrismaModel>
    _max?: NestedDateTimeFilter<$PrismaModel>
  }

  export type EnumApplicationStatusFilter<$PrismaModel = never> = {
    equals?: $Enums.ApplicationStatus | EnumApplicationStatusFieldRefInput<$PrismaModel>
    in?: $Enums.ApplicationStatus[] | ListEnumApplicationStatusFieldRefInput<$PrismaModel>
    notIn?: $Enums.ApplicationStatus[] | ListEnumApplicationStatusFieldRefInput<$PrismaModel>
    not?: NestedEnumApplicationStatusFilter<$PrismaModel> | $Enums.ApplicationStatus
  }

  export type IntNullableFilter<$PrismaModel = never> = {
    equals?: number | IntFieldRefInput<$PrismaModel> | null
    in?: number[] | ListIntFieldRefInput<$PrismaModel> | null
    notIn?: number[] | ListIntFieldRefInput<$PrismaModel> | null
    lt?: number | IntFieldRefInput<$PrismaModel>
    lte?: number | IntFieldRefInput<$PrismaModel>
    gt?: number | IntFieldRefInput<$PrismaModel>
    gte?: number | IntFieldRefInput<$PrismaModel>
    not?: NestedIntNullableFilter<$PrismaModel> | number | null
  }

  export type ApplicationCountOrderByAggregateInput = {
    id?: SortOrder
    name?: SortOrder
    phone?: SortOrder
    status?: SortOrder
    propertyType?: SortOrder
    propertyId?: SortOrder
    link?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
  }

  export type ApplicationAvgOrderByAggregateInput = {
    id?: SortOrder
    propertyId?: SortOrder
  }

  export type ApplicationMaxOrderByAggregateInput = {
    id?: SortOrder
    name?: SortOrder
    phone?: SortOrder
    status?: SortOrder
    propertyType?: SortOrder
    propertyId?: SortOrder
    link?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
  }

  export type ApplicationMinOrderByAggregateInput = {
    id?: SortOrder
    name?: SortOrder
    phone?: SortOrder
    status?: SortOrder
    propertyType?: SortOrder
    propertyId?: SortOrder
    link?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
  }

  export type ApplicationSumOrderByAggregateInput = {
    id?: SortOrder
    propertyId?: SortOrder
  }

  export type EnumApplicationStatusWithAggregatesFilter<$PrismaModel = never> = {
    equals?: $Enums.ApplicationStatus | EnumApplicationStatusFieldRefInput<$PrismaModel>
    in?: $Enums.ApplicationStatus[] | ListEnumApplicationStatusFieldRefInput<$PrismaModel>
    notIn?: $Enums.ApplicationStatus[] | ListEnumApplicationStatusFieldRefInput<$PrismaModel>
    not?: NestedEnumApplicationStatusWithAggregatesFilter<$PrismaModel> | $Enums.ApplicationStatus
    _count?: NestedIntFilter<$PrismaModel>
    _min?: NestedEnumApplicationStatusFilter<$PrismaModel>
    _max?: NestedEnumApplicationStatusFilter<$PrismaModel>
  }

  export type IntNullableWithAggregatesFilter<$PrismaModel = never> = {
    equals?: number | IntFieldRefInput<$PrismaModel> | null
    in?: number[] | ListIntFieldRefInput<$PrismaModel> | null
    notIn?: number[] | ListIntFieldRefInput<$PrismaModel> | null
    lt?: number | IntFieldRefInput<$PrismaModel>
    lte?: number | IntFieldRefInput<$PrismaModel>
    gt?: number | IntFieldRefInput<$PrismaModel>
    gte?: number | IntFieldRefInput<$PrismaModel>
    not?: NestedIntNullableWithAggregatesFilter<$PrismaModel> | number | null
    _count?: NestedIntNullableFilter<$PrismaModel>
    _avg?: NestedFloatNullableFilter<$PrismaModel>
    _sum?: NestedIntNullableFilter<$PrismaModel>
    _min?: NestedIntNullableFilter<$PrismaModel>
    _max?: NestedIntNullableFilter<$PrismaModel>
  }

  export type NewBuildingComplexNullableScalarRelationFilter = {
    is?: NewBuildingComplexWhereInput | null
    isNot?: NewBuildingComplexWhereInput | null
  }

  export type NewBuildingApartmentNullableScalarRelationFilter = {
    is?: NewBuildingApartmentWhereInput | null
    isNot?: NewBuildingApartmentWhereInput | null
  }

  export type ReadyApartmentNullableScalarRelationFilter = {
    is?: ReadyApartmentWhereInput | null
    isNot?: ReadyApartmentWhereInput | null
  }

  export type RentalApartmentNullableScalarRelationFilter = {
    is?: RentalApartmentWhereInput | null
    isNot?: RentalApartmentWhereInput | null
  }

  export type CountryPropertyNullableScalarRelationFilter = {
    is?: CountryPropertyWhereInput | null
    isNot?: CountryPropertyWhereInput | null
  }

  export type CommercialPropertyNullableScalarRelationFilter = {
    is?: CommercialPropertyWhereInput | null
    isNot?: CommercialPropertyWhereInput | null
  }

  export type ImageCountOrderByAggregateInput = {
    id?: SortOrder
    url?: SortOrder
    newBuildingComplexId?: SortOrder
    newBuildingApartmentId?: SortOrder
    readyApartmentId?: SortOrder
    rentalApartmentId?: SortOrder
    countryPropertyId?: SortOrder
    commercialPropertyId?: SortOrder
    createdAt?: SortOrder
  }

  export type ImageAvgOrderByAggregateInput = {
    id?: SortOrder
    newBuildingComplexId?: SortOrder
    newBuildingApartmentId?: SortOrder
    readyApartmentId?: SortOrder
    rentalApartmentId?: SortOrder
    countryPropertyId?: SortOrder
    commercialPropertyId?: SortOrder
  }

  export type ImageMaxOrderByAggregateInput = {
    id?: SortOrder
    url?: SortOrder
    newBuildingComplexId?: SortOrder
    newBuildingApartmentId?: SortOrder
    readyApartmentId?: SortOrder
    rentalApartmentId?: SortOrder
    countryPropertyId?: SortOrder
    commercialPropertyId?: SortOrder
    createdAt?: SortOrder
  }

  export type ImageMinOrderByAggregateInput = {
    id?: SortOrder
    url?: SortOrder
    newBuildingComplexId?: SortOrder
    newBuildingApartmentId?: SortOrder
    readyApartmentId?: SortOrder
    rentalApartmentId?: SortOrder
    countryPropertyId?: SortOrder
    commercialPropertyId?: SortOrder
    createdAt?: SortOrder
  }

  export type ImageSumOrderByAggregateInput = {
    id?: SortOrder
    newBuildingComplexId?: SortOrder
    newBuildingApartmentId?: SortOrder
    readyApartmentId?: SortOrder
    rentalApartmentId?: SortOrder
    countryPropertyId?: SortOrder
    commercialPropertyId?: SortOrder
  }

  export type FloatNullableFilter<$PrismaModel = never> = {
    equals?: number | FloatFieldRefInput<$PrismaModel> | null
    in?: number[] | ListFloatFieldRefInput<$PrismaModel> | null
    notIn?: number[] | ListFloatFieldRefInput<$PrismaModel> | null
    lt?: number | FloatFieldRefInput<$PrismaModel>
    lte?: number | FloatFieldRefInput<$PrismaModel>
    gt?: number | FloatFieldRefInput<$PrismaModel>
    gte?: number | FloatFieldRefInput<$PrismaModel>
    not?: NestedFloatNullableFilter<$PrismaModel> | number | null
  }

  export type DateTimeNullableFilter<$PrismaModel = never> = {
    equals?: Date | string | DateTimeFieldRefInput<$PrismaModel> | null
    in?: Date[] | string[] | ListDateTimeFieldRefInput<$PrismaModel> | null
    notIn?: Date[] | string[] | ListDateTimeFieldRefInput<$PrismaModel> | null
    lt?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    lte?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    gt?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    gte?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    not?: NestedDateTimeNullableFilter<$PrismaModel> | Date | string | null
  }

  export type BoolFilter<$PrismaModel = never> = {
    equals?: boolean | BooleanFieldRefInput<$PrismaModel>
    not?: NestedBoolFilter<$PrismaModel> | boolean
  }

  export type ImageListRelationFilter = {
    every?: ImageWhereInput
    some?: ImageWhereInput
    none?: ImageWhereInput
  }

  export type NewBuildingApartmentListRelationFilter = {
    every?: NewBuildingApartmentWhereInput
    some?: NewBuildingApartmentWhereInput
    none?: NewBuildingApartmentWhereInput
  }

  export type NearbyPlaceListRelationFilter = {
    every?: NearbyPlaceWhereInput
    some?: NearbyPlaceWhereInput
    none?: NearbyPlaceWhereInput
  }

  export type ImageOrderByRelationAggregateInput = {
    _count?: SortOrder
  }

  export type NewBuildingApartmentOrderByRelationAggregateInput = {
    _count?: SortOrder
  }

  export type NearbyPlaceOrderByRelationAggregateInput = {
    _count?: SortOrder
  }

  export type NewBuildingComplexCountOrderByAggregateInput = {
    id?: SortOrder
    name?: SortOrder
    address?: SortOrder
    district?: SortOrder
    metro?: SortOrder
    metroDistance?: SortOrder
    city?: SortOrder
    developer?: SortOrder
    priceFrom?: SortOrder
    areaFrom?: SortOrder
    buildingClass?: SortOrder
    floors?: SortOrder
    totalApartments?: SortOrder
    availableApartments?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    completionDate?: SortOrder
    height?: SortOrder
    hasParking?: SortOrder
    description?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
  }

  export type NewBuildingComplexAvgOrderByAggregateInput = {
    id?: SortOrder
    metroDistance?: SortOrder
    priceFrom?: SortOrder
    areaFrom?: SortOrder
    floors?: SortOrder
    totalApartments?: SortOrder
    availableApartments?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    height?: SortOrder
  }

  export type NewBuildingComplexMaxOrderByAggregateInput = {
    id?: SortOrder
    name?: SortOrder
    address?: SortOrder
    district?: SortOrder
    metro?: SortOrder
    metroDistance?: SortOrder
    city?: SortOrder
    developer?: SortOrder
    priceFrom?: SortOrder
    areaFrom?: SortOrder
    buildingClass?: SortOrder
    floors?: SortOrder
    totalApartments?: SortOrder
    availableApartments?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    completionDate?: SortOrder
    height?: SortOrder
    hasParking?: SortOrder
    description?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
  }

  export type NewBuildingComplexMinOrderByAggregateInput = {
    id?: SortOrder
    name?: SortOrder
    address?: SortOrder
    district?: SortOrder
    metro?: SortOrder
    metroDistance?: SortOrder
    city?: SortOrder
    developer?: SortOrder
    priceFrom?: SortOrder
    areaFrom?: SortOrder
    buildingClass?: SortOrder
    floors?: SortOrder
    totalApartments?: SortOrder
    availableApartments?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    completionDate?: SortOrder
    height?: SortOrder
    hasParking?: SortOrder
    description?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
  }

  export type NewBuildingComplexSumOrderByAggregateInput = {
    id?: SortOrder
    metroDistance?: SortOrder
    priceFrom?: SortOrder
    areaFrom?: SortOrder
    floors?: SortOrder
    totalApartments?: SortOrder
    availableApartments?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    height?: SortOrder
  }

  export type FloatNullableWithAggregatesFilter<$PrismaModel = never> = {
    equals?: number | FloatFieldRefInput<$PrismaModel> | null
    in?: number[] | ListFloatFieldRefInput<$PrismaModel> | null
    notIn?: number[] | ListFloatFieldRefInput<$PrismaModel> | null
    lt?: number | FloatFieldRefInput<$PrismaModel>
    lte?: number | FloatFieldRefInput<$PrismaModel>
    gt?: number | FloatFieldRefInput<$PrismaModel>
    gte?: number | FloatFieldRefInput<$PrismaModel>
    not?: NestedFloatNullableWithAggregatesFilter<$PrismaModel> | number | null
    _count?: NestedIntNullableFilter<$PrismaModel>
    _avg?: NestedFloatNullableFilter<$PrismaModel>
    _sum?: NestedFloatNullableFilter<$PrismaModel>
    _min?: NestedFloatNullableFilter<$PrismaModel>
    _max?: NestedFloatNullableFilter<$PrismaModel>
  }

  export type DateTimeNullableWithAggregatesFilter<$PrismaModel = never> = {
    equals?: Date | string | DateTimeFieldRefInput<$PrismaModel> | null
    in?: Date[] | string[] | ListDateTimeFieldRefInput<$PrismaModel> | null
    notIn?: Date[] | string[] | ListDateTimeFieldRefInput<$PrismaModel> | null
    lt?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    lte?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    gt?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    gte?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    not?: NestedDateTimeNullableWithAggregatesFilter<$PrismaModel> | Date | string | null
    _count?: NestedIntNullableFilter<$PrismaModel>
    _min?: NestedDateTimeNullableFilter<$PrismaModel>
    _max?: NestedDateTimeNullableFilter<$PrismaModel>
  }

  export type BoolWithAggregatesFilter<$PrismaModel = never> = {
    equals?: boolean | BooleanFieldRefInput<$PrismaModel>
    not?: NestedBoolWithAggregatesFilter<$PrismaModel> | boolean
    _count?: NestedIntFilter<$PrismaModel>
    _min?: NestedBoolFilter<$PrismaModel>
    _max?: NestedBoolFilter<$PrismaModel>
  }

  export type NewBuildingComplexScalarRelationFilter = {
    is?: NewBuildingComplexWhereInput
    isNot?: NewBuildingComplexWhereInput
  }

  export type NewBuildingApartmentCountOrderByAggregateInput = {
    id?: SortOrder
    complexId?: SortOrder
    title?: SortOrder
    bedrooms?: SortOrder
    area?: SortOrder
    price?: SortOrder
    pricePerM2?: SortOrder
    floor?: SortOrder
    totalFloors?: SortOrder
    city?: SortOrder
    apartmentNumber?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    type?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
  }

  export type NewBuildingApartmentAvgOrderByAggregateInput = {
    id?: SortOrder
    complexId?: SortOrder
    bedrooms?: SortOrder
    area?: SortOrder
    price?: SortOrder
    pricePerM2?: SortOrder
    floor?: SortOrder
    totalFloors?: SortOrder
    apartmentNumber?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
  }

  export type NewBuildingApartmentMaxOrderByAggregateInput = {
    id?: SortOrder
    complexId?: SortOrder
    title?: SortOrder
    bedrooms?: SortOrder
    area?: SortOrder
    price?: SortOrder
    pricePerM2?: SortOrder
    floor?: SortOrder
    totalFloors?: SortOrder
    city?: SortOrder
    apartmentNumber?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    type?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
  }

  export type NewBuildingApartmentMinOrderByAggregateInput = {
    id?: SortOrder
    complexId?: SortOrder
    title?: SortOrder
    bedrooms?: SortOrder
    area?: SortOrder
    price?: SortOrder
    pricePerM2?: SortOrder
    floor?: SortOrder
    totalFloors?: SortOrder
    city?: SortOrder
    apartmentNumber?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    type?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
  }

  export type NewBuildingApartmentSumOrderByAggregateInput = {
    id?: SortOrder
    complexId?: SortOrder
    bedrooms?: SortOrder
    area?: SortOrder
    price?: SortOrder
    pricePerM2?: SortOrder
    floor?: SortOrder
    totalFloors?: SortOrder
    apartmentNumber?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
  }

  export type NearbyPlaceCountOrderByAggregateInput = {
    id?: SortOrder
    complexId?: SortOrder
    name?: SortOrder
    category?: SortOrder
    distance?: SortOrder
    icon?: SortOrder
    createdAt?: SortOrder
  }

  export type NearbyPlaceAvgOrderByAggregateInput = {
    id?: SortOrder
    complexId?: SortOrder
    distance?: SortOrder
  }

  export type NearbyPlaceMaxOrderByAggregateInput = {
    id?: SortOrder
    complexId?: SortOrder
    name?: SortOrder
    category?: SortOrder
    distance?: SortOrder
    icon?: SortOrder
    createdAt?: SortOrder
  }

  export type NearbyPlaceMinOrderByAggregateInput = {
    id?: SortOrder
    complexId?: SortOrder
    name?: SortOrder
    category?: SortOrder
    distance?: SortOrder
    icon?: SortOrder
    createdAt?: SortOrder
  }

  export type NearbyPlaceSumOrderByAggregateInput = {
    id?: SortOrder
    complexId?: SortOrder
    distance?: SortOrder
  }

  export type ReviewCountOrderByAggregateInput = {
    id?: SortOrder
    authorName?: SortOrder
    rating?: SortOrder
    comment?: SortOrder
    createdAt?: SortOrder
  }

  export type ReviewAvgOrderByAggregateInput = {
    id?: SortOrder
    rating?: SortOrder
  }

  export type ReviewMaxOrderByAggregateInput = {
    id?: SortOrder
    authorName?: SortOrder
    rating?: SortOrder
    comment?: SortOrder
    createdAt?: SortOrder
  }

  export type ReviewMinOrderByAggregateInput = {
    id?: SortOrder
    authorName?: SortOrder
    rating?: SortOrder
    comment?: SortOrder
    createdAt?: SortOrder
  }

  export type ReviewSumOrderByAggregateInput = {
    id?: SortOrder
    rating?: SortOrder
  }

  export type ReadyApartmentCountOrderByAggregateInput = {
    id?: SortOrder
    title?: SortOrder
    complexName?: SortOrder
    address?: SortOrder
    city?: SortOrder
    area?: SortOrder
    price?: SortOrder
    pricePerM2?: SortOrder
    bedrooms?: SortOrder
    floor?: SortOrder
    totalFloors?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    metro?: SortOrder
    metroDistance?: SortOrder
    description?: SortOrder
    developer?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
  }

  export type ReadyApartmentAvgOrderByAggregateInput = {
    id?: SortOrder
    area?: SortOrder
    price?: SortOrder
    pricePerM2?: SortOrder
    bedrooms?: SortOrder
    floor?: SortOrder
    totalFloors?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    metroDistance?: SortOrder
  }

  export type ReadyApartmentMaxOrderByAggregateInput = {
    id?: SortOrder
    title?: SortOrder
    complexName?: SortOrder
    address?: SortOrder
    city?: SortOrder
    area?: SortOrder
    price?: SortOrder
    pricePerM2?: SortOrder
    bedrooms?: SortOrder
    floor?: SortOrder
    totalFloors?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    metro?: SortOrder
    metroDistance?: SortOrder
    description?: SortOrder
    developer?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
  }

  export type ReadyApartmentMinOrderByAggregateInput = {
    id?: SortOrder
    title?: SortOrder
    complexName?: SortOrder
    address?: SortOrder
    city?: SortOrder
    area?: SortOrder
    price?: SortOrder
    pricePerM2?: SortOrder
    bedrooms?: SortOrder
    floor?: SortOrder
    totalFloors?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    metro?: SortOrder
    metroDistance?: SortOrder
    description?: SortOrder
    developer?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
  }

  export type ReadyApartmentSumOrderByAggregateInput = {
    id?: SortOrder
    area?: SortOrder
    price?: SortOrder
    pricePerM2?: SortOrder
    bedrooms?: SortOrder
    floor?: SortOrder
    totalFloors?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    metroDistance?: SortOrder
  }

  export type RentalApartmentCountOrderByAggregateInput = {
    id?: SortOrder
    title?: SortOrder
    address?: SortOrder
    area?: SortOrder
    pricePerMonth?: SortOrder
    bedrooms?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    floor?: SortOrder
    totalFloors?: SortOrder
    city?: SortOrder
    metro?: SortOrder
    metroDistance?: SortOrder
    description?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
  }

  export type RentalApartmentAvgOrderByAggregateInput = {
    id?: SortOrder
    area?: SortOrder
    pricePerMonth?: SortOrder
    bedrooms?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    floor?: SortOrder
    totalFloors?: SortOrder
    metroDistance?: SortOrder
  }

  export type RentalApartmentMaxOrderByAggregateInput = {
    id?: SortOrder
    title?: SortOrder
    address?: SortOrder
    area?: SortOrder
    pricePerMonth?: SortOrder
    bedrooms?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    floor?: SortOrder
    totalFloors?: SortOrder
    city?: SortOrder
    metro?: SortOrder
    metroDistance?: SortOrder
    description?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
  }

  export type RentalApartmentMinOrderByAggregateInput = {
    id?: SortOrder
    title?: SortOrder
    address?: SortOrder
    area?: SortOrder
    pricePerMonth?: SortOrder
    bedrooms?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    floor?: SortOrder
    totalFloors?: SortOrder
    city?: SortOrder
    metro?: SortOrder
    metroDistance?: SortOrder
    description?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
  }

  export type RentalApartmentSumOrderByAggregateInput = {
    id?: SortOrder
    area?: SortOrder
    pricePerMonth?: SortOrder
    bedrooms?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    floor?: SortOrder
    totalFloors?: SortOrder
    metroDistance?: SortOrder
  }

  export type CountryPropertyCountOrderByAggregateInput = {
    id?: SortOrder
    title?: SortOrder
    address?: SortOrder
    metro?: SortOrder
    metroDistance?: SortOrder
    city?: SortOrder
    price?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    landArea?: SortOrder
    bedrooms?: SortOrder
    totalFloors?: SortOrder
    pricePerM2?: SortOrder
    description?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
  }

  export type CountryPropertyAvgOrderByAggregateInput = {
    id?: SortOrder
    metroDistance?: SortOrder
    price?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    landArea?: SortOrder
    bedrooms?: SortOrder
    totalFloors?: SortOrder
    pricePerM2?: SortOrder
  }

  export type CountryPropertyMaxOrderByAggregateInput = {
    id?: SortOrder
    title?: SortOrder
    address?: SortOrder
    metro?: SortOrder
    metroDistance?: SortOrder
    city?: SortOrder
    price?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    landArea?: SortOrder
    bedrooms?: SortOrder
    totalFloors?: SortOrder
    pricePerM2?: SortOrder
    description?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
  }

  export type CountryPropertyMinOrderByAggregateInput = {
    id?: SortOrder
    title?: SortOrder
    address?: SortOrder
    metro?: SortOrder
    metroDistance?: SortOrder
    city?: SortOrder
    price?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    landArea?: SortOrder
    bedrooms?: SortOrder
    totalFloors?: SortOrder
    pricePerM2?: SortOrder
    description?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
  }

  export type CountryPropertySumOrderByAggregateInput = {
    id?: SortOrder
    metroDistance?: SortOrder
    price?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    landArea?: SortOrder
    bedrooms?: SortOrder
    totalFloors?: SortOrder
    pricePerM2?: SortOrder
  }

  export type CommercialPropertyCountOrderByAggregateInput = {
    id?: SortOrder
    title?: SortOrder
    address?: SortOrder
    price?: SortOrder
    pricePerM2?: SortOrder
    area?: SortOrder
    city?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    hasFinishing?: SortOrder
    purpose?: SortOrder
    metro?: SortOrder
    metroDistance?: SortOrder
    description?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
  }

  export type CommercialPropertyAvgOrderByAggregateInput = {
    id?: SortOrder
    price?: SortOrder
    pricePerM2?: SortOrder
    area?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    metroDistance?: SortOrder
  }

  export type CommercialPropertyMaxOrderByAggregateInput = {
    id?: SortOrder
    title?: SortOrder
    address?: SortOrder
    price?: SortOrder
    pricePerM2?: SortOrder
    area?: SortOrder
    city?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    hasFinishing?: SortOrder
    purpose?: SortOrder
    metro?: SortOrder
    metroDistance?: SortOrder
    description?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
  }

  export type CommercialPropertyMinOrderByAggregateInput = {
    id?: SortOrder
    title?: SortOrder
    address?: SortOrder
    price?: SortOrder
    pricePerM2?: SortOrder
    area?: SortOrder
    city?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    hasFinishing?: SortOrder
    purpose?: SortOrder
    metro?: SortOrder
    metroDistance?: SortOrder
    description?: SortOrder
    createdAt?: SortOrder
    updatedAt?: SortOrder
  }

  export type CommercialPropertySumOrderByAggregateInput = {
    id?: SortOrder
    price?: SortOrder
    pricePerM2?: SortOrder
    area?: SortOrder
    lat?: SortOrder
    lng?: SortOrder
    metroDistance?: SortOrder
  }

  export type StringFieldUpdateOperationsInput = {
    set?: string
  }

  export type NullableStringFieldUpdateOperationsInput = {
    set?: string | null
  }

  export type DateTimeFieldUpdateOperationsInput = {
    set?: Date | string
  }

  export type IntFieldUpdateOperationsInput = {
    set?: number
    increment?: number
    decrement?: number
    multiply?: number
    divide?: number
  }

  export type EnumApplicationStatusFieldUpdateOperationsInput = {
    set?: $Enums.ApplicationStatus
  }

  export type NullableIntFieldUpdateOperationsInput = {
    set?: number | null
    increment?: number
    decrement?: number
    multiply?: number
    divide?: number
  }

  export type NewBuildingComplexCreateNestedOneWithoutImagesInput = {
    create?: XOR<NewBuildingComplexCreateWithoutImagesInput, NewBuildingComplexUncheckedCreateWithoutImagesInput>
    connectOrCreate?: NewBuildingComplexCreateOrConnectWithoutImagesInput
    connect?: NewBuildingComplexWhereUniqueInput
  }

  export type NewBuildingApartmentCreateNestedOneWithoutImagesInput = {
    create?: XOR<NewBuildingApartmentCreateWithoutImagesInput, NewBuildingApartmentUncheckedCreateWithoutImagesInput>
    connectOrCreate?: NewBuildingApartmentCreateOrConnectWithoutImagesInput
    connect?: NewBuildingApartmentWhereUniqueInput
  }

  export type ReadyApartmentCreateNestedOneWithoutImagesInput = {
    create?: XOR<ReadyApartmentCreateWithoutImagesInput, ReadyApartmentUncheckedCreateWithoutImagesInput>
    connectOrCreate?: ReadyApartmentCreateOrConnectWithoutImagesInput
    connect?: ReadyApartmentWhereUniqueInput
  }

  export type RentalApartmentCreateNestedOneWithoutImagesInput = {
    create?: XOR<RentalApartmentCreateWithoutImagesInput, RentalApartmentUncheckedCreateWithoutImagesInput>
    connectOrCreate?: RentalApartmentCreateOrConnectWithoutImagesInput
    connect?: RentalApartmentWhereUniqueInput
  }

  export type CountryPropertyCreateNestedOneWithoutImagesInput = {
    create?: XOR<CountryPropertyCreateWithoutImagesInput, CountryPropertyUncheckedCreateWithoutImagesInput>
    connectOrCreate?: CountryPropertyCreateOrConnectWithoutImagesInput
    connect?: CountryPropertyWhereUniqueInput
  }

  export type CommercialPropertyCreateNestedOneWithoutImagesInput = {
    create?: XOR<CommercialPropertyCreateWithoutImagesInput, CommercialPropertyUncheckedCreateWithoutImagesInput>
    connectOrCreate?: CommercialPropertyCreateOrConnectWithoutImagesInput
    connect?: CommercialPropertyWhereUniqueInput
  }

  export type NewBuildingComplexUpdateOneWithoutImagesNestedInput = {
    create?: XOR<NewBuildingComplexCreateWithoutImagesInput, NewBuildingComplexUncheckedCreateWithoutImagesInput>
    connectOrCreate?: NewBuildingComplexCreateOrConnectWithoutImagesInput
    upsert?: NewBuildingComplexUpsertWithoutImagesInput
    disconnect?: NewBuildingComplexWhereInput | boolean
    delete?: NewBuildingComplexWhereInput | boolean
    connect?: NewBuildingComplexWhereUniqueInput
    update?: XOR<XOR<NewBuildingComplexUpdateToOneWithWhereWithoutImagesInput, NewBuildingComplexUpdateWithoutImagesInput>, NewBuildingComplexUncheckedUpdateWithoutImagesInput>
  }

  export type NewBuildingApartmentUpdateOneWithoutImagesNestedInput = {
    create?: XOR<NewBuildingApartmentCreateWithoutImagesInput, NewBuildingApartmentUncheckedCreateWithoutImagesInput>
    connectOrCreate?: NewBuildingApartmentCreateOrConnectWithoutImagesInput
    upsert?: NewBuildingApartmentUpsertWithoutImagesInput
    disconnect?: NewBuildingApartmentWhereInput | boolean
    delete?: NewBuildingApartmentWhereInput | boolean
    connect?: NewBuildingApartmentWhereUniqueInput
    update?: XOR<XOR<NewBuildingApartmentUpdateToOneWithWhereWithoutImagesInput, NewBuildingApartmentUpdateWithoutImagesInput>, NewBuildingApartmentUncheckedUpdateWithoutImagesInput>
  }

  export type ReadyApartmentUpdateOneWithoutImagesNestedInput = {
    create?: XOR<ReadyApartmentCreateWithoutImagesInput, ReadyApartmentUncheckedCreateWithoutImagesInput>
    connectOrCreate?: ReadyApartmentCreateOrConnectWithoutImagesInput
    upsert?: ReadyApartmentUpsertWithoutImagesInput
    disconnect?: ReadyApartmentWhereInput | boolean
    delete?: ReadyApartmentWhereInput | boolean
    connect?: ReadyApartmentWhereUniqueInput
    update?: XOR<XOR<ReadyApartmentUpdateToOneWithWhereWithoutImagesInput, ReadyApartmentUpdateWithoutImagesInput>, ReadyApartmentUncheckedUpdateWithoutImagesInput>
  }

  export type RentalApartmentUpdateOneWithoutImagesNestedInput = {
    create?: XOR<RentalApartmentCreateWithoutImagesInput, RentalApartmentUncheckedCreateWithoutImagesInput>
    connectOrCreate?: RentalApartmentCreateOrConnectWithoutImagesInput
    upsert?: RentalApartmentUpsertWithoutImagesInput
    disconnect?: RentalApartmentWhereInput | boolean
    delete?: RentalApartmentWhereInput | boolean
    connect?: RentalApartmentWhereUniqueInput
    update?: XOR<XOR<RentalApartmentUpdateToOneWithWhereWithoutImagesInput, RentalApartmentUpdateWithoutImagesInput>, RentalApartmentUncheckedUpdateWithoutImagesInput>
  }

  export type CountryPropertyUpdateOneWithoutImagesNestedInput = {
    create?: XOR<CountryPropertyCreateWithoutImagesInput, CountryPropertyUncheckedCreateWithoutImagesInput>
    connectOrCreate?: CountryPropertyCreateOrConnectWithoutImagesInput
    upsert?: CountryPropertyUpsertWithoutImagesInput
    disconnect?: CountryPropertyWhereInput | boolean
    delete?: CountryPropertyWhereInput | boolean
    connect?: CountryPropertyWhereUniqueInput
    update?: XOR<XOR<CountryPropertyUpdateToOneWithWhereWithoutImagesInput, CountryPropertyUpdateWithoutImagesInput>, CountryPropertyUncheckedUpdateWithoutImagesInput>
  }

  export type CommercialPropertyUpdateOneWithoutImagesNestedInput = {
    create?: XOR<CommercialPropertyCreateWithoutImagesInput, CommercialPropertyUncheckedCreateWithoutImagesInput>
    connectOrCreate?: CommercialPropertyCreateOrConnectWithoutImagesInput
    upsert?: CommercialPropertyUpsertWithoutImagesInput
    disconnect?: CommercialPropertyWhereInput | boolean
    delete?: CommercialPropertyWhereInput | boolean
    connect?: CommercialPropertyWhereUniqueInput
    update?: XOR<XOR<CommercialPropertyUpdateToOneWithWhereWithoutImagesInput, CommercialPropertyUpdateWithoutImagesInput>, CommercialPropertyUncheckedUpdateWithoutImagesInput>
  }

  export type ImageCreateNestedManyWithoutNewBuildingComplexInput = {
    create?: XOR<ImageCreateWithoutNewBuildingComplexInput, ImageUncheckedCreateWithoutNewBuildingComplexInput> | ImageCreateWithoutNewBuildingComplexInput[] | ImageUncheckedCreateWithoutNewBuildingComplexInput[]
    connectOrCreate?: ImageCreateOrConnectWithoutNewBuildingComplexInput | ImageCreateOrConnectWithoutNewBuildingComplexInput[]
    createMany?: ImageCreateManyNewBuildingComplexInputEnvelope
    connect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
  }

  export type NewBuildingApartmentCreateNestedManyWithoutComplexInput = {
    create?: XOR<NewBuildingApartmentCreateWithoutComplexInput, NewBuildingApartmentUncheckedCreateWithoutComplexInput> | NewBuildingApartmentCreateWithoutComplexInput[] | NewBuildingApartmentUncheckedCreateWithoutComplexInput[]
    connectOrCreate?: NewBuildingApartmentCreateOrConnectWithoutComplexInput | NewBuildingApartmentCreateOrConnectWithoutComplexInput[]
    createMany?: NewBuildingApartmentCreateManyComplexInputEnvelope
    connect?: NewBuildingApartmentWhereUniqueInput | NewBuildingApartmentWhereUniqueInput[]
  }

  export type NearbyPlaceCreateNestedManyWithoutComplexInput = {
    create?: XOR<NearbyPlaceCreateWithoutComplexInput, NearbyPlaceUncheckedCreateWithoutComplexInput> | NearbyPlaceCreateWithoutComplexInput[] | NearbyPlaceUncheckedCreateWithoutComplexInput[]
    connectOrCreate?: NearbyPlaceCreateOrConnectWithoutComplexInput | NearbyPlaceCreateOrConnectWithoutComplexInput[]
    createMany?: NearbyPlaceCreateManyComplexInputEnvelope
    connect?: NearbyPlaceWhereUniqueInput | NearbyPlaceWhereUniqueInput[]
  }

  export type ImageUncheckedCreateNestedManyWithoutNewBuildingComplexInput = {
    create?: XOR<ImageCreateWithoutNewBuildingComplexInput, ImageUncheckedCreateWithoutNewBuildingComplexInput> | ImageCreateWithoutNewBuildingComplexInput[] | ImageUncheckedCreateWithoutNewBuildingComplexInput[]
    connectOrCreate?: ImageCreateOrConnectWithoutNewBuildingComplexInput | ImageCreateOrConnectWithoutNewBuildingComplexInput[]
    createMany?: ImageCreateManyNewBuildingComplexInputEnvelope
    connect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
  }

  export type NewBuildingApartmentUncheckedCreateNestedManyWithoutComplexInput = {
    create?: XOR<NewBuildingApartmentCreateWithoutComplexInput, NewBuildingApartmentUncheckedCreateWithoutComplexInput> | NewBuildingApartmentCreateWithoutComplexInput[] | NewBuildingApartmentUncheckedCreateWithoutComplexInput[]
    connectOrCreate?: NewBuildingApartmentCreateOrConnectWithoutComplexInput | NewBuildingApartmentCreateOrConnectWithoutComplexInput[]
    createMany?: NewBuildingApartmentCreateManyComplexInputEnvelope
    connect?: NewBuildingApartmentWhereUniqueInput | NewBuildingApartmentWhereUniqueInput[]
  }

  export type NearbyPlaceUncheckedCreateNestedManyWithoutComplexInput = {
    create?: XOR<NearbyPlaceCreateWithoutComplexInput, NearbyPlaceUncheckedCreateWithoutComplexInput> | NearbyPlaceCreateWithoutComplexInput[] | NearbyPlaceUncheckedCreateWithoutComplexInput[]
    connectOrCreate?: NearbyPlaceCreateOrConnectWithoutComplexInput | NearbyPlaceCreateOrConnectWithoutComplexInput[]
    createMany?: NearbyPlaceCreateManyComplexInputEnvelope
    connect?: NearbyPlaceWhereUniqueInput | NearbyPlaceWhereUniqueInput[]
  }

  export type NullableFloatFieldUpdateOperationsInput = {
    set?: number | null
    increment?: number
    decrement?: number
    multiply?: number
    divide?: number
  }

  export type NullableDateTimeFieldUpdateOperationsInput = {
    set?: Date | string | null
  }

  export type BoolFieldUpdateOperationsInput = {
    set?: boolean
  }

  export type ImageUpdateManyWithoutNewBuildingComplexNestedInput = {
    create?: XOR<ImageCreateWithoutNewBuildingComplexInput, ImageUncheckedCreateWithoutNewBuildingComplexInput> | ImageCreateWithoutNewBuildingComplexInput[] | ImageUncheckedCreateWithoutNewBuildingComplexInput[]
    connectOrCreate?: ImageCreateOrConnectWithoutNewBuildingComplexInput | ImageCreateOrConnectWithoutNewBuildingComplexInput[]
    upsert?: ImageUpsertWithWhereUniqueWithoutNewBuildingComplexInput | ImageUpsertWithWhereUniqueWithoutNewBuildingComplexInput[]
    createMany?: ImageCreateManyNewBuildingComplexInputEnvelope
    set?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    disconnect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    delete?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    connect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    update?: ImageUpdateWithWhereUniqueWithoutNewBuildingComplexInput | ImageUpdateWithWhereUniqueWithoutNewBuildingComplexInput[]
    updateMany?: ImageUpdateManyWithWhereWithoutNewBuildingComplexInput | ImageUpdateManyWithWhereWithoutNewBuildingComplexInput[]
    deleteMany?: ImageScalarWhereInput | ImageScalarWhereInput[]
  }

  export type NewBuildingApartmentUpdateManyWithoutComplexNestedInput = {
    create?: XOR<NewBuildingApartmentCreateWithoutComplexInput, NewBuildingApartmentUncheckedCreateWithoutComplexInput> | NewBuildingApartmentCreateWithoutComplexInput[] | NewBuildingApartmentUncheckedCreateWithoutComplexInput[]
    connectOrCreate?: NewBuildingApartmentCreateOrConnectWithoutComplexInput | NewBuildingApartmentCreateOrConnectWithoutComplexInput[]
    upsert?: NewBuildingApartmentUpsertWithWhereUniqueWithoutComplexInput | NewBuildingApartmentUpsertWithWhereUniqueWithoutComplexInput[]
    createMany?: NewBuildingApartmentCreateManyComplexInputEnvelope
    set?: NewBuildingApartmentWhereUniqueInput | NewBuildingApartmentWhereUniqueInput[]
    disconnect?: NewBuildingApartmentWhereUniqueInput | NewBuildingApartmentWhereUniqueInput[]
    delete?: NewBuildingApartmentWhereUniqueInput | NewBuildingApartmentWhereUniqueInput[]
    connect?: NewBuildingApartmentWhereUniqueInput | NewBuildingApartmentWhereUniqueInput[]
    update?: NewBuildingApartmentUpdateWithWhereUniqueWithoutComplexInput | NewBuildingApartmentUpdateWithWhereUniqueWithoutComplexInput[]
    updateMany?: NewBuildingApartmentUpdateManyWithWhereWithoutComplexInput | NewBuildingApartmentUpdateManyWithWhereWithoutComplexInput[]
    deleteMany?: NewBuildingApartmentScalarWhereInput | NewBuildingApartmentScalarWhereInput[]
  }

  export type NearbyPlaceUpdateManyWithoutComplexNestedInput = {
    create?: XOR<NearbyPlaceCreateWithoutComplexInput, NearbyPlaceUncheckedCreateWithoutComplexInput> | NearbyPlaceCreateWithoutComplexInput[] | NearbyPlaceUncheckedCreateWithoutComplexInput[]
    connectOrCreate?: NearbyPlaceCreateOrConnectWithoutComplexInput | NearbyPlaceCreateOrConnectWithoutComplexInput[]
    upsert?: NearbyPlaceUpsertWithWhereUniqueWithoutComplexInput | NearbyPlaceUpsertWithWhereUniqueWithoutComplexInput[]
    createMany?: NearbyPlaceCreateManyComplexInputEnvelope
    set?: NearbyPlaceWhereUniqueInput | NearbyPlaceWhereUniqueInput[]
    disconnect?: NearbyPlaceWhereUniqueInput | NearbyPlaceWhereUniqueInput[]
    delete?: NearbyPlaceWhereUniqueInput | NearbyPlaceWhereUniqueInput[]
    connect?: NearbyPlaceWhereUniqueInput | NearbyPlaceWhereUniqueInput[]
    update?: NearbyPlaceUpdateWithWhereUniqueWithoutComplexInput | NearbyPlaceUpdateWithWhereUniqueWithoutComplexInput[]
    updateMany?: NearbyPlaceUpdateManyWithWhereWithoutComplexInput | NearbyPlaceUpdateManyWithWhereWithoutComplexInput[]
    deleteMany?: NearbyPlaceScalarWhereInput | NearbyPlaceScalarWhereInput[]
  }

  export type ImageUncheckedUpdateManyWithoutNewBuildingComplexNestedInput = {
    create?: XOR<ImageCreateWithoutNewBuildingComplexInput, ImageUncheckedCreateWithoutNewBuildingComplexInput> | ImageCreateWithoutNewBuildingComplexInput[] | ImageUncheckedCreateWithoutNewBuildingComplexInput[]
    connectOrCreate?: ImageCreateOrConnectWithoutNewBuildingComplexInput | ImageCreateOrConnectWithoutNewBuildingComplexInput[]
    upsert?: ImageUpsertWithWhereUniqueWithoutNewBuildingComplexInput | ImageUpsertWithWhereUniqueWithoutNewBuildingComplexInput[]
    createMany?: ImageCreateManyNewBuildingComplexInputEnvelope
    set?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    disconnect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    delete?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    connect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    update?: ImageUpdateWithWhereUniqueWithoutNewBuildingComplexInput | ImageUpdateWithWhereUniqueWithoutNewBuildingComplexInput[]
    updateMany?: ImageUpdateManyWithWhereWithoutNewBuildingComplexInput | ImageUpdateManyWithWhereWithoutNewBuildingComplexInput[]
    deleteMany?: ImageScalarWhereInput | ImageScalarWhereInput[]
  }

  export type NewBuildingApartmentUncheckedUpdateManyWithoutComplexNestedInput = {
    create?: XOR<NewBuildingApartmentCreateWithoutComplexInput, NewBuildingApartmentUncheckedCreateWithoutComplexInput> | NewBuildingApartmentCreateWithoutComplexInput[] | NewBuildingApartmentUncheckedCreateWithoutComplexInput[]
    connectOrCreate?: NewBuildingApartmentCreateOrConnectWithoutComplexInput | NewBuildingApartmentCreateOrConnectWithoutComplexInput[]
    upsert?: NewBuildingApartmentUpsertWithWhereUniqueWithoutComplexInput | NewBuildingApartmentUpsertWithWhereUniqueWithoutComplexInput[]
    createMany?: NewBuildingApartmentCreateManyComplexInputEnvelope
    set?: NewBuildingApartmentWhereUniqueInput | NewBuildingApartmentWhereUniqueInput[]
    disconnect?: NewBuildingApartmentWhereUniqueInput | NewBuildingApartmentWhereUniqueInput[]
    delete?: NewBuildingApartmentWhereUniqueInput | NewBuildingApartmentWhereUniqueInput[]
    connect?: NewBuildingApartmentWhereUniqueInput | NewBuildingApartmentWhereUniqueInput[]
    update?: NewBuildingApartmentUpdateWithWhereUniqueWithoutComplexInput | NewBuildingApartmentUpdateWithWhereUniqueWithoutComplexInput[]
    updateMany?: NewBuildingApartmentUpdateManyWithWhereWithoutComplexInput | NewBuildingApartmentUpdateManyWithWhereWithoutComplexInput[]
    deleteMany?: NewBuildingApartmentScalarWhereInput | NewBuildingApartmentScalarWhereInput[]
  }

  export type NearbyPlaceUncheckedUpdateManyWithoutComplexNestedInput = {
    create?: XOR<NearbyPlaceCreateWithoutComplexInput, NearbyPlaceUncheckedCreateWithoutComplexInput> | NearbyPlaceCreateWithoutComplexInput[] | NearbyPlaceUncheckedCreateWithoutComplexInput[]
    connectOrCreate?: NearbyPlaceCreateOrConnectWithoutComplexInput | NearbyPlaceCreateOrConnectWithoutComplexInput[]
    upsert?: NearbyPlaceUpsertWithWhereUniqueWithoutComplexInput | NearbyPlaceUpsertWithWhereUniqueWithoutComplexInput[]
    createMany?: NearbyPlaceCreateManyComplexInputEnvelope
    set?: NearbyPlaceWhereUniqueInput | NearbyPlaceWhereUniqueInput[]
    disconnect?: NearbyPlaceWhereUniqueInput | NearbyPlaceWhereUniqueInput[]
    delete?: NearbyPlaceWhereUniqueInput | NearbyPlaceWhereUniqueInput[]
    connect?: NearbyPlaceWhereUniqueInput | NearbyPlaceWhereUniqueInput[]
    update?: NearbyPlaceUpdateWithWhereUniqueWithoutComplexInput | NearbyPlaceUpdateWithWhereUniqueWithoutComplexInput[]
    updateMany?: NearbyPlaceUpdateManyWithWhereWithoutComplexInput | NearbyPlaceUpdateManyWithWhereWithoutComplexInput[]
    deleteMany?: NearbyPlaceScalarWhereInput | NearbyPlaceScalarWhereInput[]
  }

  export type NewBuildingComplexCreateNestedOneWithoutApartmentsInput = {
    create?: XOR<NewBuildingComplexCreateWithoutApartmentsInput, NewBuildingComplexUncheckedCreateWithoutApartmentsInput>
    connectOrCreate?: NewBuildingComplexCreateOrConnectWithoutApartmentsInput
    connect?: NewBuildingComplexWhereUniqueInput
  }

  export type ImageCreateNestedManyWithoutNewBuildingApartmentInput = {
    create?: XOR<ImageCreateWithoutNewBuildingApartmentInput, ImageUncheckedCreateWithoutNewBuildingApartmentInput> | ImageCreateWithoutNewBuildingApartmentInput[] | ImageUncheckedCreateWithoutNewBuildingApartmentInput[]
    connectOrCreate?: ImageCreateOrConnectWithoutNewBuildingApartmentInput | ImageCreateOrConnectWithoutNewBuildingApartmentInput[]
    createMany?: ImageCreateManyNewBuildingApartmentInputEnvelope
    connect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
  }

  export type ImageUncheckedCreateNestedManyWithoutNewBuildingApartmentInput = {
    create?: XOR<ImageCreateWithoutNewBuildingApartmentInput, ImageUncheckedCreateWithoutNewBuildingApartmentInput> | ImageCreateWithoutNewBuildingApartmentInput[] | ImageUncheckedCreateWithoutNewBuildingApartmentInput[]
    connectOrCreate?: ImageCreateOrConnectWithoutNewBuildingApartmentInput | ImageCreateOrConnectWithoutNewBuildingApartmentInput[]
    createMany?: ImageCreateManyNewBuildingApartmentInputEnvelope
    connect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
  }

  export type NewBuildingComplexUpdateOneRequiredWithoutApartmentsNestedInput = {
    create?: XOR<NewBuildingComplexCreateWithoutApartmentsInput, NewBuildingComplexUncheckedCreateWithoutApartmentsInput>
    connectOrCreate?: NewBuildingComplexCreateOrConnectWithoutApartmentsInput
    upsert?: NewBuildingComplexUpsertWithoutApartmentsInput
    connect?: NewBuildingComplexWhereUniqueInput
    update?: XOR<XOR<NewBuildingComplexUpdateToOneWithWhereWithoutApartmentsInput, NewBuildingComplexUpdateWithoutApartmentsInput>, NewBuildingComplexUncheckedUpdateWithoutApartmentsInput>
  }

  export type ImageUpdateManyWithoutNewBuildingApartmentNestedInput = {
    create?: XOR<ImageCreateWithoutNewBuildingApartmentInput, ImageUncheckedCreateWithoutNewBuildingApartmentInput> | ImageCreateWithoutNewBuildingApartmentInput[] | ImageUncheckedCreateWithoutNewBuildingApartmentInput[]
    connectOrCreate?: ImageCreateOrConnectWithoutNewBuildingApartmentInput | ImageCreateOrConnectWithoutNewBuildingApartmentInput[]
    upsert?: ImageUpsertWithWhereUniqueWithoutNewBuildingApartmentInput | ImageUpsertWithWhereUniqueWithoutNewBuildingApartmentInput[]
    createMany?: ImageCreateManyNewBuildingApartmentInputEnvelope
    set?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    disconnect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    delete?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    connect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    update?: ImageUpdateWithWhereUniqueWithoutNewBuildingApartmentInput | ImageUpdateWithWhereUniqueWithoutNewBuildingApartmentInput[]
    updateMany?: ImageUpdateManyWithWhereWithoutNewBuildingApartmentInput | ImageUpdateManyWithWhereWithoutNewBuildingApartmentInput[]
    deleteMany?: ImageScalarWhereInput | ImageScalarWhereInput[]
  }

  export type ImageUncheckedUpdateManyWithoutNewBuildingApartmentNestedInput = {
    create?: XOR<ImageCreateWithoutNewBuildingApartmentInput, ImageUncheckedCreateWithoutNewBuildingApartmentInput> | ImageCreateWithoutNewBuildingApartmentInput[] | ImageUncheckedCreateWithoutNewBuildingApartmentInput[]
    connectOrCreate?: ImageCreateOrConnectWithoutNewBuildingApartmentInput | ImageCreateOrConnectWithoutNewBuildingApartmentInput[]
    upsert?: ImageUpsertWithWhereUniqueWithoutNewBuildingApartmentInput | ImageUpsertWithWhereUniqueWithoutNewBuildingApartmentInput[]
    createMany?: ImageCreateManyNewBuildingApartmentInputEnvelope
    set?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    disconnect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    delete?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    connect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    update?: ImageUpdateWithWhereUniqueWithoutNewBuildingApartmentInput | ImageUpdateWithWhereUniqueWithoutNewBuildingApartmentInput[]
    updateMany?: ImageUpdateManyWithWhereWithoutNewBuildingApartmentInput | ImageUpdateManyWithWhereWithoutNewBuildingApartmentInput[]
    deleteMany?: ImageScalarWhereInput | ImageScalarWhereInput[]
  }

  export type NewBuildingComplexCreateNestedOneWithoutNearbyPlacesInput = {
    create?: XOR<NewBuildingComplexCreateWithoutNearbyPlacesInput, NewBuildingComplexUncheckedCreateWithoutNearbyPlacesInput>
    connectOrCreate?: NewBuildingComplexCreateOrConnectWithoutNearbyPlacesInput
    connect?: NewBuildingComplexWhereUniqueInput
  }

  export type NewBuildingComplexUpdateOneRequiredWithoutNearbyPlacesNestedInput = {
    create?: XOR<NewBuildingComplexCreateWithoutNearbyPlacesInput, NewBuildingComplexUncheckedCreateWithoutNearbyPlacesInput>
    connectOrCreate?: NewBuildingComplexCreateOrConnectWithoutNearbyPlacesInput
    upsert?: NewBuildingComplexUpsertWithoutNearbyPlacesInput
    connect?: NewBuildingComplexWhereUniqueInput
    update?: XOR<XOR<NewBuildingComplexUpdateToOneWithWhereWithoutNearbyPlacesInput, NewBuildingComplexUpdateWithoutNearbyPlacesInput>, NewBuildingComplexUncheckedUpdateWithoutNearbyPlacesInput>
  }

  export type ImageCreateNestedManyWithoutReadyApartmentInput = {
    create?: XOR<ImageCreateWithoutReadyApartmentInput, ImageUncheckedCreateWithoutReadyApartmentInput> | ImageCreateWithoutReadyApartmentInput[] | ImageUncheckedCreateWithoutReadyApartmentInput[]
    connectOrCreate?: ImageCreateOrConnectWithoutReadyApartmentInput | ImageCreateOrConnectWithoutReadyApartmentInput[]
    createMany?: ImageCreateManyReadyApartmentInputEnvelope
    connect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
  }

  export type ImageUncheckedCreateNestedManyWithoutReadyApartmentInput = {
    create?: XOR<ImageCreateWithoutReadyApartmentInput, ImageUncheckedCreateWithoutReadyApartmentInput> | ImageCreateWithoutReadyApartmentInput[] | ImageUncheckedCreateWithoutReadyApartmentInput[]
    connectOrCreate?: ImageCreateOrConnectWithoutReadyApartmentInput | ImageCreateOrConnectWithoutReadyApartmentInput[]
    createMany?: ImageCreateManyReadyApartmentInputEnvelope
    connect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
  }

  export type ImageUpdateManyWithoutReadyApartmentNestedInput = {
    create?: XOR<ImageCreateWithoutReadyApartmentInput, ImageUncheckedCreateWithoutReadyApartmentInput> | ImageCreateWithoutReadyApartmentInput[] | ImageUncheckedCreateWithoutReadyApartmentInput[]
    connectOrCreate?: ImageCreateOrConnectWithoutReadyApartmentInput | ImageCreateOrConnectWithoutReadyApartmentInput[]
    upsert?: ImageUpsertWithWhereUniqueWithoutReadyApartmentInput | ImageUpsertWithWhereUniqueWithoutReadyApartmentInput[]
    createMany?: ImageCreateManyReadyApartmentInputEnvelope
    set?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    disconnect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    delete?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    connect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    update?: ImageUpdateWithWhereUniqueWithoutReadyApartmentInput | ImageUpdateWithWhereUniqueWithoutReadyApartmentInput[]
    updateMany?: ImageUpdateManyWithWhereWithoutReadyApartmentInput | ImageUpdateManyWithWhereWithoutReadyApartmentInput[]
    deleteMany?: ImageScalarWhereInput | ImageScalarWhereInput[]
  }

  export type ImageUncheckedUpdateManyWithoutReadyApartmentNestedInput = {
    create?: XOR<ImageCreateWithoutReadyApartmentInput, ImageUncheckedCreateWithoutReadyApartmentInput> | ImageCreateWithoutReadyApartmentInput[] | ImageUncheckedCreateWithoutReadyApartmentInput[]
    connectOrCreate?: ImageCreateOrConnectWithoutReadyApartmentInput | ImageCreateOrConnectWithoutReadyApartmentInput[]
    upsert?: ImageUpsertWithWhereUniqueWithoutReadyApartmentInput | ImageUpsertWithWhereUniqueWithoutReadyApartmentInput[]
    createMany?: ImageCreateManyReadyApartmentInputEnvelope
    set?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    disconnect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    delete?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    connect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    update?: ImageUpdateWithWhereUniqueWithoutReadyApartmentInput | ImageUpdateWithWhereUniqueWithoutReadyApartmentInput[]
    updateMany?: ImageUpdateManyWithWhereWithoutReadyApartmentInput | ImageUpdateManyWithWhereWithoutReadyApartmentInput[]
    deleteMany?: ImageScalarWhereInput | ImageScalarWhereInput[]
  }

  export type ImageCreateNestedManyWithoutRentalApartmentInput = {
    create?: XOR<ImageCreateWithoutRentalApartmentInput, ImageUncheckedCreateWithoutRentalApartmentInput> | ImageCreateWithoutRentalApartmentInput[] | ImageUncheckedCreateWithoutRentalApartmentInput[]
    connectOrCreate?: ImageCreateOrConnectWithoutRentalApartmentInput | ImageCreateOrConnectWithoutRentalApartmentInput[]
    createMany?: ImageCreateManyRentalApartmentInputEnvelope
    connect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
  }

  export type ImageUncheckedCreateNestedManyWithoutRentalApartmentInput = {
    create?: XOR<ImageCreateWithoutRentalApartmentInput, ImageUncheckedCreateWithoutRentalApartmentInput> | ImageCreateWithoutRentalApartmentInput[] | ImageUncheckedCreateWithoutRentalApartmentInput[]
    connectOrCreate?: ImageCreateOrConnectWithoutRentalApartmentInput | ImageCreateOrConnectWithoutRentalApartmentInput[]
    createMany?: ImageCreateManyRentalApartmentInputEnvelope
    connect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
  }

  export type ImageUpdateManyWithoutRentalApartmentNestedInput = {
    create?: XOR<ImageCreateWithoutRentalApartmentInput, ImageUncheckedCreateWithoutRentalApartmentInput> | ImageCreateWithoutRentalApartmentInput[] | ImageUncheckedCreateWithoutRentalApartmentInput[]
    connectOrCreate?: ImageCreateOrConnectWithoutRentalApartmentInput | ImageCreateOrConnectWithoutRentalApartmentInput[]
    upsert?: ImageUpsertWithWhereUniqueWithoutRentalApartmentInput | ImageUpsertWithWhereUniqueWithoutRentalApartmentInput[]
    createMany?: ImageCreateManyRentalApartmentInputEnvelope
    set?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    disconnect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    delete?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    connect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    update?: ImageUpdateWithWhereUniqueWithoutRentalApartmentInput | ImageUpdateWithWhereUniqueWithoutRentalApartmentInput[]
    updateMany?: ImageUpdateManyWithWhereWithoutRentalApartmentInput | ImageUpdateManyWithWhereWithoutRentalApartmentInput[]
    deleteMany?: ImageScalarWhereInput | ImageScalarWhereInput[]
  }

  export type ImageUncheckedUpdateManyWithoutRentalApartmentNestedInput = {
    create?: XOR<ImageCreateWithoutRentalApartmentInput, ImageUncheckedCreateWithoutRentalApartmentInput> | ImageCreateWithoutRentalApartmentInput[] | ImageUncheckedCreateWithoutRentalApartmentInput[]
    connectOrCreate?: ImageCreateOrConnectWithoutRentalApartmentInput | ImageCreateOrConnectWithoutRentalApartmentInput[]
    upsert?: ImageUpsertWithWhereUniqueWithoutRentalApartmentInput | ImageUpsertWithWhereUniqueWithoutRentalApartmentInput[]
    createMany?: ImageCreateManyRentalApartmentInputEnvelope
    set?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    disconnect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    delete?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    connect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    update?: ImageUpdateWithWhereUniqueWithoutRentalApartmentInput | ImageUpdateWithWhereUniqueWithoutRentalApartmentInput[]
    updateMany?: ImageUpdateManyWithWhereWithoutRentalApartmentInput | ImageUpdateManyWithWhereWithoutRentalApartmentInput[]
    deleteMany?: ImageScalarWhereInput | ImageScalarWhereInput[]
  }

  export type ImageCreateNestedManyWithoutCountryPropertyInput = {
    create?: XOR<ImageCreateWithoutCountryPropertyInput, ImageUncheckedCreateWithoutCountryPropertyInput> | ImageCreateWithoutCountryPropertyInput[] | ImageUncheckedCreateWithoutCountryPropertyInput[]
    connectOrCreate?: ImageCreateOrConnectWithoutCountryPropertyInput | ImageCreateOrConnectWithoutCountryPropertyInput[]
    createMany?: ImageCreateManyCountryPropertyInputEnvelope
    connect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
  }

  export type ImageUncheckedCreateNestedManyWithoutCountryPropertyInput = {
    create?: XOR<ImageCreateWithoutCountryPropertyInput, ImageUncheckedCreateWithoutCountryPropertyInput> | ImageCreateWithoutCountryPropertyInput[] | ImageUncheckedCreateWithoutCountryPropertyInput[]
    connectOrCreate?: ImageCreateOrConnectWithoutCountryPropertyInput | ImageCreateOrConnectWithoutCountryPropertyInput[]
    createMany?: ImageCreateManyCountryPropertyInputEnvelope
    connect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
  }

  export type ImageUpdateManyWithoutCountryPropertyNestedInput = {
    create?: XOR<ImageCreateWithoutCountryPropertyInput, ImageUncheckedCreateWithoutCountryPropertyInput> | ImageCreateWithoutCountryPropertyInput[] | ImageUncheckedCreateWithoutCountryPropertyInput[]
    connectOrCreate?: ImageCreateOrConnectWithoutCountryPropertyInput | ImageCreateOrConnectWithoutCountryPropertyInput[]
    upsert?: ImageUpsertWithWhereUniqueWithoutCountryPropertyInput | ImageUpsertWithWhereUniqueWithoutCountryPropertyInput[]
    createMany?: ImageCreateManyCountryPropertyInputEnvelope
    set?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    disconnect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    delete?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    connect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    update?: ImageUpdateWithWhereUniqueWithoutCountryPropertyInput | ImageUpdateWithWhereUniqueWithoutCountryPropertyInput[]
    updateMany?: ImageUpdateManyWithWhereWithoutCountryPropertyInput | ImageUpdateManyWithWhereWithoutCountryPropertyInput[]
    deleteMany?: ImageScalarWhereInput | ImageScalarWhereInput[]
  }

  export type ImageUncheckedUpdateManyWithoutCountryPropertyNestedInput = {
    create?: XOR<ImageCreateWithoutCountryPropertyInput, ImageUncheckedCreateWithoutCountryPropertyInput> | ImageCreateWithoutCountryPropertyInput[] | ImageUncheckedCreateWithoutCountryPropertyInput[]
    connectOrCreate?: ImageCreateOrConnectWithoutCountryPropertyInput | ImageCreateOrConnectWithoutCountryPropertyInput[]
    upsert?: ImageUpsertWithWhereUniqueWithoutCountryPropertyInput | ImageUpsertWithWhereUniqueWithoutCountryPropertyInput[]
    createMany?: ImageCreateManyCountryPropertyInputEnvelope
    set?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    disconnect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    delete?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    connect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    update?: ImageUpdateWithWhereUniqueWithoutCountryPropertyInput | ImageUpdateWithWhereUniqueWithoutCountryPropertyInput[]
    updateMany?: ImageUpdateManyWithWhereWithoutCountryPropertyInput | ImageUpdateManyWithWhereWithoutCountryPropertyInput[]
    deleteMany?: ImageScalarWhereInput | ImageScalarWhereInput[]
  }

  export type ImageCreateNestedManyWithoutCommercialPropertyInput = {
    create?: XOR<ImageCreateWithoutCommercialPropertyInput, ImageUncheckedCreateWithoutCommercialPropertyInput> | ImageCreateWithoutCommercialPropertyInput[] | ImageUncheckedCreateWithoutCommercialPropertyInput[]
    connectOrCreate?: ImageCreateOrConnectWithoutCommercialPropertyInput | ImageCreateOrConnectWithoutCommercialPropertyInput[]
    createMany?: ImageCreateManyCommercialPropertyInputEnvelope
    connect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
  }

  export type ImageUncheckedCreateNestedManyWithoutCommercialPropertyInput = {
    create?: XOR<ImageCreateWithoutCommercialPropertyInput, ImageUncheckedCreateWithoutCommercialPropertyInput> | ImageCreateWithoutCommercialPropertyInput[] | ImageUncheckedCreateWithoutCommercialPropertyInput[]
    connectOrCreate?: ImageCreateOrConnectWithoutCommercialPropertyInput | ImageCreateOrConnectWithoutCommercialPropertyInput[]
    createMany?: ImageCreateManyCommercialPropertyInputEnvelope
    connect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
  }

  export type ImageUpdateManyWithoutCommercialPropertyNestedInput = {
    create?: XOR<ImageCreateWithoutCommercialPropertyInput, ImageUncheckedCreateWithoutCommercialPropertyInput> | ImageCreateWithoutCommercialPropertyInput[] | ImageUncheckedCreateWithoutCommercialPropertyInput[]
    connectOrCreate?: ImageCreateOrConnectWithoutCommercialPropertyInput | ImageCreateOrConnectWithoutCommercialPropertyInput[]
    upsert?: ImageUpsertWithWhereUniqueWithoutCommercialPropertyInput | ImageUpsertWithWhereUniqueWithoutCommercialPropertyInput[]
    createMany?: ImageCreateManyCommercialPropertyInputEnvelope
    set?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    disconnect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    delete?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    connect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    update?: ImageUpdateWithWhereUniqueWithoutCommercialPropertyInput | ImageUpdateWithWhereUniqueWithoutCommercialPropertyInput[]
    updateMany?: ImageUpdateManyWithWhereWithoutCommercialPropertyInput | ImageUpdateManyWithWhereWithoutCommercialPropertyInput[]
    deleteMany?: ImageScalarWhereInput | ImageScalarWhereInput[]
  }

  export type ImageUncheckedUpdateManyWithoutCommercialPropertyNestedInput = {
    create?: XOR<ImageCreateWithoutCommercialPropertyInput, ImageUncheckedCreateWithoutCommercialPropertyInput> | ImageCreateWithoutCommercialPropertyInput[] | ImageUncheckedCreateWithoutCommercialPropertyInput[]
    connectOrCreate?: ImageCreateOrConnectWithoutCommercialPropertyInput | ImageCreateOrConnectWithoutCommercialPropertyInput[]
    upsert?: ImageUpsertWithWhereUniqueWithoutCommercialPropertyInput | ImageUpsertWithWhereUniqueWithoutCommercialPropertyInput[]
    createMany?: ImageCreateManyCommercialPropertyInputEnvelope
    set?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    disconnect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    delete?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    connect?: ImageWhereUniqueInput | ImageWhereUniqueInput[]
    update?: ImageUpdateWithWhereUniqueWithoutCommercialPropertyInput | ImageUpdateWithWhereUniqueWithoutCommercialPropertyInput[]
    updateMany?: ImageUpdateManyWithWhereWithoutCommercialPropertyInput | ImageUpdateManyWithWhereWithoutCommercialPropertyInput[]
    deleteMany?: ImageScalarWhereInput | ImageScalarWhereInput[]
  }

  export type NestedIntFilter<$PrismaModel = never> = {
    equals?: number | IntFieldRefInput<$PrismaModel>
    in?: number[] | ListIntFieldRefInput<$PrismaModel>
    notIn?: number[] | ListIntFieldRefInput<$PrismaModel>
    lt?: number | IntFieldRefInput<$PrismaModel>
    lte?: number | IntFieldRefInput<$PrismaModel>
    gt?: number | IntFieldRefInput<$PrismaModel>
    gte?: number | IntFieldRefInput<$PrismaModel>
    not?: NestedIntFilter<$PrismaModel> | number
  }

  export type NestedStringFilter<$PrismaModel = never> = {
    equals?: string | StringFieldRefInput<$PrismaModel>
    in?: string[] | ListStringFieldRefInput<$PrismaModel>
    notIn?: string[] | ListStringFieldRefInput<$PrismaModel>
    lt?: string | StringFieldRefInput<$PrismaModel>
    lte?: string | StringFieldRefInput<$PrismaModel>
    gt?: string | StringFieldRefInput<$PrismaModel>
    gte?: string | StringFieldRefInput<$PrismaModel>
    contains?: string | StringFieldRefInput<$PrismaModel>
    startsWith?: string | StringFieldRefInput<$PrismaModel>
    endsWith?: string | StringFieldRefInput<$PrismaModel>
    not?: NestedStringFilter<$PrismaModel> | string
  }

  export type NestedStringNullableFilter<$PrismaModel = never> = {
    equals?: string | StringFieldRefInput<$PrismaModel> | null
    in?: string[] | ListStringFieldRefInput<$PrismaModel> | null
    notIn?: string[] | ListStringFieldRefInput<$PrismaModel> | null
    lt?: string | StringFieldRefInput<$PrismaModel>
    lte?: string | StringFieldRefInput<$PrismaModel>
    gt?: string | StringFieldRefInput<$PrismaModel>
    gte?: string | StringFieldRefInput<$PrismaModel>
    contains?: string | StringFieldRefInput<$PrismaModel>
    startsWith?: string | StringFieldRefInput<$PrismaModel>
    endsWith?: string | StringFieldRefInput<$PrismaModel>
    not?: NestedStringNullableFilter<$PrismaModel> | string | null
  }

  export type NestedDateTimeFilter<$PrismaModel = never> = {
    equals?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    in?: Date[] | string[] | ListDateTimeFieldRefInput<$PrismaModel>
    notIn?: Date[] | string[] | ListDateTimeFieldRefInput<$PrismaModel>
    lt?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    lte?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    gt?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    gte?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    not?: NestedDateTimeFilter<$PrismaModel> | Date | string
  }

  export type NestedIntWithAggregatesFilter<$PrismaModel = never> = {
    equals?: number | IntFieldRefInput<$PrismaModel>
    in?: number[] | ListIntFieldRefInput<$PrismaModel>
    notIn?: number[] | ListIntFieldRefInput<$PrismaModel>
    lt?: number | IntFieldRefInput<$PrismaModel>
    lte?: number | IntFieldRefInput<$PrismaModel>
    gt?: number | IntFieldRefInput<$PrismaModel>
    gte?: number | IntFieldRefInput<$PrismaModel>
    not?: NestedIntWithAggregatesFilter<$PrismaModel> | number
    _count?: NestedIntFilter<$PrismaModel>
    _avg?: NestedFloatFilter<$PrismaModel>
    _sum?: NestedIntFilter<$PrismaModel>
    _min?: NestedIntFilter<$PrismaModel>
    _max?: NestedIntFilter<$PrismaModel>
  }

  export type NestedFloatFilter<$PrismaModel = never> = {
    equals?: number | FloatFieldRefInput<$PrismaModel>
    in?: number[] | ListFloatFieldRefInput<$PrismaModel>
    notIn?: number[] | ListFloatFieldRefInput<$PrismaModel>
    lt?: number | FloatFieldRefInput<$PrismaModel>
    lte?: number | FloatFieldRefInput<$PrismaModel>
    gt?: number | FloatFieldRefInput<$PrismaModel>
    gte?: number | FloatFieldRefInput<$PrismaModel>
    not?: NestedFloatFilter<$PrismaModel> | number
  }

  export type NestedStringWithAggregatesFilter<$PrismaModel = never> = {
    equals?: string | StringFieldRefInput<$PrismaModel>
    in?: string[] | ListStringFieldRefInput<$PrismaModel>
    notIn?: string[] | ListStringFieldRefInput<$PrismaModel>
    lt?: string | StringFieldRefInput<$PrismaModel>
    lte?: string | StringFieldRefInput<$PrismaModel>
    gt?: string | StringFieldRefInput<$PrismaModel>
    gte?: string | StringFieldRefInput<$PrismaModel>
    contains?: string | StringFieldRefInput<$PrismaModel>
    startsWith?: string | StringFieldRefInput<$PrismaModel>
    endsWith?: string | StringFieldRefInput<$PrismaModel>
    not?: NestedStringWithAggregatesFilter<$PrismaModel> | string
    _count?: NestedIntFilter<$PrismaModel>
    _min?: NestedStringFilter<$PrismaModel>
    _max?: NestedStringFilter<$PrismaModel>
  }

  export type NestedStringNullableWithAggregatesFilter<$PrismaModel = never> = {
    equals?: string | StringFieldRefInput<$PrismaModel> | null
    in?: string[] | ListStringFieldRefInput<$PrismaModel> | null
    notIn?: string[] | ListStringFieldRefInput<$PrismaModel> | null
    lt?: string | StringFieldRefInput<$PrismaModel>
    lte?: string | StringFieldRefInput<$PrismaModel>
    gt?: string | StringFieldRefInput<$PrismaModel>
    gte?: string | StringFieldRefInput<$PrismaModel>
    contains?: string | StringFieldRefInput<$PrismaModel>
    startsWith?: string | StringFieldRefInput<$PrismaModel>
    endsWith?: string | StringFieldRefInput<$PrismaModel>
    not?: NestedStringNullableWithAggregatesFilter<$PrismaModel> | string | null
    _count?: NestedIntNullableFilter<$PrismaModel>
    _min?: NestedStringNullableFilter<$PrismaModel>
    _max?: NestedStringNullableFilter<$PrismaModel>
  }

  export type NestedIntNullableFilter<$PrismaModel = never> = {
    equals?: number | IntFieldRefInput<$PrismaModel> | null
    in?: number[] | ListIntFieldRefInput<$PrismaModel> | null
    notIn?: number[] | ListIntFieldRefInput<$PrismaModel> | null
    lt?: number | IntFieldRefInput<$PrismaModel>
    lte?: number | IntFieldRefInput<$PrismaModel>
    gt?: number | IntFieldRefInput<$PrismaModel>
    gte?: number | IntFieldRefInput<$PrismaModel>
    not?: NestedIntNullableFilter<$PrismaModel> | number | null
  }

  export type NestedDateTimeWithAggregatesFilter<$PrismaModel = never> = {
    equals?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    in?: Date[] | string[] | ListDateTimeFieldRefInput<$PrismaModel>
    notIn?: Date[] | string[] | ListDateTimeFieldRefInput<$PrismaModel>
    lt?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    lte?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    gt?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    gte?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    not?: NestedDateTimeWithAggregatesFilter<$PrismaModel> | Date | string
    _count?: NestedIntFilter<$PrismaModel>
    _min?: NestedDateTimeFilter<$PrismaModel>
    _max?: NestedDateTimeFilter<$PrismaModel>
  }

  export type NestedEnumApplicationStatusFilter<$PrismaModel = never> = {
    equals?: $Enums.ApplicationStatus | EnumApplicationStatusFieldRefInput<$PrismaModel>
    in?: $Enums.ApplicationStatus[] | ListEnumApplicationStatusFieldRefInput<$PrismaModel>
    notIn?: $Enums.ApplicationStatus[] | ListEnumApplicationStatusFieldRefInput<$PrismaModel>
    not?: NestedEnumApplicationStatusFilter<$PrismaModel> | $Enums.ApplicationStatus
  }

  export type NestedEnumApplicationStatusWithAggregatesFilter<$PrismaModel = never> = {
    equals?: $Enums.ApplicationStatus | EnumApplicationStatusFieldRefInput<$PrismaModel>
    in?: $Enums.ApplicationStatus[] | ListEnumApplicationStatusFieldRefInput<$PrismaModel>
    notIn?: $Enums.ApplicationStatus[] | ListEnumApplicationStatusFieldRefInput<$PrismaModel>
    not?: NestedEnumApplicationStatusWithAggregatesFilter<$PrismaModel> | $Enums.ApplicationStatus
    _count?: NestedIntFilter<$PrismaModel>
    _min?: NestedEnumApplicationStatusFilter<$PrismaModel>
    _max?: NestedEnumApplicationStatusFilter<$PrismaModel>
  }

  export type NestedIntNullableWithAggregatesFilter<$PrismaModel = never> = {
    equals?: number | IntFieldRefInput<$PrismaModel> | null
    in?: number[] | ListIntFieldRefInput<$PrismaModel> | null
    notIn?: number[] | ListIntFieldRefInput<$PrismaModel> | null
    lt?: number | IntFieldRefInput<$PrismaModel>
    lte?: number | IntFieldRefInput<$PrismaModel>
    gt?: number | IntFieldRefInput<$PrismaModel>
    gte?: number | IntFieldRefInput<$PrismaModel>
    not?: NestedIntNullableWithAggregatesFilter<$PrismaModel> | number | null
    _count?: NestedIntNullableFilter<$PrismaModel>
    _avg?: NestedFloatNullableFilter<$PrismaModel>
    _sum?: NestedIntNullableFilter<$PrismaModel>
    _min?: NestedIntNullableFilter<$PrismaModel>
    _max?: NestedIntNullableFilter<$PrismaModel>
  }

  export type NestedFloatNullableFilter<$PrismaModel = never> = {
    equals?: number | FloatFieldRefInput<$PrismaModel> | null
    in?: number[] | ListFloatFieldRefInput<$PrismaModel> | null
    notIn?: number[] | ListFloatFieldRefInput<$PrismaModel> | null
    lt?: number | FloatFieldRefInput<$PrismaModel>
    lte?: number | FloatFieldRefInput<$PrismaModel>
    gt?: number | FloatFieldRefInput<$PrismaModel>
    gte?: number | FloatFieldRefInput<$PrismaModel>
    not?: NestedFloatNullableFilter<$PrismaModel> | number | null
  }

  export type NestedDateTimeNullableFilter<$PrismaModel = never> = {
    equals?: Date | string | DateTimeFieldRefInput<$PrismaModel> | null
    in?: Date[] | string[] | ListDateTimeFieldRefInput<$PrismaModel> | null
    notIn?: Date[] | string[] | ListDateTimeFieldRefInput<$PrismaModel> | null
    lt?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    lte?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    gt?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    gte?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    not?: NestedDateTimeNullableFilter<$PrismaModel> | Date | string | null
  }

  export type NestedBoolFilter<$PrismaModel = never> = {
    equals?: boolean | BooleanFieldRefInput<$PrismaModel>
    not?: NestedBoolFilter<$PrismaModel> | boolean
  }

  export type NestedFloatNullableWithAggregatesFilter<$PrismaModel = never> = {
    equals?: number | FloatFieldRefInput<$PrismaModel> | null
    in?: number[] | ListFloatFieldRefInput<$PrismaModel> | null
    notIn?: number[] | ListFloatFieldRefInput<$PrismaModel> | null
    lt?: number | FloatFieldRefInput<$PrismaModel>
    lte?: number | FloatFieldRefInput<$PrismaModel>
    gt?: number | FloatFieldRefInput<$PrismaModel>
    gte?: number | FloatFieldRefInput<$PrismaModel>
    not?: NestedFloatNullableWithAggregatesFilter<$PrismaModel> | number | null
    _count?: NestedIntNullableFilter<$PrismaModel>
    _avg?: NestedFloatNullableFilter<$PrismaModel>
    _sum?: NestedFloatNullableFilter<$PrismaModel>
    _min?: NestedFloatNullableFilter<$PrismaModel>
    _max?: NestedFloatNullableFilter<$PrismaModel>
  }

  export type NestedDateTimeNullableWithAggregatesFilter<$PrismaModel = never> = {
    equals?: Date | string | DateTimeFieldRefInput<$PrismaModel> | null
    in?: Date[] | string[] | ListDateTimeFieldRefInput<$PrismaModel> | null
    notIn?: Date[] | string[] | ListDateTimeFieldRefInput<$PrismaModel> | null
    lt?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    lte?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    gt?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    gte?: Date | string | DateTimeFieldRefInput<$PrismaModel>
    not?: NestedDateTimeNullableWithAggregatesFilter<$PrismaModel> | Date | string | null
    _count?: NestedIntNullableFilter<$PrismaModel>
    _min?: NestedDateTimeNullableFilter<$PrismaModel>
    _max?: NestedDateTimeNullableFilter<$PrismaModel>
  }

  export type NestedBoolWithAggregatesFilter<$PrismaModel = never> = {
    equals?: boolean | BooleanFieldRefInput<$PrismaModel>
    not?: NestedBoolWithAggregatesFilter<$PrismaModel> | boolean
    _count?: NestedIntFilter<$PrismaModel>
    _min?: NestedBoolFilter<$PrismaModel>
    _max?: NestedBoolFilter<$PrismaModel>
  }

  export type NewBuildingComplexCreateWithoutImagesInput = {
    name: string
    address: string
    district?: string | null
    metro?: string | null
    metroDistance?: number | null
    city?: string | null
    developer: string
    priceFrom: number
    areaFrom?: number | null
    buildingClass?: string | null
    floors?: number | null
    totalApartments?: number | null
    availableApartments?: number | null
    lat?: number | null
    lng?: number | null
    completionDate?: Date | string | null
    height?: number | null
    hasParking?: boolean
    description?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
    apartments?: NewBuildingApartmentCreateNestedManyWithoutComplexInput
    nearbyPlaces?: NearbyPlaceCreateNestedManyWithoutComplexInput
  }

  export type NewBuildingComplexUncheckedCreateWithoutImagesInput = {
    id?: number
    name: string
    address: string
    district?: string | null
    metro?: string | null
    metroDistance?: number | null
    city?: string | null
    developer: string
    priceFrom: number
    areaFrom?: number | null
    buildingClass?: string | null
    floors?: number | null
    totalApartments?: number | null
    availableApartments?: number | null
    lat?: number | null
    lng?: number | null
    completionDate?: Date | string | null
    height?: number | null
    hasParking?: boolean
    description?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
    apartments?: NewBuildingApartmentUncheckedCreateNestedManyWithoutComplexInput
    nearbyPlaces?: NearbyPlaceUncheckedCreateNestedManyWithoutComplexInput
  }

  export type NewBuildingComplexCreateOrConnectWithoutImagesInput = {
    where: NewBuildingComplexWhereUniqueInput
    create: XOR<NewBuildingComplexCreateWithoutImagesInput, NewBuildingComplexUncheckedCreateWithoutImagesInput>
  }

  export type NewBuildingApartmentCreateWithoutImagesInput = {
    title?: string
    bedrooms: number
    area: number
    price: number
    pricePerM2: number
    floor: number
    totalFloors: number
    city?: string | null
    apartmentNumber?: number
    lat?: number | null
    lng?: number | null
    type: string
    createdAt?: Date | string
    updatedAt?: Date | string
    complex: NewBuildingComplexCreateNestedOneWithoutApartmentsInput
  }

  export type NewBuildingApartmentUncheckedCreateWithoutImagesInput = {
    id?: number
    complexId: number
    title?: string
    bedrooms: number
    area: number
    price: number
    pricePerM2: number
    floor: number
    totalFloors: number
    city?: string | null
    apartmentNumber?: number
    lat?: number | null
    lng?: number | null
    type: string
    createdAt?: Date | string
    updatedAt?: Date | string
  }

  export type NewBuildingApartmentCreateOrConnectWithoutImagesInput = {
    where: NewBuildingApartmentWhereUniqueInput
    create: XOR<NewBuildingApartmentCreateWithoutImagesInput, NewBuildingApartmentUncheckedCreateWithoutImagesInput>
  }

  export type ReadyApartmentCreateWithoutImagesInput = {
    title: string
    complexName?: string | null
    address: string
    city?: string | null
    area: number
    price: number
    pricePerM2: number
    bedrooms: number
    floor: number
    totalFloors: number
    lat?: number | null
    lng?: number | null
    metro?: string | null
    metroDistance?: number | null
    description?: string | null
    developer?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
  }

  export type ReadyApartmentUncheckedCreateWithoutImagesInput = {
    id?: number
    title: string
    complexName?: string | null
    address: string
    city?: string | null
    area: number
    price: number
    pricePerM2: number
    bedrooms: number
    floor: number
    totalFloors: number
    lat?: number | null
    lng?: number | null
    metro?: string | null
    metroDistance?: number | null
    description?: string | null
    developer?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
  }

  export type ReadyApartmentCreateOrConnectWithoutImagesInput = {
    where: ReadyApartmentWhereUniqueInput
    create: XOR<ReadyApartmentCreateWithoutImagesInput, ReadyApartmentUncheckedCreateWithoutImagesInput>
  }

  export type RentalApartmentCreateWithoutImagesInput = {
    title: string
    address: string
    area: number
    pricePerMonth: number
    bedrooms: number
    lat?: number | null
    lng?: number | null
    floor: number
    totalFloors: number
    city?: string | null
    metro?: string | null
    metroDistance?: number | null
    description?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
  }

  export type RentalApartmentUncheckedCreateWithoutImagesInput = {
    id?: number
    title: string
    address: string
    area: number
    pricePerMonth: number
    bedrooms: number
    lat?: number | null
    lng?: number | null
    floor: number
    totalFloors: number
    city?: string | null
    metro?: string | null
    metroDistance?: number | null
    description?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
  }

  export type RentalApartmentCreateOrConnectWithoutImagesInput = {
    where: RentalApartmentWhereUniqueInput
    create: XOR<RentalApartmentCreateWithoutImagesInput, RentalApartmentUncheckedCreateWithoutImagesInput>
  }

  export type CountryPropertyCreateWithoutImagesInput = {
    title: string
    address: string
    metro?: string | null
    metroDistance?: number | null
    city?: string | null
    price: number
    lat?: number | null
    lng?: number | null
    landArea: number
    bedrooms: number
    totalFloors: number
    pricePerM2: number
    description?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
  }

  export type CountryPropertyUncheckedCreateWithoutImagesInput = {
    id?: number
    title: string
    address: string
    metro?: string | null
    metroDistance?: number | null
    city?: string | null
    price: number
    lat?: number | null
    lng?: number | null
    landArea: number
    bedrooms: number
    totalFloors: number
    pricePerM2: number
    description?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
  }

  export type CountryPropertyCreateOrConnectWithoutImagesInput = {
    where: CountryPropertyWhereUniqueInput
    create: XOR<CountryPropertyCreateWithoutImagesInput, CountryPropertyUncheckedCreateWithoutImagesInput>
  }

  export type CommercialPropertyCreateWithoutImagesInput = {
    title: string
    address: string
    price: number
    pricePerM2: number
    area: number
    city?: string | null
    lat?: number | null
    lng?: number | null
    hasFinishing?: boolean
    purpose?: string | null
    metro?: string | null
    metroDistance?: number | null
    description?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
  }

  export type CommercialPropertyUncheckedCreateWithoutImagesInput = {
    id?: number
    title: string
    address: string
    price: number
    pricePerM2: number
    area: number
    city?: string | null
    lat?: number | null
    lng?: number | null
    hasFinishing?: boolean
    purpose?: string | null
    metro?: string | null
    metroDistance?: number | null
    description?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
  }

  export type CommercialPropertyCreateOrConnectWithoutImagesInput = {
    where: CommercialPropertyWhereUniqueInput
    create: XOR<CommercialPropertyCreateWithoutImagesInput, CommercialPropertyUncheckedCreateWithoutImagesInput>
  }

  export type NewBuildingComplexUpsertWithoutImagesInput = {
    update: XOR<NewBuildingComplexUpdateWithoutImagesInput, NewBuildingComplexUncheckedUpdateWithoutImagesInput>
    create: XOR<NewBuildingComplexCreateWithoutImagesInput, NewBuildingComplexUncheckedCreateWithoutImagesInput>
    where?: NewBuildingComplexWhereInput
  }

  export type NewBuildingComplexUpdateToOneWithWhereWithoutImagesInput = {
    where?: NewBuildingComplexWhereInput
    data: XOR<NewBuildingComplexUpdateWithoutImagesInput, NewBuildingComplexUncheckedUpdateWithoutImagesInput>
  }

  export type NewBuildingComplexUpdateWithoutImagesInput = {
    name?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    district?: NullableStringFieldUpdateOperationsInput | string | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    city?: NullableStringFieldUpdateOperationsInput | string | null
    developer?: StringFieldUpdateOperationsInput | string
    priceFrom?: IntFieldUpdateOperationsInput | number
    areaFrom?: NullableIntFieldUpdateOperationsInput | number | null
    buildingClass?: NullableStringFieldUpdateOperationsInput | string | null
    floors?: NullableIntFieldUpdateOperationsInput | number | null
    totalApartments?: NullableIntFieldUpdateOperationsInput | number | null
    availableApartments?: NullableIntFieldUpdateOperationsInput | number | null
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    completionDate?: NullableDateTimeFieldUpdateOperationsInput | Date | string | null
    height?: NullableIntFieldUpdateOperationsInput | number | null
    hasParking?: BoolFieldUpdateOperationsInput | boolean
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
    apartments?: NewBuildingApartmentUpdateManyWithoutComplexNestedInput
    nearbyPlaces?: NearbyPlaceUpdateManyWithoutComplexNestedInput
  }

  export type NewBuildingComplexUncheckedUpdateWithoutImagesInput = {
    id?: IntFieldUpdateOperationsInput | number
    name?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    district?: NullableStringFieldUpdateOperationsInput | string | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    city?: NullableStringFieldUpdateOperationsInput | string | null
    developer?: StringFieldUpdateOperationsInput | string
    priceFrom?: IntFieldUpdateOperationsInput | number
    areaFrom?: NullableIntFieldUpdateOperationsInput | number | null
    buildingClass?: NullableStringFieldUpdateOperationsInput | string | null
    floors?: NullableIntFieldUpdateOperationsInput | number | null
    totalApartments?: NullableIntFieldUpdateOperationsInput | number | null
    availableApartments?: NullableIntFieldUpdateOperationsInput | number | null
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    completionDate?: NullableDateTimeFieldUpdateOperationsInput | Date | string | null
    height?: NullableIntFieldUpdateOperationsInput | number | null
    hasParking?: BoolFieldUpdateOperationsInput | boolean
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
    apartments?: NewBuildingApartmentUncheckedUpdateManyWithoutComplexNestedInput
    nearbyPlaces?: NearbyPlaceUncheckedUpdateManyWithoutComplexNestedInput
  }

  export type NewBuildingApartmentUpsertWithoutImagesInput = {
    update: XOR<NewBuildingApartmentUpdateWithoutImagesInput, NewBuildingApartmentUncheckedUpdateWithoutImagesInput>
    create: XOR<NewBuildingApartmentCreateWithoutImagesInput, NewBuildingApartmentUncheckedCreateWithoutImagesInput>
    where?: NewBuildingApartmentWhereInput
  }

  export type NewBuildingApartmentUpdateToOneWithWhereWithoutImagesInput = {
    where?: NewBuildingApartmentWhereInput
    data: XOR<NewBuildingApartmentUpdateWithoutImagesInput, NewBuildingApartmentUncheckedUpdateWithoutImagesInput>
  }

  export type NewBuildingApartmentUpdateWithoutImagesInput = {
    title?: StringFieldUpdateOperationsInput | string
    bedrooms?: IntFieldUpdateOperationsInput | number
    area?: IntFieldUpdateOperationsInput | number
    price?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    floor?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    city?: NullableStringFieldUpdateOperationsInput | string | null
    apartmentNumber?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    type?: StringFieldUpdateOperationsInput | string
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
    complex?: NewBuildingComplexUpdateOneRequiredWithoutApartmentsNestedInput
  }

  export type NewBuildingApartmentUncheckedUpdateWithoutImagesInput = {
    id?: IntFieldUpdateOperationsInput | number
    complexId?: IntFieldUpdateOperationsInput | number
    title?: StringFieldUpdateOperationsInput | string
    bedrooms?: IntFieldUpdateOperationsInput | number
    area?: IntFieldUpdateOperationsInput | number
    price?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    floor?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    city?: NullableStringFieldUpdateOperationsInput | string | null
    apartmentNumber?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    type?: StringFieldUpdateOperationsInput | string
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ReadyApartmentUpsertWithoutImagesInput = {
    update: XOR<ReadyApartmentUpdateWithoutImagesInput, ReadyApartmentUncheckedUpdateWithoutImagesInput>
    create: XOR<ReadyApartmentCreateWithoutImagesInput, ReadyApartmentUncheckedCreateWithoutImagesInput>
    where?: ReadyApartmentWhereInput
  }

  export type ReadyApartmentUpdateToOneWithWhereWithoutImagesInput = {
    where?: ReadyApartmentWhereInput
    data: XOR<ReadyApartmentUpdateWithoutImagesInput, ReadyApartmentUncheckedUpdateWithoutImagesInput>
  }

  export type ReadyApartmentUpdateWithoutImagesInput = {
    title?: StringFieldUpdateOperationsInput | string
    complexName?: NullableStringFieldUpdateOperationsInput | string | null
    address?: StringFieldUpdateOperationsInput | string
    city?: NullableStringFieldUpdateOperationsInput | string | null
    area?: IntFieldUpdateOperationsInput | number
    price?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    bedrooms?: IntFieldUpdateOperationsInput | number
    floor?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    description?: NullableStringFieldUpdateOperationsInput | string | null
    developer?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ReadyApartmentUncheckedUpdateWithoutImagesInput = {
    id?: IntFieldUpdateOperationsInput | number
    title?: StringFieldUpdateOperationsInput | string
    complexName?: NullableStringFieldUpdateOperationsInput | string | null
    address?: StringFieldUpdateOperationsInput | string
    city?: NullableStringFieldUpdateOperationsInput | string | null
    area?: IntFieldUpdateOperationsInput | number
    price?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    bedrooms?: IntFieldUpdateOperationsInput | number
    floor?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    description?: NullableStringFieldUpdateOperationsInput | string | null
    developer?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type RentalApartmentUpsertWithoutImagesInput = {
    update: XOR<RentalApartmentUpdateWithoutImagesInput, RentalApartmentUncheckedUpdateWithoutImagesInput>
    create: XOR<RentalApartmentCreateWithoutImagesInput, RentalApartmentUncheckedCreateWithoutImagesInput>
    where?: RentalApartmentWhereInput
  }

  export type RentalApartmentUpdateToOneWithWhereWithoutImagesInput = {
    where?: RentalApartmentWhereInput
    data: XOR<RentalApartmentUpdateWithoutImagesInput, RentalApartmentUncheckedUpdateWithoutImagesInput>
  }

  export type RentalApartmentUpdateWithoutImagesInput = {
    title?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    area?: IntFieldUpdateOperationsInput | number
    pricePerMonth?: IntFieldUpdateOperationsInput | number
    bedrooms?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    floor?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    city?: NullableStringFieldUpdateOperationsInput | string | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type RentalApartmentUncheckedUpdateWithoutImagesInput = {
    id?: IntFieldUpdateOperationsInput | number
    title?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    area?: IntFieldUpdateOperationsInput | number
    pricePerMonth?: IntFieldUpdateOperationsInput | number
    bedrooms?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    floor?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    city?: NullableStringFieldUpdateOperationsInput | string | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type CountryPropertyUpsertWithoutImagesInput = {
    update: XOR<CountryPropertyUpdateWithoutImagesInput, CountryPropertyUncheckedUpdateWithoutImagesInput>
    create: XOR<CountryPropertyCreateWithoutImagesInput, CountryPropertyUncheckedCreateWithoutImagesInput>
    where?: CountryPropertyWhereInput
  }

  export type CountryPropertyUpdateToOneWithWhereWithoutImagesInput = {
    where?: CountryPropertyWhereInput
    data: XOR<CountryPropertyUpdateWithoutImagesInput, CountryPropertyUncheckedUpdateWithoutImagesInput>
  }

  export type CountryPropertyUpdateWithoutImagesInput = {
    title?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    city?: NullableStringFieldUpdateOperationsInput | string | null
    price?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    landArea?: IntFieldUpdateOperationsInput | number
    bedrooms?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type CountryPropertyUncheckedUpdateWithoutImagesInput = {
    id?: IntFieldUpdateOperationsInput | number
    title?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    city?: NullableStringFieldUpdateOperationsInput | string | null
    price?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    landArea?: IntFieldUpdateOperationsInput | number
    bedrooms?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type CommercialPropertyUpsertWithoutImagesInput = {
    update: XOR<CommercialPropertyUpdateWithoutImagesInput, CommercialPropertyUncheckedUpdateWithoutImagesInput>
    create: XOR<CommercialPropertyCreateWithoutImagesInput, CommercialPropertyUncheckedCreateWithoutImagesInput>
    where?: CommercialPropertyWhereInput
  }

  export type CommercialPropertyUpdateToOneWithWhereWithoutImagesInput = {
    where?: CommercialPropertyWhereInput
    data: XOR<CommercialPropertyUpdateWithoutImagesInput, CommercialPropertyUncheckedUpdateWithoutImagesInput>
  }

  export type CommercialPropertyUpdateWithoutImagesInput = {
    title?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    price?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    area?: IntFieldUpdateOperationsInput | number
    city?: NullableStringFieldUpdateOperationsInput | string | null
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    hasFinishing?: BoolFieldUpdateOperationsInput | boolean
    purpose?: NullableStringFieldUpdateOperationsInput | string | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type CommercialPropertyUncheckedUpdateWithoutImagesInput = {
    id?: IntFieldUpdateOperationsInput | number
    title?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    price?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    area?: IntFieldUpdateOperationsInput | number
    city?: NullableStringFieldUpdateOperationsInput | string | null
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    hasFinishing?: BoolFieldUpdateOperationsInput | boolean
    purpose?: NullableStringFieldUpdateOperationsInput | string | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ImageCreateWithoutNewBuildingComplexInput = {
    url: string
    createdAt?: Date | string
    newBuildingApartment?: NewBuildingApartmentCreateNestedOneWithoutImagesInput
    readyApartment?: ReadyApartmentCreateNestedOneWithoutImagesInput
    rentalApartment?: RentalApartmentCreateNestedOneWithoutImagesInput
    countryProperty?: CountryPropertyCreateNestedOneWithoutImagesInput
    commercialProperty?: CommercialPropertyCreateNestedOneWithoutImagesInput
  }

  export type ImageUncheckedCreateWithoutNewBuildingComplexInput = {
    id?: number
    url: string
    newBuildingApartmentId?: number | null
    readyApartmentId?: number | null
    rentalApartmentId?: number | null
    countryPropertyId?: number | null
    commercialPropertyId?: number | null
    createdAt?: Date | string
  }

  export type ImageCreateOrConnectWithoutNewBuildingComplexInput = {
    where: ImageWhereUniqueInput
    create: XOR<ImageCreateWithoutNewBuildingComplexInput, ImageUncheckedCreateWithoutNewBuildingComplexInput>
  }

  export type ImageCreateManyNewBuildingComplexInputEnvelope = {
    data: ImageCreateManyNewBuildingComplexInput | ImageCreateManyNewBuildingComplexInput[]
    skipDuplicates?: boolean
  }

  export type NewBuildingApartmentCreateWithoutComplexInput = {
    title?: string
    bedrooms: number
    area: number
    price: number
    pricePerM2: number
    floor: number
    totalFloors: number
    city?: string | null
    apartmentNumber?: number
    lat?: number | null
    lng?: number | null
    type: string
    createdAt?: Date | string
    updatedAt?: Date | string
    images?: ImageCreateNestedManyWithoutNewBuildingApartmentInput
  }

  export type NewBuildingApartmentUncheckedCreateWithoutComplexInput = {
    id?: number
    title?: string
    bedrooms: number
    area: number
    price: number
    pricePerM2: number
    floor: number
    totalFloors: number
    city?: string | null
    apartmentNumber?: number
    lat?: number | null
    lng?: number | null
    type: string
    createdAt?: Date | string
    updatedAt?: Date | string
    images?: ImageUncheckedCreateNestedManyWithoutNewBuildingApartmentInput
  }

  export type NewBuildingApartmentCreateOrConnectWithoutComplexInput = {
    where: NewBuildingApartmentWhereUniqueInput
    create: XOR<NewBuildingApartmentCreateWithoutComplexInput, NewBuildingApartmentUncheckedCreateWithoutComplexInput>
  }

  export type NewBuildingApartmentCreateManyComplexInputEnvelope = {
    data: NewBuildingApartmentCreateManyComplexInput | NewBuildingApartmentCreateManyComplexInput[]
    skipDuplicates?: boolean
  }

  export type NearbyPlaceCreateWithoutComplexInput = {
    name: string
    category: string
    distance?: number | null
    icon?: string | null
    createdAt?: Date | string
  }

  export type NearbyPlaceUncheckedCreateWithoutComplexInput = {
    id?: number
    name: string
    category: string
    distance?: number | null
    icon?: string | null
    createdAt?: Date | string
  }

  export type NearbyPlaceCreateOrConnectWithoutComplexInput = {
    where: NearbyPlaceWhereUniqueInput
    create: XOR<NearbyPlaceCreateWithoutComplexInput, NearbyPlaceUncheckedCreateWithoutComplexInput>
  }

  export type NearbyPlaceCreateManyComplexInputEnvelope = {
    data: NearbyPlaceCreateManyComplexInput | NearbyPlaceCreateManyComplexInput[]
    skipDuplicates?: boolean
  }

  export type ImageUpsertWithWhereUniqueWithoutNewBuildingComplexInput = {
    where: ImageWhereUniqueInput
    update: XOR<ImageUpdateWithoutNewBuildingComplexInput, ImageUncheckedUpdateWithoutNewBuildingComplexInput>
    create: XOR<ImageCreateWithoutNewBuildingComplexInput, ImageUncheckedCreateWithoutNewBuildingComplexInput>
  }

  export type ImageUpdateWithWhereUniqueWithoutNewBuildingComplexInput = {
    where: ImageWhereUniqueInput
    data: XOR<ImageUpdateWithoutNewBuildingComplexInput, ImageUncheckedUpdateWithoutNewBuildingComplexInput>
  }

  export type ImageUpdateManyWithWhereWithoutNewBuildingComplexInput = {
    where: ImageScalarWhereInput
    data: XOR<ImageUpdateManyMutationInput, ImageUncheckedUpdateManyWithoutNewBuildingComplexInput>
  }

  export type ImageScalarWhereInput = {
    AND?: ImageScalarWhereInput | ImageScalarWhereInput[]
    OR?: ImageScalarWhereInput[]
    NOT?: ImageScalarWhereInput | ImageScalarWhereInput[]
    id?: IntFilter<"Image"> | number
    url?: StringFilter<"Image"> | string
    newBuildingComplexId?: IntNullableFilter<"Image"> | number | null
    newBuildingApartmentId?: IntNullableFilter<"Image"> | number | null
    readyApartmentId?: IntNullableFilter<"Image"> | number | null
    rentalApartmentId?: IntNullableFilter<"Image"> | number | null
    countryPropertyId?: IntNullableFilter<"Image"> | number | null
    commercialPropertyId?: IntNullableFilter<"Image"> | number | null
    createdAt?: DateTimeFilter<"Image"> | Date | string
  }

  export type NewBuildingApartmentUpsertWithWhereUniqueWithoutComplexInput = {
    where: NewBuildingApartmentWhereUniqueInput
    update: XOR<NewBuildingApartmentUpdateWithoutComplexInput, NewBuildingApartmentUncheckedUpdateWithoutComplexInput>
    create: XOR<NewBuildingApartmentCreateWithoutComplexInput, NewBuildingApartmentUncheckedCreateWithoutComplexInput>
  }

  export type NewBuildingApartmentUpdateWithWhereUniqueWithoutComplexInput = {
    where: NewBuildingApartmentWhereUniqueInput
    data: XOR<NewBuildingApartmentUpdateWithoutComplexInput, NewBuildingApartmentUncheckedUpdateWithoutComplexInput>
  }

  export type NewBuildingApartmentUpdateManyWithWhereWithoutComplexInput = {
    where: NewBuildingApartmentScalarWhereInput
    data: XOR<NewBuildingApartmentUpdateManyMutationInput, NewBuildingApartmentUncheckedUpdateManyWithoutComplexInput>
  }

  export type NewBuildingApartmentScalarWhereInput = {
    AND?: NewBuildingApartmentScalarWhereInput | NewBuildingApartmentScalarWhereInput[]
    OR?: NewBuildingApartmentScalarWhereInput[]
    NOT?: NewBuildingApartmentScalarWhereInput | NewBuildingApartmentScalarWhereInput[]
    id?: IntFilter<"NewBuildingApartment"> | number
    complexId?: IntFilter<"NewBuildingApartment"> | number
    title?: StringFilter<"NewBuildingApartment"> | string
    bedrooms?: IntFilter<"NewBuildingApartment"> | number
    area?: IntFilter<"NewBuildingApartment"> | number
    price?: IntFilter<"NewBuildingApartment"> | number
    pricePerM2?: IntFilter<"NewBuildingApartment"> | number
    floor?: IntFilter<"NewBuildingApartment"> | number
    totalFloors?: IntFilter<"NewBuildingApartment"> | number
    city?: StringNullableFilter<"NewBuildingApartment"> | string | null
    apartmentNumber?: IntFilter<"NewBuildingApartment"> | number
    lat?: FloatNullableFilter<"NewBuildingApartment"> | number | null
    lng?: FloatNullableFilter<"NewBuildingApartment"> | number | null
    type?: StringFilter<"NewBuildingApartment"> | string
    createdAt?: DateTimeFilter<"NewBuildingApartment"> | Date | string
    updatedAt?: DateTimeFilter<"NewBuildingApartment"> | Date | string
  }

  export type NearbyPlaceUpsertWithWhereUniqueWithoutComplexInput = {
    where: NearbyPlaceWhereUniqueInput
    update: XOR<NearbyPlaceUpdateWithoutComplexInput, NearbyPlaceUncheckedUpdateWithoutComplexInput>
    create: XOR<NearbyPlaceCreateWithoutComplexInput, NearbyPlaceUncheckedCreateWithoutComplexInput>
  }

  export type NearbyPlaceUpdateWithWhereUniqueWithoutComplexInput = {
    where: NearbyPlaceWhereUniqueInput
    data: XOR<NearbyPlaceUpdateWithoutComplexInput, NearbyPlaceUncheckedUpdateWithoutComplexInput>
  }

  export type NearbyPlaceUpdateManyWithWhereWithoutComplexInput = {
    where: NearbyPlaceScalarWhereInput
    data: XOR<NearbyPlaceUpdateManyMutationInput, NearbyPlaceUncheckedUpdateManyWithoutComplexInput>
  }

  export type NearbyPlaceScalarWhereInput = {
    AND?: NearbyPlaceScalarWhereInput | NearbyPlaceScalarWhereInput[]
    OR?: NearbyPlaceScalarWhereInput[]
    NOT?: NearbyPlaceScalarWhereInput | NearbyPlaceScalarWhereInput[]
    id?: IntFilter<"NearbyPlace"> | number
    complexId?: IntFilter<"NearbyPlace"> | number
    name?: StringFilter<"NearbyPlace"> | string
    category?: StringFilter<"NearbyPlace"> | string
    distance?: IntNullableFilter<"NearbyPlace"> | number | null
    icon?: StringNullableFilter<"NearbyPlace"> | string | null
    createdAt?: DateTimeFilter<"NearbyPlace"> | Date | string
  }

  export type NewBuildingComplexCreateWithoutApartmentsInput = {
    name: string
    address: string
    district?: string | null
    metro?: string | null
    metroDistance?: number | null
    city?: string | null
    developer: string
    priceFrom: number
    areaFrom?: number | null
    buildingClass?: string | null
    floors?: number | null
    totalApartments?: number | null
    availableApartments?: number | null
    lat?: number | null
    lng?: number | null
    completionDate?: Date | string | null
    height?: number | null
    hasParking?: boolean
    description?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
    images?: ImageCreateNestedManyWithoutNewBuildingComplexInput
    nearbyPlaces?: NearbyPlaceCreateNestedManyWithoutComplexInput
  }

  export type NewBuildingComplexUncheckedCreateWithoutApartmentsInput = {
    id?: number
    name: string
    address: string
    district?: string | null
    metro?: string | null
    metroDistance?: number | null
    city?: string | null
    developer: string
    priceFrom: number
    areaFrom?: number | null
    buildingClass?: string | null
    floors?: number | null
    totalApartments?: number | null
    availableApartments?: number | null
    lat?: number | null
    lng?: number | null
    completionDate?: Date | string | null
    height?: number | null
    hasParking?: boolean
    description?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
    images?: ImageUncheckedCreateNestedManyWithoutNewBuildingComplexInput
    nearbyPlaces?: NearbyPlaceUncheckedCreateNestedManyWithoutComplexInput
  }

  export type NewBuildingComplexCreateOrConnectWithoutApartmentsInput = {
    where: NewBuildingComplexWhereUniqueInput
    create: XOR<NewBuildingComplexCreateWithoutApartmentsInput, NewBuildingComplexUncheckedCreateWithoutApartmentsInput>
  }

  export type ImageCreateWithoutNewBuildingApartmentInput = {
    url: string
    createdAt?: Date | string
    newBuildingComplex?: NewBuildingComplexCreateNestedOneWithoutImagesInput
    readyApartment?: ReadyApartmentCreateNestedOneWithoutImagesInput
    rentalApartment?: RentalApartmentCreateNestedOneWithoutImagesInput
    countryProperty?: CountryPropertyCreateNestedOneWithoutImagesInput
    commercialProperty?: CommercialPropertyCreateNestedOneWithoutImagesInput
  }

  export type ImageUncheckedCreateWithoutNewBuildingApartmentInput = {
    id?: number
    url: string
    newBuildingComplexId?: number | null
    readyApartmentId?: number | null
    rentalApartmentId?: number | null
    countryPropertyId?: number | null
    commercialPropertyId?: number | null
    createdAt?: Date | string
  }

  export type ImageCreateOrConnectWithoutNewBuildingApartmentInput = {
    where: ImageWhereUniqueInput
    create: XOR<ImageCreateWithoutNewBuildingApartmentInput, ImageUncheckedCreateWithoutNewBuildingApartmentInput>
  }

  export type ImageCreateManyNewBuildingApartmentInputEnvelope = {
    data: ImageCreateManyNewBuildingApartmentInput | ImageCreateManyNewBuildingApartmentInput[]
    skipDuplicates?: boolean
  }

  export type NewBuildingComplexUpsertWithoutApartmentsInput = {
    update: XOR<NewBuildingComplexUpdateWithoutApartmentsInput, NewBuildingComplexUncheckedUpdateWithoutApartmentsInput>
    create: XOR<NewBuildingComplexCreateWithoutApartmentsInput, NewBuildingComplexUncheckedCreateWithoutApartmentsInput>
    where?: NewBuildingComplexWhereInput
  }

  export type NewBuildingComplexUpdateToOneWithWhereWithoutApartmentsInput = {
    where?: NewBuildingComplexWhereInput
    data: XOR<NewBuildingComplexUpdateWithoutApartmentsInput, NewBuildingComplexUncheckedUpdateWithoutApartmentsInput>
  }

  export type NewBuildingComplexUpdateWithoutApartmentsInput = {
    name?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    district?: NullableStringFieldUpdateOperationsInput | string | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    city?: NullableStringFieldUpdateOperationsInput | string | null
    developer?: StringFieldUpdateOperationsInput | string
    priceFrom?: IntFieldUpdateOperationsInput | number
    areaFrom?: NullableIntFieldUpdateOperationsInput | number | null
    buildingClass?: NullableStringFieldUpdateOperationsInput | string | null
    floors?: NullableIntFieldUpdateOperationsInput | number | null
    totalApartments?: NullableIntFieldUpdateOperationsInput | number | null
    availableApartments?: NullableIntFieldUpdateOperationsInput | number | null
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    completionDate?: NullableDateTimeFieldUpdateOperationsInput | Date | string | null
    height?: NullableIntFieldUpdateOperationsInput | number | null
    hasParking?: BoolFieldUpdateOperationsInput | boolean
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
    images?: ImageUpdateManyWithoutNewBuildingComplexNestedInput
    nearbyPlaces?: NearbyPlaceUpdateManyWithoutComplexNestedInput
  }

  export type NewBuildingComplexUncheckedUpdateWithoutApartmentsInput = {
    id?: IntFieldUpdateOperationsInput | number
    name?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    district?: NullableStringFieldUpdateOperationsInput | string | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    city?: NullableStringFieldUpdateOperationsInput | string | null
    developer?: StringFieldUpdateOperationsInput | string
    priceFrom?: IntFieldUpdateOperationsInput | number
    areaFrom?: NullableIntFieldUpdateOperationsInput | number | null
    buildingClass?: NullableStringFieldUpdateOperationsInput | string | null
    floors?: NullableIntFieldUpdateOperationsInput | number | null
    totalApartments?: NullableIntFieldUpdateOperationsInput | number | null
    availableApartments?: NullableIntFieldUpdateOperationsInput | number | null
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    completionDate?: NullableDateTimeFieldUpdateOperationsInput | Date | string | null
    height?: NullableIntFieldUpdateOperationsInput | number | null
    hasParking?: BoolFieldUpdateOperationsInput | boolean
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
    images?: ImageUncheckedUpdateManyWithoutNewBuildingComplexNestedInput
    nearbyPlaces?: NearbyPlaceUncheckedUpdateManyWithoutComplexNestedInput
  }

  export type ImageUpsertWithWhereUniqueWithoutNewBuildingApartmentInput = {
    where: ImageWhereUniqueInput
    update: XOR<ImageUpdateWithoutNewBuildingApartmentInput, ImageUncheckedUpdateWithoutNewBuildingApartmentInput>
    create: XOR<ImageCreateWithoutNewBuildingApartmentInput, ImageUncheckedCreateWithoutNewBuildingApartmentInput>
  }

  export type ImageUpdateWithWhereUniqueWithoutNewBuildingApartmentInput = {
    where: ImageWhereUniqueInput
    data: XOR<ImageUpdateWithoutNewBuildingApartmentInput, ImageUncheckedUpdateWithoutNewBuildingApartmentInput>
  }

  export type ImageUpdateManyWithWhereWithoutNewBuildingApartmentInput = {
    where: ImageScalarWhereInput
    data: XOR<ImageUpdateManyMutationInput, ImageUncheckedUpdateManyWithoutNewBuildingApartmentInput>
  }

  export type NewBuildingComplexCreateWithoutNearbyPlacesInput = {
    name: string
    address: string
    district?: string | null
    metro?: string | null
    metroDistance?: number | null
    city?: string | null
    developer: string
    priceFrom: number
    areaFrom?: number | null
    buildingClass?: string | null
    floors?: number | null
    totalApartments?: number | null
    availableApartments?: number | null
    lat?: number | null
    lng?: number | null
    completionDate?: Date | string | null
    height?: number | null
    hasParking?: boolean
    description?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
    images?: ImageCreateNestedManyWithoutNewBuildingComplexInput
    apartments?: NewBuildingApartmentCreateNestedManyWithoutComplexInput
  }

  export type NewBuildingComplexUncheckedCreateWithoutNearbyPlacesInput = {
    id?: number
    name: string
    address: string
    district?: string | null
    metro?: string | null
    metroDistance?: number | null
    city?: string | null
    developer: string
    priceFrom: number
    areaFrom?: number | null
    buildingClass?: string | null
    floors?: number | null
    totalApartments?: number | null
    availableApartments?: number | null
    lat?: number | null
    lng?: number | null
    completionDate?: Date | string | null
    height?: number | null
    hasParking?: boolean
    description?: string | null
    createdAt?: Date | string
    updatedAt?: Date | string
    images?: ImageUncheckedCreateNestedManyWithoutNewBuildingComplexInput
    apartments?: NewBuildingApartmentUncheckedCreateNestedManyWithoutComplexInput
  }

  export type NewBuildingComplexCreateOrConnectWithoutNearbyPlacesInput = {
    where: NewBuildingComplexWhereUniqueInput
    create: XOR<NewBuildingComplexCreateWithoutNearbyPlacesInput, NewBuildingComplexUncheckedCreateWithoutNearbyPlacesInput>
  }

  export type NewBuildingComplexUpsertWithoutNearbyPlacesInput = {
    update: XOR<NewBuildingComplexUpdateWithoutNearbyPlacesInput, NewBuildingComplexUncheckedUpdateWithoutNearbyPlacesInput>
    create: XOR<NewBuildingComplexCreateWithoutNearbyPlacesInput, NewBuildingComplexUncheckedCreateWithoutNearbyPlacesInput>
    where?: NewBuildingComplexWhereInput
  }

  export type NewBuildingComplexUpdateToOneWithWhereWithoutNearbyPlacesInput = {
    where?: NewBuildingComplexWhereInput
    data: XOR<NewBuildingComplexUpdateWithoutNearbyPlacesInput, NewBuildingComplexUncheckedUpdateWithoutNearbyPlacesInput>
  }

  export type NewBuildingComplexUpdateWithoutNearbyPlacesInput = {
    name?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    district?: NullableStringFieldUpdateOperationsInput | string | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    city?: NullableStringFieldUpdateOperationsInput | string | null
    developer?: StringFieldUpdateOperationsInput | string
    priceFrom?: IntFieldUpdateOperationsInput | number
    areaFrom?: NullableIntFieldUpdateOperationsInput | number | null
    buildingClass?: NullableStringFieldUpdateOperationsInput | string | null
    floors?: NullableIntFieldUpdateOperationsInput | number | null
    totalApartments?: NullableIntFieldUpdateOperationsInput | number | null
    availableApartments?: NullableIntFieldUpdateOperationsInput | number | null
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    completionDate?: NullableDateTimeFieldUpdateOperationsInput | Date | string | null
    height?: NullableIntFieldUpdateOperationsInput | number | null
    hasParking?: BoolFieldUpdateOperationsInput | boolean
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
    images?: ImageUpdateManyWithoutNewBuildingComplexNestedInput
    apartments?: NewBuildingApartmentUpdateManyWithoutComplexNestedInput
  }

  export type NewBuildingComplexUncheckedUpdateWithoutNearbyPlacesInput = {
    id?: IntFieldUpdateOperationsInput | number
    name?: StringFieldUpdateOperationsInput | string
    address?: StringFieldUpdateOperationsInput | string
    district?: NullableStringFieldUpdateOperationsInput | string | null
    metro?: NullableStringFieldUpdateOperationsInput | string | null
    metroDistance?: NullableIntFieldUpdateOperationsInput | number | null
    city?: NullableStringFieldUpdateOperationsInput | string | null
    developer?: StringFieldUpdateOperationsInput | string
    priceFrom?: IntFieldUpdateOperationsInput | number
    areaFrom?: NullableIntFieldUpdateOperationsInput | number | null
    buildingClass?: NullableStringFieldUpdateOperationsInput | string | null
    floors?: NullableIntFieldUpdateOperationsInput | number | null
    totalApartments?: NullableIntFieldUpdateOperationsInput | number | null
    availableApartments?: NullableIntFieldUpdateOperationsInput | number | null
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    completionDate?: NullableDateTimeFieldUpdateOperationsInput | Date | string | null
    height?: NullableIntFieldUpdateOperationsInput | number | null
    hasParking?: BoolFieldUpdateOperationsInput | boolean
    description?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
    images?: ImageUncheckedUpdateManyWithoutNewBuildingComplexNestedInput
    apartments?: NewBuildingApartmentUncheckedUpdateManyWithoutComplexNestedInput
  }

  export type ImageCreateWithoutReadyApartmentInput = {
    url: string
    createdAt?: Date | string
    newBuildingComplex?: NewBuildingComplexCreateNestedOneWithoutImagesInput
    newBuildingApartment?: NewBuildingApartmentCreateNestedOneWithoutImagesInput
    rentalApartment?: RentalApartmentCreateNestedOneWithoutImagesInput
    countryProperty?: CountryPropertyCreateNestedOneWithoutImagesInput
    commercialProperty?: CommercialPropertyCreateNestedOneWithoutImagesInput
  }

  export type ImageUncheckedCreateWithoutReadyApartmentInput = {
    id?: number
    url: string
    newBuildingComplexId?: number | null
    newBuildingApartmentId?: number | null
    rentalApartmentId?: number | null
    countryPropertyId?: number | null
    commercialPropertyId?: number | null
    createdAt?: Date | string
  }

  export type ImageCreateOrConnectWithoutReadyApartmentInput = {
    where: ImageWhereUniqueInput
    create: XOR<ImageCreateWithoutReadyApartmentInput, ImageUncheckedCreateWithoutReadyApartmentInput>
  }

  export type ImageCreateManyReadyApartmentInputEnvelope = {
    data: ImageCreateManyReadyApartmentInput | ImageCreateManyReadyApartmentInput[]
    skipDuplicates?: boolean
  }

  export type ImageUpsertWithWhereUniqueWithoutReadyApartmentInput = {
    where: ImageWhereUniqueInput
    update: XOR<ImageUpdateWithoutReadyApartmentInput, ImageUncheckedUpdateWithoutReadyApartmentInput>
    create: XOR<ImageCreateWithoutReadyApartmentInput, ImageUncheckedCreateWithoutReadyApartmentInput>
  }

  export type ImageUpdateWithWhereUniqueWithoutReadyApartmentInput = {
    where: ImageWhereUniqueInput
    data: XOR<ImageUpdateWithoutReadyApartmentInput, ImageUncheckedUpdateWithoutReadyApartmentInput>
  }

  export type ImageUpdateManyWithWhereWithoutReadyApartmentInput = {
    where: ImageScalarWhereInput
    data: XOR<ImageUpdateManyMutationInput, ImageUncheckedUpdateManyWithoutReadyApartmentInput>
  }

  export type ImageCreateWithoutRentalApartmentInput = {
    url: string
    createdAt?: Date | string
    newBuildingComplex?: NewBuildingComplexCreateNestedOneWithoutImagesInput
    newBuildingApartment?: NewBuildingApartmentCreateNestedOneWithoutImagesInput
    readyApartment?: ReadyApartmentCreateNestedOneWithoutImagesInput
    countryProperty?: CountryPropertyCreateNestedOneWithoutImagesInput
    commercialProperty?: CommercialPropertyCreateNestedOneWithoutImagesInput
  }

  export type ImageUncheckedCreateWithoutRentalApartmentInput = {
    id?: number
    url: string
    newBuildingComplexId?: number | null
    newBuildingApartmentId?: number | null
    readyApartmentId?: number | null
    countryPropertyId?: number | null
    commercialPropertyId?: number | null
    createdAt?: Date | string
  }

  export type ImageCreateOrConnectWithoutRentalApartmentInput = {
    where: ImageWhereUniqueInput
    create: XOR<ImageCreateWithoutRentalApartmentInput, ImageUncheckedCreateWithoutRentalApartmentInput>
  }

  export type ImageCreateManyRentalApartmentInputEnvelope = {
    data: ImageCreateManyRentalApartmentInput | ImageCreateManyRentalApartmentInput[]
    skipDuplicates?: boolean
  }

  export type ImageUpsertWithWhereUniqueWithoutRentalApartmentInput = {
    where: ImageWhereUniqueInput
    update: XOR<ImageUpdateWithoutRentalApartmentInput, ImageUncheckedUpdateWithoutRentalApartmentInput>
    create: XOR<ImageCreateWithoutRentalApartmentInput, ImageUncheckedCreateWithoutRentalApartmentInput>
  }

  export type ImageUpdateWithWhereUniqueWithoutRentalApartmentInput = {
    where: ImageWhereUniqueInput
    data: XOR<ImageUpdateWithoutRentalApartmentInput, ImageUncheckedUpdateWithoutRentalApartmentInput>
  }

  export type ImageUpdateManyWithWhereWithoutRentalApartmentInput = {
    where: ImageScalarWhereInput
    data: XOR<ImageUpdateManyMutationInput, ImageUncheckedUpdateManyWithoutRentalApartmentInput>
  }

  export type ImageCreateWithoutCountryPropertyInput = {
    url: string
    createdAt?: Date | string
    newBuildingComplex?: NewBuildingComplexCreateNestedOneWithoutImagesInput
    newBuildingApartment?: NewBuildingApartmentCreateNestedOneWithoutImagesInput
    readyApartment?: ReadyApartmentCreateNestedOneWithoutImagesInput
    rentalApartment?: RentalApartmentCreateNestedOneWithoutImagesInput
    commercialProperty?: CommercialPropertyCreateNestedOneWithoutImagesInput
  }

  export type ImageUncheckedCreateWithoutCountryPropertyInput = {
    id?: number
    url: string
    newBuildingComplexId?: number | null
    newBuildingApartmentId?: number | null
    readyApartmentId?: number | null
    rentalApartmentId?: number | null
    commercialPropertyId?: number | null
    createdAt?: Date | string
  }

  export type ImageCreateOrConnectWithoutCountryPropertyInput = {
    where: ImageWhereUniqueInput
    create: XOR<ImageCreateWithoutCountryPropertyInput, ImageUncheckedCreateWithoutCountryPropertyInput>
  }

  export type ImageCreateManyCountryPropertyInputEnvelope = {
    data: ImageCreateManyCountryPropertyInput | ImageCreateManyCountryPropertyInput[]
    skipDuplicates?: boolean
  }

  export type ImageUpsertWithWhereUniqueWithoutCountryPropertyInput = {
    where: ImageWhereUniqueInput
    update: XOR<ImageUpdateWithoutCountryPropertyInput, ImageUncheckedUpdateWithoutCountryPropertyInput>
    create: XOR<ImageCreateWithoutCountryPropertyInput, ImageUncheckedCreateWithoutCountryPropertyInput>
  }

  export type ImageUpdateWithWhereUniqueWithoutCountryPropertyInput = {
    where: ImageWhereUniqueInput
    data: XOR<ImageUpdateWithoutCountryPropertyInput, ImageUncheckedUpdateWithoutCountryPropertyInput>
  }

  export type ImageUpdateManyWithWhereWithoutCountryPropertyInput = {
    where: ImageScalarWhereInput
    data: XOR<ImageUpdateManyMutationInput, ImageUncheckedUpdateManyWithoutCountryPropertyInput>
  }

  export type ImageCreateWithoutCommercialPropertyInput = {
    url: string
    createdAt?: Date | string
    newBuildingComplex?: NewBuildingComplexCreateNestedOneWithoutImagesInput
    newBuildingApartment?: NewBuildingApartmentCreateNestedOneWithoutImagesInput
    readyApartment?: ReadyApartmentCreateNestedOneWithoutImagesInput
    rentalApartment?: RentalApartmentCreateNestedOneWithoutImagesInput
    countryProperty?: CountryPropertyCreateNestedOneWithoutImagesInput
  }

  export type ImageUncheckedCreateWithoutCommercialPropertyInput = {
    id?: number
    url: string
    newBuildingComplexId?: number | null
    newBuildingApartmentId?: number | null
    readyApartmentId?: number | null
    rentalApartmentId?: number | null
    countryPropertyId?: number | null
    createdAt?: Date | string
  }

  export type ImageCreateOrConnectWithoutCommercialPropertyInput = {
    where: ImageWhereUniqueInput
    create: XOR<ImageCreateWithoutCommercialPropertyInput, ImageUncheckedCreateWithoutCommercialPropertyInput>
  }

  export type ImageCreateManyCommercialPropertyInputEnvelope = {
    data: ImageCreateManyCommercialPropertyInput | ImageCreateManyCommercialPropertyInput[]
    skipDuplicates?: boolean
  }

  export type ImageUpsertWithWhereUniqueWithoutCommercialPropertyInput = {
    where: ImageWhereUniqueInput
    update: XOR<ImageUpdateWithoutCommercialPropertyInput, ImageUncheckedUpdateWithoutCommercialPropertyInput>
    create: XOR<ImageCreateWithoutCommercialPropertyInput, ImageUncheckedCreateWithoutCommercialPropertyInput>
  }

  export type ImageUpdateWithWhereUniqueWithoutCommercialPropertyInput = {
    where: ImageWhereUniqueInput
    data: XOR<ImageUpdateWithoutCommercialPropertyInput, ImageUncheckedUpdateWithoutCommercialPropertyInput>
  }

  export type ImageUpdateManyWithWhereWithoutCommercialPropertyInput = {
    where: ImageScalarWhereInput
    data: XOR<ImageUpdateManyMutationInput, ImageUncheckedUpdateManyWithoutCommercialPropertyInput>
  }

  export type ImageCreateManyNewBuildingComplexInput = {
    id?: number
    url: string
    newBuildingApartmentId?: number | null
    readyApartmentId?: number | null
    rentalApartmentId?: number | null
    countryPropertyId?: number | null
    commercialPropertyId?: number | null
    createdAt?: Date | string
  }

  export type NewBuildingApartmentCreateManyComplexInput = {
    id?: number
    title?: string
    bedrooms: number
    area: number
    price: number
    pricePerM2: number
    floor: number
    totalFloors: number
    city?: string | null
    apartmentNumber?: number
    lat?: number | null
    lng?: number | null
    type: string
    createdAt?: Date | string
    updatedAt?: Date | string
  }

  export type NearbyPlaceCreateManyComplexInput = {
    id?: number
    name: string
    category: string
    distance?: number | null
    icon?: string | null
    createdAt?: Date | string
  }

  export type ImageUpdateWithoutNewBuildingComplexInput = {
    url?: StringFieldUpdateOperationsInput | string
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    newBuildingApartment?: NewBuildingApartmentUpdateOneWithoutImagesNestedInput
    readyApartment?: ReadyApartmentUpdateOneWithoutImagesNestedInput
    rentalApartment?: RentalApartmentUpdateOneWithoutImagesNestedInput
    countryProperty?: CountryPropertyUpdateOneWithoutImagesNestedInput
    commercialProperty?: CommercialPropertyUpdateOneWithoutImagesNestedInput
  }

  export type ImageUncheckedUpdateWithoutNewBuildingComplexInput = {
    id?: IntFieldUpdateOperationsInput | number
    url?: StringFieldUpdateOperationsInput | string
    newBuildingApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    readyApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    rentalApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    countryPropertyId?: NullableIntFieldUpdateOperationsInput | number | null
    commercialPropertyId?: NullableIntFieldUpdateOperationsInput | number | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ImageUncheckedUpdateManyWithoutNewBuildingComplexInput = {
    id?: IntFieldUpdateOperationsInput | number
    url?: StringFieldUpdateOperationsInput | string
    newBuildingApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    readyApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    rentalApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    countryPropertyId?: NullableIntFieldUpdateOperationsInput | number | null
    commercialPropertyId?: NullableIntFieldUpdateOperationsInput | number | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type NewBuildingApartmentUpdateWithoutComplexInput = {
    title?: StringFieldUpdateOperationsInput | string
    bedrooms?: IntFieldUpdateOperationsInput | number
    area?: IntFieldUpdateOperationsInput | number
    price?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    floor?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    city?: NullableStringFieldUpdateOperationsInput | string | null
    apartmentNumber?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    type?: StringFieldUpdateOperationsInput | string
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
    images?: ImageUpdateManyWithoutNewBuildingApartmentNestedInput
  }

  export type NewBuildingApartmentUncheckedUpdateWithoutComplexInput = {
    id?: IntFieldUpdateOperationsInput | number
    title?: StringFieldUpdateOperationsInput | string
    bedrooms?: IntFieldUpdateOperationsInput | number
    area?: IntFieldUpdateOperationsInput | number
    price?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    floor?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    city?: NullableStringFieldUpdateOperationsInput | string | null
    apartmentNumber?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    type?: StringFieldUpdateOperationsInput | string
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
    images?: ImageUncheckedUpdateManyWithoutNewBuildingApartmentNestedInput
  }

  export type NewBuildingApartmentUncheckedUpdateManyWithoutComplexInput = {
    id?: IntFieldUpdateOperationsInput | number
    title?: StringFieldUpdateOperationsInput | string
    bedrooms?: IntFieldUpdateOperationsInput | number
    area?: IntFieldUpdateOperationsInput | number
    price?: IntFieldUpdateOperationsInput | number
    pricePerM2?: IntFieldUpdateOperationsInput | number
    floor?: IntFieldUpdateOperationsInput | number
    totalFloors?: IntFieldUpdateOperationsInput | number
    city?: NullableStringFieldUpdateOperationsInput | string | null
    apartmentNumber?: IntFieldUpdateOperationsInput | number
    lat?: NullableFloatFieldUpdateOperationsInput | number | null
    lng?: NullableFloatFieldUpdateOperationsInput | number | null
    type?: StringFieldUpdateOperationsInput | string
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    updatedAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type NearbyPlaceUpdateWithoutComplexInput = {
    name?: StringFieldUpdateOperationsInput | string
    category?: StringFieldUpdateOperationsInput | string
    distance?: NullableIntFieldUpdateOperationsInput | number | null
    icon?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type NearbyPlaceUncheckedUpdateWithoutComplexInput = {
    id?: IntFieldUpdateOperationsInput | number
    name?: StringFieldUpdateOperationsInput | string
    category?: StringFieldUpdateOperationsInput | string
    distance?: NullableIntFieldUpdateOperationsInput | number | null
    icon?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type NearbyPlaceUncheckedUpdateManyWithoutComplexInput = {
    id?: IntFieldUpdateOperationsInput | number
    name?: StringFieldUpdateOperationsInput | string
    category?: StringFieldUpdateOperationsInput | string
    distance?: NullableIntFieldUpdateOperationsInput | number | null
    icon?: NullableStringFieldUpdateOperationsInput | string | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ImageCreateManyNewBuildingApartmentInput = {
    id?: number
    url: string
    newBuildingComplexId?: number | null
    readyApartmentId?: number | null
    rentalApartmentId?: number | null
    countryPropertyId?: number | null
    commercialPropertyId?: number | null
    createdAt?: Date | string
  }

  export type ImageUpdateWithoutNewBuildingApartmentInput = {
    url?: StringFieldUpdateOperationsInput | string
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    newBuildingComplex?: NewBuildingComplexUpdateOneWithoutImagesNestedInput
    readyApartment?: ReadyApartmentUpdateOneWithoutImagesNestedInput
    rentalApartment?: RentalApartmentUpdateOneWithoutImagesNestedInput
    countryProperty?: CountryPropertyUpdateOneWithoutImagesNestedInput
    commercialProperty?: CommercialPropertyUpdateOneWithoutImagesNestedInput
  }

  export type ImageUncheckedUpdateWithoutNewBuildingApartmentInput = {
    id?: IntFieldUpdateOperationsInput | number
    url?: StringFieldUpdateOperationsInput | string
    newBuildingComplexId?: NullableIntFieldUpdateOperationsInput | number | null
    readyApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    rentalApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    countryPropertyId?: NullableIntFieldUpdateOperationsInput | number | null
    commercialPropertyId?: NullableIntFieldUpdateOperationsInput | number | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ImageUncheckedUpdateManyWithoutNewBuildingApartmentInput = {
    id?: IntFieldUpdateOperationsInput | number
    url?: StringFieldUpdateOperationsInput | string
    newBuildingComplexId?: NullableIntFieldUpdateOperationsInput | number | null
    readyApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    rentalApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    countryPropertyId?: NullableIntFieldUpdateOperationsInput | number | null
    commercialPropertyId?: NullableIntFieldUpdateOperationsInput | number | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ImageCreateManyReadyApartmentInput = {
    id?: number
    url: string
    newBuildingComplexId?: number | null
    newBuildingApartmentId?: number | null
    rentalApartmentId?: number | null
    countryPropertyId?: number | null
    commercialPropertyId?: number | null
    createdAt?: Date | string
  }

  export type ImageUpdateWithoutReadyApartmentInput = {
    url?: StringFieldUpdateOperationsInput | string
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    newBuildingComplex?: NewBuildingComplexUpdateOneWithoutImagesNestedInput
    newBuildingApartment?: NewBuildingApartmentUpdateOneWithoutImagesNestedInput
    rentalApartment?: RentalApartmentUpdateOneWithoutImagesNestedInput
    countryProperty?: CountryPropertyUpdateOneWithoutImagesNestedInput
    commercialProperty?: CommercialPropertyUpdateOneWithoutImagesNestedInput
  }

  export type ImageUncheckedUpdateWithoutReadyApartmentInput = {
    id?: IntFieldUpdateOperationsInput | number
    url?: StringFieldUpdateOperationsInput | string
    newBuildingComplexId?: NullableIntFieldUpdateOperationsInput | number | null
    newBuildingApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    rentalApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    countryPropertyId?: NullableIntFieldUpdateOperationsInput | number | null
    commercialPropertyId?: NullableIntFieldUpdateOperationsInput | number | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ImageUncheckedUpdateManyWithoutReadyApartmentInput = {
    id?: IntFieldUpdateOperationsInput | number
    url?: StringFieldUpdateOperationsInput | string
    newBuildingComplexId?: NullableIntFieldUpdateOperationsInput | number | null
    newBuildingApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    rentalApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    countryPropertyId?: NullableIntFieldUpdateOperationsInput | number | null
    commercialPropertyId?: NullableIntFieldUpdateOperationsInput | number | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ImageCreateManyRentalApartmentInput = {
    id?: number
    url: string
    newBuildingComplexId?: number | null
    newBuildingApartmentId?: number | null
    readyApartmentId?: number | null
    countryPropertyId?: number | null
    commercialPropertyId?: number | null
    createdAt?: Date | string
  }

  export type ImageUpdateWithoutRentalApartmentInput = {
    url?: StringFieldUpdateOperationsInput | string
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    newBuildingComplex?: NewBuildingComplexUpdateOneWithoutImagesNestedInput
    newBuildingApartment?: NewBuildingApartmentUpdateOneWithoutImagesNestedInput
    readyApartment?: ReadyApartmentUpdateOneWithoutImagesNestedInput
    countryProperty?: CountryPropertyUpdateOneWithoutImagesNestedInput
    commercialProperty?: CommercialPropertyUpdateOneWithoutImagesNestedInput
  }

  export type ImageUncheckedUpdateWithoutRentalApartmentInput = {
    id?: IntFieldUpdateOperationsInput | number
    url?: StringFieldUpdateOperationsInput | string
    newBuildingComplexId?: NullableIntFieldUpdateOperationsInput | number | null
    newBuildingApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    readyApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    countryPropertyId?: NullableIntFieldUpdateOperationsInput | number | null
    commercialPropertyId?: NullableIntFieldUpdateOperationsInput | number | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ImageUncheckedUpdateManyWithoutRentalApartmentInput = {
    id?: IntFieldUpdateOperationsInput | number
    url?: StringFieldUpdateOperationsInput | string
    newBuildingComplexId?: NullableIntFieldUpdateOperationsInput | number | null
    newBuildingApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    readyApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    countryPropertyId?: NullableIntFieldUpdateOperationsInput | number | null
    commercialPropertyId?: NullableIntFieldUpdateOperationsInput | number | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ImageCreateManyCountryPropertyInput = {
    id?: number
    url: string
    newBuildingComplexId?: number | null
    newBuildingApartmentId?: number | null
    readyApartmentId?: number | null
    rentalApartmentId?: number | null
    commercialPropertyId?: number | null
    createdAt?: Date | string
  }

  export type ImageUpdateWithoutCountryPropertyInput = {
    url?: StringFieldUpdateOperationsInput | string
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    newBuildingComplex?: NewBuildingComplexUpdateOneWithoutImagesNestedInput
    newBuildingApartment?: NewBuildingApartmentUpdateOneWithoutImagesNestedInput
    readyApartment?: ReadyApartmentUpdateOneWithoutImagesNestedInput
    rentalApartment?: RentalApartmentUpdateOneWithoutImagesNestedInput
    commercialProperty?: CommercialPropertyUpdateOneWithoutImagesNestedInput
  }

  export type ImageUncheckedUpdateWithoutCountryPropertyInput = {
    id?: IntFieldUpdateOperationsInput | number
    url?: StringFieldUpdateOperationsInput | string
    newBuildingComplexId?: NullableIntFieldUpdateOperationsInput | number | null
    newBuildingApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    readyApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    rentalApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    commercialPropertyId?: NullableIntFieldUpdateOperationsInput | number | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ImageUncheckedUpdateManyWithoutCountryPropertyInput = {
    id?: IntFieldUpdateOperationsInput | number
    url?: StringFieldUpdateOperationsInput | string
    newBuildingComplexId?: NullableIntFieldUpdateOperationsInput | number | null
    newBuildingApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    readyApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    rentalApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    commercialPropertyId?: NullableIntFieldUpdateOperationsInput | number | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ImageCreateManyCommercialPropertyInput = {
    id?: number
    url: string
    newBuildingComplexId?: number | null
    newBuildingApartmentId?: number | null
    readyApartmentId?: number | null
    rentalApartmentId?: number | null
    countryPropertyId?: number | null
    createdAt?: Date | string
  }

  export type ImageUpdateWithoutCommercialPropertyInput = {
    url?: StringFieldUpdateOperationsInput | string
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
    newBuildingComplex?: NewBuildingComplexUpdateOneWithoutImagesNestedInput
    newBuildingApartment?: NewBuildingApartmentUpdateOneWithoutImagesNestedInput
    readyApartment?: ReadyApartmentUpdateOneWithoutImagesNestedInput
    rentalApartment?: RentalApartmentUpdateOneWithoutImagesNestedInput
    countryProperty?: CountryPropertyUpdateOneWithoutImagesNestedInput
  }

  export type ImageUncheckedUpdateWithoutCommercialPropertyInput = {
    id?: IntFieldUpdateOperationsInput | number
    url?: StringFieldUpdateOperationsInput | string
    newBuildingComplexId?: NullableIntFieldUpdateOperationsInput | number | null
    newBuildingApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    readyApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    rentalApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    countryPropertyId?: NullableIntFieldUpdateOperationsInput | number | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }

  export type ImageUncheckedUpdateManyWithoutCommercialPropertyInput = {
    id?: IntFieldUpdateOperationsInput | number
    url?: StringFieldUpdateOperationsInput | string
    newBuildingComplexId?: NullableIntFieldUpdateOperationsInput | number | null
    newBuildingApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    readyApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    rentalApartmentId?: NullableIntFieldUpdateOperationsInput | number | null
    countryPropertyId?: NullableIntFieldUpdateOperationsInput | number | null
    createdAt?: DateTimeFieldUpdateOperationsInput | Date | string
  }



  /**
   * Batch Payload for updateMany & deleteMany & createMany
   */

  export type BatchPayload = {
    count: number
  }

  /**
   * DMMF
   */
  export const dmmf: runtime.BaseDMMF
}