
Object.defineProperty(exports, "__esModule", { value: true });

const {
  Decimal,
  objectEnumValues,
  makeStrictEnum,
  Public,
  getRuntime,
  skip
} = require('./runtime/index-browser.js')


const Prisma = {}

exports.Prisma = Prisma
exports.$Enums = {}

/**
 * Prisma Client JS version: 6.5.0
 * Query Engine version: 173f8d54f8d52e692c7e27e72a88314ec7aeff60
 */
Prisma.prismaVersion = {
  client: "6.5.0",
  engine: "173f8d54f8d52e692c7e27e72a88314ec7aeff60"
}

Prisma.PrismaClientKnownRequestError = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`PrismaClientKnownRequestError is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)};
Prisma.PrismaClientUnknownRequestError = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`PrismaClientUnknownRequestError is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.PrismaClientRustPanicError = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`PrismaClientRustPanicError is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.PrismaClientInitializationError = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`PrismaClientInitializationError is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.PrismaClientValidationError = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`PrismaClientValidationError is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.Decimal = Decimal

/**
 * Re-export of sql-template-tag
 */
Prisma.sql = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`sqltag is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.empty = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`empty is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.join = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`join is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.raw = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`raw is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.validator = Public.validator

/**
* Extensions
*/
Prisma.getExtensionContext = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`Extensions.getExtensionContext is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.defineExtension = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`Extensions.defineExtension is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}

/**
 * Shorthand utilities for JSON filtering
 */
Prisma.DbNull = objectEnumValues.instances.DbNull
Prisma.JsonNull = objectEnumValues.instances.JsonNull
Prisma.AnyNull = objectEnumValues.instances.AnyNull

Prisma.NullTypes = {
  DbNull: objectEnumValues.classes.DbNull,
  JsonNull: objectEnumValues.classes.JsonNull,
  AnyNull: objectEnumValues.classes.AnyNull
}



/**
 * Enums
 */

exports.Prisma.TransactionIsolationLevel = makeStrictEnum({
  ReadUncommitted: 'ReadUncommitted',
  ReadCommitted: 'ReadCommitted',
  RepeatableRead: 'RepeatableRead',
  Serializable: 'Serializable'
});

exports.Prisma.RealtorScalarFieldEnum = {
  id: 'id',
  fullName: 'fullName',
  phone: 'phone',
  email: 'email',
  avatarUrl: 'avatarUrl',
  position: 'position',
  createdAt: 'createdAt',
  updatedAt: 'updatedAt'
};

exports.Prisma.ApplicationScalarFieldEnum = {
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

exports.Prisma.ImageScalarFieldEnum = {
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

exports.Prisma.NewBuildingComplexScalarFieldEnum = {
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

exports.Prisma.NewBuildingApartmentScalarFieldEnum = {
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

exports.Prisma.NearbyPlaceScalarFieldEnum = {
  id: 'id',
  complexId: 'complexId',
  name: 'name',
  category: 'category',
  distance: 'distance',
  icon: 'icon',
  createdAt: 'createdAt'
};

exports.Prisma.ReviewScalarFieldEnum = {
  id: 'id',
  authorName: 'authorName',
  rating: 'rating',
  comment: 'comment',
  createdAt: 'createdAt'
};

exports.Prisma.ReadyApartmentScalarFieldEnum = {
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

exports.Prisma.RentalApartmentScalarFieldEnum = {
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

exports.Prisma.CountryPropertyScalarFieldEnum = {
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

exports.Prisma.CommercialPropertyScalarFieldEnum = {
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

exports.Prisma.SortOrder = {
  asc: 'asc',
  desc: 'desc'
};

exports.Prisma.QueryMode = {
  default: 'default',
  insensitive: 'insensitive'
};

exports.Prisma.NullsOrder = {
  first: 'first',
  last: 'last'
};
exports.ApplicationStatus = exports.$Enums.ApplicationStatus = {
  NEW: 'NEW',
  PROCESSING: 'PROCESSING',
  COMPLETED: 'COMPLETED',
  CANCELLED: 'CANCELLED'
};

exports.Prisma.ModelName = {
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

/**
 * This is a stub Prisma Client that will error at runtime if called.
 */
class PrismaClient {
  constructor() {
    return new Proxy(this, {
      get(target, prop) {
        let message
        const runtime = getRuntime()
        if (runtime.isEdge) {
          message = `PrismaClient is not configured to run in ${runtime.prettyName}. In order to run Prisma Client on edge runtime, either:
- Use Prisma Accelerate: https://pris.ly/d/accelerate
- Use Driver Adapters: https://pris.ly/d/driver-adapters
`;
        } else {
          message = 'PrismaClient is unable to run in this browser environment, or has been bundled for the browser (running in `' + runtime.prettyName + '`).'
        }
        
        message += `
If this is unexpected, please open an issue: https://pris.ly/prisma-prisma-bug-report`

        throw new Error(message)
      }
    })
  }
}

exports.PrismaClient = PrismaClient

Object.assign(exports, Prisma)
