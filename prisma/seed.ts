import { PrismaClient,  } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  console.log('🌱 Начинаем заполнение базы данных...');

  // Очистка базы данных
  await prisma.image.deleteMany();
  await prisma.review.deleteMany();
  await prisma.nearbyPlace.deleteMany();
  await prisma.newBuildingApartment.deleteMany();
  await prisma.newBuildingComplex.deleteMany();
  await prisma.readyApartment.deleteMany();
  await prisma.rentalApartment.deleteMany();
  await prisma.countryProperty.deleteMany();
  await prisma.commercialProperty.deleteMany();
  await prisma.application.deleteMany();
  await prisma.realtor.deleteMany();

  console.log('✅ База данных очищена');

  // ==============================================
  // РИЭЛТОРЫ
  // ==============================================
  const realtors = await Promise.all([
    prisma.realtor.create({
      data: {
        fullName: 'Иванова Анна Сергеевна',
        phone: '+7 (999) 123-45-67',
        email: 'ivanova@realty.ru',
        position: 'Риэлтор по новостройкам',
      },
    }),
    prisma.realtor.create({
      data: {
        fullName: 'Петров Дмитрий Владимирович',
        phone: '+7 (999) 234-56-78',
        email: 'petrov@realty.ru',
        position: 'Риэлтор по аренде',
      },
    }),
    prisma.realtor.create({
      data: {
        fullName: 'Смирнова Елена Игоревна',
        phone: '+7 (999) 345-67-89',
        email: 'smirnova@realty.ru',
        position: 'Риэлтор по загородной недвижимости',
      },
    }),
  ]);

  console.log('✅ Создано риэлторов:', realtors.length);

  // ==============================================
  // ЗАЯВКИ
  // ==============================================
  const applications = await Promise.all([
    prisma.application.create({
      data: {
        name: 'Александр Кузнецов',
        phone: '+7 (911) 111-11-11',
        status: "NEW",
        comment: 'Интересует трехкомнатная квартира в центре',
        propertyType: 'ready_apartment',
      },
    }),
    prisma.application.create({
      data: {
        name: 'Мария Соколова',
        phone: '+7 (922) 222-22-22',
        status: "PROCESSING",
        comment: 'Хочу снять студию на длительный срок',
        propertyType: 'rental_apartment',
      },
    }),
    prisma.application.create({
      data: {
        name: 'Игорь Волков',
        phone: '+7 (933) 333-33-33',
        status: "COMPLETED",
        comment: 'Ищу загородный дом для семьи',
        propertyType: 'country_property',
      },
    }),
  ]);

  console.log('✅ Создано заявок:', applications.length);

  // ==============================================
  // НОВОСТРОЙКИ
  // ==============================================
  const complex1 = await prisma.newBuildingComplex.create({
    data: {
      name: 'ЖК "Солнечный город"',
      address: 'ул. Ленина, 100',
      district: 'Центральный',
      metro: 'Площадь Ленина',
      metroDistance: 5,
      developer: 'ГК "СтройИнвест"',
      priceFrom: 3500000,
      areaFrom: 35,
      buildingClass: "COMFORT",
      floors: 25,
      totalApartments: 500,
      availableApartments: 120,
      completionDate: new Date('2025-12-31'),
      height: 75,
      hasParking: true,
      description: 'Современный жилой комплекс комфорт-класса с развитой инфраструктурой',
      nearbyPlaces: {
        create: [
          {
            name: 'Школа №5',
            category: 'Образование',
            distance: 300,
            icon: 'school',
          },
          {
            name: 'Детский сад "Солнышко"',
            category: 'Образование',
            distance: 200,
            icon: 'kindergarten',
          },
          {
            name: 'Парк Победы',
            category: 'Отдых',
            distance: 500,
            icon: 'park',
          },
          {
            name: 'ТЦ "Мега"',
            category: 'Шопинг',
            distance: 800,
            icon: 'shopping',
          },
        ],
      },
      reviews: {
        create: [
          {
            authorName: 'Ольга М.',
            rating: 5,
            comment: 'Отличный комплекс! Купили квартиру, очень довольны качеством.',
          },
          {
            authorName: 'Сергей К.',
            rating: 4,
            comment: 'Хорошее расположение, но стройка идет медленно.',
          },
        ],
      },
      apartments: {
        create: [
          {
            bedrooms: 1,
            area: 42,
            price: 4200000,
            pricePerM2: 100000,
            floor: 10,
          },
          {
            bedrooms: 2,
            area: 65,
            price: 6500000,
            pricePerM2: 100000,
            floor: 15,
          },
          {
            bedrooms: 3,
            area: 85,
            price: 8500000,
            pricePerM2: 100000,
            floor: 20,
          },
        ],
      },
    },
  });

  const complex2 = await prisma.newBuildingComplex.create({
    data: {
      name: 'ЖК "Riverside"',
      address: 'наб. Реки Невы, 45',
      district: 'Приморский',
      metro: 'Чёрная речка',
      metroDistance: 10,
      developer: 'ГК "ПремиумСтрой"',
      priceFrom: 8000000,
      areaFrom: 50,
      buildingClass: "PREMIUM",
      floors: 30,
      totalApartments: 300,
      availableApartments: 45,
      completionDate: new Date('2026-06-30'),
      height: 90,
      hasParking: true,
      description: 'Премиальный жилой комплекс на берегу реки с видом на воду',
      nearbyPlaces: {
        create: [
          {
            name: 'Набережная',
            category: 'Отдых',
            distance: 100,
            icon: 'water',
          },
          {
            name: 'Фитнес-клуб Premium',
            category: 'Спорт',
            distance: 400,
            icon: 'gym',
          },
        ],
      },
      reviews: {
        create: [
          {
            authorName: 'Владимир П.',
            rating: 5,
            comment: 'Потрясающий вид из окон! Премиум-класс по всем параметрам.',
          },
        ],
      },
      apartments: {
        create: [
          {
            bedrooms: 2,
            area: 75,
            price: 9000000,
            pricePerM2: 120000,
            floor: 25,
          },
          {
            bedrooms: 3,
            area: 110,
            price: 13200000,
            pricePerM2: 120000,
            floor: 28,
          },
        ],
      },
    },
  });

  console.log('✅ Создано ЖК:', 2);

  // ==============================================
  // ГОТОВЫЕ КВАРТИРЫ
  // ==============================================
  const readyApartments = await Promise.all([
    prisma.readyApartment.create({
      data: {
        title: 'Просторная 3-комнатная квартира в центре',
        complexName: 'ЖК "Северная столица"',
        address: 'пр. Невский, 80',
        area: 95,
        price: 12000000,
        pricePerM2: 126315,
        bedrooms: 3,
        floor: 8,
        totalFloors: 12,
        metro: 'Маяковская',
        metroDistance: 7,
        description: 'Отличная квартира с евроремонтом, панорамными окнами и видом на город',
      },
    }),
    prisma.readyApartment.create({
      data: {
        title: 'Уютная студия для молодой семьи',
        address: 'ул. Московская, 15',
        area: 28,
        price: 3200000,
        pricePerM2: 114285,
        bedrooms: 0,
        floor: 5,
        totalFloors: 9,
        metro: 'Технологический институт',
        metroDistance: 5,
        description: 'Современная студия с качественным ремонтом',
      },
    }),
    prisma.readyApartment.create({
      data: {
        title: '2-комнатная квартира с отличной планировкой',
        complexName: 'ЖК "Гармония"',
        address: 'ул. Гражданская, 25',
        area: 58,
        price: 6500000,
        pricePerM2: 112068,
        bedrooms: 2,
        floor: 12,
        totalFloors: 16,
        metro: 'Гражданский проспект',
        metroDistance: 3,
        description: 'Светлая квартира, раздельные комнаты, большая кухня',
      },
    }),
  ]);

  console.log('✅ Создано готовых квартир:', readyApartments.length);

  // ==============================================
  // АРЕНДА КВАРТИР
  // ==============================================
  const rentalApartments = await Promise.all([
    prisma.rentalApartment.create({
      data: {
        title: 'Студия в центре для длительной аренды',
        address: 'ул. Рубинштейна, 10',
        area: 32,
        pricePerMonth: 35000,
        bedrooms: 0,
        floor: 4,
        totalFloors: 5,
        metro: 'Достоевская',
        metroDistance: 2,
        description: 'Стильная студия с мебелью и техникой, готова к заселению',
      },
    }),
    prisma.rentalApartment.create({
      data: {
        title: '2-комнатная квартира на длительный срок',
        address: 'пр. Энгельса, 75',
        area: 62,
        pricePerMonth: 50000,
        bedrooms: 2,
        floor: 10,
        totalFloors: 17,
        metro: 'Удельная',
        metroDistance: 8,
        description: 'Просторная квартира для семьи, вся мебель и бытовая техника',
      },
    }),
    prisma.rentalApartment.create({
      data: {
        title: '1-комнатная квартира у метро',
        address: 'ул. Типанова, 5',
        area: 40,
        pricePerMonth: 40000,
        bedrooms: 1,
        floor: 7,
        totalFloors: 10,
        metro: 'Московская',
        metroDistance: 3,
        description: 'Уютная квартира после ремонта, отличное расположение',
      },
    }),
  ]);

  console.log('✅ Создано квартир в аренду:', rentalApartments.length);

  // ==============================================
  // ЗАГОРОДНАЯ НЕДВИЖИМОСТЬ
  // ==============================================
  const countryProperties = await Promise.all([
    prisma.countryProperty.create({
      data: {
        title: 'Коттедж в элитном поселке',
        address: 'КП "Зеленые холмы", уч. 15',
        metro: 'Девяткино',
        metroDistance: 25,
        price: 25000000,
        landArea: 12,
        bedrooms: 4,
        totalFloors: 2,
        pricePerM2: 125000,
        description: 'Современный коттедж премиум-класса с бассейном и сауной',
      },
    }),
    prisma.countryProperty.create({
      data: {
        title: 'Дача с баней на берегу озера',
        address: 'СНТ "Лесное", уч. 45',
        metro: 'Парнас',
        metroDistance: 40,
        price: 5500000,
        landArea: 8,
        bedrooms: 2,
        totalFloors: 1,
        pricePerM2: 55000,
        description: 'Уютная дача для отдыха, рядом лес и озеро',
      },
    }),
    prisma.countryProperty.create({
      data: {
        title: 'Таунхаус в современном поселке',
        address: 'КП "Скандинавия", уч. 78',
        metro: 'Комендантский проспект',
        metroDistance: 20,
        price: 15000000,
        landArea: 4,
        bedrooms: 3,
        totalFloors: 3,
        pricePerM2: 100000,
        description: 'Таунхаус в скандинавском стиле, готов к заселению',
      },
    }),
  ]);

  console.log('✅ Создано загородной недвижимости:', countryProperties.length);

  // ==============================================
  // КОММЕРЧЕСКАЯ НЕДВИЖИМОСТЬ
  // ==============================================
  const commercialProperties = await Promise.all([
    prisma.commercialProperty.create({
      data: {
        title: 'Офис в бизнес-центре класса А',
        address: 'пр. Медиков, 10, БЦ "Платинум"',
        price: 18000000,
        pricePerM2: 200000,
        area: 90,
        hasFinishing: true,
        purpose: 'Офисное помещение',
        metro: 'Петроградская',
        metroDistance: 5,
        description: 'Престижный офис с отделкой, панорамными окнами и парковкой',
      },
    }),
    prisma.commercialProperty.create({
      data: {
        title: 'Торговое помещение на первой линии',
        address: 'Невский пр., 120',
        price: 35000000,
        pricePerM2: 350000,
        area: 100,
        hasFinishing: false,
        purpose: 'Торговое помещение',
        metro: 'Площадь Восстания',
        metroDistance: 2,
        description: 'Помещение свободной планировки, высокий трафик',
      },
    }),
    prisma.commercialProperty.create({
      data: {
        title: 'Склад с офисной частью',
        address: 'Индустриальный пр., 55',
        price: 12000000,
        pricePerM2: 40000,
        area: 300,
        hasFinishing: true,
        purpose: 'Складское помещение',
        metro: 'Ладожская',
        metroDistance: 15,
        description: 'Утепленный склад с офисными помещениями и удобным подъездом',
      },
    }),
  ]);

  console.log('✅ Создано коммерческой недвижимости:', commercialProperties.length);

  console.log('\n🎉 База данных успешно заполнена!');
  console.log('📊 Статистика:');
  console.log(`   - Риэлторов: ${realtors.length}`);
  console.log(`   - Заявок: ${applications.length}`);
  console.log(`   - ЖК: 2`);
  console.log(`   - Готовых квартир: ${readyApartments.length}`);
  console.log(`   - Квартир в аренду: ${rentalApartments.length}`);
  console.log(`   - Загородной недвижимости: ${countryProperties.length}`);
  console.log(`   - Коммерческой недвижимости: ${commercialProperties.length}`);
}

main()
  .catch((e) => {
    console.error('❌ Ошибка при заполнении базы данных:', e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });