--
-- PostgreSQL database dump
--

\restrict E3cv0FIPxJYNIR3MOwAN4xrYH1QjDovZkbk7uLSG6NK9PZWL7Shd5k7zceYqdfO

-- Dumped from database version 16.11
-- Dumped by pg_dump version 16.11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: root
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO root;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: root
--

COMMENT ON SCHEMA public IS '';


--
-- Name: ApplicationStatus; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public."ApplicationStatus" AS ENUM (
    'NEW',
    'PROCESSING',
    'COMPLETED',
    'CANCELLED'
);


ALTER TYPE public."ApplicationStatus" OWNER TO root;

--
-- Name: BuildingClass; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public."BuildingClass" AS ENUM (
    'ECONOMY',
    'COMFORT',
    'BUSINESS',
    'PREMIUM',
    'ELITE'
);


ALTER TYPE public."BuildingClass" OWNER TO root;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Application; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."Application" (
    id integer NOT NULL,
    name text NOT NULL,
    phone text NOT NULL,
    status public."ApplicationStatus" DEFAULT 'NEW'::public."ApplicationStatus" NOT NULL,
    "propertyType" text,
    "propertyId" integer,
    link text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Application" OWNER TO root;

--
-- Name: Application_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."Application_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Application_id_seq" OWNER TO root;

--
-- Name: Application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."Application_id_seq" OWNED BY public."Application".id;


--
-- Name: CommercialProperty; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."CommercialProperty" (
    id integer NOT NULL,
    title text NOT NULL,
    address text NOT NULL,
    price integer NOT NULL,
    "pricePerM2" integer NOT NULL,
    area integer NOT NULL,
    city text,
    lat double precision,
    lng double precision,
    "hasFinishing" boolean DEFAULT false NOT NULL,
    purpose text,
    metro text,
    "metroDistance" integer,
    description text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "currentId" text DEFAULT '-1'::text
);


ALTER TABLE public."CommercialProperty" OWNER TO root;

--
-- Name: CommercialProperty_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."CommercialProperty_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."CommercialProperty_id_seq" OWNER TO root;

--
-- Name: CommercialProperty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."CommercialProperty_id_seq" OWNED BY public."CommercialProperty".id;


--
-- Name: CountryProperty; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."CountryProperty" (
    id integer NOT NULL,
    title text NOT NULL,
    address text NOT NULL,
    metro text,
    "metroDistance" integer,
    city text,
    price integer NOT NULL,
    lat double precision,
    lng double precision,
    "landArea" integer NOT NULL,
    bedrooms integer NOT NULL,
    "totalFloors" integer NOT NULL,
    "pricePerM2" integer NOT NULL,
    description text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "currentId" text DEFAULT '-1'::text
);


ALTER TABLE public."CountryProperty" OWNER TO root;

--
-- Name: CountryProperty_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."CountryProperty_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."CountryProperty_id_seq" OWNER TO root;

--
-- Name: CountryProperty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."CountryProperty_id_seq" OWNED BY public."CountryProperty".id;


--
-- Name: Image; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."Image" (
    id integer NOT NULL,
    url text NOT NULL,
    "newBuildingComplexId" integer,
    "newBuildingApartmentId" integer,
    "readyApartmentId" integer,
    "rentalApartmentId" integer,
    "countryPropertyId" integer,
    "commercialPropertyId" integer,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Image" OWNER TO root;

--
-- Name: Image_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."Image_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Image_id_seq" OWNER TO root;

--
-- Name: Image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."Image_id_seq" OWNED BY public."Image".id;


--
-- Name: NearbyPlace; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."NearbyPlace" (
    id integer NOT NULL,
    "complexId" integer NOT NULL,
    name text NOT NULL,
    category text NOT NULL,
    distance integer,
    icon text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."NearbyPlace" OWNER TO root;

--
-- Name: NearbyPlace_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."NearbyPlace_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."NearbyPlace_id_seq" OWNER TO root;

--
-- Name: NearbyPlace_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."NearbyPlace_id_seq" OWNED BY public."NearbyPlace".id;


--
-- Name: NewBuildingApartment; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."NewBuildingApartment" (
    id integer NOT NULL,
    "complexId" integer NOT NULL,
    bedrooms integer NOT NULL,
    area integer NOT NULL,
    price integer NOT NULL,
    "pricePerM2" integer NOT NULL,
    floor integer NOT NULL,
    "totalFloors" integer NOT NULL,
    city text,
    lat double precision,
    lng double precision,
    type text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    title text DEFAULT 'null'::text NOT NULL,
    "apartmentNumber" integer DEFAULT 0 NOT NULL,
    korpus integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."NewBuildingApartment" OWNER TO root;

--
-- Name: NewBuildingApartment_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."NewBuildingApartment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."NewBuildingApartment_id_seq" OWNER TO root;

--
-- Name: NewBuildingApartment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."NewBuildingApartment_id_seq" OWNED BY public."NewBuildingApartment".id;


--
-- Name: NewBuildingComplex; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."NewBuildingComplex" (
    id integer NOT NULL,
    name text NOT NULL,
    address text NOT NULL,
    district text,
    metro text,
    "metroDistance" integer,
    city text,
    developer text NOT NULL,
    "priceFrom" integer NOT NULL,
    "areaFrom" integer,
    "buildingClass" text,
    floors integer,
    "totalApartments" integer,
    "availableApartments" integer,
    lat double precision,
    lng double precision,
    "completionDate" timestamp(3) without time zone,
    height integer,
    "hasParking" boolean DEFAULT false NOT NULL,
    description text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."NewBuildingComplex" OWNER TO root;

--
-- Name: NewBuildingComplex_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."NewBuildingComplex_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."NewBuildingComplex_id_seq" OWNER TO root;

--
-- Name: NewBuildingComplex_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."NewBuildingComplex_id_seq" OWNED BY public."NewBuildingComplex".id;


--
-- Name: ReadyApartment; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."ReadyApartment" (
    id integer NOT NULL,
    title text NOT NULL,
    "complexName" text,
    address text NOT NULL,
    city text,
    area integer NOT NULL,
    price integer NOT NULL,
    "pricePerM2" integer NOT NULL,
    bedrooms integer NOT NULL,
    floor integer NOT NULL,
    "totalFloors" integer NOT NULL,
    lat double precision,
    lng double precision,
    metro text,
    "metroDistance" integer,
    description text,
    developer text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "currentId" text DEFAULT '-1'::text
);


ALTER TABLE public."ReadyApartment" OWNER TO root;

--
-- Name: ReadyApartment_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."ReadyApartment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ReadyApartment_id_seq" OWNER TO root;

--
-- Name: ReadyApartment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."ReadyApartment_id_seq" OWNED BY public."ReadyApartment".id;


--
-- Name: Realtor; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."Realtor" (
    id integer NOT NULL,
    "fullName" text NOT NULL,
    phone text,
    email text,
    "avatarUrl" text,
    "position" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Realtor" OWNER TO root;

--
-- Name: Realtor_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."Realtor_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Realtor_id_seq" OWNER TO root;

--
-- Name: Realtor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."Realtor_id_seq" OWNED BY public."Realtor".id;


--
-- Name: RentalApartment; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."RentalApartment" (
    id integer NOT NULL,
    title text NOT NULL,
    address text NOT NULL,
    area integer NOT NULL,
    "pricePerMonth" integer NOT NULL,
    bedrooms integer NOT NULL,
    lat double precision,
    lng double precision,
    floor integer NOT NULL,
    "totalFloors" integer NOT NULL,
    city text,
    metro text,
    "metroDistance" integer,
    description text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "currentId" text DEFAULT '-1'::text
);


ALTER TABLE public."RentalApartment" OWNER TO root;

--
-- Name: RentalApartment_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."RentalApartment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."RentalApartment_id_seq" OWNER TO root;

--
-- Name: RentalApartment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."RentalApartment_id_seq" OWNED BY public."RentalApartment".id;


--
-- Name: Review; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."Review" (
    id integer NOT NULL,
    "authorName" text,
    rating integer NOT NULL,
    comment text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Review" OWNER TO root;

--
-- Name: Review_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."Review_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Review_id_seq" OWNER TO root;

--
-- Name: Review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."Review_id_seq" OWNED BY public."Review".id;


--
-- Name: Application id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Application" ALTER COLUMN id SET DEFAULT nextval('public."Application_id_seq"'::regclass);


--
-- Name: CommercialProperty id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."CommercialProperty" ALTER COLUMN id SET DEFAULT nextval('public."CommercialProperty_id_seq"'::regclass);


--
-- Name: CountryProperty id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."CountryProperty" ALTER COLUMN id SET DEFAULT nextval('public."CountryProperty_id_seq"'::regclass);


--
-- Name: Image id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Image" ALTER COLUMN id SET DEFAULT nextval('public."Image_id_seq"'::regclass);


--
-- Name: NearbyPlace id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."NearbyPlace" ALTER COLUMN id SET DEFAULT nextval('public."NearbyPlace_id_seq"'::regclass);


--
-- Name: NewBuildingApartment id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."NewBuildingApartment" ALTER COLUMN id SET DEFAULT nextval('public."NewBuildingApartment_id_seq"'::regclass);


--
-- Name: NewBuildingComplex id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."NewBuildingComplex" ALTER COLUMN id SET DEFAULT nextval('public."NewBuildingComplex_id_seq"'::regclass);


--
-- Name: ReadyApartment id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."ReadyApartment" ALTER COLUMN id SET DEFAULT nextval('public."ReadyApartment_id_seq"'::regclass);


--
-- Name: Realtor id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Realtor" ALTER COLUMN id SET DEFAULT nextval('public."Realtor_id_seq"'::regclass);


--
-- Name: RentalApartment id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."RentalApartment" ALTER COLUMN id SET DEFAULT nextval('public."RentalApartment_id_seq"'::regclass);


--
-- Name: Review id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Review" ALTER COLUMN id SET DEFAULT nextval('public."Review_id_seq"'::regclass);


--
-- Data for Name: Application; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."Application" (id, name, phone, status, "propertyType", "propertyId", link, "createdAt", "updatedAt") FROM stdin;
1	длсмоывдвы	+79270379857	NEW	продажа	\N	/	2025-12-27 10:14:48.232	2025-12-27 10:14:48.232
\.


--
-- Data for Name: CommercialProperty; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."CommercialProperty" (id, title, address, price, "pricePerM2", area, city, lat, lng, "hasFinishing", purpose, metro, "metroDistance", description, "createdAt", "updatedAt", "currentId") FROM stdin;
1	ПСН 26 м2, Цокольный / 5 этаж	Республика Татарстан (Татарстан), Лаишевский район, Столбищенское сельское поселение, село Усады, жилой комплекс Южный Парк, Сиреневая улица, 6	2990000	1	26	Казань	55.838738	49.24329	t	ПСН	не указан	0	Продаетcя кoммeрческое пoмещeние в ЖK Южный Пaрк🌟 Идеaльноe прeдлoжeниe для вaшего бизнесa! ✅ Площaдь: 25 кв.м✅ Рeмoнт: cвeжий и сoврeмeнный✅ Удoбноe paсположениe в однoм из caмых востребoванных ЖK гoрoдаПpeимущества пoмещeния:- Отличнaя планирoвкa, гoтовая к эксплуaтации- Наличие всех коммуникаций: электричество, вода, интернет- Парковка для клиентов Коммерческое помещение идеально подойдет для:- Офиса- Магазина- Студии или салона красотыНе упустите возможность стать владельцем привлекательного и выгодного объекта! 📞 Звоните прямо сейчас для записи на просмотр!	2025-11-29 13:41:49.695	2025-11-29 13:41:49.695	3
2	Офис 32 м2, 2 / 2 этаж	г Казань, ул Серова, зд 48 к 2	40000	1	32	Казань	55.823151	49.074218	t	Офис	не указан	0	Сдается уютное и светлое помещение с дизайнерским ремонтом по адресу: ул. Серова, 48к2.  Идеально для вашей компании!  Создайте комфортную атмосферу для работы в этом элегантном пространстве.  З 32 км.м , комфортная атмосфера , в данном здании имеется магазин пятерочка , удобная транспортная развязка . Звоните прямо сейчас.	2025-11-29 16:42:03.366	2025-11-29 16:42:03.366	183
3	ПСН 415.8 м2, 3 / 3 этаж	г Казань, ул Московская, д 11	30000000	1	415	Казань	55.79307	49.10389	t	ПСН	не указан	0	Продается офисное помещение\n\nПросторное офисное помещение площадью более 400 кв.м. в самом центре Казани на улице Московская, 11.\n\nУникальная mansardная планировка придаст вашему бизнесу особый стиль и атмосферу.\n\nВ офисе имеется мокрая точка, что удобно для организации рабочего процесса.\n\nДля дополнительного комфорта — отдельный вход и наличие шлагбаума обеспечивают безопасность и приватность.\n\nИдеально подходит для различных видов бизнеса: от креативных агентств до учебных центров.\n\nНе упустите шанс разместить свой бизнес в сердце столицы Татарстана!\n\nЗвоните для получения дополнительной информации и организации просмотра.	2025-11-29 17:03:02.027	2025-11-29 17:03:02.027	326
4	Гараж 65 м2, этаж	Республика Татарстан (Татарстан), Зеленодольский район, Осиновское сельское поселение, село Осиново	2700000	1	65	Казань	55.877556	48.889848	t	Гараж	не указан	0	Готовое помещение для автосервиса площадью 65 кв.м. Удобная организация работы с двумя заездами, тёплые полы и готовая рабочая зона — можно начинать работу сразу после сделки.\n\nОписание Готовый бизнес под автосервис — гараж 65 м²:\n- Площадь 65 кв.м\n- Два заезда — удобный подъезд и разграничение зон приема/выдачи авто\n- Тёплые полы — комфорт и работа в холодный период без дополнительных затрат\n- Помещение подготовлено под автосервис — практичная планировка для поста ремонта и обслуживания\n\nПреимущества:\n- Быстрый запуск бизнеса без долгого ремонта\n- Экономия на отоплении благодаря тёплому полу\n- Удобная логистика для клиентов и сотрудников\n- Подходит под разные направления автосервиса\n\nПодходит для:\n- СТО и техобслуживания\n- Диагностических и ремонтных работ\n- Шиномонтажа, мелкого кузовного ремонта и т.д.\n\nУсловия продажи:\n- Продаётся помещение как готовый объект под бизнес\n- Возможна продажа с оборудованием по договорённости	2025-11-30 09:46:20.493	2025-11-30 09:46:20.493	671
5	Готовый бизнес 244 м2, 1 / 1 этаж	Республика Татарстан (Татарстан), Казань, улица Энгельса, 15	3390000	1	244	Казань	55.808943	49.072197	t	Готовый бизнес	не указан	0	Продажа прибыльного автосервиса — готовый бизнес под ключ\n\nПродаю автосервис с постоянным потоком клиентов и устойчивой прибылью, удобно расположен недалеко от центра города. Идеально для инвестора или мастера, который хочет сразу начать работу без вложений в организацию.\n\nЧто входит в комплект:\n• Постоянная клиентская база с повторными обращениями\n• Размещение на Авито с отзывами и высоким рейтингом\n• Действующие договоры со страховыми компаниями — стабильный поток заказов\n• Опытная команда сотрудников, готовая остаться и продолжить работу\n• Полный комплект профессионального инструментария и оборудования\n• Стапель для кузовного ремонта\n• Все необходимые расходные материалы в наличии\n• Отлаженные бизнес‑процессы и документация\n\nУсловия и расходы:\n• Аренда помещения 240 000 руб/мес\n• Коммунальные услуги примерно 20 000 руб/мес (летом)\n\nПочему это выгодно:\n• Можно начинать работать с первого дня — минимум простоев и затрат на запуск\n• Налаженные отношения со страховыми компаниями дают регулярный поток клиентов и стабильный доход\n• Полный набор оборудования и команда сокращают риски при передаче бизнеса\n\nГотов предоставить подробную информацию, финансовые отчеты и документы для проверок. Возможен показ и обсуждение условий продажи для серьёзных покупателей.\n\nЗаинтересованы — пишите или звоните, договоримся о встрече и показе.	2025-11-30 09:51:36.389	2025-11-30 09:51:36.389	752
6	Торговая площадь 70 м2, 2 / 17 этаж	г Казань, ул Достоевского, д 57	13300000	1	70	Казань	55.788292	49.152471	t	Торговая площадь	не указан	0	Продаётся коммерческое помещение свободного назначения\nИдеально подходит для организации бизнеса любого направления!\nУдобная транспортная доступность и развитая инфраструктура района!\nВозможность реализации творческих идей и перспектив развития вашего дела!\nПриобретайте успешное будущее своего бизнеса прямо сейчас!	2025-11-30 12:44:16.489	2025-11-30 12:44:16.489	1201
7	Торговая площадь 100 м2, 2 / 17 этаж	г Казань, ул Достоевского, д 57	19000000	1	100	Казань	55.788292	49.152471	t	Торговая площадь	не указан	0	Продаётся коммерческое помещение свободного назначения\nИдеально подходит для организации бизнеса любого направления!\nУдобная транспортная доступность и развитая инфраструктура района!\nВозможность реализации творческих идей и перспектив развития вашего дела!\nПриобретайте успешное будущее своего бизнеса прямо сейчас!	2025-11-30 12:46:43.053	2025-11-30 12:46:43.053	1213
8	ПСН 297 м2, 2 / 17 этаж	г Казань, ул Достоевского, д 57	297000	1	297	Казань	55.788292	49.152471	t	ПСН	не указан	0	Сдается коммерческое помещение в аренду.\nИдеально подойдет для бизнеса любого формата!\nСвободное назначение позволяет реализовать любые идеи!\nУдобная транспортная доступность и развитая инфраструктура района.\nКомфортные условия аренды и профессиональный подход ждут вас!\nСвяжитесь с нами прямо сейчас и узнайте подробности!	2025-11-30 13:09:22.495	2025-11-30 13:09:22.495	12159
\.


--
-- Data for Name: CountryProperty; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."CountryProperty" (id, title, address, metro, "metroDistance", city, price, lat, lng, "landArea", bedrooms, "totalFloors", "pricePerM2", description, "createdAt", "updatedAt", "currentId") FROM stdin;
2	Таунхаус 5-комн., 180 м2, 3 этаж	Республика Татарстан (Татарстан), Казань, Аэропортовская улица, 27Б	не указан	0	Казань	100000	55.789664	49.177336	180	5	3	1	🏠 Прeкрacный тaунхаус 180 кв.м в Советcком pайоне Ищeтe идеaльнoе мecтo для жизни? Baшему вниманию предлaгаeтся уютный и пpocтoрный тaунхaуc нa 3 этажa!✨ Oсобенноcти:- Bсe неoбxoдимoe для комфоpтнoго прoживaния: комнaты oборудовaны кондиционерaми, крoвaтями и тeлeвизоpaми.- Kaчeственный кирпичный дом, что гарантирует тепло и уют в любое время года.- Спокойные и дружелюбные соседи — семейные люди, что создаёт атмосферу приятного соседства.📍 Удобное расположение в Советском районе, рядом с необходимыми магазинами и развлекательными заведениями.Не упустите шанс сделать этот таунхаус своим новым домом! Звоните для уточнения деталей или для записи на просмотр! 📞	2025-11-29 13:58:01.644	2025-11-29 13:58:01.644	6
9	Дом 5-комн., 120 м2, 2 этаж	Респ Татарстан, Лаишевский р-н, село Сокуры, ул Зеркальная, д 35	не указан	0	Казань	8700000	55.597383	49.390291	120	5	2	1	Продается уютный дом в живописном селе Сокуры! Этот просторный дом в предчистовой отделке готов стать вашим идеальным местом для жизни. Вы сможете самостоятельно подобрать отделку и создать уникальный интерьер по своему вкусу. Все коммуникации уже подведены, что обеспечит вам комфорт и удобство с первого дня. Село Сокуры окружает природа: свежий воздух, красивые пейзажи и тихая атмосфера позволяют насладиться спокойствием вдали от городского шума. Рядом с домом находятся магазины и другие необходимые объекты инфраструктуры, что делает жизнь здесь еще комфортнее. Не упустите уникальную возможность стать владельцем прекрасного дома в этом прекрасном месте! Свяжитесь для получения подробной информации и организации просмотра.	2025-11-29 16:52:36.938	2025-11-29 16:52:36.938	307
1	Коттедж 6-комн., 170 м2, 2 этаж	Республика Татарстан (Татарстан), Лаишево, Родниковая улица, 11	не указан	0	Казань	120000	55.394924	49.522612	170	6	2	1	🏡 Сдам уютный дом 170 кв м в Лaишево! 🌲 Пpeкрасноe меcтоpacпoложeние – в окpужeнии живoпиcнoго леса, идeальнoе мecтo для любитeлей пpирoды и cпoкойствия. ⏰ Toлько 40 минут дo Казани! Идеaльный вapиант для теx, ктo рабoтaeт в гopoде, нo мeчтает о кoмфортной зaгороднoй жизни. 🛋️ В домe eсть вся необходимая мебель и техника, готов к заселению. 📅 Не упустите шанс! Для получения подробностей и записи на просмотр – пишите в личные сообщения!	2025-11-29 13:49:32.422	2025-11-29 13:49:32.422	5
3	Участок м2, этаж	Республика Татарстан (Татарстан), Лаишевский район, Сокуровское сельское поселение, деревня Обухово, Центральная улица, 6А	не указан	0	Казань	2490000	55.616188	49.440021	10	0	3	1	Республика Татарстан, Лаишевский р-н, Сокуровское сельское поселение, д. Обухово\nЗемельный участок, 10 соток, ИЖС, в собственности\nКадастровый номер: 16:24:240301:4021\nДо центра Казани 15 минут.\nВ шаговой доступности Школа, Детский садик, Остановка общественного транспорта, Аптека.\nКоммуникации проходят по улице.\nХорошие подъездные пути.\nВ окружении жилые дома.\nЖивописное месторасположение.\nРазвитая инфраструктура.\nВзрослый собственник.\nПраво собственности зарегистрировано.	2025-11-29 14:21:10.599	2025-11-29 14:21:10.599	14
10	Дом 4-комн., 130 м2, 1 этаж	Респ Татарстан, Высокогорский р-н, деревня Эстачи, ул Изумрудная, д 109	не указан	0	Казань	7800000	55.877632	49.344692	130	4	1	1	Продается великолепный дом в предчистовой отделке в поселке Эстачи! Это уникальное предложение сочетает в себе комфорт и возможность оформить пространство по вашему вкусу. Приятная площадь позволит создать уютный интерьер для всей семьи. Все коммуникации подведены, что сделает ваш переезд легким и беспроблемным. Особой гордостью дома является собственная сауна, где вы сможете расслабиться и восстановить силы после напряженного дня. Поселок Эстачи радует живописной природой, тишиной и спокойствием, что позволяет наслаждаться жизнью вдали от городской суеты. Удобная инфраструктура и близость к необходимым объектам делают это место идеальным для жизни. Не упустите шанс стать владельцем этого прекрасного дома! Свяжитесь для получения подробной информации и организации просмотра.	2025-11-29 16:55:37.879	2025-11-29 16:55:37.879	308
4	Дом 4-комн., 170 м2, 2 этаж	Республика Татарстан (Татарстан), Зеленодольский район, Осиновское сельское поселение, село Осиново, Солнечная улица, 54	не указан	0	Казань	11950000	55.884216	48.910249	170	4	2	1	🏡 Продаётся двухэтажный дом в посёлке Осиново: идеальный вариант для комфортной жизни.\n✅ Если вы мечтаете о собственном уютном доме в живописном районе, то это предложение идеально подойдёт вам.\n✅ Двухэтажный дом в посёлке Осиново, Зеленодольский район — это не просто жильё, это место, где вы сможете насладиться спокойствием и комфортом.\n✅ Качественные материалы и современные технологии строительства.\n✅ Данный дом построен из высококачественных материалов, что гарантирует его долговечность и надёжность.\n✅ Площадь дома составляет 170 кв.м, а на участке площадью 8 соток вы сможете реализовать свои садовые и дачные идеи.\n✅ Не упустите возможность стать счастливым обладателем этого замечательного дома в посёлке Осиново. Ощутите все преимущества комфортной загородной жизни уже сегодня!	2025-11-29 14:45:34.568	2025-11-29 14:45:34.568	21
5	Дом 4-комн., 99 м2, 1 этаж	Республика Татарстан (Татарстан), Верхнеуслонский район, Набережно-Морквашское сельское поселение, посёлок Пятидворка, Бирюзовая улица	не указан	0	Казань	6750000	55.770983	48.812	99	4	1	1	▎🏡 Продается дом вашей мечты! 🌟\n🌳 Ищете идеальное место для жизни? У нас отличный вариант! Продается дом площадью 100 кв.м, построенный с любовью и заботой! ❤️\n🧱 Основные характеристики:\n- Стены из коричневого кирпича – этот материал не только прочный, но и красиво смотрится!\n- Панорамные окна, которые наполняют дом светом и открывают восхитительный вид на природу. 🌄\n🌿 Преимущества расположения:\n- Рядом с домом – чистейший воздух и великолепная природа, где можно проводить время с семьей, гулять или заниматься спортом! 🚶‍♂️🌞\n✨ Не упустите шанс стать владельцем этого замечательного дома! Для получения дополнительной информации, пожалуйста, свяжитесь с нами! 📞💬\nВаш новый уютный дом ждет вас! 🏠❤️	2025-11-29 15:04:50.455	2025-11-29 15:04:50.455	27
6	Дом 4-комн., 105 м2, 1 этаж	Республика Татарстан (Татарстан), Зеленодольский район, Большекургузинское сельское поселение, село Большие Кургузи, Родная улица, 16	не указан	0	Казань	6400000	56.002053	48.826876	105	4	1	1	🏡 Продается уютный дом в Северной Раифе!\n\n🔹 Площадь: 105 кв.м\n🔹 Предчистовая отделка — идеальный шанс создать пространство своей мечты!\n\n✨ Особенности:\n- Просторные светлые комнаты, которые легко трансформируются в зоны для отдыха и работы\n- Удобная планировка, которая позволит вам организовать комфортное пространство для вашей семьи\n- Возможность реализации собственных дизайнерских идей — создайте дом, который будет отражать именно ваш стиль!\n\n🌳 Уникальное месторасположение:\n- Тихий район с развитой инфраструктурой\n- В шаговой доступности магазины, школы и остановки общественного транспорта\n- Прекрасные возможности для прогулок на свежем воздухе и активного отдыха\n\n🚗 Удобный подъезд и парковка.\n\n📞 Звоните прямо сейчас, чтобы узнать больше и записаться на просмотр! Ваш идеальный дом ждет вас!	2025-11-29 15:37:44.654	2025-11-29 15:37:44.654	90
7	Коттедж 4-комн., 95.1 м2, 1 этаж	Респ Татарстан, Лаишевский р-н, село Сокуры	не указан	0	Казань	7500000	55.620174	49.394665	142	4	1	1	Продается уютный дом в предчистовой отделке в поселке Сокуры! Участок в 10 соток с ровной поверхностью, идеально подходит для садоводства и отдыха на свежем воздухе. Все коммуникации подведены: газ, электричество и теплые полы обеспечат комфорт на любом этапе. Удобные подъездные пути обеспечивают легкий доступ к дому. Здесь вы сможете создать свой идеальный уголок для жизни или дачи! Не упустите шанс на комфортное и спокойное проживание в прекрасной природе. Звоните для подробной информации!	2025-11-29 15:52:16.382	2025-11-29 15:52:16.382	142
8	Дом 4-комн., 130.8 м2, 1 этаж	Респ Татарстан, Лаишевский р-н, село Сокуры, ул Зеркальная, д 13	не указан	0	Казань	7800000	55.596045	49.386392	130	4	1	1	Продается уютный дом с ремонтом в живописном селе Сокуры! Этот дом станет настоящим пристанищем для вашей семьи. Просторные комнаты, свежий ремонт и продуманное пространство сразу создают ощущение уюта. Вся необходимая инфраструктура в шаговой доступности: магазины, школы и остановки общественного транспорта. Вы сможете насладиться спокойствием загородной жизни, не отказывая себе в удобствах городской жизни. До центра Казани всего 35 минут! Это идеальный выбор для тех, кто ценит комфорт и свободу от городской суеты. Не упустите шанс приобрести дом своей мечты. Звоните для подробностей и для организации просмотра!	2025-11-29 16:44:57.386	2025-11-29 16:44:57.386	294
11	Участок м2, этаж	Респ Татарстан, Лаишевский р-н, село Шуран	не указан	0	Казань	5400000	55.369531	49.823611	21	0	1	1	Продается 4 участка в живописном месте\n\nПредлагаем уникальную возможность приобрести четыре участка на берегу реки Камы в селе Шуран!\n\nПлощадь участков:\n- 20.6 соток\n- 15 соток\n- 20 соток\n- 19 соток\n\nКаждый участок идеально подходит для постройки загородного дома или дачи.\n\nЦена всего 250 тысяч за сотку!\n\nКадастровый номер одного из участков: 16:24:010401:652.\n\nНасладитесь природой, тишиной и красотой окружающих пейзажей.\n\nНе упустите шанс создать свой идеальный уголок! Звоните для получения дополнительной информации и организации просмотра.	2025-11-29 17:10:48.003	2025-11-29 17:10:48.003	332
12	Дом 5-комн., 100 м2, 1 этаж	Республика Татарстан (Татарстан), Верхнеуслонский район, Набережно-Морквашское сельское поселение, посёлок Пятидворка	не указан	0	Казань	7450000	55.762758	48.806044	100	5	1	1	Продаётся уютный дом в закрытом посёлке Новое Пятидворье!\n\nНовый кирпичный дом, выполненный с заботой о каждой детали.\nВсе коммуникации уже подведены, что позволяет сразу заселиться и наслаждаться комфортом.\n\nПосёлок окружён живописной природой, создавая идеальные условия для спокойной жизни. Безопасность и уединение гарантированы!\n\nУдобное месторасположение и развитая инфраструктура в шаговой доступности.\n\nЭта уютная домашняя атмосфера ждёт своих новых хозяев! Не упустите шанс стать обладателем этого прекрасно оформленного дома!\n\nЗвоните сейчас для более подробной информации и организации просмотра!	2025-11-29 17:31:57.118	2025-11-29 17:31:57.118	369
13	Дом 4-комн., 100 м2, 1 этаж	Республика Татарстан (Татарстан), Зеленодольский район, Большекургузинское сельское поселение, село Большие Кургузи	не указан	0	Казань	7000000	56.013517	48.835329	100	4	1	1	Продаётся дом в живописном посёлке Северная Раифа!\n\nДом в черновой отделке – идеальный blank canvas для реализации ваших дизайнерских идей.\nВсе коммуникации подведены, что позволяет начать работу по оформлению сразу после покупки.\n\nУникальная природа вокруг и тишина посёлка обеспечат вам спокойствие и комфорт.\n\nУдобное расположение: рядом магазины, школы и другие необходимые объекты инфраструктуры.\n\nПридайте этой недвижимости свою индивидуальность и создайте дом своей мечты!\n\nЗвоните и узнайте подробности! Не упустите шанс на выгодное приобретение!	2025-11-29 17:35:50.309	2025-11-29 17:35:50.309	370
14	Дом 4-комн., 150 м2, 2 этаж	г Казань, тер СНТ Победа, д 126	не указан	0	Казань	100000	55.697447	49.089849	150	4	1	1	🏡 Сдается уютный дом в Приволжском районе\n\nИщете идеальное место для комфортной жизни? Этот просторный дом площадью 150 кв. м станет вашим идеальным выбором!\n\n✨ Особенности:\n- Большие светлые комнаты, которые создают атмосферу уюта и удобства.\n- Прекрасная баня, где вы сможете расслабиться после долгого дня.\n- Участок, на котором можно организовать летние вечера с друзьями и семьей.\n\n📍 Месторасположение:\nДом находится в живописном районе с развитой инфраструктурой, что делает его идеальным для жизни и отдыха.\n\nНе упустите возможность арендовать этот замечательный дом! Свяжитесь с нами для получения дополнительной информации.	2025-11-29 17:38:48.125	2025-11-29 17:38:48.125	388
15	Дом 3-комн., 150 м2, 1 этаж	г Казань, ул Троицкий Лес, д 43А	не указан	0	Казань	190000	55.818361	49.169476	150	3	1	1	ДОМ РЕАЛЬНЫЙ!\n🏡 Сдаю великолепный дом\n✨ Находится напротив реки Казанки в престижной локации\n📏 460 кв. м + 100 кв. м терраса\n🚗 Собственная парковка для вашего удобства\n\nЭто действительно дом вашей мечты! Просторные комнаты, роскошный интерьер и величественный вид на реку создадут атмосферу уюта и комфорта. Идеально подходит для тех, кто стремится к спокойствию и роскоши в жизни.\n\n💎 Дорого и богато — это именно то, что вам нужно!\n\nНе упустите возможность испытать все преимущества этого уникального предложения! 🏞️	2025-11-29 17:54:30.26	2025-11-29 17:54:30.26	437
16	Дом 5-комн., 220 м2, 2 этаж	г Казань, ул Извилистая	не указан	0	Казань	150000	55.822296	49.26644	220	5	2	1	🏡 Сдаю уютный дом\n\n✨ Общая площадь: 220 кв. м\n🏢 2 этажа изысканного дизайнерского ремонта\n🛏️ 4 просторные спальни для комфортного проживания\n🚗 Удобная парковка для вашего автомобиля\n\nЭтот стильный дом идеально подходит для семейного проживания или тех, кто ценит комфорт и уют. Просторные комнаты наполнены светом и теплом, а дизайнерский подход создает уникальную атмосферу.\n\n📞 Звоните для получения подробной информации и организации просмотра!	2025-11-29 17:58:25.513	2025-11-29 17:58:25.513	449
17	Участок м2, этаж	г Казань, тер Коллективный сад N10 СНТ ОАО КМПО	не указан	0	Казань	2300000	55.891865	49.043756	6	5	1	1	🌳 Продается прекрасный участок в садоводческом обществе КМПО-10!\n\n🏞️ Уникальное месторасположение — всего в нескольких шагах от живописного третьего озера. Это идеальное место для любителей природы и спокойствия.\n\n✨ Участок окружен зеленью и свежим воздухом, что создаст атмосферу уюта и расслабления. Здесь можно воплотить в жизнь все ваши мечты о загородной жизни: постройки дачи, обустройство сада или просто наслаждение тишиной и спокойствием.\n\n🚶‍♂️ Вся необходимая инфраструктура находится в шаговой доступности, что делает жизнь здесь комфортной и удобной.\n\nНе упустите свой шанс стать владельцем этого замечательного участка!	2025-11-30 09:40:42.742	2025-11-30 09:40:42.742	635
18	Дом 4-комн., 100 м2, 1 этаж	Респ Татарстан, Высокогорский р-н, село Шигали, ул Тахира Гильмутдинова, д 22	не указан	0	Казань	8300000	55.96535	49.020831	100	4	4	1	Продаётся уютный кирпичный дом 100 кв. м в живописном посёлке Шигали!\n\nОтличное предложение для семьи!\n- Просторные комнаты\n- Тёплая атмосфера и качественная постройка\n\nРядом проживают дружелюбные соседи, что создаёт комфортную обстановку для жизни.\n\nДо города Казани всего 15 минут. Удобный доступ к инфраструктуре: магазины, школы и детские сады в шаговой доступности.\n\nНасладитесь природой и спокойствием загородной жизни, не теряя связи с городской цивилизацией.\n\nНе упустите возможность стать владельцем этого замечательного дома! Звоните для подробной информации и записи на просмотр!	2025-11-30 09:43:32.053	2025-11-30 09:43:32.053	637
19	Участок м2, этаж	Республика Татарстан (Татарстан), Верхнеуслонский район, Набережно-Морквашское сельское поселение, посёлок Пятидворка	не указан	0	Казань	2250000	55.762758	48.806044	5	0	1	1	Участок в посёлке Пятидворка — идеальный вариант для строительства загородного дома\n\nОсновные характеристики:\n• Закрытый охраняемый посёлок — спокойная и безопасная атмосфера\n• Ровный участок — подготовлен для быстрого старта строительства\n• Централизованная вода — удобство и экономия на коммуникациях\n• Удобное расположение внутри посёлка — хорошие подъездные пути\n\nПреимущества:\n• Безопасность и приватность закрытого посёлка\n• Отсутствие дополнительных земляных работ благодаря ровной площадке\n• Экономия времени и средств на проведение водоснабжения — подключение уже доступно\n• Отличная инфраструктура рядом (торговля, дороги, при необходимости школа/поликлиника в доступности)\n• Подходит для строительства постоянного дома или дачи с возможностью будущей сдачи в аренду\n\nРекомендации:\n• Подходит для тех, кто ценит комфорт загородной жизни без лишних хлопот\n\nГотов показать участок в удобное для вас время. Звоните или пишите — отвечу на все вопросы и предоставлю всё необходимое для быстрой сделки.	2025-11-30 09:49:25.405	2025-11-30 09:49:25.405	710
20	Дом 4-комн., 130 м2, 2 этаж	Республика Татарстан (Татарстан), Казань, Советский район, жилой массив Самосырово, улица Мира, 135	не указан	0	Казань	100000	55.800701	49.282601	130	4	4	1	обьявление  реальное !!! есть видео Сдаю отличный 4‑комнатный дом — 15 минут от центра Адрес • ул. Мира, 135 Кратко о доме • Просторный 4‑комнатный дом, идеален для семьи или на долгосрочную аренду. • Удобная транспортная доступность — 15 минут езды до центра города, рядом развязки и остановки. Участок и инфраструктура • Большой благоустроенный участок, аккуратно засеян газоном. • Автоматический полив газона — экономия времени и всегда ухоженный вид. • Много места для парковки — удобно для гостей и нескольких автомобилей. • Зона для отдыха и барбекю: мангал и беседка — отличное место для встреч на свежем воздухе. Преимущества • Комфорт и функциональность — простор внутри и приятная благоустроенная территория снаружи. • Подходит для семейных посиделок, вечеринок и спокойной жизни вдали от городской суеты, но с быстрым доступом в центр. Готов показать дом по договорённости. Напишите, когда удобно посмотреть или задавайте вопросы.	2025-11-30 11:42:47.994	2025-11-30 11:42:47.994	809
21	Дом 5-комн., 270 м2, 1 этаж	Республика Татарстан (Татарстан), Казань, Советский район, жилой массив Самосырово, улица Мира, 135А	не указан	0	Казань	150000	55.800772	49.282879	270	5	1	1	обьявление реальное!!!!! есть видео Сдаю отличный 5‑комнатный дом — 15 минут от центра Адрес • ул. Мира, 135 Кратко о доме • Просторный 5‑комнатный дом, идеален для семьи или на долгосрочную аренду. • Удобная транспортная доступность — 15 минут езды до центра города, рядом развязки и остановки. Участок и инфраструктура • Большой благоустроенный участок, аккуратно засеян газоном. • Автоматический полив газона — экономия времени и всегда ухоженный вид. • Много места для парковки — удобно для гостей и нескольких автомобилей. • Зона для отдыха и барбекю: мангал и беседка — отличное место для встреч на свежем воздухе. Преимущества • Комфорт и функциональность — простор внутри и приятная благоустроенная территория снаружи. • Подходит для семейных посиделок, вечеринок и спокойной жизни вдали от городской суеты, но с быстрым доступом в центр. Готов показать дом по договорённости. Напишите, когда удобно посмотреть или задавайте вопросы.	2025-11-30 11:47:29.33	2025-11-30 11:47:29.33	810
22	Дом Свободной планировки 150 м2, 2 этаж	Респ Татарстан, Высокогорский р-н, село Чувашли	не указан	0	Казань	120000	56.066555	49.007977	150	2	2	1	Сдаётся дом из бруса 150 кв.м – экологично и комфортно!\n\n🏠 Просторный двухэтажный дом с 4 комнатами идеально подойдёт для семьи или компании.\n\n🚿 В доме 2 санузла и душевая кабина – комфорт и удобство для всех проживающих.\n\n🛋️ Оснащён всем необходимым для комфортного проживания: мебель, техника, коммуникации.\n\n🌿 Ухоженная территория с газоном и красивыми насаждениями. Есть теплица для любителей огородничества.\n\n🔥 Отдельностоящая зона барбекю – уютные вечера на свежем воздухе гарантированы.\n\n🪵 Русская баня на дровах – прекрасный способ расслабиться и восстановить силы.\n\n📍 Отличное место для отдыха и жизни в экологически чистом, уютном доме!\n\nЗвоните, покажу дом в удобное для вас время!	2025-11-30 12:10:44.088	2025-11-30 12:10:44.088	1147
23	Участок м2, этаж	Республика Татарстан (Татарстан), Лаишевский район, Никольское сельское поселение, СНТ Надежда, 15-я аллея, 45	не указан	0	Казань	850000	55.531621	49.094754	5	0	1	1	Продаю ровный участок в экологически чистом районе Казани.\nНа территории стоит дом.\nПодойдет для временного проживания на время постройки своего дома мечты (есть фото и видео дома, отправлю по запросу).\nВнутри дома есть электричество и вода.\nГаз проходит по границе участка. Есть возможность заведения в дом.\nВ тёплое время года работают все необходимые магазины в пешей доступности, ходит общественный транспорт.\nВ пешей доступности протекает река Волга. В летнее время можно прогуляться и насладиться природной красотой.\nТрава на фото мягкая. Лего можно убрать. Насыпь — это опилки, можно будет отсыпать ими дорожку.\nУчасток подготовлен к продаже — спилили крупные деревья.\nУчасток без обременений, один взрослый собственник.\nПишите, звоните, расскажу подробнее.	2025-11-30 12:53:33.892	2025-11-30 12:53:33.892	1249
\.


--
-- Data for Name: Image; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."Image" (id, url, "newBuildingComplexId", "newBuildingApartmentId", "readyApartmentId", "rentalApartmentId", "countryPropertyId", "commercialPropertyId", "createdAt") FROM stdin;
1	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/244d07bb-fb2a-4d77-bfe1-e99d0d75ff59.jpg	1	\N	\N	\N	\N	\N	2025-11-27 09:57:27.177
2	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/0e86b922-2ff5-4201-b8cf-57f93d9d66a3.jpg	1	\N	\N	\N	\N	\N	2025-11-27 09:57:27.177
3	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/a3a61efa-0320-4d34-805d-4d3f8c1ac73f.jpg	1	\N	\N	\N	\N	\N	2025-11-27 09:57:27.177
4	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/938c2f0e-aede-4c9b-bbcb-61779dca20bc.jpg	1	\N	\N	\N	\N	\N	2025-11-27 09:57:27.177
5	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/c555a43f-f47e-49fd-b35f-6c296a7e2d4f.jpg	1	\N	\N	\N	\N	\N	2025-11-27 09:58:05.997
6	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/a07fa6a7-d136-483f-abe8-3726bef0f648.jpg	1	\N	\N	\N	\N	\N	2025-11-27 09:58:05.997
7	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/382425b1-c46e-49e0-90ed-ba6abfd1a2a3.jpg	1	\N	\N	\N	\N	\N	2025-11-27 09:58:05.997
8	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/2df82e81-d381-4706-8256-bbef14bfa5a4.jpg	1	\N	\N	\N	\N	\N	2025-11-27 09:58:05.997
9	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/104cd118-a096-4efd-97f2-2fcb4c0eb0f4.jpg	\N	1	\N	\N	\N	\N	2025-11-27 10:05:36.037
10	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/31317eb6-f87f-463c-9ef0-3fa4eb7862ef.jpg	\N	1	\N	\N	\N	\N	2025-11-27 10:05:36.037
11	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/922d1c10-5d89-43bc-953d-007bde5b92a3.jpg	\N	1	\N	\N	\N	\N	2025-11-27 10:05:36.037
12	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/1eb2badb-8767-4c24-8c3a-65174f6fa820.jpg	\N	2	\N	\N	\N	\N	2025-11-27 10:15:49.749
13	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/3426290b-070d-4159-97be-30c666be11bd.jpg	\N	2	\N	\N	\N	\N	2025-11-27 10:15:49.749
14	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/edb7cbe0-d690-42e3-a8d7-5073a37bbd47.jpg	\N	2	\N	\N	\N	\N	2025-11-27 10:19:23.671
15	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/678c9d20-197d-4085-b1e0-af7da1641fca.jpg	\N	2	\N	\N	\N	\N	2025-11-27 10:19:23.671
16	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/51f2ee49-3387-46fc-a015-fc8f5bd1d4b3.jpg	\N	4	\N	\N	\N	\N	2025-11-27 10:28:56.69
17	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/bcdc26fe-0a77-4dfc-b0b3-588a3fb6b3e0.jpg	\N	4	\N	\N	\N	\N	2025-11-27 10:28:56.69
18	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/060e048a-a4f0-4fa2-8c31-b6d313f16344.jpg	\N	3	\N	\N	\N	\N	2025-11-27 10:29:38.912
19	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/38df3155-e16b-45fd-bad7-255e62360189.jpg	\N	3	\N	\N	\N	\N	2025-11-27 10:29:38.912
20	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/ec2cf942-b430-421f-95ca-42261e5909ac.jpg	\N	5	\N	\N	\N	\N	2025-11-27 10:30:55.082
21	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/8ad99cff-a385-4b64-af9d-055a86803567.jpg	\N	5	\N	\N	\N	\N	2025-11-27 10:30:55.082
22	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/6846a027-9f88-44b7-8f44-01ed1a247b8c.jpg	\N	5	\N	\N	\N	\N	2025-11-27 10:34:15.693
23	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/82bfd94e-f458-4e2c-a2d4-94e143c4b2e6.jpg	\N	5	\N	\N	\N	\N	2025-11-27 10:34:15.693
24	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/33ec711e-bc20-4cb5-9d1c-7dc43b3c601b.jpg	\N	5	\N	\N	\N	\N	2025-11-27 11:02:32.428
25	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/9ced2eac-ad73-4fcd-9ce0-4fc6f0548095.jpg	\N	5	\N	\N	\N	\N	2025-11-27 11:02:32.428
26	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/92185c99-3da2-4380-9cce-363c45a5c365.jpg	\N	7	\N	\N	\N	\N	2025-11-27 11:05:05.47
27	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/63d54a53-9ee2-4caa-9f3a-87cdf8eb0883.jpg	\N	7	\N	\N	\N	\N	2025-11-27 11:05:05.47
28	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/2bd8d027-7a3e-4ee9-aff7-5c320a07c264.jpg	\N	8	\N	\N	\N	\N	2025-11-27 11:05:23.159
29	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/d682e6fe-7ca7-4e42-9700-d92f84626e0d.jpg	\N	8	\N	\N	\N	\N	2025-11-27 11:05:23.159
30	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/4cfc2d3b-dc73-4a67-956e-a9e742773d14.jpg	\N	9	\N	\N	\N	\N	2025-11-27 11:07:40.988
31	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/a5d6d5a2-bf0f-498d-9e5d-8d734778f774.jpg	\N	9	\N	\N	\N	\N	2025-11-27 11:07:40.988
32	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/0be18aa1-7e40-44c1-b121-01f47949f631.jpg	\N	10	\N	\N	\N	\N	2025-11-27 11:09:18.635
33	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/342480af-5fea-4a4e-8c14-7d23c1aee5a0.jpg	\N	10	\N	\N	\N	\N	2025-11-27 11:09:18.635
34	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/69bd0af8-3a17-44bd-9e46-dd369b6334e1.jpg	\N	11	\N	\N	\N	\N	2025-11-27 11:11:50.61
35	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/6164fab7-e5ac-409b-913e-0403998fcd3a.jpg	\N	11	\N	\N	\N	\N	2025-11-27 11:11:50.61
36	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/7ad15708-b7cf-4050-9779-715b524c77ee.jpg	\N	12	\N	\N	\N	\N	2025-11-27 11:18:24.988
37	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/848d6265-b2c9-4014-8172-6b53972268bf.jpg	\N	13	\N	\N	\N	\N	2025-11-27 11:20:37.059
38	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/fd010466-4a29-4623-a5fc-43f7bd86f522.jpg	\N	14	\N	\N	\N	\N	2025-11-27 11:22:34.679
39	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/7111cbe2-8014-4298-8823-0ebf73b3e02b.jpg	\N	15	\N	\N	\N	\N	2025-11-27 11:27:24.296
40	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/382c1cd9-dfb5-424b-a99e-bc464dfb7732.jpg	\N	16	\N	\N	\N	\N	2025-11-27 11:31:23.025
41	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/b400e1fc-4b3d-4e45-89df-90bdca265edf.jpg	\N	17	\N	\N	\N	\N	2025-11-27 11:33:53.617
42	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/9adcd906-5fd5-4e1a-a7e2-066775a6b1cc.jpg	\N	18	\N	\N	\N	\N	2025-11-27 11:36:18.905
43	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/99348280-7968-4d04-aa14-4293584a23e6.jpg	\N	19	\N	\N	\N	\N	2025-11-27 11:38:17.633
44	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/7756f7bf-f98e-48e9-bac7-92a1df5b86da.jpg	\N	20	\N	\N	\N	\N	2025-11-27 11:40:06.706
45	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/d436b5a1-840e-4e2c-82ab-7bfceea6e244.jpg	\N	21	\N	\N	\N	\N	2025-11-27 11:41:21.694
46	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/0c1e606d-7e5e-4316-be02-fd29a1631455.jpg	\N	22	\N	\N	\N	\N	2025-11-27 11:43:06.577
47	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/c2acacf8-b056-4385-9669-e8c40f4cfce6.jpg	\N	23	\N	\N	\N	\N	2025-11-27 11:44:15.128
48	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/7c564fff-01c5-4b9d-9033-dfcf0393dccc.jpg	\N	24	\N	\N	\N	\N	2025-11-27 11:45:51.699
49	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/88735bd6-c966-4f35-839e-277c77156ee7.jpg	\N	25	\N	\N	\N	\N	2025-11-27 11:47:26.21
506	https://platina.vtcrm.ru/uploads/Photos/21/67caa5f63d2aa.jpeg	\N	\N	\N	\N	4	\N	2025-11-29 15:01:38.977
50	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/4df3c2f3-eaee-4ed8-b999-62c0772a0790.jpg	\N	26	\N	\N	\N	\N	2025-11-27 11:48:56.835
51	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/42be317e-445d-483a-82fe-9ff7112d02e3.jpg	\N	27	\N	\N	\N	\N	2025-11-27 11:50:05.701
52	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/358999ae-9bb9-4f57-a194-b6671f11facb.jpg	\N	28	\N	\N	\N	\N	2025-11-27 11:51:13.982
53	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/54fcc389-5442-43c6-aaef-03f2aab58ce9.jpg	\N	29	\N	\N	\N	\N	2025-11-27 11:52:26.91
54	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/7c872160-146b-462d-a96a-1f3008f00078.jpg	\N	29	\N	\N	\N	\N	2025-11-27 11:54:46.991
55	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/ba95dda9-f3a5-4e67-9367-a7e9ef1b466d.jpg	\N	30	\N	\N	\N	\N	2025-11-27 11:56:06.348
56	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/01b467ee-cf5f-40c2-a40b-f2e5449e7677.jpg	\N	31	\N	\N	\N	\N	2025-11-27 11:56:08.733
57	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/763d977f-0854-4955-9800-d62e98f8d9ee.jpg	\N	31	\N	\N	\N	\N	2025-11-27 11:56:47.997
58	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/e016f855-f9a6-492b-a49c-5ca88b168092.jpg	\N	32	\N	\N	\N	\N	2025-11-27 11:58:11.79
59	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/ef00b4ab-56c9-414e-a80a-75972f514992.jpg	\N	33	\N	\N	\N	\N	2025-11-27 11:59:22.376
69	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/ab2a111e-3a66-470d-b962-5428f592fafc.jpg	3	\N	\N	\N	\N	\N	2025-11-27 13:15:57.845
70	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/c17c3748-3161-4c19-a1b5-32cf416808bd.jpg	3	\N	\N	\N	\N	\N	2025-11-27 13:15:57.845
71	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/73302ec4-0830-4e49-9b72-66daa8bf9518.jpg	3	\N	\N	\N	\N	\N	2025-11-27 13:15:57.845
72	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/3cad0a3c-87fa-450a-b3ba-162eaf446eec.jpg	3	\N	\N	\N	\N	\N	2025-11-27 13:15:57.845
73	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/895e7210-6630-4e33-8235-880498c0a9d4.jpg	3	\N	\N	\N	\N	\N	2025-11-27 13:15:57.845
74	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/ff128e5c-4d48-4a42-aee5-0dbbe662b394.jpg	3	\N	\N	\N	\N	\N	2025-11-27 13:15:57.845
75	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/7db9fcd1-4551-4e02-bc21-6c618b73297e.jpg	3	\N	\N	\N	\N	\N	2025-11-27 13:15:57.845
76	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/da9e0545-27cd-46d8-add5-2a730c95f119.jpg	3	\N	\N	\N	\N	\N	2025-11-27 13:15:57.845
77	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/ee7c4ecd-bc95-4316-80e0-85f1947298c3.jpg	3	\N	\N	\N	\N	\N	2025-11-27 13:15:57.845
78	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/2a8ea8df-d57b-460c-8a8e-af6b39cf6dcd.jpg	\N	35	\N	\N	\N	\N	2025-11-27 13:18:00.913
79	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/d7fee7ec-69b6-412d-b107-6000704eecff.jpg	\N	36	\N	\N	\N	\N	2025-11-27 13:20:08.899
80	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/9eab1c3f-6fe7-4353-98bd-26dabc8c89cc.jpg	\N	37	\N	\N	\N	\N	2025-11-27 13:21:24.364
81	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/12084846-022a-4c42-9885-0ebbf9f4131b.jpg	\N	38	\N	\N	\N	\N	2025-11-27 13:23:47.738
82	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/2fc34b4d-344f-42ac-959c-2ba7445b50f9.jpg	\N	39	\N	\N	\N	\N	2025-11-27 13:28:10.21
83	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/81d0618b-778c-4eff-a1be-db307f2eb9df.jpg	\N	40	\N	\N	\N	\N	2025-11-27 13:30:17.683
84	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/512e8a90-a8aa-4a32-afa0-38e63fce4ac9.jpg	\N	41	\N	\N	\N	\N	2025-11-27 13:31:49.433
85	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/fd03ad18-93ab-4c36-87e2-52703b28ab55.jpg	\N	42	\N	\N	\N	\N	2025-11-27 13:33:58.667
86	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/ae3c4f5b-18fa-417a-8e5c-eb6b197f4329.jpg	\N	43	\N	\N	\N	\N	2025-11-27 13:37:14.468
87	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/db47961d-ca3d-4ba1-997e-a47469a14d7a.jpg	\N	44	\N	\N	\N	\N	2025-11-27 13:38:42.582
88	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/b0602aef-0d5e-4413-b198-36100edbb99b.jpg	\N	45	\N	\N	\N	\N	2025-11-27 13:40:08.947
89	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/1edada4f-4081-4fc6-b823-66e5d75d893f.jpg	\N	46	\N	\N	\N	\N	2025-11-27 13:41:54.693
90	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/b48e7004-20b5-423d-b255-ae257feea219.jpg	\N	47	\N	\N	\N	\N	2025-11-27 13:43:26.039
91	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/8bbea29a-ecb9-424d-baad-9c8572fc51c6.jpg	\N	48	\N	\N	\N	\N	2025-11-27 13:45:16.166
92	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/adf0cfed-cded-4711-9513-eda02a084b90.jpg	\N	49	\N	\N	\N	\N	2025-11-27 13:47:15.543
93	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/629c4e8a-3aec-488c-8e64-1b413501d76a.jpg	\N	50	\N	\N	\N	\N	2025-11-27 13:49:24.801
94	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/eb646db5-29d1-4519-aa33-e66014d23f24.jpg	\N	51	\N	\N	\N	\N	2025-11-27 13:51:38.685
95	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/a312af14-6ceb-4c79-826a-7fc0e9e6f398.jpg	\N	52	\N	\N	\N	\N	2025-11-27 13:53:55.068
96	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/307b20a5-b3c9-41e9-ac13-c226b3ef584a.jpg	\N	53	\N	\N	\N	\N	2025-11-27 13:55:28.341
97	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/c7545454-399d-40d1-9ed7-045efa2a26fd.jpg	\N	54	\N	\N	\N	\N	2025-11-27 13:57:05.585
98	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/ec7309b9-9150-4fe4-94e0-e36e9befeddf.jpg	\N	55	\N	\N	\N	\N	2025-11-27 13:58:39.308
507	https://platina.vtcrm.ru/uploads/Photos/21/67caa5f654b8a.jpeg	\N	\N	\N	\N	4	\N	2025-11-29 15:01:38.977
508	https://platina.vtcrm.ru/uploads/Photos/21/67caa5f666551.jpeg	\N	\N	\N	\N	4	\N	2025-11-29 15:01:38.977
509	https://platina.vtcrm.ru/uploads/Photos/21/67caa5f677b10.jpeg	\N	\N	\N	\N	4	\N	2025-11-29 15:01:38.977
510	https://platina.vtcrm.ru/uploads/Photos/21/67caa5f69db0e.jpeg	\N	\N	\N	\N	4	\N	2025-11-29 15:01:38.977
511	https://platina.vtcrm.ru/uploads/Photos/21/67caa5f6b6958.jpeg	\N	\N	\N	\N	4	\N	2025-11-29 15:01:38.977
512	https://platina.vtcrm.ru/uploads/Photos/21/67caa5f6d1035.jpeg	\N	\N	\N	\N	4	\N	2025-11-29 15:01:38.977
513	https://platina.vtcrm.ru/uploads/Photos/21/67caa5f6e8eb8.jpeg	\N	\N	\N	\N	4	\N	2025-11-29 15:01:38.977
514	https://platina.vtcrm.ru/uploads/Photos/21/67caa5f727f0b.jpeg	\N	\N	\N	\N	4	\N	2025-11-29 15:01:38.977
515	https://platina.vtcrm.ru/uploads/Photos/21/67caa5f75f639.jpeg	\N	\N	\N	\N	4	\N	2025-11-29 15:01:38.977
522	https://platina.vtcrm.ru/uploads/Photos/27/phpw0fUtp.jpeg	\N	\N	\N	\N	5	\N	2025-11-29 15:06:39.371
523	https://platina.vtcrm.ru/uploads/Photos/27/phpuz40Dv.jpeg	\N	\N	\N	\N	5	\N	2025-11-29 15:06:39.371
524	https://platina.vtcrm.ru/uploads/Photos/68/phpr7W5uu.jpeg	\N	\N	1	\N	\N	\N	2025-11-29 15:31:02.485
525	https://platina.vtcrm.ru/uploads/Photos/68/phpbDcKOx.jpeg	\N	\N	1	\N	\N	\N	2025-11-29 15:31:02.485
99	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/859a2faf-8a9e-4c4b-b498-0cff34dc4873.jpg	\N	56	\N	\N	\N	\N	2025-11-27 14:00:57.232
100	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/92e77563-fb62-49e1-8d29-8d406a5b28a4.jpg	\N	56	\N	\N	\N	\N	2025-11-27 14:00:57.232
112	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/7a3334c9-bb77-410e-9ab4-047eee0290ec.jpg	\N	5	\N	\N	\N	\N	2025-11-28 08:02:21.425
113	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/8cb33ed0-011c-42a2-9b09-fbdbc65c1f73.jpg	\N	5	\N	\N	\N	\N	2025-11-28 08:02:21.425
114	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/020cad1c-d57c-4ce5-a99c-f06845a2ac3d.jpg	\N	5	\N	\N	\N	\N	2025-11-28 08:02:21.425
115	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/19884cef-891f-4640-8863-9c755114c541.jpg	\N	5	\N	\N	\N	\N	2025-11-28 08:02:21.425
116	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/ca56c18d-f5ef-43d2-9e0d-3062706ec383.jpg	\N	5	\N	\N	\N	\N	2025-11-28 08:02:21.425
117	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/3aa79412-506f-4dc4-b2ba-0c42b7d77f03.jpg	\N	5	\N	\N	\N	\N	2025-11-28 08:02:21.425
118	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/da3bf9d9-fecd-4d22-acb7-d4b5d0d8b924.jpg	\N	5	\N	\N	\N	\N	2025-11-28 08:02:21.425
119	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/f212edaf-f7bb-424c-a240-f63ac0dd3b13.jpg	5	\N	\N	\N	\N	\N	2025-11-28 08:03:57.785
120	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/b7126085-ceb5-4833-818f-4455c132bdde.jpg	5	\N	\N	\N	\N	\N	2025-11-28 08:03:57.785
121	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/166ccf12-5f59-4b10-8243-160a785f12fa.jpg	5	\N	\N	\N	\N	\N	2025-11-28 08:03:57.785
122	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/939981a8-f928-4a3e-8ddb-30caba6d53ab.jpg	5	\N	\N	\N	\N	\N	2025-11-28 08:03:57.785
123	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/1bdcb39d-d20e-441d-8ca8-7eff8246c67e.jpg	5	\N	\N	\N	\N	\N	2025-11-28 08:03:57.785
124	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/be6a3a7f-b59b-4bb4-a130-fe9f438474fc.jpg	5	\N	\N	\N	\N	\N	2025-11-28 08:03:57.785
125	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/0c1e919f-6990-4ffc-96bc-2af7c4698997.jpg	5	\N	\N	\N	\N	\N	2025-11-28 08:03:57.785
126	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/bc29c53c-3dba-4286-b2d9-91056b7f8785.jpg	\N	59	\N	\N	\N	\N	2025-11-28 08:05:03.081
127	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/87f1cb41-ed66-44e6-b917-4006efe3f0d7.jpg	\N	60	\N	\N	\N	\N	2025-11-28 08:06:50.821
128	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/3dbb6df5-5e99-4095-a383-8442251f67c2.jpg	\N	61	\N	\N	\N	\N	2025-11-28 08:08:07.533
129	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/e5af4b59-7567-4e97-bfb3-8c77371c4a1e.jpg	\N	62	\N	\N	\N	\N	2025-11-28 08:09:28.079
130	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/1bc0c739-ffa1-45e2-b236-7fc7dbe9b099.jpg	\N	63	\N	\N	\N	\N	2025-11-28 08:10:47.906
131	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/54d792de-29d5-4a72-a0b1-fcc74147cf25.jpg	\N	64	\N	\N	\N	\N	2025-11-28 08:11:47.61
132	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/0f95e43b-a9a5-4504-9a38-539dc48fb850.jpg	\N	65	\N	\N	\N	\N	2025-11-28 08:12:54.827
133	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/74f25677-4db8-4148-a6de-666ac0aeecb1.jpg	\N	66	\N	\N	\N	\N	2025-11-28 08:14:11.503
134	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/d1a89cb3-087d-4a6f-94e9-b1afae316656.jpg	\N	67	\N	\N	\N	\N	2025-11-28 08:15:20.669
135	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/068e40ea-0e86-4984-92e8-6aaa50a0ae5c.jpg	\N	68	\N	\N	\N	\N	2025-11-28 08:16:23.311
136	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/2d886008-594d-4ac0-ae41-934e294d837f.jpg	\N	69	\N	\N	\N	\N	2025-11-28 08:17:31.827
137	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/5a41cbff-d0ba-424f-9f33-1ef4cd3ab224.jpg	\N	70	\N	\N	\N	\N	2025-11-28 08:18:44.243
138	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/4c5285d9-7b3d-49c1-8ffc-ecd9815f2fe3.jpg	\N	71	\N	\N	\N	\N	2025-11-28 08:20:02.054
139	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/736ad8f0-ba06-412e-84a7-f0b6c136746c.jpg	\N	72	\N	\N	\N	\N	2025-11-28 08:21:18.113
140	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/1aef2a03-8242-4b79-97ad-5b69f74e7a39.jpg	\N	73	\N	\N	\N	\N	2025-11-28 08:22:13.539
141	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/1acc060b-277c-4376-9f5e-7ba6d9030b24.jpg	\N	74	\N	\N	\N	\N	2025-11-28 08:24:08.338
142	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/37fb6b59-e7d7-4526-a670-fa682fd91787.jpg	\N	75	\N	\N	\N	\N	2025-11-28 08:25:09.451
143	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/795343d4-2b42-4138-9671-e875c73c22be.jpg	\N	76	\N	\N	\N	\N	2025-11-28 08:26:06.393
144	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/6dad64bb-3b6e-42bb-9904-7fd6b3cda5f7.jpg	\N	77	\N	\N	\N	\N	2025-11-28 08:27:12.907
145	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/87c9fd5e-53db-4801-a693-70dabbbda309.jpg	\N	78	\N	\N	\N	\N	2025-11-28 08:28:13.52
146	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/ee26f8c3-e682-4475-983b-00c83a8aabd5.jpg	\N	79	\N	\N	\N	\N	2025-11-28 08:29:20.837
147	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/52b62c7a-7623-4bf4-90b3-523685d65d33.jpg	\N	80	\N	\N	\N	\N	2025-11-28 08:30:07.193
148	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/92b3d99a-8a2c-4d45-884e-b04d8ffff416.jpg	\N	81	\N	\N	\N	\N	2025-11-28 08:31:24.139
149	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/9c922d78-7bd7-49bd-99c7-01187d26f2a9.jpg	\N	82	\N	\N	\N	\N	2025-11-28 08:32:17.277
150	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/e7742b87-27b3-46ea-a549-9dce0a076a5b.jpg	\N	83	\N	\N	\N	\N	2025-11-28 08:33:11.781
151	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/0d8de902-4103-4e1e-a226-635b71e37e1e.jpg	\N	84	\N	\N	\N	\N	2025-11-28 08:35:21.45
152	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/e2afbcba-46e6-48b3-abd6-e2149a64e4d0.jpg	\N	85	\N	\N	\N	\N	2025-11-28 08:36:35.245
153	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/10c08705-9ec4-4dff-a523-a5c58d42637b.jpg	\N	86	\N	\N	\N	\N	2025-11-28 08:37:26.981
154	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/52f306ed-a796-49e1-b6fd-e0378a9ca74a.jpg	\N	87	\N	\N	\N	\N	2025-11-28 08:38:21.883
155	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/3fc2952d-d2d8-476b-93fe-2af899d7e82e.jpg	6	\N	\N	\N	\N	\N	2025-11-28 08:53:15.281
156	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/2d5ccb34-6f8c-46bd-af23-1d43ccfe7248.jpg	6	\N	\N	\N	\N	\N	2025-11-28 08:53:15.281
157	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/34dbf2d2-ee3d-4b82-a8c5-0d5de164cb99.jpg	6	\N	\N	\N	\N	\N	2025-11-28 08:53:15.281
158	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/2bb542a5-6299-4775-89d9-6bb8ce996f76.jpg	6	\N	\N	\N	\N	\N	2025-11-28 08:53:15.281
159	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/08a8cebe-c70a-400c-8cb5-65e4c52aeea8.jpg	6	\N	\N	\N	\N	\N	2025-11-28 08:53:15.281
160	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/3f0f72ad-316b-46ff-921c-2f34454bebc2.jpg	6	\N	\N	\N	\N	\N	2025-11-28 08:53:15.281
161	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/c3cd0980-08b7-4b4f-a6eb-26c64169aec3.jpg	6	\N	\N	\N	\N	\N	2025-11-28 08:53:15.281
162	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/a616cf84-12fd-44a9-82aa-50a99898b4da.jpg	6	\N	\N	\N	\N	\N	2025-11-28 08:53:15.281
163	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/c6d6e6d8-1109-40a0-bf5c-73e941af3eaa.jpg	\N	89	\N	\N	\N	\N	2025-11-28 08:57:49.845
164	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/10ebc159-d2c9-40f5-80b7-f12cccc49bed.jpg	\N	90	\N	\N	\N	\N	2025-11-28 09:00:03.914
165	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/c1247e27-4c06-4c1e-bc4c-69fff5806c1c.jpg	\N	91	\N	\N	\N	\N	2025-11-28 09:01:22.245
166	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/6c552dbe-4dd7-4670-b0e5-e80e914b8e9b.jpg	\N	92	\N	\N	\N	\N	2025-11-28 09:02:34.145
167	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/d12a9934-d115-4264-b240-1444337b2d7d.jpg	\N	93	\N	\N	\N	\N	2025-11-28 09:03:49.534
168	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/7377e1cc-ce2e-4039-b552-153533ffadd9.jpg	\N	94	\N	\N	\N	\N	2025-11-28 09:04:57.706
169	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/b1ed4261-e3cf-498f-8f24-81b51d5f7050.jpg	\N	95	\N	\N	\N	\N	2025-11-28 09:05:48.208
170	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/a25a5805-e3ba-4e97-a4f6-69a962abfb7f.jpg	\N	96	\N	\N	\N	\N	2025-11-28 09:06:48.273
171	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/a2cbc757-8c88-4ace-b2c7-32c9cff49f7d.jpg	\N	97	\N	\N	\N	\N	2025-11-28 09:07:39.359
172	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/da546820-abc7-4acd-a10c-e2c28a8418b0.jpg	\N	98	\N	\N	\N	\N	2025-11-28 09:08:50.287
173	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/ce9a66bc-c73d-4029-b321-59bda49043f4.jpg	\N	99	\N	\N	\N	\N	2025-11-28 09:09:57.229
174	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/0690d56e-a2bd-4287-b193-443c781f7f31.jpg	\N	100	\N	\N	\N	\N	2025-11-28 09:10:56.104
175	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/7da3232a-56c9-4899-854a-7728ee382186.jpg	\N	101	\N	\N	\N	\N	2025-11-28 09:25:41.075
176	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/6feb0467-630f-455b-90a3-9cf415938bef.jpg	\N	102	\N	\N	\N	\N	2025-11-28 09:26:42.928
177	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/00186c3e-6860-4360-b33b-a631ed362071.jpg	\N	103	\N	\N	\N	\N	2025-11-28 09:27:28.866
178	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/7799253b-5c7a-476b-8dea-c374a4619fbf.jpg	7	\N	\N	\N	\N	\N	2025-11-28 09:36:23.261
179	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/d29dbbc3-1b0f-47b7-8e4f-64a97aae8f49.jpg	7	\N	\N	\N	\N	\N	2025-11-28 09:36:23.261
180	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/6b75f285-b592-4573-a6fb-e1b4640e2f0e.jpg	7	\N	\N	\N	\N	\N	2025-11-28 09:36:23.261
181	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/8677ca87-ce46-4a0a-a0b3-60820e17357a.jpg	7	\N	\N	\N	\N	\N	2025-11-28 09:36:23.261
182	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/2ba99176-eb29-466d-85f3-354d7a9113bf.jpg	7	\N	\N	\N	\N	\N	2025-11-28 09:36:23.261
183	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/5187c4d6-1cfd-4faa-8735-fb4341eb3f37.jpg	7	\N	\N	\N	\N	\N	2025-11-28 09:36:23.261
184	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/464debaa-9312-494d-8c60-116bd9a4e73e.jpg	7	\N	\N	\N	\N	\N	2025-11-28 09:36:23.261
185	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/ccfba938-603b-4975-9990-d56808c9ce1e.jpg	7	\N	\N	\N	\N	\N	2025-11-28 09:36:23.261
186	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/c8e6370a-81e9-448d-8fdc-1b5fc3d25b21.jpg	\N	104	\N	\N	\N	\N	2025-11-28 09:38:41.208
187	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/7c6ed257-b36e-4883-9363-be30fe7d2e8f.jpg	\N	105	\N	\N	\N	\N	2025-11-28 09:39:29.069
188	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/da425d19-568f-4650-95c7-b518e9c4e5dc.jpg	\N	106	\N	\N	\N	\N	2025-11-28 09:40:04.366
189	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/c8962ff6-aba7-491c-87d2-547b0210a0e1.jpg	\N	107	\N	\N	\N	\N	2025-11-28 09:41:03.354
190	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/75fa3296-3fc5-4ee0-a892-964698f8a75a.jpg	\N	108	\N	\N	\N	\N	2025-11-28 09:41:56.336
191	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/f14f0b09-9d18-4c86-9582-7e4cf6c8af82.jpg	\N	109	\N	\N	\N	\N	2025-11-28 09:42:56.704
192	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/0e96f8c1-9818-4911-ab5e-349548f03f27.jpg	\N	110	\N	\N	\N	\N	2025-11-28 09:47:03.216
193	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/2972021d-391e-4cc1-a299-1c54d916866b.jpg	\N	111	\N	\N	\N	\N	2025-11-28 09:48:13.903
194	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/67ec78a7-dd0f-4675-a26a-5236d5f46585.jpg	\N	112	\N	\N	\N	\N	2025-11-28 09:49:42.19
195	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/ace493f5-944d-4ac5-a839-cc71d6717b0f.jpg	\N	113	\N	\N	\N	\N	2025-11-28 09:50:46.529
196	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/62b4242f-7f64-4968-8524-dfe4eff40496.jpg	\N	114	\N	\N	\N	\N	2025-11-28 09:52:13.922
197	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/f3d25cf1-59e6-4f62-a303-d94687c8c847.jpg	\N	115	\N	\N	\N	\N	2025-11-28 09:53:27.187
198	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/72401218-f2ba-499a-a49a-a02489899f65.jpg	\N	116	\N	\N	\N	\N	2025-11-28 09:54:24.393
199	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/cb86c24f-858c-4895-8cf4-8641f7236395.jpg	\N	117	\N	\N	\N	\N	2025-11-28 09:55:34.295
200	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/4e8d3b54-4da5-41cb-8692-1326756b1e71.jpg	\N	118	\N	\N	\N	\N	2025-11-28 09:56:43.374
201	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/a6ea1006-5a5f-4fa1-8dba-569f836ecfd8.jpg	\N	119	\N	\N	\N	\N	2025-11-28 09:57:45.39
202	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/1700fda0-2f23-4bd0-b468-7e4f8a024226.jpg	\N	120	\N	\N	\N	\N	2025-11-28 09:59:31.216
203	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/16994864-d13e-4ac7-a357-87cb0bdcf163.jpg	\N	121	\N	\N	\N	\N	2025-11-28 10:00:32.186
204	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/84f5e233-ab9d-466c-89ce-73b23fa2680f.jpg	\N	122	\N	\N	\N	\N	2025-11-28 10:04:24.269
205	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/56139ab9-2113-4de5-9b66-921161e8821d.jpg	\N	124	\N	\N	\N	\N	2025-11-28 10:05:11.339
206	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/dfa68ac6-4284-4430-943a-5eb94598245a.jpg	\N	123	\N	\N	\N	\N	2025-11-28 10:07:40.715
207	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/1d682822-be32-4e4e-bad6-8ccc7a714aa6.jpg	\N	125	\N	\N	\N	\N	2025-11-28 10:09:01.557
516	https://platina.vtcrm.ru/uploads/Photos/27/phpfnDZRx.jpeg	\N	\N	\N	\N	5	\N	2025-11-29 15:06:39.371
208	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/c4dbb7f9-8d87-4def-91c4-55a60d59087b.jpg	\N	126	\N	\N	\N	\N	2025-11-28 10:10:49.916
209	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/12cc9e41-20ba-4334-a720-eb5b8b6dbe89.jpg	8	\N	\N	\N	\N	\N	2025-11-28 10:17:27.155
210	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/bb15ca71-1ca2-43ba-bb04-28768b25a43a.jpg	8	\N	\N	\N	\N	\N	2025-11-28 10:17:27.155
211	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/0bea6765-371e-44db-acc5-aee429ff6e70.jpg	8	\N	\N	\N	\N	\N	2025-11-28 10:17:27.155
212	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/8ad94b13-9149-44de-ac18-933a98d91a40.jpg	8	\N	\N	\N	\N	\N	2025-11-28 10:17:27.155
213	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/d3e7ba11-4ce1-4c52-a85a-7cbf08dc2484.jpg	8	\N	\N	\N	\N	\N	2025-11-28 10:17:27.155
214	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/cbb6b3b1-9332-45a7-9bf7-5c5a7325e4b6.jpg	8	\N	\N	\N	\N	\N	2025-11-28 10:17:27.155
215	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/6f7cff16-4cd4-4024-934a-196654bb5c84.jpg	8	\N	\N	\N	\N	\N	2025-11-28 10:17:27.155
216	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/cfceeab3-e226-4076-8f03-2463b212cd03.jpg	\N	127	\N	\N	\N	\N	2025-11-28 10:19:32.506
217	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/670c4048-94e7-4ac2-8ba1-b5d9d390e16a.jpg	\N	128	\N	\N	\N	\N	2025-11-28 10:20:26.57
218	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/eb1a4e27-d7ad-47fd-abc3-a23019f84d82.jpg	\N	129	\N	\N	\N	\N	2025-11-28 10:21:35.931
219	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/531d8c6e-53cd-4f64-83ea-63ee27da59ad.jpg	\N	130	\N	\N	\N	\N	2025-11-28 10:22:39.529
220	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/69228aaf-79ee-450e-8fdd-9e152eec7720.jpg	\N	131	\N	\N	\N	\N	2025-11-28 10:23:37.742
221	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/aca94051-9a89-4d83-8641-0584c293ee16.jpg	\N	132	\N	\N	\N	\N	2025-11-28 10:24:31.423
222	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/05106eb7-3d9e-4892-b59e-ea55679f456f.jpg	\N	133	\N	\N	\N	\N	2025-11-28 10:25:21.794
223	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/3aa71365-472c-4df6-9bc7-22f867216e4e.jpg	\N	134	\N	\N	\N	\N	2025-11-28 10:26:27.028
224	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/912b80f0-f86a-4880-965f-306745be014e.jpg	\N	135	\N	\N	\N	\N	2025-11-28 10:27:17.747
225	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/97fa8e8a-355a-4638-a947-2bcf98a66151.jpg	\N	136	\N	\N	\N	\N	2025-11-28 10:28:12.937
226	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/2d65c30b-12b4-443f-8550-96ca674dd7f2.jpg	\N	137	\N	\N	\N	\N	2025-11-28 10:29:11.445
227	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/538986b6-f386-4658-a4ec-f296e2576f80.jpg	\N	138	\N	\N	\N	\N	2025-11-28 10:29:54.875
228	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/98ea8de7-bb06-4423-9801-d51285cd6d92.jpg	\N	139	\N	\N	\N	\N	2025-11-28 10:42:38.516
229	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/4fa47d1e-c4c2-40e7-b86a-71eb53e4bbb8.jpg	\N	140	\N	\N	\N	\N	2025-11-28 10:43:32.703
230	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/b4d38df6-7e9f-4d3a-846d-344dab23f88b.jpg	\N	141	\N	\N	\N	\N	2025-11-28 10:45:48.075
231	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/a060c0f5-99b5-4cab-a6c4-f9d507b949cd.jpg	\N	142	\N	\N	\N	\N	2025-11-28 10:47:11.811
232	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/6b43de25-3a53-42b3-89c1-613966591acd.jpg	\N	143	\N	\N	\N	\N	2025-11-28 10:48:03.891
233	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/eaf236a3-1298-484f-b445-d06eaea870d2.jpg	\N	144	\N	\N	\N	\N	2025-11-28 10:49:12.841
234	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/1430b9b9-7460-4068-987f-54c4967dfc62.jpg	\N	145	\N	\N	\N	\N	2025-11-28 10:49:58.92
235	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/1cf30516-a7ba-4574-aaa1-9673dd2b23d0.jpg	\N	146	\N	\N	\N	\N	2025-11-28 10:50:47.304
236	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/b7c9b6ed-11a2-4891-8a91-78c32ba92c6c.jpg	\N	147	\N	\N	\N	\N	2025-11-28 10:51:39.354
237	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/68a0af1f-40f7-426f-9c05-f49aef07f660.jpg	\N	148	\N	\N	\N	\N	2025-11-28 10:52:36.708
238	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/5b410e5b-45c6-4add-b8a6-f7882fb239d5.jpg	\N	149	\N	\N	\N	\N	2025-11-28 10:53:29.14
239	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/eb2eda7d-4a21-449a-a6ba-c3ca0cf6a6d3.jpg	\N	150	\N	\N	\N	\N	2025-11-28 10:54:26.871
240	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/3a80a095-a2e3-4096-9717-6a4c9a494e4b.jpg	\N	151	\N	\N	\N	\N	2025-11-28 10:55:17.897
241	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/ebe136fc-8078-4ee3-ae12-dbb623c75acd.jpg	\N	152	\N	\N	\N	\N	2025-11-28 10:56:16.954
242	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/a1fede89-f2e4-4861-a9eb-289fb0f5fed7.jpg	\N	153	\N	\N	\N	\N	2025-11-28 10:57:22.936
243	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/442d8930-434c-46f4-bc24-be5d7abc41ec.jpg	\N	154	\N	\N	\N	\N	2025-11-28 10:58:39.264
244	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/ee1e2e12-48e9-4daa-a687-1b57e7f0d95a.jpg	\N	155	\N	\N	\N	\N	2025-11-28 10:59:26.623
245	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/a6cd60f5-e7a2-4db9-9cf9-efbdee28e384.jpg	\N	156	\N	\N	\N	\N	2025-11-28 11:00:18.522
246	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/69db9249-3ee4-4b25-8ea4-bbec0af9fbdd.jpg	\N	157	\N	\N	\N	\N	2025-11-28 11:01:15.92
247	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/c95b5102-a7c1-4daa-ac53-c4f9099ff1dc.jpg	\N	158	\N	\N	\N	\N	2025-11-28 11:03:26.863
248	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/dfe4eb39-7852-44cf-8f35-c3d117d37deb.jpg	\N	159	\N	\N	\N	\N	2025-11-28 11:04:15.118
249	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/d3eb4a74-5ef5-4716-8b39-1ed7dd91725c.jpg	9	\N	\N	\N	\N	\N	2025-11-28 11:10:14.422
250	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/3b5f3286-57d6-401c-af51-03c63689ad34.jpg	9	\N	\N	\N	\N	\N	2025-11-28 11:10:14.422
251	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/5f6ca0a0-2410-4f02-9093-680382c66a1a.jpg	9	\N	\N	\N	\N	\N	2025-11-28 11:10:14.422
252	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/98dbd11c-4ab8-415c-a8b7-372dd9fa5d78.jpg	9	\N	\N	\N	\N	\N	2025-11-28 11:10:14.422
253	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/7e2b7036-64a4-46bb-b675-e3fab61fcf17.jpg	9	\N	\N	\N	\N	\N	2025-11-28 11:10:14.422
254	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/855667ce-1d7d-45fa-ae74-f27578c9ab78.jpg	9	\N	\N	\N	\N	\N	2025-11-28 11:10:14.422
255	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/a336e315-c81e-4d47-83aa-d49f400f9fad.jpg	9	\N	\N	\N	\N	\N	2025-11-28 11:10:14.422
256	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/b6071d05-5f21-4033-8a03-92572fbfef3a.jpg	\N	160	\N	\N	\N	\N	2025-11-28 11:12:18.347
517	https://platina.vtcrm.ru/uploads/Photos/27/phpPTt7oy.jpeg	\N	\N	\N	\N	5	\N	2025-11-29 15:06:39.371
257	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/5d20d18f-c845-47c7-ae6c-0b1a1802f286.png	\N	161	\N	\N	\N	\N	2025-11-28 11:13:48.672
258	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/93e8c3e0-d7a7-4400-9cd3-365aef4d2d1e.png	\N	162	\N	\N	\N	\N	2025-11-28 11:14:36.295
259	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/adcfe2c0-6a48-4c6b-82d9-a0223190702c.png	\N	163	\N	\N	\N	\N	2025-11-28 11:15:24.653
260	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/73f018cf-b7d9-4dba-a403-6d64486f99ab.png	\N	164	\N	\N	\N	\N	2025-11-28 11:16:19.215
261	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/4d4efe85-01b8-4a4e-94d1-20b0f21a6bfa.png	\N	165	\N	\N	\N	\N	2025-11-28 11:17:38.527
262	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/3df7e723-d741-442b-a4d7-d75574fceb3b.jpg	10	\N	\N	\N	\N	\N	2025-11-28 11:23:02.207
263	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/efc20d73-a7df-436e-975f-3c3c611e1665.jpg	10	\N	\N	\N	\N	\N	2025-11-28 11:23:02.207
264	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/c78833d2-ee55-40d8-b400-14b57d464f84.jpg	10	\N	\N	\N	\N	\N	2025-11-28 11:23:02.207
265	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/f4447302-7ed9-4a12-b54e-8850e5bf6839.jpg	10	\N	\N	\N	\N	\N	2025-11-28 11:23:02.207
266	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/8988fea3-23d1-4d86-a4d9-42437f16aa3c.jpg	10	\N	\N	\N	\N	\N	2025-11-28 11:23:02.207
267	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/a2e55df8-2efe-4f75-bffe-5337e2dc1ce3.jpg	\N	166	\N	\N	\N	\N	2025-11-28 11:26:17.547
268	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/b071a5cc-1249-4ec6-bdab-8f8400e14cb4.jpg	\N	167	\N	\N	\N	\N	2025-11-28 11:27:27.417
269	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/d66f954e-24ac-49c5-bb07-4e4b492415df.jpg	\N	168	\N	\N	\N	\N	2025-11-28 11:28:19.978
270	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/7ce856ae-161b-40c8-aed3-bc2b725399a1.jpg	\N	169	\N	\N	\N	\N	2025-11-28 11:29:12.213
271	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/bec5bec0-1cd4-471b-bde5-53bc02f56af8.jpg	\N	170	\N	\N	\N	\N	2025-11-28 11:30:13.003
272	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/f6194f36-5ceb-4f0c-809a-235d2092ef9d.jpg	\N	171	\N	\N	\N	\N	2025-11-28 11:31:06.315
273	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/103bb8b8-ed7b-43a4-b96a-be9830512f35.jpg	\N	172	\N	\N	\N	\N	2025-11-28 11:31:58.482
274	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/4c87967b-f5cd-4c7c-ad86-904f7ec39cef.jpg	\N	173	\N	\N	\N	\N	2025-11-28 11:32:47.804
275	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/d9a16e91-1161-471f-82fb-155ccefb6e57.jpg	\N	174	\N	\N	\N	\N	2025-11-28 11:40:54.759
276	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/8b5db1ba-67fb-4327-ab59-896080902b59.jpg	\N	175	\N	\N	\N	\N	2025-11-28 11:41:59.412
277	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/eb970db0-6e70-4482-8cc6-f6803e85de67.jpg	\N	176	\N	\N	\N	\N	2025-11-28 11:43:29.967
278	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/4a2c6066-6c4d-49a7-9d06-f2eb00537c64.jpg	\N	177	\N	\N	\N	\N	2025-11-28 11:44:20.864
279	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/06f4e2cf-e1ed-4ec1-aa4b-faa5714f2abb.jpg	\N	178	\N	\N	\N	\N	2025-11-28 11:45:18.6
280	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/e453c680-088a-42e6-a9d3-92f5b0c3d312.jpg	\N	179	\N	\N	\N	\N	2025-11-28 11:46:05.039
281	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/0aca0764-4452-4d67-8cf7-f39f79d84c43.jpg	\N	180	\N	\N	\N	\N	2025-11-28 11:46:56.192
282	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/551d7de6-d4ff-4565-ba00-c7b42559c3e0.jpg	\N	181	\N	\N	\N	\N	2025-11-28 11:47:47.686
283	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/e59c665d-697b-42fd-abc5-873fca1646f6.jpg	\N	182	\N	\N	\N	\N	2025-11-28 11:48:36.908
284	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/1bf925a5-4d75-4e27-849d-9b32f65512b3.jpg	\N	183	\N	\N	\N	\N	2025-11-28 11:49:34.663
285	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/2ce24d23-5b2a-4961-850b-8436b58dac4c.jpg	\N	184	\N	\N	\N	\N	2025-11-28 11:50:30.804
286	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/3b2a07b7-ab93-4d9b-a97d-3b100ebfd70c.jpg	\N	185	\N	\N	\N	\N	2025-11-28 11:51:40.482
287	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/ab02de85-9c89-4d2c-ae62-c34a4f68afd7.jpg	\N	186	\N	\N	\N	\N	2025-11-28 11:53:09.799
288	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/9d716cdd-5b58-40fe-b418-e711aacf2533.jpg	\N	187	\N	\N	\N	\N	2025-11-28 11:54:06.127
289	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/eeb8e04d-bd35-48fe-938a-2754a385fc8d.jpg	\N	188	\N	\N	\N	\N	2025-11-28 11:54:50.309
290	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/451ea230-a6a3-4687-8550-f7198de88870.jpg	\N	189	\N	\N	\N	\N	2025-11-28 11:55:52.916
291	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/2e9fe2fe-af31-4cfc-8b7e-a3eca6628db0.jpg	\N	190	\N	\N	\N	\N	2025-11-28 11:56:42.41
292	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/cef71168-f819-4ca3-9839-336b428412b1.jpg	\N	191	\N	\N	\N	\N	2025-11-28 11:57:44.275
293	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/c0cc5156-ae02-4eb0-b39d-629dccf161bf.jpg	11	\N	\N	\N	\N	\N	2025-11-28 12:04:37.978
294	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/0af40ded-b144-4869-a299-a16e13aaa5fb.jpg	11	\N	\N	\N	\N	\N	2025-11-28 12:04:37.978
295	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/f8c63f2d-1387-4d10-b35c-58b4a366a8bc.jpg	11	\N	\N	\N	\N	\N	2025-11-28 12:04:37.978
296	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/3f40359d-aaba-451c-97c3-386f29ba886f.jpg	11	\N	\N	\N	\N	\N	2025-11-28 12:04:37.978
297	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/0337e4d2-cf7a-428e-8fdd-9b4929928916.jpg	11	\N	\N	\N	\N	\N	2025-11-28 12:04:37.978
298	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/61a2d60b-d540-42fc-b5fc-9b148f66ee72.jpg	\N	192	\N	\N	\N	\N	2025-11-28 12:06:08.815
299	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/8ebed107-a079-43bb-b7b0-ef8c4292fe01.jpg	\N	193	\N	\N	\N	\N	2025-11-28 12:06:53.07
300	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/15791b92-2914-4028-b70a-95cd1ec6b0fa.jpg	12	\N	\N	\N	\N	\N	2025-11-28 12:10:30.665
301	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/57f0ed16-36ec-416a-8153-829c16b1c5cb.jpg	12	\N	\N	\N	\N	\N	2025-11-28 12:10:30.665
302	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/55bd9cd8-5326-4d00-8721-5213cfaf004b.jpg	12	\N	\N	\N	\N	\N	2025-11-28 12:10:30.665
303	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/93a80be8-a273-4fe7-b5d0-326e227ef6c2.jpg	12	\N	\N	\N	\N	\N	2025-11-28 12:10:30.665
304	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/8efa3dc9-0de3-4339-9f0c-1a173a449914.jpg	12	\N	\N	\N	\N	\N	2025-11-28 12:10:30.665
305	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/330f9682-2f6b-422a-a91c-69a5e628e8f9.jpg	\N	194	\N	\N	\N	\N	2025-11-28 12:12:04.897
518	https://platina.vtcrm.ru/uploads/Photos/27/phpVkswF8.jpeg	\N	\N	\N	\N	5	\N	2025-11-29 15:06:39.371
306	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/6f905327-dedb-4130-98bd-787e03bb1333.jpg	\N	195	\N	\N	\N	\N	2025-11-28 12:13:08.497
307	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/799e2c45-2f55-4939-bb2c-92f4a2ca512c.jpg	\N	196	\N	\N	\N	\N	2025-11-28 12:14:37.68
308	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/19d20670-44ab-44a7-90e3-70b83b46aa9c.jpg	\N	197	\N	\N	\N	\N	2025-11-28 12:15:23.533
309	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/c70a0fe5-bab4-4275-ae01-dbb6a6f98113.jpg	\N	198	\N	\N	\N	\N	2025-11-28 12:16:15.188
310	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/1391c94f-addb-49e5-b56d-f322fafd12c4.jpg	\N	199	\N	\N	\N	\N	2025-11-28 12:17:11.501
311	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/f199dbb2-a632-4ede-abd4-0f7416a1afcf.jpg	\N	200	\N	\N	\N	\N	2025-11-28 12:18:23.685
312	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/ab7c63a0-4f95-4d10-bee7-fcb0402ece9f.jpg	\N	201	\N	\N	\N	\N	2025-11-28 12:19:26.548
313	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/e4924b3b-4d3f-47d1-beda-99586a3b8603.jpg	\N	202	\N	\N	\N	\N	2025-11-28 12:20:20.629
314	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/31ead15d-030a-48e8-97a7-93720f71e55b.jpg	\N	203	\N	\N	\N	\N	2025-11-28 12:21:33.347
315	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/131cea98-9379-40ea-a559-3e3bb407eaad.jpg	\N	204	\N	\N	\N	\N	2025-11-28 12:22:26.947
316	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/34b90c21-fa5f-46cc-9fd3-686e0f1714b9.jpg	\N	205	\N	\N	\N	\N	2025-11-28 12:23:19.414
317	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/1f92d2d5-3b1b-429e-a106-2651f2af7691.jpg	\N	206	\N	\N	\N	\N	2025-11-28 12:24:21.986
318	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/20bc7ddb-e2e2-4529-9143-1c141ce5fe90.jpg	\N	207	\N	\N	\N	\N	2025-11-28 12:25:14.451
319	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/e20a8a91-8574-4d04-9ef9-9eef73ef6cb1.jpg	\N	208	\N	\N	\N	\N	2025-11-28 12:26:01.296
320	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/132309ea-dd10-4d52-ad5a-1f8e32468a4f.jpg	\N	209	\N	\N	\N	\N	2025-11-28 12:26:47.913
321	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/7ef0e21c-5978-4939-aac9-63a0b31bb703.jpg	\N	210	\N	\N	\N	\N	2025-11-28 12:27:50.084
322	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/d2970880-ff32-4887-bc3c-3f060e949be1.jpg	\N	211	\N	\N	\N	\N	2025-11-28 12:28:38.247
323	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/baf6072a-8a83-4a9d-92ab-db67c0c2dde6.jpg	\N	212	\N	\N	\N	\N	2025-11-28 12:29:25.687
324	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/c0ee3440-2c65-4dbd-ac5d-071f25636f02.jpg	\N	213	\N	\N	\N	\N	2025-11-28 12:30:21.755
325	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/5fee0ec2-f814-4675-8cb2-45579d31c863.jpg	\N	214	\N	\N	\N	\N	2025-11-28 12:31:15.804
326	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/837fe869-88b2-4eb2-80f3-93431d9f17ea.jpg	\N	215	\N	\N	\N	\N	2025-11-28 12:32:11.493
327	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/5d7d8290-10b6-4509-9330-2792a124a8ef.jpg	\N	216	\N	\N	\N	\N	2025-11-28 12:33:13.797
328	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/8a977955-d980-4d5e-9501-e4957d02a37d.jpg	\N	217	\N	\N	\N	\N	2025-11-28 12:34:04.12
329	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/634ac2d9-107e-4b6b-8c5e-07d470056cb6.jpg	\N	218	\N	\N	\N	\N	2025-11-28 12:34:51.656
330	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/0e26e8c2-f32e-4677-9d2d-0ce36541dc8c.jpg	\N	219	\N	\N	\N	\N	2025-11-28 12:35:49.511
331	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/0f02fedf-fa58-4c38-a123-a2d55570a312.jpg	\N	220	\N	\N	\N	\N	2025-11-28 12:36:51.83
332	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/9cfaf38d-d9be-494f-9516-b3d292494680.jpg	\N	221	\N	\N	\N	\N	2025-11-28 12:37:47.921
333	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/7608387c-912d-4a80-a034-e579214634ec.jpg	\N	222	\N	\N	\N	\N	2025-11-28 12:38:45.568
334	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/d8919037-e65a-4bf2-81ad-8bca54c5c47b.jpg	\N	223	\N	\N	\N	\N	2025-11-28 12:40:07.269
335	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/5f0261a1-40f0-4868-be79-023632a5ae32.jpg	\N	224	\N	\N	\N	\N	2025-11-28 12:40:57.47
336	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/ba45c891-3b5d-4846-a8c8-e434f510af6b.jpg	\N	225	\N	\N	\N	\N	2025-11-28 12:41:37.422
337	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/c2864541-9b07-4e34-8f8c-9e4479501c2d.jpg	\N	226	\N	\N	\N	\N	2025-11-28 12:42:26.627
338	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/66da83dd-d216-45e9-8081-257c880ab5a7.jpg	\N	227	\N	\N	\N	\N	2025-11-28 12:43:21.666
339	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/9db0f02e-7ea4-4451-8c80-a051945edc9d.jpg	\N	228	\N	\N	\N	\N	2025-11-28 12:44:04.255
340	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/af4f572b-0641-448d-86fe-d7e7b8455865.jpg	\N	229	\N	\N	\N	\N	2025-11-28 12:45:21.525
341	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/d41b84cb-50a4-43bc-a628-12f3c050d271.jpg	\N	230	\N	\N	\N	\N	2025-11-28 12:48:13.801
342	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/00b02e8c-1acb-4491-9a0f-3d776be7e235.jpg	\N	231	\N	\N	\N	\N	2025-11-28 12:49:07.124
343	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/b7f88d53-63bc-47e9-bb68-4d2833078f49.jpg	\N	232	\N	\N	\N	\N	2025-11-28 12:50:42.158
344	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/575262dc-17c2-4ec3-97be-7093e4f2d8c0.jpg	\N	233	\N	\N	\N	\N	2025-11-28 12:51:31.574
345	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/903cebd9-d4de-466e-a4ec-379f61766850.jpg	13	\N	\N	\N	\N	\N	2025-11-28 12:57:58.971
346	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/3ae0c025-7a4f-4beb-832b-b1828c8a9dfc.jpg	13	\N	\N	\N	\N	\N	2025-11-28 12:57:58.971
347	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/b0e2d8fd-95ec-42e7-8352-5e7826c66df4.jpg	13	\N	\N	\N	\N	\N	2025-11-28 12:57:58.971
348	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/ea9ffbd6-d478-4d05-96df-2ec6185a827a.jpg	13	\N	\N	\N	\N	\N	2025-11-28 12:57:58.971
349	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/b957f3cd-6785-44ad-8015-611e805e440e.jpg	13	\N	\N	\N	\N	\N	2025-11-28 12:57:58.971
350	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/fada49cc-6a26-485e-bb12-8836cf2d00d9.jpg	13	\N	\N	\N	\N	\N	2025-11-28 12:57:58.971
351	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/7b30623b-8166-4177-9e66-1c4dfb1c8f95.jpg	\N	234	\N	\N	\N	\N	2025-11-28 13:00:17.773
352	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/a3655bd1-be22-4ac7-a1ab-a71c7cee9725.jpg	\N	235	\N	\N	\N	\N	2025-11-28 13:01:09.71
353	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/9df3d3e6-3c20-4bae-a400-03ab4809417b.jpg	\N	236	\N	\N	\N	\N	2025-11-28 13:02:05.186
354	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/9440c3be-ff85-4c72-b80b-97a7781eb256.jpg	\N	237	\N	\N	\N	\N	2025-11-28 13:02:51.116
519	https://platina.vtcrm.ru/uploads/Photos/27/phpEymLGN.jpeg	\N	\N	\N	\N	5	\N	2025-11-29 15:06:39.371
355	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/323dd19b-0ff1-432e-80cd-8b4a8772d4ee.jpg	\N	238	\N	\N	\N	\N	2025-11-28 13:03:51.648
356	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/39424b43-796b-4a17-9e98-1400dcdf26c8.jpg	\N	239	\N	\N	\N	\N	2025-11-28 13:04:40.127
357	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/9208c76c-a863-40be-adbf-e56bbc501c77.jpg	\N	240	\N	\N	\N	\N	2025-11-28 13:10:16.794
358	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/f8b26968-7ef9-4dc6-9e0b-b5c4ab68b974.jpg	\N	241	\N	\N	\N	\N	2025-11-28 13:12:40.912
359	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/8d581ed7-64de-445a-95ba-82a6b7bac76e.jpg	\N	242	\N	\N	\N	\N	2025-11-28 13:13:46.989
360	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/06c3a50a-7a82-4c11-8b88-94648f1b6a63.jpg	\N	243	\N	\N	\N	\N	2025-11-28 13:14:33.567
361	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/2e6e9adb-5dd1-4abd-8b7a-a1c93303cede.jpg	\N	244	\N	\N	\N	\N	2025-11-28 13:15:14.292
362	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/7d7bd96e-893f-44af-9dfc-b28b1e503932.jpg	\N	245	\N	\N	\N	\N	2025-11-28 13:15:55.175
363	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/e724ddad-5440-454f-8c8a-da7d1ec3237c.jpg	\N	246	\N	\N	\N	\N	2025-11-28 13:16:47.277
364	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/e5a9caaf-1cc4-45f3-8019-50a7a0687d0c.jpg	\N	247	\N	\N	\N	\N	2025-11-28 13:17:56.44
365	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/3897fe97-b87c-4ce2-8ee1-9eea17523473.jpg	\N	248	\N	\N	\N	\N	2025-11-28 13:18:48.682
366	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/4526c2b1-9bca-4798-80a2-5b5e22709555.jpg	\N	249	\N	\N	\N	\N	2025-11-28 13:19:34.513
367	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/7a7803a1-1c3e-48d7-bd8d-e5230b2f0909.jpg	\N	250	\N	\N	\N	\N	2025-11-28 13:20:26.065
368	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/71ce8f00-3838-47bd-bbfd-fd23d8c861bf.jpg	\N	251	\N	\N	\N	\N	2025-11-28 13:21:21.34
369	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/0f767481-689f-434a-a472-94e6b3917509.jpg	\N	252	\N	\N	\N	\N	2025-11-28 13:22:03.251
370	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/2d34c1f6-f059-46c8-89ae-1e40c278fd6f.jpg	\N	253	\N	\N	\N	\N	2025-11-28 13:22:54.019
371	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/f9c5b55e-b7ac-47ff-a75f-ebd7e3588997.jpg	\N	254	\N	\N	\N	\N	2025-11-28 13:23:43.577
372	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/f0aa0c90-8717-4b92-a9e0-d90e513d6e80.jpg	\N	255	\N	\N	\N	\N	2025-11-28 13:24:39.398
373	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/db50b197-c8e1-44d7-a1cc-7acd8e87648d.jpg	\N	256	\N	\N	\N	\N	2025-11-28 13:25:28.077
374	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/822f699e-dd9f-4496-a34a-b1cc76c2531e.jpg	\N	257	\N	\N	\N	\N	2025-11-28 13:26:19.816
375	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/b8cbc8b6-697e-4aa0-9822-bf46436fb249.jpg	\N	258	\N	\N	\N	\N	2025-11-28 13:27:20.517
376	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/5fb37380-b8c8-4ddc-962d-bbbc81bbde9a.jpg	\N	259	\N	\N	\N	\N	2025-11-28 13:28:08.485
377	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/ceedfc11-07bd-4cff-87d9-fe7bac3bdff4.jpg	\N	260	\N	\N	\N	\N	2025-11-28 13:28:55.14
378	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/31acd40e-1c43-4305-9240-dee677b5297f.jpg	\N	261	\N	\N	\N	\N	2025-11-28 13:29:39.561
379	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/1edd2e37-769c-496a-a02d-cf4a82c49c82.jpg	\N	262	\N	\N	\N	\N	2025-11-28 13:30:26.215
380	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/097f0e0c-62c0-41da-b22a-bf9736070185.jpg	\N	263	\N	\N	\N	\N	2025-11-28 13:31:06.35
381	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/ee2227d2-4f2c-4629-8311-3a45c61d7d25.jpg	\N	264	\N	\N	\N	\N	2025-11-28 13:32:26.796
382	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/9d293b46-f172-4256-b6b6-e6de81f6053b.jpg	\N	265	\N	\N	\N	\N	2025-11-28 13:33:16.847
383	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/8775b075-3c77-42f3-98a9-7b53a3922c0e.jpg	\N	266	\N	\N	\N	\N	2025-11-28 13:33:24.132
384	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/ba7e15ed-a81f-4159-a16d-6b4e82afe2ab.jpg	\N	267	\N	\N	\N	\N	2025-11-28 13:34:20.879
385	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/121ec1ac-4749-4689-8b81-a5620b4dd470.jpg	14	\N	\N	\N	\N	\N	2025-11-28 13:39:30.873
386	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/1f9f411b-6160-4111-8940-8dbf4c35a7e9.jpg	14	\N	\N	\N	\N	\N	2025-11-28 13:39:30.873
387	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/5d9a8f88-0b20-4ed6-a156-23122050acf5.jpg	14	\N	\N	\N	\N	\N	2025-11-28 13:39:30.873
388	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/3a45dce9-79be-4d09-bbce-ed509522d550.jpg	14	\N	\N	\N	\N	\N	2025-11-28 13:39:30.873
389	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/eabeb2eb-e2ec-445f-ab5f-fab5589634d2.jpg	14	\N	\N	\N	\N	\N	2025-11-28 13:39:30.873
390	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/0ed06832-10be-4bcb-91d1-cb43d3b523d8.jpg	\N	268	\N	\N	\N	\N	2025-11-28 13:41:15.028
391	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/efeff18b-0606-466e-92a1-cbf0f91e58fb.jpg	\N	269	\N	\N	\N	\N	2025-11-28 13:42:14.108
392	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/a11058a6-bb44-47de-b755-6fe01a241cc2.jpg	\N	270	\N	\N	\N	\N	2025-11-28 13:45:16.533
393	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/8cacf384-104d-4aee-849e-c9532fc78768.jpg	\N	271	\N	\N	\N	\N	2025-11-28 13:45:53.472
394	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/5124c2c8-8749-4cf2-9ad3-9f1a887096bf.jpg	\N	272	\N	\N	\N	\N	2025-11-28 13:46:43.364
395	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/68f42984-3af6-4fe5-acf6-8377909d736f.jpg	\N	273	\N	\N	\N	\N	2025-11-28 13:47:32.467
396	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/7020ef4f-89b5-4408-ad9e-67a9f7a3c5c2.jpg	14	\N	\N	\N	\N	\N	2025-11-28 13:50:41.878
397	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/a6c2eff5-e74d-478d-bf3a-96c390c95573.jpg	\N	274	\N	\N	\N	\N	2025-11-28 14:12:35.893
398	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/8536ef96-bbf2-4381-8bf7-bbd49b2b80a6.jpg	\N	275	\N	\N	\N	\N	2025-11-28 14:14:13.792
399	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/4a51cbbe-4ff7-4c14-b297-0852baa49f54.jpg	\N	276	\N	\N	\N	\N	2025-11-28 14:15:22.895
400	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/c2bfaf2a-9a00-4f01-8842-4048a684668a.jpg	\N	277	\N	\N	\N	\N	2025-11-28 14:16:18.966
401	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/d90f7d07-33dc-494e-aa47-e8cbe848eadc.jpg	\N	278	\N	\N	\N	\N	2025-11-28 14:17:12.743
402	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/0f850126-9f9b-4ff9-8fd3-23426b12f88b.jpg	\N	279	\N	\N	\N	\N	2025-11-28 14:18:27.062
403	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/779185c5-5a20-4caf-a743-7ab5e03e2a97.jpg	\N	280	\N	\N	\N	\N	2025-11-28 14:19:27.544
520	https://platina.vtcrm.ru/uploads/Photos/27/phpyt1qNu.jpeg	\N	\N	\N	\N	5	\N	2025-11-29 15:06:39.371
404	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/a3428813-6890-40e9-a394-3d3508f8504a.jpg	\N	281	\N	\N	\N	\N	2025-11-28 14:20:17.637
405	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/5796a984-f660-40f2-ac58-56794d43e4e3.jpg	\N	282	\N	\N	\N	\N	2025-11-28 14:21:04.553
406	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/7d4eae34-709b-4a45-a826-f353d1e35cf3.jpg	\N	283	\N	\N	\N	\N	2025-11-28 14:21:54.397
407	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/69d6b217-1622-4237-9619-3bf0f3d48fcc.jpg	\N	284	\N	\N	\N	\N	2025-11-28 14:23:00.852
408	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/cf404653-398e-4f9b-a903-3b164d2df0a7.jpg	\N	285	\N	\N	\N	\N	2025-11-28 14:24:23.964
409	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/7b4b6db2-4892-407d-a3f1-90e28b581d12.jpg	\N	286	\N	\N	\N	\N	2025-11-28 14:25:24.495
410	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/35160141-ca75-42a3-a11a-168e51235e44.jpg	\N	288	\N	\N	\N	\N	2025-11-28 14:26:59.39
411	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/b92b8efd-1e35-4f78-9b6c-c843a6e275dc.jpg	\N	287	\N	\N	\N	\N	2025-11-28 14:27:09.551
412	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/b1bf2514-f26b-4e85-a3d0-ac86fc6907dd.jpg	\N	288	\N	\N	\N	\N	2025-11-28 14:28:14.081
413	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/971d395a-4801-4a26-b9cb-d3acea62fdfa.jpg	\N	290	\N	\N	\N	\N	2025-11-28 14:29:15.139
414	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/bdefe4ff-069a-46be-b3a7-02f138a7467a.jpg	\N	289	\N	\N	\N	\N	2025-11-28 14:29:37.505
415	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/c2a8cf3d-e1d2-4deb-8f4b-84f965e9ab00.jpg	\N	291	\N	\N	\N	\N	2025-11-28 14:30:21.298
416	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/9f65d4c2-fd27-41e5-8541-4887d524ed4d.jpg	\N	292	\N	\N	\N	\N	2025-11-28 14:31:25.388
417	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/51c53d09-3b34-4882-be10-bf0cf43172d3.jpg	\N	293	\N	\N	\N	\N	2025-11-28 14:32:12.279
418	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/4d4869b4-9247-4baf-a5a9-13443c55d534.jpg	\N	294	\N	\N	\N	\N	2025-11-28 14:33:04.047
419	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/e13df4db-4ace-4bc0-add3-c5f740c05fc3.jpg	\N	295	\N	\N	\N	\N	2025-11-28 14:33:58.592
420	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/7e3dd27f-c420-439f-8f70-ca0fe39d35aa.jpg	\N	296	\N	\N	\N	\N	2025-11-28 14:34:37.85
421	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/89958399-5580-4e33-87c6-3253a8f8418c.jpg	\N	297	\N	\N	\N	\N	2025-11-28 14:35:25.799
422	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/36ad9873-2c9c-440c-9650-aab1bb3da94b.jpg	\N	298	\N	\N	\N	\N	2025-11-28 14:36:23.973
423	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/37a377ae-5c01-4915-874c-1205a05f926b.jpg	\N	299	\N	\N	\N	\N	2025-11-28 14:37:33.175
424	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/8f8a6147-d256-4629-b2f5-2ca2b72f2ba3.jpg	\N	300	\N	\N	\N	\N	2025-11-28 14:38:22.939
425	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/03dca199-933a-4844-a4d0-8555ff317440.jpg	\N	301	\N	\N	\N	\N	2025-11-28 14:39:26.708
426	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/5e859785-0358-4aa7-ab6f-68cab3b62031.jpg	\N	302	\N	\N	\N	\N	2025-11-28 14:40:17.783
427	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/9400393c-2912-4861-9bb8-181e2bd16eb3.jpg	\N	303	\N	\N	\N	\N	2025-11-28 14:42:05.577
428	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/67469454-4019-43f1-8985-5813575e0c17.jpg	\N	304	\N	\N	\N	\N	2025-11-28 14:43:20.033
429	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/5af129b6-dc29-4b23-833b-a8ae2f1f7a85.jpg	\N	305	\N	\N	\N	\N	2025-11-28 14:44:20.026
430	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/20d12490-7803-40b5-b3a5-d6480a09074a.jpg	\N	306	\N	\N	\N	\N	2025-11-28 14:45:21.416
431	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/520436a6-2c75-4152-a075-502f1fe04a32.jpg	\N	307	\N	\N	\N	\N	2025-11-28 14:50:51.033
432	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/415cb1e7-d55c-4f06-bba9-ac84569e78eb.jpg	\N	308	\N	\N	\N	\N	2025-11-28 14:51:38.482
433	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/84bfac05-a1c2-49ab-af07-b844fc58a941.jpg	\N	309	\N	\N	\N	\N	2025-11-28 14:53:03.785
434	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/e402c61c-3e63-4d8a-bfe6-74e8b00e309f.jpg	\N	310	\N	\N	\N	\N	2025-11-28 14:54:11.985
435	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/d81c9497-8b95-4676-97b2-17eeb7278f16.jpg	\N	311	\N	\N	\N	\N	2025-11-28 14:55:22.569
436	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/8a6d2c89-e21f-4aee-b66f-6afdab322f78.jpeg	\N	\N	\N	\N	\N	1	2025-11-29 13:43:27.09
437	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/71f5806a-872a-45e5-a195-8f9f6a508cf5.jpeg	\N	\N	\N	\N	\N	1	2025-11-29 13:43:32.593
438	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/0592f6e5-d94a-4656-8647-723fff6f4018.jpeg	\N	\N	\N	\N	\N	1	2025-11-29 13:43:32.593
439	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/10a2bb31-c180-4fb1-a497-e6fbe6c63eba.jpeg	\N	\N	\N	\N	\N	1	2025-11-29 13:43:32.593
440	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/c9e6d80f-cbd5-49af-a31c-801c9aedef6f.jpeg	\N	\N	\N	\N	\N	1	2025-11-29 13:43:32.593
441	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/bbf6a432-8d6f-4327-a382-f450cb264ad8.jpeg	\N	\N	\N	\N	1	\N	2025-11-29 13:52:01.369
442	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/dd493759-c2ff-451e-a609-37e7d12ffe49.jpeg	\N	\N	\N	\N	1	\N	2025-11-29 13:52:11.84
443	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/96c2e63d-2538-4a7f-98c7-d29b8e6e98f1.jpeg	\N	\N	\N	\N	1	\N	2025-11-29 13:52:11.84
444	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/9b1ad335-a9e2-4155-898f-ed3c99a06a89.jpeg	\N	\N	\N	\N	1	\N	2025-11-29 13:52:11.84
445	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/27864835-76c0-423b-b188-b9c2f4eb1a49.jpeg	\N	\N	\N	\N	1	\N	2025-11-29 13:52:11.84
446	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/b1aebc76-43f8-416d-ab74-c35a1bbb400f.jpeg	\N	\N	\N	\N	1	\N	2025-11-29 13:52:11.84
447	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/bbf6f8da-3ec0-451b-a210-7378680068fd.jpeg	\N	\N	\N	\N	1	\N	2025-11-29 13:52:11.84
448	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/6344893f-ca6e-458a-8594-2487e80e6cbf.jpeg	\N	\N	\N	\N	1	\N	2025-11-29 13:52:11.84
449	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/2dcc3fe6-32d1-45c9-b55b-a73d2cd62ae3.jpeg	\N	\N	\N	\N	1	\N	2025-11-29 13:52:11.84
450	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/25a34583-8b68-4a75-9ab7-a4c8f9017194.jpeg	\N	\N	\N	\N	1	\N	2025-11-29 13:52:11.84
451	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/60805b53-cbb6-4c9e-aecd-529688ce6096.jpeg	\N	\N	\N	\N	1	\N	2025-11-29 13:52:11.84
452	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/15a6a9e7-11e2-4d96-9e3d-8bb684f198e9.jpeg	\N	\N	\N	\N	1	\N	2025-11-29 13:52:11.84
521	https://platina.vtcrm.ru/uploads/Photos/27/phpteE6Zd.jpeg	\N	\N	\N	\N	5	\N	2025-11-29 15:06:39.371
453	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/907cfd06-bc70-4d79-aeb5-e9003c64a17e.jpeg	\N	\N	\N	\N	1	\N	2025-11-29 13:52:11.84
454	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/e25622a1-f8ca-4069-8711-bb7feea3094b.jpeg	\N	\N	\N	\N	1	\N	2025-11-29 13:52:11.84
455	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/392bbc93-e527-4ad3-af5a-17b23170363b.jpeg	\N	\N	\N	\N	1	\N	2025-11-29 13:52:11.84
456	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/c5d8e6d6-7d8b-4e4a-bfb8-17b54b3937a2.jpeg	\N	\N	\N	\N	1	\N	2025-11-29 13:52:11.84
457	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/77182bba-76d2-43a0-838b-8f7b2ad64ba6.jpeg	\N	\N	\N	\N	1	\N	2025-11-29 13:52:11.84
458	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/ea6b6b54-80e5-4ff1-a628-a78ed3c207c1.jpeg	\N	\N	\N	\N	1	\N	2025-11-29 13:52:11.84
459	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/3f025f4c-a018-4cea-886b-8d6807bc2e52.jpeg	\N	\N	\N	\N	2	\N	2025-11-29 14:00:09.953
460	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/a9577844-89f5-431e-8de6-78fd081d60c9.jpeg	\N	\N	\N	\N	2	\N	2025-11-29 14:00:19.008
461	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/c7824182-e2ca-4396-a347-e6b50b154e07.jpeg	\N	\N	\N	\N	2	\N	2025-11-29 14:00:19.008
462	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/7b08d4dc-2c74-445d-b8b1-557e66d86db1.jpeg	\N	\N	\N	\N	2	\N	2025-11-29 14:00:19.008
463	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/c02ab776-86e2-4f7c-8d4f-6e5128907542.jpeg	\N	\N	\N	\N	2	\N	2025-11-29 14:00:19.008
464	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/db83e7f7-ad53-4403-a7b9-9c2e41954f41.jpeg	\N	\N	\N	\N	2	\N	2025-11-29 14:00:19.008
465	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/e4178002-aa43-4ff2-a0e3-99b355193cda.jpeg	\N	\N	\N	\N	2	\N	2025-11-29 14:00:19.008
466	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/f1dad6d6-22d1-4293-aff5-7a54afa10a55.jpeg	\N	\N	\N	\N	2	\N	2025-11-29 14:00:19.008
467	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/1052e26b-6234-4cb9-9ebd-868106041d55.jpeg	\N	\N	\N	\N	2	\N	2025-11-29 14:00:19.008
468	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/b0bc0ed5-8601-450e-8d4d-412759841ffd.jpeg	\N	\N	\N	\N	2	\N	2025-11-29 14:00:19.008
469	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/bc6390d6-7106-4183-948e-4bbc51d0d26e.jpeg	\N	\N	\N	\N	2	\N	2025-11-29 14:00:19.008
470	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/0fc24b28-18d6-4442-87fe-354052b48a5d.jpeg	\N	\N	\N	\N	2	\N	2025-11-29 14:00:19.008
471	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/4204c6bf-3c72-46cc-82bd-7eecdaf57b7f.jpeg	\N	\N	\N	\N	2	\N	2025-11-29 14:00:19.008
472	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/c00df379-02f0-4c1d-8751-dc8f255c6f08.jpeg	\N	\N	\N	\N	2	\N	2025-11-29 14:00:19.008
473	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/2396704a-b6b4-45fd-9101-361080c4de07.jpeg	\N	\N	\N	\N	2	\N	2025-11-29 14:00:19.008
474	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/984af70d-7bfa-4256-b903-79f99f782821.jpeg	\N	\N	\N	\N	2	\N	2025-11-29 14:00:19.008
475	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/4cc27d0d-125c-4055-868a-601f8d990bed.jpeg	\N	\N	\N	1	\N	\N	2025-11-29 14:16:07.265
476	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/e2fdcda0-a6e3-4cc9-95f1-985f7f0bca54.jpeg	\N	\N	\N	1	\N	\N	2025-11-29 14:16:07.265
477	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/d0210889-d2d6-466c-8749-99d1b4707327.jpeg	\N	\N	\N	1	\N	\N	2025-11-29 14:16:07.265
478	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/96f8cafb-1167-44e3-ba13-8d74b6b6ac81.jpeg	\N	\N	\N	1	\N	\N	2025-11-29 14:16:07.265
479	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/48faed86-c887-4ac5-a68d-ab1d06de442d.jpeg	\N	\N	\N	1	\N	\N	2025-11-29 14:16:07.265
480	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/69f79215-b15d-49ce-bd6c-d313e6226301.jpeg	\N	\N	\N	1	\N	\N	2025-11-29 14:16:07.265
481	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/265ea331-60ac-4a7d-bcdb-f8138d82e485.jpeg	\N	\N	\N	1	\N	\N	2025-11-29 14:16:07.265
482	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/18690504-cd88-4a8a-ae10-2b0449dca13d.jpeg	\N	\N	\N	1	\N	\N	2025-11-29 14:16:07.265
483	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/9730af60-a3e9-4f41-b4e3-4220d51a7e4e.jpeg	\N	\N	\N	1	\N	\N	2025-11-29 14:16:07.265
484	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/b1a44350-0929-4790-8c44-b3047bd65949.jpeg	\N	\N	\N	1	\N	\N	2025-11-29 14:16:07.265
485	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/87d2ca64-6546-4d63-8c37-caad14932e11.jpeg	\N	\N	\N	1	\N	\N	2025-11-29 14:16:07.265
486	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/bf1b80ac-4a29-403e-80dd-520a5f0095ad.jpeg	\N	\N	\N	1	\N	\N	2025-11-29 14:16:07.265
487	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/3c0ad5a4-9259-4701-bfce-e12d05b58061.jpeg	\N	\N	\N	1	\N	\N	2025-11-29 14:16:07.265
488	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/dea5b169-c890-46a2-b861-990cacecf296.jpeg	\N	\N	\N	\N	3	\N	2025-11-29 14:22:18.968
489	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/8d8e8b62-9cae-4d8f-9ab8-6afcaa2851a3.jpeg	\N	\N	\N	\N	3	\N	2025-11-29 14:22:18.968
490	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/5b365b00-cac8-4300-be8c-e11e95dfd6e4.jpeg	\N	\N	\N	\N	3	\N	2025-11-29 14:22:18.968
491	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/74de3eca-6281-4ce4-8a5b-7b45d5e84a82.jpeg	\N	\N	\N	\N	3	\N	2025-11-29 14:22:18.968
492	https://9c9a241d-11ea-4f71-8a89-7a1d2f462630.selstorage.ru/images/c8e03847-bb2f-4643-803e-a740e1f7cfc5.jpeg	\N	\N	\N	\N	3	\N	2025-11-29 14:22:18.968
493	https://platina.vtcrm.ru/uploads/Photos/21/67caa5f4a4a82.jpeg	\N	\N	\N	\N	4	\N	2025-11-29 14:58:18.205
494	https://platina.vtcrm.ru/uploads/Photos/21/67caa5f4c6e74.jpeg	\N	\N	\N	\N	4	\N	2025-11-29 14:58:18.205
495	https://platina.vtcrm.ru/uploads/Photos/21/67caa5f4df671.jpeg	\N	\N	\N	\N	4	\N	2025-11-29 14:58:18.205
496	https://platina.vtcrm.ru/uploads/Photos/21/67caa5f503f17.jpeg	\N	\N	\N	\N	4	\N	2025-11-29 14:58:18.205
497	https://platina.vtcrm.ru/uploads/Photos/21/67caa5f533d5e.jpeg	\N	\N	\N	\N	4	\N	2025-11-29 14:58:18.205
498	https://platina.vtcrm.ru/uploads/Photos/21/67caa5f54bbe9.jpeg	\N	\N	\N	\N	4	\N	2025-11-29 14:58:18.205
499	https://platina.vtcrm.ru/uploads/Photos/21/67caa5f5647da.jpeg	\N	\N	\N	\N	4	\N	2025-11-29 14:58:18.205
500	https://platina.vtcrm.ru/uploads/Photos/21/67caa5f57b887.jpeg	\N	\N	\N	\N	4	\N	2025-11-29 15:01:38.977
501	https://platina.vtcrm.ru/uploads/Photos/21/67caa5f594588.jpeg	\N	\N	\N	\N	4	\N	2025-11-29 15:01:38.977
502	https://platina.vtcrm.ru/uploads/Photos/21/67caa5f5ad2d9.jpeg	\N	\N	\N	\N	4	\N	2025-11-29 15:01:38.977
503	https://platina.vtcrm.ru/uploads/Photos/21/67caa5f5cf06a.jpeg	\N	\N	\N	\N	4	\N	2025-11-29 15:01:38.977
504	https://platina.vtcrm.ru/uploads/Photos/21/67caa5f5e74db.jpeg	\N	\N	\N	\N	4	\N	2025-11-29 15:01:38.977
505	https://platina.vtcrm.ru/uploads/Photos/21/67caa5f60cc30.jpeg	\N	\N	\N	\N	4	\N	2025-11-29 15:01:38.977
526	https://platina.vtcrm.ru/uploads/Photos/68/phpKnHT8p.jpeg	\N	\N	1	\N	\N	\N	2025-11-29 15:31:02.485
527	https://platina.vtcrm.ru/uploads/Photos/68/phpb0YlF9.jpeg	\N	\N	1	\N	\N	\N	2025-11-29 15:31:02.485
528	https://platina.vtcrm.ru/uploads/Photos/68/phpsrVRp0.jpeg	\N	\N	1	\N	\N	\N	2025-11-29 15:31:02.485
529	https://platina.vtcrm.ru/uploads/Photos/68/phpnA4T4z.jpeg	\N	\N	1	\N	\N	\N	2025-11-29 15:31:02.485
530	https://platina.vtcrm.ru/uploads/Photos/68/phpn6dLfE.jpeg	\N	\N	1	\N	\N	\N	2025-11-29 15:31:02.485
531	https://platina.vtcrm.ru/uploads/Photos/68/phpJHg6gW.jpeg	\N	\N	1	\N	\N	\N	2025-11-29 15:31:02.485
532	https://platina.vtcrm.ru/uploads/Photos/68/phpDPzarb.jpeg	\N	\N	1	\N	\N	\N	2025-11-29 15:31:02.485
533	https://platina.vtcrm.ru/?au=MzI%3D&Currency=rur&Status=2	\N	\N	1	\N	\N	\N	2025-11-29 15:31:02.485
534	https://platina.vtcrm.ru/uploads/Photos/68/php1f1QIt.jpeg	\N	\N	1	\N	\N	\N	2025-11-29 15:31:02.485
535	https://platina.vtcrm.ru/?au=MzI%3D&Currency=rur&Status=2	\N	\N	1	\N	\N	\N	2025-11-29 15:31:02.485
536	https://platina.vtcrm.ru/uploads/Photos/68/phpKQE0Vw.jpeg	\N	\N	1	\N	\N	\N	2025-11-29 15:31:02.485
537	https://platina.vtcrm.ru/uploads/Photos/68/phpnSg95X.jpeg	\N	\N	1	\N	\N	\N	2025-11-29 15:31:02.485
538	https://platina.vtcrm.ru/uploads/Photos/68/phpbFP2no.jpeg	\N	\N	1	\N	\N	\N	2025-11-29 15:31:02.485
539	https://platina.vtcrm.ru/uploads/Photos/68/phpr8WNqK.jpeg	\N	\N	1	\N	\N	\N	2025-11-29 15:31:02.485
540	https://platina.vtcrm.ru/uploads/Photos/68/phpyeEyTe.jpeg	\N	\N	1	\N	\N	\N	2025-11-29 15:31:02.485
541	https://platina.vtcrm.ru/uploads/Photos/68/php0AqLHl.jpeg	\N	\N	1	\N	\N	\N	2025-11-29 15:31:02.485
542	https://platina.vtcrm.ru/uploads/Photos/88/phpJnz2Bq.jpeg	\N	\N	\N	2	\N	\N	2025-11-29 15:34:43.571
543	https://platina.vtcrm.ru/uploads/Photos/88/phpoMW8q2.jpeg	\N	\N	\N	2	\N	\N	2025-11-29 15:34:43.571
544	https://platina.vtcrm.ru/uploads/Photos/88/phptnGHI7.jpeg	\N	\N	\N	2	\N	\N	2025-11-29 15:34:43.571
545	https://platina.vtcrm.ru/uploads/Photos/88/phpbJfNxw.jpeg	\N	\N	\N	2	\N	\N	2025-11-29 15:34:43.571
546	https://platina.vtcrm.ru/uploads/Photos/88/php37mD92.jpeg	\N	\N	\N	2	\N	\N	2025-11-29 15:34:43.571
547	https://platina.vtcrm.ru/uploads/Photos/88/php5AqxLr.jpeg	\N	\N	\N	2	\N	\N	2025-11-29 15:34:43.571
548	https://platina.vtcrm.ru/uploads/Photos/88/phpHGGiA3.jpeg	\N	\N	\N	2	\N	\N	2025-11-29 15:34:43.571
549	https://platina.vtcrm.ru/uploads/Photos/88/php0DWrg9.jpeg	\N	\N	\N	2	\N	\N	2025-11-29 15:34:43.571
550	https://platina.vtcrm.ru/uploads/Photos/88/php7FJjhw.jpeg	\N	\N	\N	2	\N	\N	2025-11-29 15:34:43.571
551	https://platina.vtcrm.ru/uploads/Photos/88/phpd2jCBr.jpeg	\N	\N	\N	2	\N	\N	2025-11-29 15:34:43.571
552	https://platina.vtcrm.ru/uploads/Photos/88/phpGDnEuh.jpeg	\N	\N	\N	2	\N	\N	2025-11-29 15:34:43.571
553	https://platina.vtcrm.ru/uploads/Photos/90/phpnpULAu.jpeg	\N	\N	\N	\N	6	\N	2025-11-29 15:40:13.479
554	https://platina.vtcrm.ru/uploads/Photos/90/phphY94NR.jpeg	\N	\N	\N	\N	6	\N	2025-11-29 15:40:13.479
555	https://platina.vtcrm.ru/uploads/Photos/90/phpNdvGN8.jpeg	\N	\N	\N	\N	6	\N	2025-11-29 15:40:13.479
556	https://platina.vtcrm.ru/uploads/Photos/90/php4i305o.jpeg	\N	\N	\N	\N	6	\N	2025-11-29 15:40:13.479
557	https://platina.vtcrm.ru/uploads/Photos/90/phpP8uUNm.jpeg	\N	\N	\N	\N	6	\N	2025-11-29 15:40:13.479
558	https://platina.vtcrm.ru/uploads/Photos/90/php6U9Mik.jpeg	\N	\N	\N	\N	6	\N	2025-11-29 15:40:13.479
559	https://platina.vtcrm.ru/uploads/Photos/90/phpqNeE06.jpeg	\N	\N	\N	\N	6	\N	2025-11-29 15:40:13.479
560	https://platina.vtcrm.ru/uploads/Photos/131/phprodPP7.jpeg	\N	\N	\N	3	\N	\N	2025-11-29 15:43:47.229
561	https://platina.vtcrm.ru/uploads/Photos/131/phpDzY98D.jpeg	\N	\N	\N	3	\N	\N	2025-11-29 15:43:47.229
562	https://platina.vtcrm.ru/uploads/Photos/131/phpycF08i.jpeg	\N	\N	\N	3	\N	\N	2025-11-29 15:43:47.229
563	https://platina.vtcrm.ru/uploads/Photos/131/phpTF0T7G.jpeg	\N	\N	\N	3	\N	\N	2025-11-29 15:43:47.229
564	https://platina.vtcrm.ru/uploads/Photos/131/phpWVcEpM.jpeg	\N	\N	\N	3	\N	\N	2025-11-29 15:43:47.229
565	https://platina.vtcrm.ru/uploads/Photos/131/phpYrgFNN.jpeg	\N	\N	\N	3	\N	\N	2025-11-29 15:43:47.229
566	https://platina.vtcrm.ru/uploads/Photos/131/phpNHRumq.jpeg	\N	\N	\N	3	\N	\N	2025-11-29 15:43:47.229
567	https://platina.vtcrm.ru/uploads/Photos/131/phpiAusJf.jpeg	\N	\N	\N	3	\N	\N	2025-11-29 15:43:47.229
568	https://platina.vtcrm.ru/uploads/Photos/136/phpvXoBWM.jpeg	\N	\N	\N	4	\N	\N	2025-11-29 15:47:04.511
569	https://platina.vtcrm.ru/uploads/Photos/136/phpayFR4V.jpeg	\N	\N	\N	4	\N	\N	2025-11-29 15:47:04.511
570	https://platina.vtcrm.ru/uploads/Photos/136/phpC7z063.jpeg	\N	\N	\N	4	\N	\N	2025-11-29 15:47:04.511
571	https://platina.vtcrm.ru/uploads/Photos/136/phpdznOXI.jpeg	\N	\N	\N	4	\N	\N	2025-11-29 15:47:04.511
572	https://platina.vtcrm.ru/uploads/Photos/136/php9DSL23.jpeg	\N	\N	\N	4	\N	\N	2025-11-29 15:47:04.511
573	https://platina.vtcrm.ru/uploads/Photos/136/php1AfPJY.jpeg	\N	\N	\N	4	\N	\N	2025-11-29 15:47:04.511
574	https://platina.vtcrm.ru/uploads/Photos/136/phpHTUGsM.jpeg	\N	\N	\N	4	\N	\N	2025-11-29 15:47:04.511
575	https://platina.vtcrm.ru/uploads/Photos/136/phpDk6jvA.jpeg	\N	\N	\N	4	\N	\N	2025-11-29 15:47:04.511
576	https://platina.vtcrm.ru/uploads/Photos/136/phpmgc6eo.jpeg	\N	\N	\N	4	\N	\N	2025-11-29 15:47:04.511
577	https://platina.vtcrm.ru/uploads/Photos/136/php7OsizV.jpeg	\N	\N	\N	4	\N	\N	2025-11-29 15:47:04.511
578	https://platina.vtcrm.ru/uploads/Photos/137/phpKtkFsw.jpeg	\N	\N	\N	5	\N	\N	2025-11-29 15:50:15.356
579	https://platina.vtcrm.ru/uploads/Photos/137/php6EGeXx.jpeg	\N	\N	\N	5	\N	\N	2025-11-29 15:50:15.356
580	https://platina.vtcrm.ru/uploads/Photos/137/phpfZ13Gr.jpeg	\N	\N	\N	5	\N	\N	2025-11-29 15:50:15.356
581	https://platina.vtcrm.ru/uploads/Photos/137/phpYiETmw.jpeg	\N	\N	\N	5	\N	\N	2025-11-29 15:50:15.356
582	https://platina.vtcrm.ru/uploads/Photos/137/phpGRunMQ.jpeg	\N	\N	\N	5	\N	\N	2025-11-29 15:50:15.356
583	https://platina.vtcrm.ru/uploads/Photos/137/phpfYBT0T.jpeg	\N	\N	\N	5	\N	\N	2025-11-29 15:50:15.356
584	https://platina.vtcrm.ru/uploads/Photos/137/phpaMDeeO.jpeg	\N	\N	\N	5	\N	\N	2025-11-29 15:50:15.356
585	https://platina.vtcrm.ru/uploads/Photos/137/phpNp9GfH.jpeg	\N	\N	\N	5	\N	\N	2025-11-29 15:50:15.356
586	https://platina.vtcrm.ru/uploads/Photos/137/php14PpBv.jpeg	\N	\N	\N	5	\N	\N	2025-11-29 15:50:15.356
587	https://platina.vtcrm.ru/uploads/Photos/137/phpfVjTic.jpeg	\N	\N	\N	5	\N	\N	2025-11-29 15:50:15.356
588	https://platina.vtcrm.ru/uploads/Photos/137/phpSAOkfV.jpeg	\N	\N	\N	5	\N	\N	2025-11-29 15:50:15.356
589	https://platina.vtcrm.ru/uploads/Photos/142/phprhFN39.jpeg	\N	\N	\N	\N	7	\N	2025-11-29 15:53:07.621
590	https://platina.vtcrm.ru/uploads/Photos/142/phpq7qtN8.jpeg	\N	\N	\N	\N	7	\N	2025-11-29 15:53:07.621
591	https://platina.vtcrm.ru/uploads/Photos/142/phpoIydwA.jpeg	\N	\N	\N	\N	7	\N	2025-11-29 15:53:07.621
592	https://platina.vtcrm.ru/uploads/Photos/142/phpzd7KJG.jpeg	\N	\N	\N	\N	7	\N	2025-11-29 15:53:07.621
593	https://platina.vtcrm.ru/uploads/Photos/142/phpQBDnLf.jpeg	\N	\N	\N	\N	7	\N	2025-11-29 15:53:07.621
594	https://platina.vtcrm.ru/uploads/Photos/145/php9sEIeH.jpeg	\N	\N	\N	6	\N	\N	2025-11-29 15:55:53.582
595	https://platina.vtcrm.ru/uploads/Photos/145/phpZVos0l.jpeg	\N	\N	\N	6	\N	\N	2025-11-29 15:55:53.582
596	https://platina.vtcrm.ru/uploads/Photos/145/phpFbsdVI.jpeg	\N	\N	\N	6	\N	\N	2025-11-29 15:55:53.582
597	https://platina.vtcrm.ru/uploads/Photos/145/phpTl3zbE.jpeg	\N	\N	\N	6	\N	\N	2025-11-29 15:55:53.582
598	https://platina.vtcrm.ru/uploads/Photos/151/phpszNucm.jpeg	\N	\N	\N	7	\N	\N	2025-11-29 15:58:58.42
599	https://platina.vtcrm.ru/uploads/Photos/151/phpyX4YIJ.jpeg	\N	\N	\N	7	\N	\N	2025-11-29 15:58:58.42
600	https://platina.vtcrm.ru/uploads/Photos/151/phpmHKICf.jpeg	\N	\N	\N	7	\N	\N	2025-11-29 15:58:58.42
601	https://platina.vtcrm.ru/uploads/Photos/151/php1CXdAl.jpeg	\N	\N	\N	7	\N	\N	2025-11-29 15:58:58.42
602	https://platina.vtcrm.ru/uploads/Photos/151/phpbIusAR.jpeg	\N	\N	\N	7	\N	\N	2025-11-29 15:58:58.42
603	https://platina.vtcrm.ru/uploads/Photos/151/phpOWLtIB.jpeg	\N	\N	\N	7	\N	\N	2025-11-29 15:58:58.42
604	https://platina.vtcrm.ru/uploads/Photos/151/phpf8InNx.jpeg	\N	\N	\N	7	\N	\N	2025-11-29 15:58:58.42
605	https://platina.vtcrm.ru/uploads/Photos/152/phpqUukhO.jpeg	\N	\N	\N	8	\N	\N	2025-11-29 16:01:29.273
606	https://platina.vtcrm.ru/uploads/Photos/152/phpHOjLaP.jpeg	\N	\N	\N	8	\N	\N	2025-11-29 16:01:29.273
607	https://platina.vtcrm.ru/uploads/Photos/152/phpF0OAyS.jpeg	\N	\N	\N	8	\N	\N	2025-11-29 16:01:29.273
608	https://platina.vtcrm.ru/uploads/Photos/152/phpdiMizP.jpeg	\N	\N	\N	8	\N	\N	2025-11-29 16:01:29.273
609	https://platina.vtcrm.ru/uploads/Photos/152/phpldn6dK.jpeg	\N	\N	\N	8	\N	\N	2025-11-29 16:01:29.273
610	https://platina.vtcrm.ru/uploads/Photos/152/phpn2F7jU.jpeg	\N	\N	\N	8	\N	\N	2025-11-29 16:01:29.273
611	https://platina.vtcrm.ru/uploads/Photos/152/phpQ4s5ks.jpeg	\N	\N	\N	8	\N	\N	2025-11-29 16:01:29.273
612	https://platina.vtcrm.ru/uploads/Photos/152/php6bZHcp.jpeg	\N	\N	\N	8	\N	\N	2025-11-29 16:01:29.273
613	https://platina.vtcrm.ru/uploads/Photos/153/phpCm3fIx.jpeg	\N	\N	\N	9	\N	\N	2025-11-29 16:04:39.98
614	https://platina.vtcrm.ru/uploads/Photos/153/phptePqD3.jpeg	\N	\N	\N	9	\N	\N	2025-11-29 16:04:39.98
615	https://platina.vtcrm.ru/uploads/Photos/153/phpkPBh21.jpeg	\N	\N	\N	9	\N	\N	2025-11-29 16:04:39.98
616	https://platina.vtcrm.ru/uploads/Photos/153/phplFyy9q.jpeg	\N	\N	\N	9	\N	\N	2025-11-29 16:04:39.98
617	https://platina.vtcrm.ru/uploads/Photos/153/phpq8riU7.jpeg	\N	\N	\N	9	\N	\N	2025-11-29 16:04:39.98
618	https://platina.vtcrm.ru/uploads/Photos/153/phpUtTpBH.jpeg	\N	\N	\N	9	\N	\N	2025-11-29 16:04:39.98
619	https://platina.vtcrm.ru/uploads/Photos/153/phpbCtFW4.jpeg	\N	\N	\N	9	\N	\N	2025-11-29 16:04:39.98
620	https://platina.vtcrm.ru/uploads/Photos/153/phpSWYOl4.jpeg	\N	\N	\N	9	\N	\N	2025-11-29 16:04:39.98
621	https://platina.vtcrm.ru/uploads/Photos/153/phpqUb4Uz.jpeg	\N	\N	\N	9	\N	\N	2025-11-29 16:04:39.98
622	https://platina.vtcrm.ru/uploads/Photos/153/phphuXA2D.jpeg	\N	\N	\N	9	\N	\N	2025-11-29 16:04:39.98
623	https://platina.vtcrm.ru/uploads/Photos/153/phpkc9fSN.jpeg	\N	\N	\N	9	\N	\N	2025-11-29 16:04:39.98
624	https://platina.vtcrm.ru/uploads/Photos/153/phpDBgZZU.jpeg	\N	\N	\N	9	\N	\N	2025-11-29 16:04:39.98
625	https://platina.vtcrm.ru/uploads/Photos/154/phpWMX5nK.jpeg	\N	\N	\N	10	\N	\N	2025-11-29 16:07:44.029
626	https://platina.vtcrm.ru/uploads/Photos/154/phpZMTxNE.jpeg	\N	\N	\N	10	\N	\N	2025-11-29 16:07:44.029
627	https://platina.vtcrm.ru/uploads/Photos/154/phpEbVLCU.jpeg	\N	\N	\N	10	\N	\N	2025-11-29 16:07:44.029
628	https://platina.vtcrm.ru/uploads/Photos/154/phpE0VwOs.jpeg	\N	\N	\N	10	\N	\N	2025-11-29 16:07:44.029
629	https://platina.vtcrm.ru/uploads/Photos/154/phpV4KyBr.jpeg	\N	\N	\N	10	\N	\N	2025-11-29 16:07:44.029
630	https://platina.vtcrm.ru/uploads/Photos/154/phpZPs6sd.jpeg	\N	\N	\N	10	\N	\N	2025-11-29 16:07:44.029
631	https://platina.vtcrm.ru/uploads/Photos/154/phpDWKjKS.jpeg	\N	\N	\N	10	\N	\N	2025-11-29 16:07:44.029
632	https://platina.vtcrm.ru/uploads/Photos/154/php5aQfxA.jpeg	\N	\N	\N	10	\N	\N	2025-11-29 16:07:44.029
633	https://platina.vtcrm.ru/uploads/Photos/154/phpoOPsGe.jpeg	\N	\N	\N	10	\N	\N	2025-11-29 16:07:44.029
634	https://platina.vtcrm.ru/uploads/Photos/154/phpShtbI8.jpeg	\N	\N	\N	10	\N	\N	2025-11-29 16:07:44.029
635	https://platina.vtcrm.ru/uploads/Photos/154/phpOmZkAV.jpeg	\N	\N	\N	10	\N	\N	2025-11-29 16:07:44.029
636	https://platina.vtcrm.ru/uploads/Photos/156/phpkx3XAV.jpeg	\N	\N	\N	11	\N	\N	2025-11-29 16:10:26.024
637	https://platina.vtcrm.ru/uploads/Photos/156/phpAiIPKM.jpeg	\N	\N	\N	11	\N	\N	2025-11-29 16:10:26.024
638	https://platina.vtcrm.ru/uploads/Photos/156/phpkb7ZaL.jpeg	\N	\N	\N	11	\N	\N	2025-11-29 16:10:26.024
639	https://platina.vtcrm.ru/uploads/Photos/156/phpRATAeg.jpeg	\N	\N	\N	11	\N	\N	2025-11-29 16:10:26.024
640	https://platina.vtcrm.ru/uploads/Photos/156/phpjvryLM.jpeg	\N	\N	\N	11	\N	\N	2025-11-29 16:10:26.024
641	https://platina.vtcrm.ru/uploads/Photos/156/phpWlS6M9.jpeg	\N	\N	\N	11	\N	\N	2025-11-29 16:10:26.024
642	https://platina.vtcrm.ru/uploads/Photos/156/php6iCItD.jpeg	\N	\N	\N	11	\N	\N	2025-11-29 16:10:26.024
643	https://platina.vtcrm.ru/uploads/Photos/156/phpVaFAeB.jpeg	\N	\N	\N	11	\N	\N	2025-11-29 16:10:26.024
644	https://platina.vtcrm.ru/uploads/Photos/156/phpTRqKlF.jpeg	\N	\N	\N	11	\N	\N	2025-11-29 16:10:26.024
645	https://platina.vtcrm.ru/uploads/Photos/169/phpZoLwo8.jpeg	\N	\N	\N	12	\N	\N	2025-11-29 16:13:07.223
646	https://platina.vtcrm.ru/uploads/Photos/169/phppvyxVS.jpeg	\N	\N	\N	12	\N	\N	2025-11-29 16:13:07.223
647	https://platina.vtcrm.ru/uploads/Photos/169/phpjzZYrF.jpeg	\N	\N	\N	12	\N	\N	2025-11-29 16:13:07.223
648	https://platina.vtcrm.ru/uploads/Photos/169/phpNJJVcD.jpeg	\N	\N	\N	12	\N	\N	2025-11-29 16:13:07.223
649	https://platina.vtcrm.ru/uploads/Photos/169/phpGNz4gX.jpeg	\N	\N	\N	12	\N	\N	2025-11-29 16:13:07.223
650	https://platina.vtcrm.ru/uploads/Photos/169/phpNwnZfO.jpeg	\N	\N	\N	12	\N	\N	2025-11-29 16:13:07.223
651	https://platina.vtcrm.ru/uploads/Photos/169/php0dkODj.jpeg	\N	\N	\N	12	\N	\N	2025-11-29 16:13:07.223
652	https://platina.vtcrm.ru/uploads/Photos/179/phpkSYbqs.jpeg	\N	\N	\N	13	\N	\N	2025-11-29 16:15:27.435
653	https://platina.vtcrm.ru/uploads/Photos/179/phpqZvNgM.jpeg	\N	\N	\N	13	\N	\N	2025-11-29 16:15:27.435
654	https://platina.vtcrm.ru/uploads/Photos/179/phpvNFYjq.jpeg	\N	\N	\N	13	\N	\N	2025-11-29 16:15:27.435
655	https://platina.vtcrm.ru/uploads/Photos/179/phpp7gJ6o.jpeg	\N	\N	\N	13	\N	\N	2025-11-29 16:15:27.435
656	https://platina.vtcrm.ru/uploads/Photos/179/php9hini6.jpeg	\N	\N	\N	13	\N	\N	2025-11-29 16:15:27.435
657	https://platina.vtcrm.ru/uploads/Photos/179/phpcK3Yrh.jpeg	\N	\N	\N	13	\N	\N	2025-11-29 16:15:27.435
658	https://platina.vtcrm.ru/uploads/Photos/180/7df77a81-6c7a-4a34-be41-eeb4a9ba956a.jpeg	\N	\N	\N	14	\N	\N	2025-11-29 16:18:15.386
659	https://platina.vtcrm.ru/uploads/Photos/180/ee312c68-42d8-4056-841a-9db25ba3d84a.jpeg	\N	\N	\N	14	\N	\N	2025-11-29 16:18:15.386
660	https://platina.vtcrm.ru/uploads/Photos/180/269a7ef5-e5ae-431e-908d-75c4df241a3c.jpeg	\N	\N	\N	14	\N	\N	2025-11-29 16:18:15.386
661	https://platina.vtcrm.ru/uploads/Photos/180/dcee5edc-ad97-4842-a9d5-c3fe6aae326d.jpeg	\N	\N	\N	14	\N	\N	2025-11-29 16:18:15.386
662	https://platina.vtcrm.ru/uploads/Photos/180/f3fcc0f7-cb44-471a-afa0-3aec74f5848b.jpeg	\N	\N	\N	14	\N	\N	2025-11-29 16:18:15.386
663	https://platina.vtcrm.ru/uploads/Photos/180/5be44e07-54dc-494b-b73f-297dd4a76456.jpeg	\N	\N	\N	14	\N	\N	2025-11-29 16:18:15.386
734	https://platina.vtcrm.ru/uploads/Photos/307/phpZ4gpDI.jpeg	\N	\N	\N	\N	9	\N	2025-11-29 16:54:19.095
664	https://platina.vtcrm.ru/uploads/Photos/180/81e0aef8-ad4e-4048-a3c6-370c5554d69f.jpeg	\N	\N	\N	14	\N	\N	2025-11-29 16:18:15.386
665	https://platina.vtcrm.ru/uploads/Photos/180/1220ac78-3549-45bb-813b-25e45df74810.jpeg	\N	\N	\N	14	\N	\N	2025-11-29 16:18:15.386
666	https://platina.vtcrm.ru/uploads/Photos/181/phpB63g1J.jpeg	\N	\N	\N	15	\N	\N	2025-11-29 16:20:38.766
667	https://platina.vtcrm.ru/uploads/Photos/181/php7c7FlD.jpeg	\N	\N	\N	15	\N	\N	2025-11-29 16:20:38.766
668	https://platina.vtcrm.ru/uploads/Photos/181/phpKkMgX2.jpeg	\N	\N	\N	15	\N	\N	2025-11-29 16:20:38.766
669	https://platina.vtcrm.ru/uploads/Photos/181/phpTVy0zv.jpeg	\N	\N	\N	15	\N	\N	2025-11-29 16:20:38.766
670	https://platina.vtcrm.ru/uploads/Photos/181/phpog4Mpp.jpeg	\N	\N	\N	15	\N	\N	2025-11-29 16:20:38.766
671	https://platina.vtcrm.ru/uploads/Photos/181/phpOoLyhr.jpeg	\N	\N	\N	15	\N	\N	2025-11-29 16:20:38.766
672	https://platina.vtcrm.ru/uploads/Photos/181/phpDrHgIv.jpeg	\N	\N	\N	15	\N	\N	2025-11-29 16:20:38.766
673	https://platina.vtcrm.ru/uploads/Photos/184/phpuNtLDi.jpeg	\N	\N	\N	16	\N	\N	2025-11-29 16:33:37.508
674	https://platina.vtcrm.ru/uploads/Photos/184/php5vqiLQ.jpeg	\N	\N	\N	16	\N	\N	2025-11-29 16:33:37.508
675	https://platina.vtcrm.ru/uploads/Photos/184/phpgm09hk.jpeg	\N	\N	\N	16	\N	\N	2025-11-29 16:33:37.508
676	https://platina.vtcrm.ru/uploads/Photos/184/phpn7vhZY.jpeg	\N	\N	\N	16	\N	\N	2025-11-29 16:33:37.508
677	https://platina.vtcrm.ru/uploads/Photos/184/phpCWnrY9.jpeg	\N	\N	\N	16	\N	\N	2025-11-29 16:33:37.508
678	https://platina.vtcrm.ru/uploads/Photos/184/phpCBXu1d.jpeg	\N	\N	\N	16	\N	\N	2025-11-29 16:33:37.508
679	https://platina.vtcrm.ru/uploads/Photos/184/php5RPBU3.jpeg	\N	\N	\N	16	\N	\N	2025-11-29 16:33:37.508
680	https://platina.vtcrm.ru/uploads/Photos/184/phpnfzcpr.jpeg	\N	\N	\N	16	\N	\N	2025-11-29 16:33:37.508
681	https://platina.vtcrm.ru/uploads/Photos/184/phpGCLFVN.jpeg	\N	\N	\N	16	\N	\N	2025-11-29 16:33:37.508
682	https://platina.vtcrm.ru/uploads/Photos/186/phpeKNd6d.jpeg	\N	\N	\N	17	\N	\N	2025-11-29 16:36:23.51
683	https://platina.vtcrm.ru/uploads/Photos/186/phpIDXenh.jpeg	\N	\N	\N	17	\N	\N	2025-11-29 16:36:23.51
684	https://platina.vtcrm.ru/uploads/Photos/186/phpVjQeQR.jpeg	\N	\N	\N	17	\N	\N	2025-11-29 16:36:23.51
685	https://platina.vtcrm.ru/uploads/Photos/186/phpTSmRzr.jpeg	\N	\N	\N	17	\N	\N	2025-11-29 16:36:23.51
686	https://platina.vtcrm.ru/uploads/Photos/186/php5rDraN.jpeg	\N	\N	\N	17	\N	\N	2025-11-29 16:36:23.51
687	https://platina.vtcrm.ru/uploads/Photos/186/php3Ft8h3.jpeg	\N	\N	\N	17	\N	\N	2025-11-29 16:36:23.51
688	https://platina.vtcrm.ru/uploads/Photos/186/php99NtAv.jpeg	\N	\N	\N	17	\N	\N	2025-11-29 16:36:23.51
689	https://platina.vtcrm.ru/uploads/Photos/186/phpkRdNC1.jpeg	\N	\N	\N	17	\N	\N	2025-11-29 16:36:23.51
690	https://platina.vtcrm.ru/uploads/Photos/212/phpMR9dum.jpeg	\N	\N	\N	18	\N	\N	2025-11-29 16:40:09.917
691	https://platina.vtcrm.ru/uploads/Photos/212/phppy7yaw.jpeg	\N	\N	\N	18	\N	\N	2025-11-29 16:40:09.917
692	https://platina.vtcrm.ru/uploads/Photos/212/phppNG52M.jpeg	\N	\N	\N	18	\N	\N	2025-11-29 16:40:09.917
693	https://platina.vtcrm.ru/uploads/Photos/212/phpHjX6Ld.jpeg	\N	\N	\N	18	\N	\N	2025-11-29 16:40:09.917
694	https://platina.vtcrm.ru/uploads/Photos/212/phpJ4k8k8.jpeg	\N	\N	\N	18	\N	\N	2025-11-29 16:40:09.917
695	https://platina.vtcrm.ru/uploads/Photos/212/phprzqVUp.jpeg	\N	\N	\N	18	\N	\N	2025-11-29 16:40:09.917
696	https://platina.vtcrm.ru/uploads/Photos/212/php7LfpOx.jpeg	\N	\N	\N	18	\N	\N	2025-11-29 16:40:09.917
697	https://platina.vtcrm.ru/uploads/Photos/212/phpidMUbv.jpeg	\N	\N	\N	18	\N	\N	2025-11-29 16:40:09.917
698	https://platina.vtcrm.ru/uploads/Photos/212/php8uDooP.jpeg	\N	\N	\N	18	\N	\N	2025-11-29 16:40:09.917
699	https://platina.vtcrm.ru/uploads/Photos/212/phpPDANrj.jpeg	\N	\N	\N	18	\N	\N	2025-11-29 16:40:09.917
700	https://platina.vtcrm.ru/uploads/Photos/183/phpeZhVcx.jpeg	\N	\N	\N	\N	\N	2	2025-11-29 16:42:51.998
701	https://platina.vtcrm.ru/uploads/Photos/183/phpHpIRad.jpeg	\N	\N	\N	\N	\N	2	2025-11-29 16:42:51.998
702	https://platina.vtcrm.ru/uploads/Photos/183/php6Y1v26.jpeg	\N	\N	\N	\N	\N	2	2025-11-29 16:42:51.998
703	https://platina.vtcrm.ru/uploads/Photos/183/phprqjmjQ.jpeg	\N	\N	\N	\N	\N	2	2025-11-29 16:42:51.998
704	https://platina.vtcrm.ru/uploads/Photos/294/phpcNNM6q.jpeg	\N	\N	\N	\N	8	\N	2025-11-29 16:46:54.406
705	https://platina.vtcrm.ru/uploads/Photos/294/phptsONiR.jpeg	\N	\N	\N	\N	8	\N	2025-11-29 16:46:54.406
706	https://platina.vtcrm.ru/uploads/Photos/294/phpV6fXtb.jpeg	\N	\N	\N	\N	8	\N	2025-11-29 16:46:54.406
707	https://platina.vtcrm.ru/uploads/Photos/294/phpkAqr8v.jpeg	\N	\N	\N	\N	8	\N	2025-11-29 16:46:54.406
708	https://platina.vtcrm.ru/uploads/Photos/294/phpky6LLM.jpeg	\N	\N	\N	\N	8	\N	2025-11-29 16:46:54.406
709	https://platina.vtcrm.ru/uploads/Photos/294/phpky6LLM.jpeg	\N	\N	\N	\N	8	\N	2025-11-29 16:46:54.406
710	https://platina.vtcrm.ru/uploads/Photos/294/phpu3nenm.jpeg	\N	\N	\N	\N	8	\N	2025-11-29 16:46:54.406
711	https://platina.vtcrm.ru/uploads/Photos/294/php0VzMge.jpeg	\N	\N	\N	\N	8	\N	2025-11-29 16:46:54.406
712	https://platina.vtcrm.ru/uploads/Photos/294/phpDoY9yi.jpeg	\N	\N	\N	\N	8	\N	2025-11-29 16:46:54.406
713	https://platina.vtcrm.ru/uploads/Photos/294/phpX47LT8.jpeg	\N	\N	\N	\N	8	\N	2025-11-29 16:46:54.406
714	https://platina.vtcrm.ru/uploads/Photos/294/phppH27Wl.jpeg	\N	\N	\N	\N	8	\N	2025-11-29 16:46:54.406
715	https://platina.vtcrm.ru/uploads/Photos/294/phpBQTPRW.jpeg	\N	\N	\N	\N	8	\N	2025-11-29 16:46:54.406
716	https://platina.vtcrm.ru/uploads/Photos/300/68345676e5af3.jpeg	\N	\N	2	\N	\N	\N	2025-11-29 16:51:13.495
717	https://platina.vtcrm.ru/uploads/Photos/300/68345676c0db4.jpeg	\N	\N	2	\N	\N	\N	2025-11-29 16:51:13.495
718	https://platina.vtcrm.ru/uploads/Photos/300/68345675a51ba.jpeg	\N	\N	2	\N	\N	\N	2025-11-29 16:51:13.495
719	https://platina.vtcrm.ru/uploads/Photos/300/68345675d09cc.jpeg	\N	\N	2	\N	\N	\N	2025-11-29 16:51:13.495
720	https://platina.vtcrm.ru/uploads/Photos/300/68345676037ed.jpeg	\N	\N	2	\N	\N	\N	2025-11-29 16:51:13.495
721	https://platina.vtcrm.ru/uploads/Photos/300/6834567629f85.jpeg	\N	\N	2	\N	\N	\N	2025-11-29 16:51:13.495
722	https://platina.vtcrm.ru/uploads/Photos/300/683456764f7d5.jpeg	\N	\N	2	\N	\N	\N	2025-11-29 16:51:13.495
723	https://platina.vtcrm.ru/uploads/Photos/300/6834567673837.jpeg	\N	\N	2	\N	\N	\N	2025-11-29 16:51:13.495
724	https://platina.vtcrm.ru/uploads/Photos/300/6834567699e23.jpeg	\N	\N	2	\N	\N	\N	2025-11-29 16:51:13.495
725	https://platina.vtcrm.ru/uploads/Photos/300/6834567718edb.jpeg	\N	\N	2	\N	\N	\N	2025-11-29 16:51:13.495
726	https://platina.vtcrm.ru/uploads/Photos/300/683456773f47a.jpeg	\N	\N	2	\N	\N	\N	2025-11-29 16:51:13.495
727	https://platina.vtcrm.ru/uploads/Photos/300/6834567764d1e.jpeg	\N	\N	2	\N	\N	\N	2025-11-29 16:51:13.495
728	https://platina.vtcrm.ru/uploads/Photos/300/6834567789f51.jpeg	\N	\N	2	\N	\N	\N	2025-11-29 16:51:13.495
729	https://platina.vtcrm.ru/uploads/Photos/300/68345677adcda.jpeg	\N	\N	2	\N	\N	\N	2025-11-29 16:51:13.495
730	https://platina.vtcrm.ru/uploads/Photos/300/68345677d0105.jpeg	\N	\N	2	\N	\N	\N	2025-11-29 16:51:13.495
731	https://platina.vtcrm.ru/uploads/Photos/300/68345677f3acf.jpeg	\N	\N	2	\N	\N	\N	2025-11-29 16:51:13.495
732	https://platina.vtcrm.ru/uploads/Photos/300/683456784c0b3.jpeg	\N	\N	2	\N	\N	\N	2025-11-29 16:51:13.495
733	https://platina.vtcrm.ru/uploads/Photos/307/phpXVE14G.jpeg	\N	\N	\N	\N	9	\N	2025-11-29 16:54:19.095
735	https://platina.vtcrm.ru/uploads/Photos/307/php7ImPtO.jpeg	\N	\N	\N	\N	9	\N	2025-11-29 16:54:19.095
736	https://platina.vtcrm.ru/uploads/Photos/307/php2ehN31.jpeg	\N	\N	\N	\N	9	\N	2025-11-29 16:54:19.095
737	https://platina.vtcrm.ru/uploads/Photos/307/phpUHFgUN.jpeg	\N	\N	\N	\N	9	\N	2025-11-29 16:54:19.095
738	https://platina.vtcrm.ru/uploads/Photos/307/phpNRXtmA.jpeg	\N	\N	\N	\N	9	\N	2025-11-29 16:54:19.095
739	https://platina.vtcrm.ru/uploads/Photos/307/phpmUoKbi.jpeg	\N	\N	\N	\N	9	\N	2025-11-29 16:54:19.095
740	https://platina.vtcrm.ru/uploads/Photos/307/phpTKIqv6.jpeg	\N	\N	\N	\N	9	\N	2025-11-29 16:54:19.095
741	https://platina.vtcrm.ru/uploads/Photos/307/phpLNUKOa.jpeg	\N	\N	\N	\N	9	\N	2025-11-29 16:54:19.095
742	https://platina.vtcrm.ru/uploads/Photos/307/phphZzrVi.jpeg	\N	\N	\N	\N	9	\N	2025-11-29 16:54:19.095
743	https://platina.vtcrm.ru/uploads/Photos/308/phpEC2TYL.jpeg	\N	\N	\N	\N	10	\N	2025-11-29 16:57:06.229
744	https://platina.vtcrm.ru/uploads/Photos/308/phpEU9MeH.jpeg	\N	\N	\N	\N	10	\N	2025-11-29 16:57:06.229
745	https://platina.vtcrm.ru/uploads/Photos/308/php0HzOC6.jpeg	\N	\N	\N	\N	10	\N	2025-11-29 16:57:06.229
746	http://platina.vtcrm.ru/uploads/Photos/308/phpWIAhPA.jpeg	\N	\N	\N	\N	10	\N	2025-11-29 16:57:06.229
747	https://platina.vtcrm.ru/uploads/Photos/308/phpAx6A9C.jpeg	\N	\N	\N	\N	10	\N	2025-11-29 16:57:06.229
748	https://platina.vtcrm.ru/uploads/Photos/308/phpBTS7cf.jpeg	\N	\N	\N	\N	10	\N	2025-11-29 16:57:06.229
749	https://platina.vtcrm.ru/uploads/Photos/308/phpcXIvJd.jpeg	\N	\N	\N	\N	10	\N	2025-11-29 16:57:06.229
750	https://platina.vtcrm.ru/uploads/Photos/308/phpKhlt9p.jpeg	\N	\N	\N	\N	10	\N	2025-11-29 16:57:06.229
751	https://platina.vtcrm.ru/uploads/Photos/308/phpryVItj.jpeg	\N	\N	\N	\N	10	\N	2025-11-29 16:57:06.229
752	https://platina.vtcrm.ru/uploads/Photos/308/phpVWg1Z4.jpeg	\N	\N	\N	\N	10	\N	2025-11-29 16:57:06.229
753	https://platina.vtcrm.ru/uploads/Photos/314/phpxna9Ao.jpeg	\N	\N	\N	19	\N	\N	2025-11-29 17:00:53.657
754	https://platina.vtcrm.ru/uploads/Photos/314/php0UMVh0.jpeg	\N	\N	\N	19	\N	\N	2025-11-29 17:00:53.657
755	https://platina.vtcrm.ru/uploads/Photos/314/phpZeKnmg.jpeg	\N	\N	\N	19	\N	\N	2025-11-29 17:00:53.657
756	https://platina.vtcrm.ru/uploads/Photos/314/phpHEQTPz.jpeg	\N	\N	\N	19	\N	\N	2025-11-29 17:00:53.657
757	https://platina.vtcrm.ru/uploads/Photos/314/phpc4AX7m.jpeg	\N	\N	\N	19	\N	\N	2025-11-29 17:00:53.657
758	https://platina.vtcrm.ru/uploads/Photos/314/php26b86i.jpeg	\N	\N	\N	19	\N	\N	2025-11-29 17:00:53.657
759	https://platina.vtcrm.ru/uploads/Photos/314/phpalI7Ee.jpeg	\N	\N	\N	19	\N	\N	2025-11-29 17:00:53.657
760	https://platina.vtcrm.ru/uploads/Photos/314/phpJlqE5A.jpeg	\N	\N	\N	19	\N	\N	2025-11-29 17:00:53.657
761	https://platina.vtcrm.ru/uploads/Photos/314/phpFl1HcG.jpeg	\N	\N	\N	19	\N	\N	2025-11-29 17:00:53.657
762	https://platina.vtcrm.ru/uploads/Photos/314/phpb4H4l0.jpeg	\N	\N	\N	19	\N	\N	2025-11-29 17:00:53.657
763	https://platina.vtcrm.ru/uploads/Photos/326/6840098d2ca94.jpeg	\N	\N	\N	\N	\N	3	2025-11-29 17:06:17.846
764	https://platina.vtcrm.ru/uploads/Photos/326/6840098d05deb.jpeg	\N	\N	\N	\N	\N	3	2025-11-29 17:08:42.749
765	https://platina.vtcrm.ru/uploads/Photos/326/6840098d544da.jpeg	\N	\N	\N	\N	\N	3	2025-11-29 17:08:42.749
766	https://platina.vtcrm.ru/uploads/Photos/326/6840098c30f6a.jpeg	\N	\N	\N	\N	\N	3	2025-11-29 17:08:42.749
767	https://platina.vtcrm.ru/uploads/Photos/326/6840098ca9f3b.jpeg	\N	\N	\N	\N	\N	3	2025-11-29 17:08:42.749
768	https://platina.vtcrm.ru/uploads/Photos/326/6840098cd44ca.jpeg	\N	\N	\N	\N	\N	3	2025-11-29 17:08:42.749
769	https://platina.vtcrm.ru/uploads/Photos/326/6840098d7a357.jpeg	\N	\N	\N	\N	\N	3	2025-11-29 17:08:42.749
770	https://platina.vtcrm.ru/uploads/Photos/326/6840098d929e0.jpeg	\N	\N	\N	\N	\N	3	2025-11-29 17:08:42.749
771	https://platina.vtcrm.ru/uploads/Photos/326/6840098dad257.jpeg	\N	\N	\N	\N	\N	3	2025-11-29 17:08:42.749
772	https://platina.vtcrm.ru/uploads/Photos/326/6840098de0f04.jpeg	\N	\N	\N	\N	\N	3	2025-11-29 17:08:42.749
773	https://platina.vtcrm.ru/uploads/Photos/326/6840098e06b33.jpeg	\N	\N	\N	\N	\N	3	2025-11-29 17:08:42.749
774	https://platina.vtcrm.ru/uploads/Photos/326/6840098e1fd9d.jpeg	\N	\N	\N	\N	\N	3	2025-11-29 17:08:42.749
775	https://platina.vtcrm.ru/uploads/Photos/326/6840098e3a02b.jpeg	\N	\N	\N	\N	\N	3	2025-11-29 17:08:42.749
776	https://platina.vtcrm.ru/uploads/Photos/326/6840098e6cf0c.jpeg	\N	\N	\N	\N	\N	3	2025-11-29 17:08:42.749
777	https://platina.vtcrm.ru/uploads/Photos/326/6840098e85e78.jpeg	\N	\N	\N	\N	\N	3	2025-11-29 17:08:42.749
778	https://platina.vtcrm.ru/uploads/Photos/326/6840098ed1a92.jpeg	\N	\N	\N	\N	\N	3	2025-11-29 17:08:42.749
779	https://platina.vtcrm.ru/uploads/Photos/332/php11EMb6.jpeg	\N	\N	\N	\N	11	\N	2025-11-29 17:11:16.903
780	https://platina.vtcrm.ru/uploads/Photos/353/684815f93a14c.jpeg	\N	\N	\N	20	\N	\N	2025-11-29 17:16:13.49
781	https://platina.vtcrm.ru/uploads/Photos/353/684815f9958dc.jpeg	\N	\N	\N	20	\N	\N	2025-11-29 17:16:13.49
782	https://platina.vtcrm.ru/uploads/Photos/353/684815f968441.jpeg	\N	\N	\N	20	\N	\N	2025-11-29 17:16:13.49
783	https://platina.vtcrm.ru/uploads/Photos/353/684815fa2c2f9.jpeg	\N	\N	\N	20	\N	\N	2025-11-29 17:16:13.49
784	https://platina.vtcrm.ru/uploads/Photos/353/684815fa13a87.jpeg	\N	\N	\N	20	\N	\N	2025-11-29 17:16:13.49
785	https://platina.vtcrm.ru/uploads/Photos/353/684815f90bc2c.jpeg	\N	\N	\N	20	\N	\N	2025-11-29 17:16:13.49
786	https://platina.vtcrm.ru/uploads/Photos/353/684815f9c3005.jpeg	\N	\N	\N	20	\N	\N	2025-11-29 17:16:13.49
787	https://platina.vtcrm.ru/uploads/Photos/353/684815f9da348.jpeg	\N	\N	\N	20	\N	\N	2025-11-29 17:16:13.49
788	https://platina.vtcrm.ru/uploads/Photos/353/684815f9ac5cf.jpeg	\N	\N	\N	20	\N	\N	2025-11-29 17:16:13.49
789	https://platina.vtcrm.ru/uploads/Photos/353/684815f8e7ea5.jpeg	\N	\N	\N	20	\N	\N	2025-11-29 17:16:13.49
790	https://platina.vtcrm.ru/uploads/Photos/353/684815f922bf8.jpeg	\N	\N	\N	20	\N	\N	2025-11-29 17:16:13.49
791	https://platina.vtcrm.ru/uploads/Photos/353/684815f951171.jpeg	\N	\N	\N	20	\N	\N	2025-11-29 17:16:13.49
792	https://platina.vtcrm.ru/uploads/Photos/353/684815f97ec3f.jpeg	\N	\N	\N	20	\N	\N	2025-11-29 17:16:13.49
793	https://platina.vtcrm.ru/uploads/Photos/353/684815f9f0e57.jpeg	\N	\N	\N	20	\N	\N	2025-11-29 17:16:13.49
794	https://platina.vtcrm.ru/uploads/Photos/353/684815fa44137.jpeg	\N	\N	\N	20	\N	\N	2025-11-29 17:16:13.49
795	https://platina.vtcrm.ru/uploads/Photos/353/684815fa5a922.jpeg	\N	\N	\N	20	\N	\N	2025-11-29 17:16:13.49
796	https://platina.vtcrm.ru/uploads/Photos/353/684815fa712de.jpeg	\N	\N	\N	20	\N	\N	2025-11-29 17:16:13.49
797	https://platina.vtcrm.ru/uploads/Photos/353/684815fa869d2.jpeg	\N	\N	\N	20	\N	\N	2025-11-29 17:16:13.49
798	https://platina.vtcrm.ru/uploads/Photos/353/684815fa9cfc5.jpeg	\N	\N	\N	20	\N	\N	2025-11-29 17:16:13.49
799	https://platina.vtcrm.ru/uploads/Photos/361/php1yV0qI.jpeg	\N	\N	\N	21	\N	\N	2025-11-29 17:19:12.457
800	https://platina.vtcrm.ru/uploads/Photos/361/phpvxPNt2.jpeg	\N	\N	\N	21	\N	\N	2025-11-29 17:19:12.457
801	https://platina.vtcrm.ru/uploads/Photos/361/phprHzk72.jpeg	\N	\N	\N	21	\N	\N	2025-11-29 17:19:12.457
802	https://platina.vtcrm.ru/uploads/Photos/361/phpUlklkp.jpeg	\N	\N	\N	21	\N	\N	2025-11-29 17:19:12.457
803	https://platina.vtcrm.ru/uploads/Photos/361/phppswmDQ.jpeg	\N	\N	\N	21	\N	\N	2025-11-29 17:19:12.457
804	https://platina.vtcrm.ru/uploads/Photos/361/phpLxOwZ6.jpeg	\N	\N	\N	21	\N	\N	2025-11-29 17:19:12.457
805	https://platina.vtcrm.ru/uploads/Photos/361/phpdFdnH8.jpeg	\N	\N	\N	21	\N	\N	2025-11-29 17:19:12.457
806	https://platina.vtcrm.ru/uploads/Photos/361/phpcgJ15M.jpeg	\N	\N	\N	21	\N	\N	2025-11-29 17:19:12.457
807	https://platina.vtcrm.ru/uploads/Photos/361/phpHMsKBz.jpeg	\N	\N	\N	21	\N	\N	2025-11-29 17:19:12.457
808	https://platina.vtcrm.ru/uploads/Photos/369/php8LOwTo.jpeg	\N	\N	\N	\N	12	\N	2025-11-29 17:33:17.216
809	https://platina.vtcrm.ru/uploads/Photos/369/phpXjT1CJ.jpeg	\N	\N	\N	\N	12	\N	2025-11-29 17:33:17.216
810	https://platina.vtcrm.ru/uploads/Photos/369/phpdKzLcD.jpeg	\N	\N	\N	\N	12	\N	2025-11-29 17:33:17.216
811	https://platina.vtcrm.ru/uploads/Photos/369/phpTwIOpn.jpeg	\N	\N	\N	\N	12	\N	2025-11-29 17:33:17.216
812	https://platina.vtcrm.ru/uploads/Photos/369/php3rw3S6.jpeg	\N	\N	\N	\N	12	\N	2025-11-29 17:33:17.216
813	https://platina.vtcrm.ru/uploads/Photos/369/phpj2AR9W.jpeg	\N	\N	\N	\N	12	\N	2025-11-29 17:33:17.216
814	https://platina.vtcrm.ru/uploads/Photos/369/php9ykt5Q.jpeg	\N	\N	\N	\N	12	\N	2025-11-29 17:33:17.216
815	https://platina.vtcrm.ru/uploads/Photos/369/phpSWdVPE.jpeg	\N	\N	\N	\N	12	\N	2025-11-29 17:33:17.216
816	https://platina.vtcrm.ru/uploads/Photos/370/php4NYAII.jpeg	\N	\N	\N	\N	13	\N	2025-11-29 17:36:41.865
817	https://platina.vtcrm.ru/uploads/Photos/370/phpSjAYRW.jpeg	\N	\N	\N	\N	13	\N	2025-11-29 17:36:41.865
818	https://platina.vtcrm.ru/uploads/Photos/370/php9UFyBF.jpeg	\N	\N	\N	\N	13	\N	2025-11-29 17:36:41.865
819	https://platina.vtcrm.ru/uploads/Photos/370/php6GqCiv.jpeg	\N	\N	\N	\N	13	\N	2025-11-29 17:36:41.865
820	https://platina.vtcrm.ru/uploads/Photos/370/phpjHCx64.jpeg	\N	\N	\N	\N	13	\N	2025-11-29 17:36:41.865
821	https://platina.vtcrm.ru/uploads/Photos/388/phptx6mu1.jpeg	\N	\N	\N	\N	14	\N	2025-11-29 17:40:59.115
822	https://platina.vtcrm.ru/uploads/Photos/388/phpjxDp1J.jpeg	\N	\N	\N	\N	14	\N	2025-11-29 17:40:59.115
823	https://platina.vtcrm.ru/uploads/Photos/388/phpSCHDEc.jpeg	\N	\N	\N	\N	14	\N	2025-11-29 17:40:59.115
824	https://platina.vtcrm.ru/uploads/Photos/388/phptCsUV2.jpeg	\N	\N	\N	\N	14	\N	2025-11-29 17:40:59.115
825	https://platina.vtcrm.ru/uploads/Photos/388/phpEwXyQy.jpeg	\N	\N	\N	\N	14	\N	2025-11-29 17:40:59.115
826	https://platina.vtcrm.ru/uploads/Photos/388/phpjfJHL3.jpeg	\N	\N	\N	\N	14	\N	2025-11-29 17:40:59.115
827	https://platina.vtcrm.ru/uploads/Photos/388/phpM4fjMj.jpeg	\N	\N	\N	\N	14	\N	2025-11-29 17:40:59.115
828	https://platina.vtcrm.ru/uploads/Photos/388/phpzjhLRU.jpeg	\N	\N	\N	\N	14	\N	2025-11-29 17:40:59.115
829	https://platina.vtcrm.ru/uploads/Photos/388/phpZFbLis.jpeg	\N	\N	\N	\N	14	\N	2025-11-29 17:40:59.115
830	https://platina.vtcrm.ru/uploads/Photos/388/phpsaYMvO.jpeg	\N	\N	\N	\N	14	\N	2025-11-29 17:40:59.115
831	https://platina.vtcrm.ru/uploads/Photos/388/php8pKQEb.jpeg	\N	\N	\N	\N	14	\N	2025-11-29 17:40:59.115
832	https://platina.vtcrm.ru/uploads/Photos/388/phpnuquD2.jpeg	\N	\N	\N	\N	14	\N	2025-11-29 17:40:59.115
833	https://platina.vtcrm.ru/uploads/Photos/388/phpktOvZ3.jpeg	\N	\N	\N	\N	14	\N	2025-11-29 17:40:59.115
834	https://platina.vtcrm.ru/uploads/Photos/388/phpDPrlrR.jpeg	\N	\N	\N	\N	14	\N	2025-11-29 17:40:59.115
835	https://platina.vtcrm.ru/uploads/Photos/388/phpzv4zAT.jpeg	\N	\N	\N	\N	14	\N	2025-11-29 17:40:59.115
836	https://platina.vtcrm.ru/uploads/Photos/388/phpNg8OEl.jpeg	\N	\N	\N	\N	14	\N	2025-11-29 17:40:59.115
837	https://platina.vtcrm.ru/uploads/Photos/388/phpRcqeuf.jpeg	\N	\N	\N	\N	14	\N	2025-11-29 17:40:59.115
838	https://platina.vtcrm.ru/uploads/Photos/416/phpXBIKYq.jpeg	\N	\N	\N	22	\N	\N	2025-11-29 17:45:08.168
839	https://platina.vtcrm.ru/uploads/Photos/416/phpoBph67.jpeg	\N	\N	\N	22	\N	\N	2025-11-29 17:45:08.168
840	https://platina.vtcrm.ru/uploads/Photos/416/phpl0meNJ.jpeg	\N	\N	\N	22	\N	\N	2025-11-29 17:45:08.168
841	https://platina.vtcrm.ru/uploads/Photos/416/phpsSnLhF.jpeg	\N	\N	\N	22	\N	\N	2025-11-29 17:45:08.168
842	https://platina.vtcrm.ru/uploads/Photos/416/phpUFMsgj.jpeg	\N	\N	\N	22	\N	\N	2025-11-29 17:45:08.168
843	https://platina.vtcrm.ru/uploads/Photos/416/phpEg30ob.jpeg	\N	\N	\N	22	\N	\N	2025-11-29 17:45:08.168
844	https://platina.vtcrm.ru/uploads/Photos/416/phpLGgJZT.jpeg	\N	\N	\N	22	\N	\N	2025-11-29 17:45:08.168
845	https://platina.vtcrm.ru/uploads/Photos/416/phpnxEVy8.jpeg	\N	\N	\N	22	\N	\N	2025-11-29 17:45:08.168
846	https://platina.vtcrm.ru/uploads/Photos/416/phpoBzdNp.jpeg	\N	\N	\N	22	\N	\N	2025-11-29 17:45:08.168
847	https://platina.vtcrm.ru/uploads/Photos/416/php2wcCeE.jpeg	\N	\N	\N	22	\N	\N	2025-11-29 17:45:08.168
848	https://platina.vtcrm.ru/uploads/Photos/416/php5NOZIi.jpeg	\N	\N	\N	22	\N	\N	2025-11-29 17:45:08.168
849	https://platina.vtcrm.ru/uploads/Photos/416/php00NqDA.jpeg	\N	\N	\N	22	\N	\N	2025-11-29 17:45:08.168
850	https://platina.vtcrm.ru/uploads/Photos/416/phpEX9x0U.jpeg	\N	\N	\N	22	\N	\N	2025-11-29 17:45:08.168
851	https://platina.vtcrm.ru/uploads/Photos/416/phpH7RdnB.jpeg	\N	\N	\N	22	\N	\N	2025-11-29 17:45:08.168
852	https://platina.vtcrm.ru/uploads/Photos/416/phpdLJSTu.jpeg	\N	\N	\N	22	\N	\N	2025-11-29 17:45:08.168
853	https://platina.vtcrm.ru/uploads/Photos/416/phpDgG3kN.jpeg	\N	\N	\N	22	\N	\N	2025-11-29 17:45:08.168
854	https://platina.vtcrm.ru/uploads/Photos/416/php4dA7b4.jpeg	\N	\N	\N	22	\N	\N	2025-11-29 17:45:08.168
855	https://platina.vtcrm.ru/uploads/Photos/418/phpYCaZwg.jpeg	\N	\N	\N	23	\N	\N	2025-11-29 17:47:43.729
856	https://platina.vtcrm.ru/uploads/Photos/418/phpRM34jQ.jpeg	\N	\N	\N	23	\N	\N	2025-11-29 17:47:43.729
857	https://platina.vtcrm.ru/uploads/Photos/418/phpCvFuYF.jpeg	\N	\N	\N	23	\N	\N	2025-11-29 17:47:43.729
858	https://platina.vtcrm.ru/uploads/Photos/418/php29jClm.jpeg	\N	\N	\N	23	\N	\N	2025-11-29 17:47:43.729
859	https://platina.vtcrm.ru/uploads/Photos/418/phpUuie9u.jpeg	\N	\N	\N	23	\N	\N	2025-11-29 17:47:43.729
860	https://platina.vtcrm.ru/uploads/Photos/418/php4yVN2b.jpeg	\N	\N	\N	23	\N	\N	2025-11-29 17:47:43.729
861	https://platina.vtcrm.ru/uploads/Photos/418/phpU4A6UE.jpeg	\N	\N	\N	23	\N	\N	2025-11-29 17:47:43.729
862	https://platina.vtcrm.ru/uploads/Photos/418/phpVzGDn9.jpeg	\N	\N	\N	23	\N	\N	2025-11-29 17:47:43.729
863	https://platina.vtcrm.ru/uploads/Photos/418/phpPq0VDH.jpeg	\N	\N	\N	23	\N	\N	2025-11-29 17:47:43.729
864	https://platina.vtcrm.ru/uploads/Photos/457/phpib4Bww.jpeg	\N	\N	\N	24	\N	\N	2025-11-29 17:50:43.681
865	https://platina.vtcrm.ru/uploads/Photos/457/phpgNwAMb.jpeg	\N	\N	\N	24	\N	\N	2025-11-29 17:50:43.681
866	https://platina.vtcrm.ru/uploads/Photos/457/phpPPgdcl.jpeg	\N	\N	\N	24	\N	\N	2025-11-29 17:50:43.681
867	https://platina.vtcrm.ru/uploads/Photos/457/phpadPf0O.jpeg	\N	\N	\N	24	\N	\N	2025-11-29 17:50:43.681
868	https://platina.vtcrm.ru/uploads/Photos/457/phpNM00YN.jpeg	\N	\N	\N	24	\N	\N	2025-11-29 17:50:43.681
869	https://platina.vtcrm.ru/uploads/Photos/457/phpLK8Zj8.jpeg	\N	\N	\N	24	\N	\N	2025-11-29 17:50:43.681
870	https://platina.vtcrm.ru/uploads/Photos/457/phpPSRU57.jpeg	\N	\N	\N	24	\N	\N	2025-11-29 17:50:43.681
871	https://platina.vtcrm.ru/uploads/Photos/457/phpB9FWzD.jpeg	\N	\N	\N	24	\N	\N	2025-11-29 17:50:43.681
872	https://platina.vtcrm.ru/uploads/Photos/494/phpf1Owz8.jpeg	\N	\N	\N	25	\N	\N	2025-11-29 17:52:57.608
873	https://platina.vtcrm.ru/uploads/Photos/494/phpybifKr.jpeg	\N	\N	\N	25	\N	\N	2025-11-29 17:52:57.608
874	https://platina.vtcrm.ru/uploads/Photos/494/phpdVWivJ.jpeg	\N	\N	\N	25	\N	\N	2025-11-29 17:52:57.608
875	https://platina.vtcrm.ru/uploads/Photos/437/php27K1Dw.jpeg	\N	\N	\N	\N	15	\N	2025-11-29 17:57:00.54
876	https://platina.vtcrm.ru/uploads/Photos/437/php3l1IHN.jpeg	\N	\N	\N	\N	15	\N	2025-11-29 17:57:00.54
877	https://platina.vtcrm.ru/uploads/Photos/437/phpsEcF7c.jpeg	\N	\N	\N	\N	15	\N	2025-11-29 17:57:00.54
878	https://platina.vtcrm.ru/uploads/Photos/437/phpYXbdnj.jpeg	\N	\N	\N	\N	15	\N	2025-11-29 17:57:00.54
879	https://platina.vtcrm.ru/uploads/Photos/437/phpNLkpjG.jpeg	\N	\N	\N	\N	15	\N	2025-11-29 17:57:00.54
880	https://platina.vtcrm.ru/uploads/Photos/437/phpFf3ojE.jpeg	\N	\N	\N	\N	15	\N	2025-11-29 17:57:00.54
881	https://platina.vtcrm.ru/uploads/Photos/437/phpiwHz7q.jpeg	\N	\N	\N	\N	15	\N	2025-11-29 17:57:00.54
882	https://platina.vtcrm.ru/uploads/Photos/437/phpEqUPWj.jpeg	\N	\N	\N	\N	15	\N	2025-11-29 17:57:00.54
883	https://platina.vtcrm.ru/uploads/Photos/437/phpc0IWQ8.jpeg	\N	\N	\N	\N	15	\N	2025-11-29 17:57:00.54
884	https://platina.vtcrm.ru/uploads/Photos/437/phpUPgS3T.jpeg	\N	\N	\N	\N	15	\N	2025-11-29 17:57:00.54
885	https://platina.vtcrm.ru/uploads/Photos/437/phpP3NPAZ.jpeg	\N	\N	\N	\N	15	\N	2025-11-29 17:57:00.54
886	https://platina.vtcrm.ru/uploads/Photos/437/phpk2EmUF.jpeg	\N	\N	\N	\N	15	\N	2025-11-29 17:57:00.54
887	https://platina.vtcrm.ru/uploads/Photos/437/phpuB9b75.jpeg	\N	\N	\N	\N	15	\N	2025-11-29 17:57:00.54
888	https://platina.vtcrm.ru/uploads/Photos/437/phpAfiGyA.jpeg	\N	\N	\N	\N	15	\N	2025-11-29 17:57:00.54
889	https://platina.vtcrm.ru/uploads/Photos/437/phpreDH6i.jpeg	\N	\N	\N	\N	15	\N	2025-11-29 17:57:00.54
890	https://platina.vtcrm.ru/uploads/Photos/437/php0ApcLs.jpeg	\N	\N	\N	\N	15	\N	2025-11-29 17:57:00.54
891	https://platina.vtcrm.ru/uploads/Photos/437/phpS1tCip.jpeg	\N	\N	\N	\N	15	\N	2025-11-29 17:57:00.54
892	https://platina.vtcrm.ru/uploads/Photos/437/phpTwFX2I.jpeg	\N	\N	\N	\N	15	\N	2025-11-29 17:57:00.54
893	https://platina.vtcrm.ru/uploads/Photos/437/phpvJ3HFc.jpeg	\N	\N	\N	\N	15	\N	2025-11-29 17:57:00.54
894	https://platina.vtcrm.ru/uploads/Photos/449/phpnDwSVg.jpeg	\N	\N	\N	\N	16	\N	2025-11-29 18:01:31.146
895	https://platina.vtcrm.ru/uploads/Photos/449/phpGP4h85.jpeg	\N	\N	\N	\N	16	\N	2025-11-29 18:01:31.146
896	https://platina.vtcrm.ru/uploads/Photos/449/phpR6RJDc.jpeg	\N	\N	\N	\N	16	\N	2025-11-29 18:01:31.146
897	https://platina.vtcrm.ru/uploads/Photos/449/phpE2LsuQ.jpeg	\N	\N	\N	\N	16	\N	2025-11-29 18:01:31.146
898	https://platina.vtcrm.ru/uploads/Photos/449/phpaw8nQ9.jpeg	\N	\N	\N	\N	16	\N	2025-11-29 18:01:31.146
899	https://platina.vtcrm.ru/uploads/Photos/449/phpQJb2I8.jpeg	\N	\N	\N	\N	16	\N	2025-11-29 18:01:31.146
900	https://platina.vtcrm.ru/uploads/Photos/449/phpq0i9Lw.jpeg	\N	\N	\N	\N	16	\N	2025-11-29 18:01:31.146
901	https://platina.vtcrm.ru/uploads/Photos/449/php3IzFQl.jpeg	\N	\N	\N	\N	16	\N	2025-11-29 18:01:31.146
902	https://platina.vtcrm.ru/uploads/Photos/449/phpJRLe2B.jpeg	\N	\N	\N	\N	16	\N	2025-11-29 18:01:31.146
903	https://platina.vtcrm.ru/uploads/Photos/449/php4sqNgd.jpeg	\N	\N	\N	\N	16	\N	2025-11-29 18:01:31.146
904	https://platina.vtcrm.ru/uploads/Photos/449/phpPnTQhF.jpeg	\N	\N	\N	\N	16	\N	2025-11-29 18:01:31.146
905	https://platina.vtcrm.ru/uploads/Photos/449/phpmHnbzc.jpeg	\N	\N	\N	\N	16	\N	2025-11-29 18:01:31.146
906	https://platina.vtcrm.ru/uploads/Photos/449/phpWFe2Fz.jpeg	\N	\N	\N	\N	16	\N	2025-11-29 18:01:31.146
907	https://platina.vtcrm.ru/uploads/Photos/449/php2SZoLu.jpeg	\N	\N	\N	\N	16	\N	2025-11-29 18:01:31.146
908	https://platina.vtcrm.ru/uploads/Photos/449/phppzkV0Z.jpeg	\N	\N	\N	\N	16	\N	2025-11-29 18:01:31.146
909	https://platina.vtcrm.ru/uploads/Photos/449/phpXs0f5R.jpeg	\N	\N	\N	\N	16	\N	2025-11-29 18:01:31.146
910	https://platina.vtcrm.ru/uploads/Photos/449/phpH0w8Wc.jpeg	\N	\N	\N	\N	16	\N	2025-11-29 18:01:31.146
911	https://platina.vtcrm.ru/uploads/Photos/449/phpcTiD37.jpeg	\N	\N	\N	\N	16	\N	2025-11-29 18:01:31.146
912	https://platina.vtcrm.ru/uploads/Photos/449/phpDh1mkJ.jpeg	\N	\N	\N	\N	16	\N	2025-11-29 18:01:31.146
913	https://platina.vtcrm.ru/uploads/Photos/449/phpWXIla9.jpeg	\N	\N	\N	\N	16	\N	2025-11-29 18:01:31.146
914	https://platina.vtcrm.ru/uploads/Photos/449/php87KtaO.jpeg	\N	\N	\N	\N	16	\N	2025-11-29 18:01:31.146
915	https://platina.vtcrm.ru/uploads/Photos/449/php3RRtLk.jpeg	\N	\N	\N	\N	16	\N	2025-11-29 18:01:31.146
916	https://platina.vtcrm.ru/uploads/Photos/507/phpmhuGZt.jpeg	\N	\N	\N	26	\N	\N	2025-11-30 09:01:27.775
917	https://platina.vtcrm.ru/uploads/Photos/507/phpHMvu2b.jpeg	\N	\N	\N	26	\N	\N	2025-11-30 09:01:27.775
918	https://platina.vtcrm.ru/uploads/Photos/507/phpRJrMwI.jpeg	\N	\N	\N	26	\N	\N	2025-11-30 09:01:27.775
919	https://platina.vtcrm.ru/uploads/Photos/507/phpTOptx4.jpeg	\N	\N	\N	26	\N	\N	2025-11-30 09:01:27.775
920	https://platina.vtcrm.ru/uploads/Photos/507/phpIRUbR3.jpeg	\N	\N	\N	26	\N	\N	2025-11-30 09:01:27.775
921	https://platina.vtcrm.ru/uploads/Photos/507/phpXs2aqv.jpeg	\N	\N	\N	26	\N	\N	2025-11-30 09:01:27.775
922	https://platina.vtcrm.ru/uploads/Photos/507/phpHQRX5z.jpeg	\N	\N	\N	26	\N	\N	2025-11-30 09:01:27.775
923	https://platina.vtcrm.ru/uploads/Photos/507/phpZ7I1aX.jpeg	\N	\N	\N	26	\N	\N	2025-11-30 09:01:27.775
924	https://platina.vtcrm.ru/uploads/Photos/507/phpSkklbI.jpeg	\N	\N	\N	26	\N	\N	2025-11-30 09:01:27.775
925	https://platina.vtcrm.ru/uploads/Photos/533/php9MvUyE.jpeg	\N	\N	\N	27	\N	\N	2025-11-30 09:04:43.251
926	https://platina.vtcrm.ru/uploads/Photos/533/phpu9R6sH.jpeg	\N	\N	\N	27	\N	\N	2025-11-30 09:04:43.251
927	https://platina.vtcrm.ru/uploads/Photos/533/phprw8bru.jpeg	\N	\N	\N	27	\N	\N	2025-11-30 09:04:43.251
928	https://platina.vtcrm.ru/uploads/Photos/533/phpM0DvS3.jpeg	\N	\N	\N	27	\N	\N	2025-11-30 09:04:43.251
929	https://platina.vtcrm.ru/uploads/Photos/533/phpubQsOi.jpeg	\N	\N	\N	27	\N	\N	2025-11-30 09:04:43.251
930	https://platina.vtcrm.ru/uploads/Photos/533/phpsg5vn4.jpeg	\N	\N	\N	27	\N	\N	2025-11-30 09:04:43.251
931	https://platina.vtcrm.ru/uploads/Photos/533/phpw1eSrp.jpeg	\N	\N	\N	27	\N	\N	2025-11-30 09:04:43.251
932	https://platina.vtcrm.ru/uploads/Photos/533/php6hcGgG.jpeg	\N	\N	\N	27	\N	\N	2025-11-30 09:04:43.251
933	https://platina.vtcrm.ru/uploads/Photos/533/phpStt5cr.jpeg	\N	\N	\N	27	\N	\N	2025-11-30 09:04:43.251
934	https://platina.vtcrm.ru/uploads/Photos/533/phpdkz2U2.jpeg	\N	\N	\N	27	\N	\N	2025-11-30 09:04:43.251
935	https://platina.vtcrm.ru/uploads/Photos/533/phpbdthhp.jpeg	\N	\N	\N	27	\N	\N	2025-11-30 09:04:43.251
936	https://platina.vtcrm.ru/uploads/Photos/541/phpi05Hg7.jpeg	\N	\N	\N	28	\N	\N	2025-11-30 09:08:43.818
937	https://platina.vtcrm.ru/uploads/Photos/541/phpZGbldX.jpeg	\N	\N	\N	28	\N	\N	2025-11-30 09:08:43.818
938	https://platina.vtcrm.ru/uploads/Photos/541/phpKsc9ti.jpeg	\N	\N	\N	28	\N	\N	2025-11-30 09:08:43.818
939	https://platina.vtcrm.ru/uploads/Photos/541/phpuKvFvA.jpeg	\N	\N	\N	28	\N	\N	2025-11-30 09:08:43.818
940	https://platina.vtcrm.ru/uploads/Photos/541/phpeYeTes.jpeg	\N	\N	\N	28	\N	\N	2025-11-30 09:08:43.818
941	https://platina.vtcrm.ru/uploads/Photos/541/phps9o0LY.jpeg	\N	\N	\N	28	\N	\N	2025-11-30 09:08:43.818
942	https://platina.vtcrm.ru/uploads/Photos/541/phpfBigzX.jpeg	\N	\N	\N	28	\N	\N	2025-11-30 09:08:43.818
943	https://platina.vtcrm.ru/uploads/Photos/541/phpXklhoR.jpeg	\N	\N	\N	28	\N	\N	2025-11-30 09:08:43.818
944	https://platina.vtcrm.ru/uploads/Photos/541/phpgoizgj.jpeg	\N	\N	\N	28	\N	\N	2025-11-30 09:08:43.818
945	https://platina.vtcrm.ru/uploads/Photos/541/phpKVIXf4.jpeg	\N	\N	\N	28	\N	\N	2025-11-30 09:08:43.818
946	https://platina.vtcrm.ru/uploads/Photos/541/phpZmsgy9.jpeg	\N	\N	\N	28	\N	\N	2025-11-30 09:08:43.818
947	https://platina.vtcrm.ru/uploads/Photos/541/phpjcFYS7.jpeg	\N	\N	\N	28	\N	\N	2025-11-30 09:08:43.818
948	https://platina.vtcrm.ru/uploads/Photos/541/phpLIpB8b.jpeg	\N	\N	\N	28	\N	\N	2025-11-30 09:08:43.818
949	https://platina.vtcrm.ru/uploads/Photos/541/phpSBtnHD.jpeg	\N	\N	\N	28	\N	\N	2025-11-30 09:08:43.818
950	https://platina.vtcrm.ru/uploads/Photos/541/phpKPv83J.jpeg	\N	\N	\N	28	\N	\N	2025-11-30 09:08:43.818
951	https://platina.vtcrm.ru/uploads/Photos/541/phpAFpXEL.jpeg	\N	\N	\N	28	\N	\N	2025-11-30 09:08:43.818
952	https://platina.vtcrm.ru/uploads/Photos/541/php26gsjd.jpeg	\N	\N	\N	28	\N	\N	2025-11-30 09:08:43.818
953	https://platina.vtcrm.ru/uploads/Photos/543/phpOkXRwH.jpeg	\N	\N	\N	29	\N	\N	2025-11-30 09:11:58.477
954	https://platina.vtcrm.ru/uploads/Photos/543/php9qw2k3.jpeg	\N	\N	\N	29	\N	\N	2025-11-30 09:11:58.477
955	https://platina.vtcrm.ru/uploads/Photos/543/phpwGEc3e.jpeg	\N	\N	\N	29	\N	\N	2025-11-30 09:11:58.477
956	https://platina.vtcrm.ru/uploads/Photos/543/php6t2k17.jpeg	\N	\N	\N	29	\N	\N	2025-11-30 09:11:58.477
957	https://platina.vtcrm.ru/uploads/Photos/543/phpMRPnhe.jpeg	\N	\N	\N	29	\N	\N	2025-11-30 09:11:58.477
958	https://platina.vtcrm.ru/uploads/Photos/543/phpkAERJU.jpeg	\N	\N	\N	29	\N	\N	2025-11-30 09:11:58.477
959	https://platina.vtcrm.ru/uploads/Photos/543/phpGFuO3K.jpeg	\N	\N	\N	29	\N	\N	2025-11-30 09:11:58.477
960	https://platina.vtcrm.ru/uploads/Photos/543/phpoEwI3z.jpeg	\N	\N	\N	29	\N	\N	2025-11-30 09:11:58.477
961	https://platina.vtcrm.ru/uploads/Photos/543/phptytk8z.jpeg	\N	\N	\N	29	\N	\N	2025-11-30 09:11:58.477
962	https://platina.vtcrm.ru/uploads/Photos/543/phpjt4CY3.jpeg	\N	\N	\N	29	\N	\N	2025-11-30 09:11:58.477
963	https://platina.vtcrm.ru/uploads/Photos/543/phpfGmiJt.jpeg	\N	\N	\N	29	\N	\N	2025-11-30 09:11:58.477
964	https://platina.vtcrm.ru/uploads/Photos/543/phpYj5vWy.jpeg	\N	\N	\N	29	\N	\N	2025-11-30 09:11:58.477
965	https://platina.vtcrm.ru/uploads/Photos/543/phpB6gQeD.jpeg	\N	\N	\N	29	\N	\N	2025-11-30 09:11:58.477
966	https://platina.vtcrm.ru/uploads/Photos/559/phpL9vzB0.jpeg	\N	\N	\N	30	\N	\N	2025-11-30 09:16:30.761
967	https://platina.vtcrm.ru/uploads/Photos/559/phpM1Slw7.jpeg	\N	\N	\N	30	\N	\N	2025-11-30 09:16:30.761
968	https://platina.vtcrm.ru/uploads/Photos/559/phpoSJYwI.jpeg	\N	\N	\N	30	\N	\N	2025-11-30 09:16:30.761
969	https://platina.vtcrm.ru/uploads/Photos/559/phpdxAn2c.jpeg	\N	\N	\N	30	\N	\N	2025-11-30 09:16:30.761
970	https://platina.vtcrm.ru/uploads/Photos/559/phpqAcEnh.jpeg	\N	\N	\N	30	\N	\N	2025-11-30 09:16:30.761
971	https://platina.vtcrm.ru/uploads/Photos/559/phpjAfUj0.jpeg	\N	\N	\N	30	\N	\N	2025-11-30 09:16:30.761
972	https://platina.vtcrm.ru/uploads/Photos/559/php4ufIGY.jpeg	\N	\N	\N	30	\N	\N	2025-11-30 09:16:30.761
973	https://platina.vtcrm.ru/uploads/Photos/559/phpH1auJ3.jpeg	\N	\N	\N	30	\N	\N	2025-11-30 09:16:30.761
974	https://platina.vtcrm.ru/uploads/Photos/559/phpZK3C9F.jpeg	\N	\N	\N	30	\N	\N	2025-11-30 09:16:30.761
975	https://platina.vtcrm.ru/uploads/Photos/559/phpstl5DT.jpeg	\N	\N	\N	30	\N	\N	2025-11-30 09:16:30.761
976	https://platina.vtcrm.ru/uploads/Photos/559/phpKK2oyf.jpeg	\N	\N	\N	30	\N	\N	2025-11-30 09:16:30.761
977	https://platina.vtcrm.ru/uploads/Photos/559/phppXKQND.jpeg	\N	\N	\N	30	\N	\N	2025-11-30 09:16:30.761
978	https://platina.vtcrm.ru/uploads/Photos/559/phpZjuo4M.jpeg	\N	\N	\N	30	\N	\N	2025-11-30 09:16:30.761
979	https://platina.vtcrm.ru/uploads/Photos/559/php2ExwNm.jpeg	\N	\N	\N	30	\N	\N	2025-11-30 09:16:30.761
980	https://platina.vtcrm.ru/uploads/Photos/559/phprKRS1N.jpeg	\N	\N	\N	30	\N	\N	2025-11-30 09:16:30.761
981	https://platina.vtcrm.ru/uploads/Photos/559/phpWEqFnd.jpeg	\N	\N	\N	30	\N	\N	2025-11-30 09:16:30.761
982	https://platina.vtcrm.ru/uploads/Photos/559/phpkXrHpZ.jpeg	\N	\N	\N	30	\N	\N	2025-11-30 09:16:30.761
983	https://platina.vtcrm.ru/uploads/Photos/559/phpV2iB7e.jpeg	\N	\N	\N	30	\N	\N	2025-11-30 09:16:30.761
984	https://platina.vtcrm.ru/uploads/Photos/573/phpUUgryo.jpeg	\N	\N	\N	31	\N	\N	2025-11-30 09:18:56.354
985	https://platina.vtcrm.ru/uploads/Photos/573/phpNiKzzI.jpeg	\N	\N	\N	31	\N	\N	2025-11-30 09:18:56.354
986	https://platina.vtcrm.ru/uploads/Photos/573/phpZWL9fQ.jpeg	\N	\N	\N	31	\N	\N	2025-11-30 09:18:56.354
987	https://platina.vtcrm.ru/uploads/Photos/573/phpJCfKPB.jpeg	\N	\N	\N	31	\N	\N	2025-11-30 09:18:56.354
988	https://platina.vtcrm.ru/uploads/Photos/573/phpEjxuKh.jpeg	\N	\N	\N	31	\N	\N	2025-11-30 09:18:56.354
989	https://platina.vtcrm.ru/uploads/Photos/573/phpYGWOY6.jpeg	\N	\N	\N	31	\N	\N	2025-11-30 09:18:56.354
990	https://platina.vtcrm.ru/uploads/Photos/602/php20PHP3.jpeg	\N	\N	\N	32	\N	\N	2025-11-30 09:22:16.708
991	https://platina.vtcrm.ru/uploads/Photos/602/phpfiQUgw.jpeg	\N	\N	\N	32	\N	\N	2025-11-30 09:22:16.708
992	https://platina.vtcrm.ru/uploads/Photos/602/phpwNwcwm.jpeg	\N	\N	\N	32	\N	\N	2025-11-30 09:22:16.708
993	https://platina.vtcrm.ru/uploads/Photos/602/phpn8NtIp.jpeg	\N	\N	\N	32	\N	\N	2025-11-30 09:22:16.708
994	https://platina.vtcrm.ru/uploads/Photos/602/phpixFL90.jpeg	\N	\N	\N	32	\N	\N	2025-11-30 09:22:16.708
995	https://platina.vtcrm.ru/uploads/Photos/602/phpbgnEGD.jpeg	\N	\N	\N	32	\N	\N	2025-11-30 09:22:16.708
996	https://platina.vtcrm.ru/uploads/Photos/602/php64XZxX.jpeg	\N	\N	\N	32	\N	\N	2025-11-30 09:22:16.708
997	https://platina.vtcrm.ru/uploads/Photos/602/phplJLl5g.jpeg	\N	\N	\N	32	\N	\N	2025-11-30 09:22:16.708
998	https://platina.vtcrm.ru/uploads/Photos/602/phpTFNIM5.jpeg	\N	\N	\N	32	\N	\N	2025-11-30 09:22:16.708
999	https://platina.vtcrm.ru/uploads/Photos/602/phpeowGWI.jpeg	\N	\N	\N	32	\N	\N	2025-11-30 09:22:16.708
1000	https://platina.vtcrm.ru/uploads/Photos/602/phpgGMYfD.jpeg	\N	\N	\N	32	\N	\N	2025-11-30 09:22:16.708
1001	https://platina.vtcrm.ru/uploads/Photos/602/phpwhsMHd.jpeg	\N	\N	\N	32	\N	\N	2025-11-30 09:22:16.708
1002	https://platina.vtcrm.ru/uploads/Photos/602/php28jqm2.jpeg	\N	\N	\N	32	\N	\N	2025-11-30 09:22:16.708
1003	https://platina.vtcrm.ru/uploads/Photos/615/phpoeSIqF.jpeg	\N	\N	\N	33	\N	\N	2025-11-30 09:25:56.159
1004	https://platina.vtcrm.ru/uploads/Photos/615/phpim5DYH.jpeg	\N	\N	\N	33	\N	\N	2025-11-30 09:25:56.159
1005	https://platina.vtcrm.ru/uploads/Photos/615/phpEuaYoj.jpeg	\N	\N	\N	33	\N	\N	2025-11-30 09:25:56.159
1006	https://platina.vtcrm.ru/uploads/Photos/615/php21SQvG.jpeg	\N	\N	\N	33	\N	\N	2025-11-30 09:25:56.159
1007	https://platina.vtcrm.ru/uploads/Photos/615/phpBmSImg.jpeg	\N	\N	\N	33	\N	\N	2025-11-30 09:25:56.159
1008	https://platina.vtcrm.ru/uploads/Photos/615/phpFrnFlN.jpeg	\N	\N	\N	33	\N	\N	2025-11-30 09:25:56.159
1009	https://platina.vtcrm.ru/uploads/Photos/615/phpH5Oyd6.jpeg	\N	\N	\N	33	\N	\N	2025-11-30 09:25:56.159
1010	https://platina.vtcrm.ru/uploads/Photos/615/php4mLRz4.jpeg	\N	\N	\N	33	\N	\N	2025-11-30 09:25:56.159
1011	https://platina.vtcrm.ru/uploads/Photos/615/phpVY2iwS.jpeg	\N	\N	\N	33	\N	\N	2025-11-30 09:25:56.159
1012	https://platina.vtcrm.ru/uploads/Photos/615/phpsXgGZ4.jpeg	\N	\N	\N	33	\N	\N	2025-11-30 09:25:56.159
1013	https://platina.vtcrm.ru/uploads/Photos/615/phpdghArr.jpeg	\N	\N	\N	33	\N	\N	2025-11-30 09:25:56.159
1014	https://platina.vtcrm.ru/uploads/Photos/615/phpW31Kly.jpeg	\N	\N	\N	33	\N	\N	2025-11-30 09:25:56.159
1015	https://platina.vtcrm.ru/uploads/Photos/615/php0LzE2d.jpeg	\N	\N	\N	33	\N	\N	2025-11-30 09:25:56.159
1016	https://platina.vtcrm.ru/uploads/Photos/615/phptgphfq.jpeg	\N	\N	\N	33	\N	\N	2025-11-30 09:25:56.159
1017	https://platina.vtcrm.ru/uploads/Photos/615/phpWLhPy0.jpeg	\N	\N	\N	33	\N	\N	2025-11-30 09:25:56.159
1018	https://platina.vtcrm.ru/uploads/Photos/614/phpX75Xsf.jpeg	\N	\N	\N	34	\N	\N	2025-11-30 09:32:45.808
1019	https://platina.vtcrm.ru/uploads/Photos/614/phpx6rcHX.jpeg	\N	\N	\N	34	\N	\N	2025-11-30 09:32:45.808
1020	https://platina.vtcrm.ru/uploads/Photos/614/phpemGl8q.jpeg	\N	\N	\N	34	\N	\N	2025-11-30 09:32:45.808
1021	https://platina.vtcrm.ru/uploads/Photos/614/phpJgGYpq.jpeg	\N	\N	\N	34	\N	\N	2025-11-30 09:32:45.808
1022	https://platina.vtcrm.ru/uploads/Photos/614/phpT63LuP.jpeg	\N	\N	\N	34	\N	\N	2025-11-30 09:32:45.808
1023	https://platina.vtcrm.ru/uploads/Photos/614/phpLDDX7Z.jpeg	\N	\N	\N	34	\N	\N	2025-11-30 09:32:45.808
1024	https://platina.vtcrm.ru/uploads/Photos/614/phpkqra0Z.jpeg	\N	\N	\N	34	\N	\N	2025-11-30 09:32:45.808
1025	https://platina.vtcrm.ru/uploads/Photos/614/phpDxrSsj.jpeg	\N	\N	\N	34	\N	\N	2025-11-30 09:32:45.808
1026	https://platina.vtcrm.ru/uploads/Photos/614/phpOrg9YV.jpeg	\N	\N	\N	34	\N	\N	2025-11-30 09:32:45.808
1027	https://platina.vtcrm.ru/uploads/Photos/614/phpN9Pgi9.jpeg	\N	\N	\N	34	\N	\N	2025-11-30 09:32:45.808
1028	https://platina.vtcrm.ru/uploads/Photos/614/phpJsbKjJ.jpeg	\N	\N	\N	34	\N	\N	2025-11-30 09:32:45.808
1029	https://platina.vtcrm.ru/uploads/Photos/614/phpLjCqaT.jpeg	\N	\N	\N	34	\N	\N	2025-11-30 09:32:45.808
1030	https://platina.vtcrm.ru/uploads/Photos/587/phpKoDFmQ.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1031	https://platina.vtcrm.ru/uploads/Photos/587/php2pMwD0.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1032	https://platina.vtcrm.ru/uploads/Photos/587/phpoq32Mv.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1033	https://platina.vtcrm.ru/uploads/Photos/587/phpjnclCo.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1034	https://platina.vtcrm.ru/uploads/Photos/587/phpnNTMzI.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1035	https://platina.vtcrm.ru/uploads/Photos/587/phpe19dKs.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1036	https://platina.vtcrm.ru/uploads/Photos/587/phpEnVBnu.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1037	https://platina.vtcrm.ru/uploads/Photos/587/phpZoyy5B.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1038	https://platina.vtcrm.ru/uploads/Photos/587/phpPnNWiT.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1039	https://platina.vtcrm.ru/uploads/Photos/587/phpxuZ6wt.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1040	https://platina.vtcrm.ru/uploads/Photos/587/phpilu9Rh.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1041	https://platina.vtcrm.ru/uploads/Photos/587/phpuVKqbQ.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1042	https://platina.vtcrm.ru/uploads/Photos/587/phpg7eKYU.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1043	https://platina.vtcrm.ru/uploads/Photos/587/phplPX1Wr.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1044	https://platina.vtcrm.ru/uploads/Photos/587/phpMGmAFm.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1045	https://platina.vtcrm.ru/uploads/Photos/587/phpA6CtJu.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1046	https://platina.vtcrm.ru/uploads/Photos/587/phpskGxdt.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1047	https://platina.vtcrm.ru/uploads/Photos/587/phpz5OElx.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1048	https://platina.vtcrm.ru/uploads/Photos/587/phpNCHsRz.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1049	https://platina.vtcrm.ru/uploads/Photos/587/phpZe9DGX.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1050	https://platina.vtcrm.ru/uploads/Photos/587/php61NpRi.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1051	https://platina.vtcrm.ru/uploads/Photos/587/phpAz0Ook.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1052	https://platina.vtcrm.ru/uploads/Photos/587/phpwFM5Yu.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1053	https://platina.vtcrm.ru/uploads/Photos/587/phpNsKmXh.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1054	https://platina.vtcrm.ru/uploads/Photos/587/phpjLq8kx.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1055	https://platina.vtcrm.ru/uploads/Photos/587/phppmf6ig.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1056	https://platina.vtcrm.ru/uploads/Photos/587/phpETCHFU.jpeg	\N	\N	3	\N	\N	\N	2025-11-30 09:38:10.714
1057	https://platina.vtcrm.ru/uploads/Photos/635/phpm33yTQ.jpeg	\N	\N	\N	\N	17	\N	2025-11-30 09:41:47.953
1058	https://platina.vtcrm.ru/uploads/Photos/635/phpuxUImt.jpeg	\N	\N	\N	\N	17	\N	2025-11-30 09:41:47.953
1059	https://platina.vtcrm.ru/uploads/Photos/635/phpoff2vQ.jpeg	\N	\N	\N	\N	17	\N	2025-11-30 09:41:47.953
1060	https://platina.vtcrm.ru/uploads/Photos/635/phpNIcWMu.jpeg	\N	\N	\N	\N	17	\N	2025-11-30 09:41:47.953
1061	https://platina.vtcrm.ru/uploads/Photos/635/php8DyDBm.jpeg	\N	\N	\N	\N	17	\N	2025-11-30 09:41:47.953
1062	https://platina.vtcrm.ru/uploads/Photos/635/phpZcmXlo.jpeg	\N	\N	\N	\N	17	\N	2025-11-30 09:41:47.953
1063	https://platina.vtcrm.ru/uploads/Photos/637/phpt78C3N.jpeg	\N	\N	\N	\N	18	\N	2025-11-30 09:44:26.863
1064	https://platina.vtcrm.ru/uploads/Photos/637/php18WB0P.jpeg	\N	\N	\N	\N	18	\N	2025-11-30 09:44:26.863
1065	https://platina.vtcrm.ru/uploads/Photos/637/phpx43iAH.jpeg	\N	\N	\N	\N	18	\N	2025-11-30 09:44:26.863
1066	https://platina.vtcrm.ru/uploads/Photos/637/php7cUY9w.jpeg	\N	\N	\N	\N	18	\N	2025-11-30 09:44:26.863
1067	https://platina.vtcrm.ru/uploads/Photos/637/phpNb1eNo.jpeg	\N	\N	\N	\N	18	\N	2025-11-30 09:44:26.863
1068	https://platina.vtcrm.ru/uploads/Photos/637/php9wuIyX.jpeg	\N	\N	\N	\N	18	\N	2025-11-30 09:44:26.863
1069	https://platina.vtcrm.ru/uploads/Photos/671/phpOHoLyi.jpeg	\N	\N	\N	\N	\N	4	2025-11-30 09:47:35.529
1070	https://platina.vtcrm.ru/uploads/Photos/671/phpKLt4Oz.jpeg	\N	\N	\N	\N	\N	4	2025-11-30 09:47:35.529
1071	https://platina.vtcrm.ru/uploads/Photos/671/phpPkWuKN.jpeg	\N	\N	\N	\N	\N	4	2025-11-30 09:47:35.529
1072	https://platina.vtcrm.ru/uploads/Photos/671/phpyCya4y.jpeg	\N	\N	\N	\N	\N	4	2025-11-30 09:47:35.529
1073	https://platina.vtcrm.ru/uploads/Photos/671/phpt83pE1.jpeg	\N	\N	\N	\N	\N	4	2025-11-30 09:47:35.529
1074	https://platina.vtcrm.ru/uploads/Photos/671/php5YKjTP.jpeg	\N	\N	\N	\N	\N	4	2025-11-30 09:47:35.529
1075	https://platina.vtcrm.ru/uploads/Photos/671/phpCsnkN0.jpeg	\N	\N	\N	\N	\N	4	2025-11-30 09:47:35.529
1076	https://platina.vtcrm.ru/uploads/Photos/671/phpPCcdGb.jpeg	\N	\N	\N	\N	\N	4	2025-11-30 09:47:35.529
1077	https://platina.vtcrm.ru/uploads/Photos/671/phpaU72uC.jpeg	\N	\N	\N	\N	\N	4	2025-11-30 09:47:35.529
1078	https://platina.vtcrm.ru/uploads/Photos/710/phpNOvJGK.jpeg	\N	\N	\N	\N	19	\N	2025-11-30 09:49:56.139
1079	https://platina.vtcrm.ru/uploads/Photos/752/phpsFV0PM.jpeg	\N	\N	\N	\N	\N	5	2025-11-30 09:52:47.719
1080	https://platina.vtcrm.ru/uploads/Photos/752/phpeXCvoq.jpeg	\N	\N	\N	\N	\N	5	2025-11-30 09:52:47.719
1081	https://platina.vtcrm.ru/uploads/Photos/752/phpMtIprP.jpeg	\N	\N	\N	\N	\N	5	2025-11-30 09:52:47.719
1082	https://platina.vtcrm.ru/uploads/Photos/752/php9cBhcc.jpeg	\N	\N	\N	\N	\N	5	2025-11-30 09:52:47.719
1083	https://platina.vtcrm.ru/uploads/Photos/752/php9vFDPn.jpeg	\N	\N	\N	\N	\N	5	2025-11-30 09:52:47.719
1084	https://platina.vtcrm.ru/uploads/Photos/752/phpMJUB3G.jpeg	\N	\N	\N	\N	\N	5	2025-11-30 09:52:47.719
1085	https://platina.vtcrm.ru/uploads/Photos/636/phpEfny61.jpeg	\N	\N	\N	35	\N	\N	2025-11-30 09:56:49.059
1086	https://platina.vtcrm.ru/uploads/Photos/636/phpdq33Am.jpeg	\N	\N	\N	35	\N	\N	2025-11-30 09:56:49.059
1087	https://platina.vtcrm.ru/uploads/Photos/636/php4vqQRF.jpeg	\N	\N	\N	35	\N	\N	2025-11-30 09:56:49.059
1088	https://platina.vtcrm.ru/uploads/Photos/636/phpz635JP.jpeg	\N	\N	\N	35	\N	\N	2025-11-30 09:56:49.059
1089	https://platina.vtcrm.ru/uploads/Photos/636/phpRUYM3S.jpeg	\N	\N	\N	35	\N	\N	2025-11-30 09:56:49.059
1090	https://platina.vtcrm.ru/uploads/Photos/636/phpdjucBU.jpeg	\N	\N	\N	35	\N	\N	2025-11-30 09:56:49.059
1091	https://platina.vtcrm.ru/uploads/Photos/636/phpRHXHRP.jpeg	\N	\N	\N	35	\N	\N	2025-11-30 09:56:49.059
1092	https://platina.vtcrm.ru/uploads/Photos/636/phpeKIYWH.jpeg	\N	\N	\N	35	\N	\N	2025-11-30 09:56:49.059
1093	https://platina.vtcrm.ru/uploads/Photos/636/php3OS1dQ.jpeg	\N	\N	\N	35	\N	\N	2025-11-30 09:56:49.059
1094	https://platina.vtcrm.ru/uploads/Photos/636/phpHOM624.jpeg	\N	\N	\N	35	\N	\N	2025-11-30 09:56:49.059
1095	https://platina.vtcrm.ru/uploads/Photos/636/phplZ6KZ6.jpeg	\N	\N	\N	35	\N	\N	2025-11-30 09:56:49.059
1096	https://platina.vtcrm.ru/uploads/Photos/636/phpqCiLCS.jpeg	\N	\N	\N	35	\N	\N	2025-11-30 09:56:49.059
1097	https://platina.vtcrm.ru/uploads/Photos/636/phpMqnxiy.jpeg	\N	\N	\N	35	\N	\N	2025-11-30 09:56:49.059
1098	https://platina.vtcrm.ru/uploads/Photos/636/phpqWQGFW.jpeg	\N	\N	\N	35	\N	\N	2025-11-30 09:56:49.059
1099	https://platina.vtcrm.ru/uploads/Photos/636/phpfG9UVW.jpeg	\N	\N	\N	35	\N	\N	2025-11-30 09:56:49.059
1100	https://platina.vtcrm.ru/uploads/Photos/636/phpsQDcsV.jpeg	\N	\N	\N	35	\N	\N	2025-11-30 09:56:49.059
1101	https://platina.vtcrm.ru/uploads/Photos/636/phpNqApJm.jpeg	\N	\N	\N	35	\N	\N	2025-11-30 09:56:49.059
1102	https://platina.vtcrm.ru/uploads/Photos/636/phphR8SBf.jpeg	\N	\N	\N	35	\N	\N	2025-11-30 09:56:49.059
1103	https://platina.vtcrm.ru/uploads/Photos/636/php71AeeO.jpeg	\N	\N	\N	35	\N	\N	2025-11-30 09:56:49.059
1104	https://platina.vtcrm.ru/uploads/Photos/636/phpXkE9E7.jpeg	\N	\N	\N	35	\N	\N	2025-11-30 09:56:49.059
1105	https://platina.vtcrm.ru/uploads/Photos/659/phpY7Qw5Q.jpeg	\N	\N	\N	36	\N	\N	2025-11-30 10:00:27.139
1106	https://platina.vtcrm.ru/uploads/Photos/659/phpKgY9Jd.jpeg	\N	\N	\N	36	\N	\N	2025-11-30 10:00:27.139
1107	https://platina.vtcrm.ru/uploads/Photos/659/phpWg7qlc.jpeg	\N	\N	\N	36	\N	\N	2025-11-30 10:00:27.139
1108	https://platina.vtcrm.ru/uploads/Photos/659/phpZOMCWZ.jpeg	\N	\N	\N	36	\N	\N	2025-11-30 10:00:27.139
1109	https://platina.vtcrm.ru/uploads/Photos/659/php9jBuUf.jpeg	\N	\N	\N	36	\N	\N	2025-11-30 10:00:27.139
1110	https://platina.vtcrm.ru/uploads/Photos/659/phpbr6v1e.jpeg	\N	\N	\N	36	\N	\N	2025-11-30 10:00:27.139
1111	https://platina.vtcrm.ru/uploads/Photos/659/phpw4gKW6.jpeg	\N	\N	\N	36	\N	\N	2025-11-30 10:00:27.139
1112	https://platina.vtcrm.ru/uploads/Photos/692/phpi8h5vq.jpeg	\N	\N	\N	37	\N	\N	2025-11-30 10:02:32.82
1113	https://platina.vtcrm.ru/uploads/Photos/692/php2yTCWx.jpeg	\N	\N	\N	37	\N	\N	2025-11-30 10:02:32.82
1114	https://platina.vtcrm.ru/uploads/Photos/692/php6LKsbq.jpeg	\N	\N	\N	37	\N	\N	2025-11-30 10:02:32.82
1115	https://platina.vtcrm.ru/uploads/Photos/692/phpbwgWmA.jpeg	\N	\N	\N	37	\N	\N	2025-11-30 10:02:32.82
1116	https://platina.vtcrm.ru/uploads/Photos/692/php2yKimF.jpeg	\N	\N	\N	37	\N	\N	2025-11-30 10:02:32.82
1117	https://platina.vtcrm.ru/uploads/Photos/753/phpn7oow9.jpeg	\N	\N	\N	39	\N	\N	2025-11-30 10:07:41.2
1118	https://platina.vtcrm.ru/uploads/Photos/753/phpHyViWz.jpeg	\N	\N	\N	39	\N	\N	2025-11-30 10:07:41.2
1119	https://platina.vtcrm.ru/uploads/Photos/753/phprl0zIJ.jpeg	\N	\N	\N	39	\N	\N	2025-11-30 10:07:41.2
1120	https://platina.vtcrm.ru/uploads/Photos/753/phpXQSeqZ.jpeg	\N	\N	\N	39	\N	\N	2025-11-30 10:07:41.2
1121	https://platina.vtcrm.ru/uploads/Photos/753/phpoEH2ft.jpeg	\N	\N	\N	39	\N	\N	2025-11-30 10:07:41.2
1122	https://platina.vtcrm.ru/uploads/Photos/753/phpkQhl4n.jpeg	\N	\N	\N	39	\N	\N	2025-11-30 10:07:41.2
1123	https://platina.vtcrm.ru/uploads/Photos/753/phpJTG2gS.jpeg	\N	\N	\N	39	\N	\N	2025-11-30 10:07:41.2
1124	https://platina.vtcrm.ru/uploads/Photos/753/phpvmhVrC.jpeg	\N	\N	\N	39	\N	\N	2025-11-30 10:07:41.2
1125	https://platina.vtcrm.ru/uploads/Photos/753/phpdx9FbO.jpeg	\N	\N	\N	39	\N	\N	2025-11-30 10:07:41.2
1126	https://platina.vtcrm.ru/uploads/Photos/753/phpJDdM4U.jpeg	\N	\N	\N	39	\N	\N	2025-11-30 10:07:41.2
1127	https://platina.vtcrm.ru/uploads/Photos/753/phpGyWCrY.jpeg	\N	\N	\N	39	\N	\N	2025-11-30 10:07:41.2
1128	https://platina.vtcrm.ru/uploads/Photos/753/phpAIH6Zr.jpeg	\N	\N	\N	39	\N	\N	2025-11-30 10:07:41.2
1129	https://platina.vtcrm.ru/uploads/Photos/701/phpR46peI.jpeg	\N	\N	\N	38	\N	\N	2025-11-30 10:08:50.279
1130	https://platina.vtcrm.ru/uploads/Photos/701/7600bb65-f8b1-42e9-af2b-9c19697f5fee.jpeg	\N	\N	\N	38	\N	\N	2025-11-30 10:09:43.187
1131	https://platina.vtcrm.ru/uploads/Photos/701/phpsjv1h9.jpeg	\N	\N	\N	38	\N	\N	2025-11-30 10:09:43.187
1132	https://platina.vtcrm.ru/uploads/Photos/701/phpqk9pCX.jpeg	\N	\N	\N	38	\N	\N	2025-11-30 10:09:43.187
1133	https://platina.vtcrm.ru/uploads/Photos/701/phpjWdhem.jpeg	\N	\N	\N	38	\N	\N	2025-11-30 10:09:43.187
1134	https://platina.vtcrm.ru/uploads/Photos/701/phpgJjale.jpeg	\N	\N	\N	38	\N	\N	2025-11-30 10:09:43.187
1135	https://platina.vtcrm.ru/uploads/Photos/701/phpJF5gmG.jpeg	\N	\N	\N	38	\N	\N	2025-11-30 10:09:43.187
1136	https://platina.vtcrm.ru/uploads/Photos/757/phpRM9Xl0.jpeg	\N	\N	\N	40	\N	\N	2025-11-30 10:37:44.774
1137	https://platina.vtcrm.ru/uploads/Photos/757/phpsAorDZ.jpeg	\N	\N	\N	40	\N	\N	2025-11-30 10:37:44.774
1138	https://platina.vtcrm.ru/uploads/Photos/757/phpZzpdDx.jpeg	\N	\N	\N	40	\N	\N	2025-11-30 10:37:44.774
1139	https://platina.vtcrm.ru/uploads/Photos/757/phpjv3MHM.jpeg	\N	\N	\N	40	\N	\N	2025-11-30 10:37:44.774
1140	https://platina.vtcrm.ru/uploads/Photos/757/phpXDdkDC.jpeg	\N	\N	\N	40	\N	\N	2025-11-30 10:37:44.774
1141	https://platina.vtcrm.ru/uploads/Photos/757/php3EUlwq.jpeg	\N	\N	\N	40	\N	\N	2025-11-30 10:37:44.774
1142	https://platina.vtcrm.ru/uploads/Photos/757/phpVn88co.jpeg	\N	\N	\N	40	\N	\N	2025-11-30 10:37:44.774
1143	https://platina.vtcrm.ru/uploads/Photos/757/php1QOWr5.jpeg	\N	\N	\N	40	\N	\N	2025-11-30 10:37:44.774
1144	https://platina.vtcrm.ru/uploads/Photos/757/phpH7nGYI.jpeg	\N	\N	\N	40	\N	\N	2025-11-30 10:37:44.774
1145	https://platina.vtcrm.ru/uploads/Photos/757/phpwuE0N1.jpeg	\N	\N	\N	40	\N	\N	2025-11-30 10:37:44.774
1146	https://platina.vtcrm.ru/uploads/Photos/757/phpGtYxWf.jpeg	\N	\N	\N	40	\N	\N	2025-11-30 10:37:44.774
1147	https://platina.vtcrm.ru/uploads/Photos/757/php8CUdJD.jpeg	\N	\N	\N	40	\N	\N	2025-11-30 10:37:44.774
1148	https://platina.vtcrm.ru/uploads/Photos/757/phpGHP1jW.jpeg	\N	\N	\N	40	\N	\N	2025-11-30 10:37:44.774
1149	https://platina.vtcrm.ru/uploads/Photos/757/phpzNVc95.jpeg	\N	\N	\N	40	\N	\N	2025-11-30 10:37:44.774
1150	https://platina.vtcrm.ru/uploads/Photos/757/phpdS5Paf.jpeg	\N	\N	\N	40	\N	\N	2025-11-30 10:37:44.774
1151	https://platina.vtcrm.ru/uploads/Photos/757/phpfisOj5.jpeg	\N	\N	\N	40	\N	\N	2025-11-30 10:37:44.774
1152	https://platina.vtcrm.ru/uploads/Photos/757/phpBkvJn7.jpeg	\N	\N	\N	40	\N	\N	2025-11-30 10:37:44.774
1153	https://platina.vtcrm.ru/uploads/Photos/757/php6BpkAm.jpeg	\N	\N	\N	40	\N	\N	2025-11-30 10:37:44.774
1154	https://platina.vtcrm.ru/uploads/Photos/757/phpurj0iC.jpeg	\N	\N	\N	40	\N	\N	2025-11-30 10:37:44.774
1155	https://platina.vtcrm.ru/uploads/Photos/757/phpHuD5XV.jpeg	\N	\N	\N	40	\N	\N	2025-11-30 10:37:44.774
1156	https://platina.vtcrm.ru/uploads/Photos/763/phpWF4Hnx.jpeg	\N	\N	\N	41	\N	\N	2025-11-30 10:40:47.942
1157	https://platina.vtcrm.ru/uploads/Photos/763/phpAIECsq.jpeg	\N	\N	\N	41	\N	\N	2025-11-30 10:40:47.942
1158	https://platina.vtcrm.ru/uploads/Photos/763/php5k58Na.jpeg	\N	\N	\N	41	\N	\N	2025-11-30 10:40:47.942
1159	https://platina.vtcrm.ru/uploads/Photos/763/phpJwhB8d.jpeg	\N	\N	\N	41	\N	\N	2025-11-30 10:40:47.942
1160	https://platina.vtcrm.ru/uploads/Photos/763/phpES0FR7.jpeg	\N	\N	\N	41	\N	\N	2025-11-30 10:40:47.942
1161	https://platina.vtcrm.ru/uploads/Photos/763/php1NfleT.jpeg	\N	\N	\N	41	\N	\N	2025-11-30 10:40:47.942
1162	https://platina.vtcrm.ru/uploads/Photos/763/phpdQxcFI.jpeg	\N	\N	\N	41	\N	\N	2025-11-30 10:40:47.942
1163	https://platina.vtcrm.ru/uploads/Photos/763/phpavkZqI.jpeg	\N	\N	\N	41	\N	\N	2025-11-30 10:40:47.942
1164	https://platina.vtcrm.ru/uploads/Photos/763/php17eQZv.jpeg	\N	\N	\N	41	\N	\N	2025-11-30 10:40:47.942
1165	https://platina.vtcrm.ru/uploads/Photos/763/phpgXGGw2.jpeg	\N	\N	\N	41	\N	\N	2025-11-30 10:40:47.942
1166	https://platina.vtcrm.ru/uploads/Photos/769/phpl7bsox.jpeg	\N	\N	\N	42	\N	\N	2025-11-30 10:43:38.476
1167	https://platina.vtcrm.ru/uploads/Photos/769/phpJyoE6v.jpeg	\N	\N	\N	42	\N	\N	2025-11-30 10:43:38.476
1168	https://platina.vtcrm.ru/uploads/Photos/769/phpepegxG.jpeg	\N	\N	\N	42	\N	\N	2025-11-30 10:43:38.476
1169	https://platina.vtcrm.ru/uploads/Photos/769/php6AOgkk.jpeg	\N	\N	\N	42	\N	\N	2025-11-30 10:43:38.476
1170	https://platina.vtcrm.ru/uploads/Photos/769/php02N0i8.jpeg	\N	\N	\N	42	\N	\N	2025-11-30 10:43:38.476
1171	https://platina.vtcrm.ru/uploads/Photos/769/php4ME8yw.jpeg	\N	\N	\N	42	\N	\N	2025-11-30 10:43:38.476
1172	https://platina.vtcrm.ru/uploads/Photos/769/phpuV8UCF.jpeg	\N	\N	\N	42	\N	\N	2025-11-30 10:43:38.476
1173	https://platina.vtcrm.ru/uploads/Photos/769/phpjUgkiq.jpeg	\N	\N	\N	42	\N	\N	2025-11-30 10:43:38.476
1174	https://platina.vtcrm.ru/uploads/Photos/769/phphAIvc7.jpeg	\N	\N	\N	42	\N	\N	2025-11-30 10:43:38.476
1175	https://platina.vtcrm.ru/uploads/Photos/769/phpdMh9ia.jpeg	\N	\N	\N	42	\N	\N	2025-11-30 10:43:38.476
1176	https://platina.vtcrm.ru/uploads/Photos/769/phpQm3u1c.jpeg	\N	\N	\N	42	\N	\N	2025-11-30 10:43:38.476
1177	https://platina.vtcrm.ru/uploads/Photos/769/phpGpQSkx.jpeg	\N	\N	\N	42	\N	\N	2025-11-30 10:43:38.476
1178	https://platina.vtcrm.ru/uploads/Photos/777/phpSPyIrL.jpeg	\N	\N	\N	43	\N	\N	2025-11-30 10:46:05.272
1179	https://platina.vtcrm.ru/uploads/Photos/777/phpnV4zJS.jpeg	\N	\N	\N	43	\N	\N	2025-11-30 10:46:05.272
1180	https://platina.vtcrm.ru/uploads/Photos/777/phpWtv2pN.jpeg	\N	\N	\N	43	\N	\N	2025-11-30 10:46:05.272
1181	https://platina.vtcrm.ru/uploads/Photos/777/phpowfxOb.jpeg	\N	\N	\N	43	\N	\N	2025-11-30 10:46:05.272
1182	https://platina.vtcrm.ru/uploads/Photos/777/php7LWzQK.jpeg	\N	\N	\N	43	\N	\N	2025-11-30 10:46:05.272
1183	https://platina.vtcrm.ru/uploads/Photos/777/phpmMp6kx.jpeg	\N	\N	\N	43	\N	\N	2025-11-30 10:46:05.272
1184	https://platina.vtcrm.ru/uploads/Photos/777/phpJSRgy8.jpeg	\N	\N	\N	43	\N	\N	2025-11-30 10:46:05.272
1185	https://platina.vtcrm.ru/uploads/Photos/778/phpMzC9wx.jpeg	\N	\N	\N	44	\N	\N	2025-11-30 10:49:49.487
1186	https://platina.vtcrm.ru/uploads/Photos/778/phpykM6nw.jpeg	\N	\N	\N	44	\N	\N	2025-11-30 10:49:49.487
1187	https://platina.vtcrm.ru/uploads/Photos/778/phpZFZoC7.jpeg	\N	\N	\N	44	\N	\N	2025-11-30 10:49:49.487
1188	https://platina.vtcrm.ru/uploads/Photos/778/phpUGmTgs.jpeg	\N	\N	\N	44	\N	\N	2025-11-30 10:49:49.487
1189	https://platina.vtcrm.ru/uploads/Photos/778/phpwpraP3.jpeg	\N	\N	\N	44	\N	\N	2025-11-30 10:49:49.487
1190	https://platina.vtcrm.ru/uploads/Photos/778/phpYLvW0L.jpeg	\N	\N	\N	44	\N	\N	2025-11-30 10:49:49.487
1191	https://platina.vtcrm.ru/uploads/Photos/778/phpH20lI1.jpeg	\N	\N	\N	44	\N	\N	2025-11-30 10:49:49.487
1192	https://platina.vtcrm.ru/uploads/Photos/778/phpJjGvNN.jpeg	\N	\N	\N	44	\N	\N	2025-11-30 10:49:49.487
1193	https://platina.vtcrm.ru/uploads/Photos/778/phpNLPvlU.jpeg	\N	\N	\N	44	\N	\N	2025-11-30 10:49:49.487
1194	https://platina.vtcrm.ru/uploads/Photos/778/phpqOe2dg.jpeg	\N	\N	\N	44	\N	\N	2025-11-30 10:49:49.487
1195	https://platina.vtcrm.ru/uploads/Photos/778/phpML5MGI.jpeg	\N	\N	\N	44	\N	\N	2025-11-30 10:49:49.487
1196	https://platina.vtcrm.ru/uploads/Photos/778/phpImbpi0.jpeg	\N	\N	\N	44	\N	\N	2025-11-30 10:49:49.487
1197	https://platina.vtcrm.ru/uploads/Photos/778/php7Ru6of.jpeg	\N	\N	\N	44	\N	\N	2025-11-30 10:49:49.487
1198	https://platina.vtcrm.ru/uploads/Photos/778/phpvZIlmb.jpeg	\N	\N	\N	44	\N	\N	2025-11-30 10:49:49.487
1199	https://platina.vtcrm.ru/uploads/Photos/778/phprJfOhI.jpeg	\N	\N	\N	44	\N	\N	2025-11-30 10:49:49.487
1200	https://platina.vtcrm.ru/uploads/Photos/778/phpzXhCVg.jpeg	\N	\N	\N	44	\N	\N	2025-11-30 10:49:49.487
1201	https://platina.vtcrm.ru/uploads/Photos/778/phpQaHM0g.jpeg	\N	\N	\N	44	\N	\N	2025-11-30 10:49:49.487
1202	https://platina.vtcrm.ru/uploads/Photos/781/phps84qI2.jpeg	\N	\N	\N	45	\N	\N	2025-11-30 10:52:31.435
1203	https://platina.vtcrm.ru/uploads/Photos/781/phpcGfNU0.jpeg	\N	\N	\N	45	\N	\N	2025-11-30 10:52:31.435
1204	https://platina.vtcrm.ru/uploads/Photos/781/phpYFjyGg.jpeg	\N	\N	\N	45	\N	\N	2025-11-30 10:52:31.435
1205	https://platina.vtcrm.ru/uploads/Photos/781/php95zm9h.jpeg	\N	\N	\N	45	\N	\N	2025-11-30 10:52:31.435
1206	https://platina.vtcrm.ru/uploads/Photos/781/phpOYqM8Y.jpeg	\N	\N	\N	45	\N	\N	2025-11-30 10:52:31.435
1207	https://platina.vtcrm.ru/uploads/Photos/781/phpkfpy6M.jpeg	\N	\N	\N	45	\N	\N	2025-11-30 10:52:31.435
1208	https://platina.vtcrm.ru/uploads/Photos/781/phpliyRIY.jpeg	\N	\N	\N	45	\N	\N	2025-11-30 10:52:31.435
1209	https://platina.vtcrm.ru/uploads/Photos/782/phpMtgI2F.jpeg	\N	\N	\N	46	\N	\N	2025-11-30 10:55:31.018
1210	https://platina.vtcrm.ru/uploads/Photos/782/phpnwmu4S.jpeg	\N	\N	\N	46	\N	\N	2025-11-30 10:55:31.018
1211	https://platina.vtcrm.ru/uploads/Photos/782/php08B1aT.jpeg	\N	\N	\N	46	\N	\N	2025-11-30 10:55:31.018
1212	https://platina.vtcrm.ru/uploads/Photos/782/phpoWLwhg.jpeg	\N	\N	\N	46	\N	\N	2025-11-30 10:55:31.018
1213	https://platina.vtcrm.ru/uploads/Photos/782/phpTTJgzG.jpeg	\N	\N	\N	46	\N	\N	2025-11-30 10:55:31.018
1214	https://platina.vtcrm.ru/uploads/Photos/782/phpOUoqoo.jpeg	\N	\N	\N	46	\N	\N	2025-11-30 10:55:31.018
1215	https://platina.vtcrm.ru/uploads/Photos/782/phpu2gzCF.jpeg	\N	\N	\N	46	\N	\N	2025-11-30 10:55:31.018
1216	https://platina.vtcrm.ru/uploads/Photos/782/phpmqApX9.jpeg	\N	\N	\N	46	\N	\N	2025-11-30 10:55:31.018
1217	https://platina.vtcrm.ru/uploads/Photos/782/phpNDQm3a.jpeg	\N	\N	\N	46	\N	\N	2025-11-30 10:55:31.018
1218	https://platina.vtcrm.ru/uploads/Photos/782/phpbEY8PU.jpeg	\N	\N	\N	46	\N	\N	2025-11-30 10:55:31.018
1219	https://platina.vtcrm.ru/uploads/Photos/783/phpbmBZgW.jpeg	\N	\N	\N	47	\N	\N	2025-11-30 10:58:23.102
1220	https://platina.vtcrm.ru/uploads/Photos/783/php7xgigk.jpeg	\N	\N	\N	47	\N	\N	2025-11-30 10:58:23.102
1221	https://platina.vtcrm.ru/uploads/Photos/783/phpCpEN7n.jpeg	\N	\N	\N	47	\N	\N	2025-11-30 10:58:23.102
1222	https://platina.vtcrm.ru/uploads/Photos/783/phpjTDb6T.jpeg	\N	\N	\N	47	\N	\N	2025-11-30 10:58:23.102
1223	https://platina.vtcrm.ru/uploads/Photos/783/phpRRpUjl.jpeg	\N	\N	\N	47	\N	\N	2025-11-30 10:58:23.102
1224	https://platina.vtcrm.ru/uploads/Photos/783/phpvM3KTN.jpeg	\N	\N	\N	47	\N	\N	2025-11-30 10:58:23.102
1225	https://platina.vtcrm.ru/uploads/Photos/783/php2pPwQR.jpeg	\N	\N	\N	47	\N	\N	2025-11-30 10:58:23.102
1226	https://platina.vtcrm.ru/uploads/Photos/774/php7IJE0L.jpeg	\N	\N	4	\N	\N	\N	2025-11-30 11:02:13.116
1227	https://platina.vtcrm.ru/uploads/Photos/774/phpqm4zUC.jpeg	\N	\N	4	\N	\N	\N	2025-11-30 11:02:13.116
1228	https://platina.vtcrm.ru/uploads/Photos/774/phpHdl12J.jpeg	\N	\N	4	\N	\N	\N	2025-11-30 11:02:13.116
1229	https://platina.vtcrm.ru/uploads/Photos/774/phpHuHTVg.jpeg	\N	\N	4	\N	\N	\N	2025-11-30 11:02:13.116
1230	https://platina.vtcrm.ru/uploads/Photos/774/phpvLp8pF.jpeg	\N	\N	4	\N	\N	\N	2025-11-30 11:02:13.116
1231	https://platina.vtcrm.ru/uploads/Photos/774/phpEiI8Rg.jpeg	\N	\N	4	\N	\N	\N	2025-11-30 11:02:13.116
1232	https://platina.vtcrm.ru/uploads/Photos/774/phpDKxd6v.jpeg	\N	\N	4	\N	\N	\N	2025-11-30 11:02:13.116
1233	https://platina.vtcrm.ru/uploads/Photos/774/php2Zbhll.jpeg	\N	\N	4	\N	\N	\N	2025-11-30 11:02:13.116
1234	https://platina.vtcrm.ru/uploads/Photos/774/phpHHNrE9.jpeg	\N	\N	4	\N	\N	\N	2025-11-30 11:02:13.116
1235	https://platina.vtcrm.ru/uploads/Photos/774/php0VrxTm.jpeg	\N	\N	4	\N	\N	\N	2025-11-30 11:02:13.116
1236	https://platina.vtcrm.ru/uploads/Photos/774/phpRx8kgH.jpeg	\N	\N	4	\N	\N	\N	2025-11-30 11:02:13.116
1237	https://platina.vtcrm.ru/uploads/Photos/774/phpIOtjGe.jpeg	\N	\N	4	\N	\N	\N	2025-11-30 11:02:13.116
1238	https://platina.vtcrm.ru/uploads/Photos/775/php5QmAl5.jpeg	\N	\N	5	\N	\N	\N	2025-11-30 11:06:56.224
1239	https://platina.vtcrm.ru/uploads/Photos/775/phpuVQgxY.jpeg	\N	\N	5	\N	\N	\N	2025-11-30 11:06:56.224
1240	https://platina.vtcrm.ru/uploads/Photos/775/php6SWQlE.jpeg	\N	\N	5	\N	\N	\N	2025-11-30 11:06:56.224
1241	https://platina.vtcrm.ru/uploads/Photos/775/phphS1YE3.jpeg	\N	\N	5	\N	\N	\N	2025-11-30 11:06:56.224
1242	https://platina.vtcrm.ru/uploads/Photos/775/php0oKIbj.jpeg	\N	\N	5	\N	\N	\N	2025-11-30 11:06:56.224
1243	https://platina.vtcrm.ru/uploads/Photos/775/phpMuZLCs.jpeg	\N	\N	5	\N	\N	\N	2025-11-30 11:06:56.224
1244	https://platina.vtcrm.ru/uploads/Photos/807/phpR1sMzg.jpeg	\N	\N	6	\N	\N	\N	2025-11-30 11:40:58.74
1245	https://platina.vtcrm.ru/uploads/Photos/807/php4WapY0.jpeg	\N	\N	6	\N	\N	\N	2025-11-30 11:40:58.74
1246	https://platina.vtcrm.ru/uploads/Photos/807/phpon2YxO.jpeg	\N	\N	6	\N	\N	\N	2025-11-30 11:40:58.74
1247	https://platina.vtcrm.ru/uploads/Photos/807/phpsnPtf9.jpeg	\N	\N	6	\N	\N	\N	2025-11-30 11:40:58.74
1248	https://platina.vtcrm.ru/uploads/Photos/807/phpmC2q5Z.jpeg	\N	\N	6	\N	\N	\N	2025-11-30 11:40:58.74
1249	https://platina.vtcrm.ru/uploads/Photos/807/php7vtDeL.jpeg	\N	\N	6	\N	\N	\N	2025-11-30 11:40:58.74
1250	https://platina.vtcrm.ru/uploads/Photos/807/phpL2adnt.jpeg	\N	\N	6	\N	\N	\N	2025-11-30 11:40:58.74
1251	https://platina.vtcrm.ru/uploads/Photos/807/phpBF3rws.jpeg	\N	\N	6	\N	\N	\N	2025-11-30 11:40:58.74
1252	https://platina.vtcrm.ru/uploads/Photos/807/php9HrzVn.jpeg	\N	\N	6	\N	\N	\N	2025-11-30 11:40:58.74
1253	https://platina.vtcrm.ru/uploads/Photos/807/phpjFqBAw.jpeg	\N	\N	6	\N	\N	\N	2025-11-30 11:40:58.74
1254	https://platina.vtcrm.ru/uploads/Photos/807/phpZ4ho5f.jpeg	\N	\N	6	\N	\N	\N	2025-11-30 11:40:58.74
1255	https://platina.vtcrm.ru/uploads/Photos/807/phpIAU9YR.jpeg	\N	\N	6	\N	\N	\N	2025-11-30 11:40:58.74
1256	https://platina.vtcrm.ru/uploads/Photos/807/phpmwsfLQ.jpeg	\N	\N	6	\N	\N	\N	2025-11-30 11:40:58.74
1257	https://platina.vtcrm.ru/uploads/Photos/807/phpGyjvY2.jpeg	\N	\N	6	\N	\N	\N	2025-11-30 11:40:58.74
1258	https://platina.vtcrm.ru/uploads/Photos/807/php1Kif1h.jpeg	\N	\N	6	\N	\N	\N	2025-11-30 11:40:58.74
1259	https://platina.vtcrm.ru/uploads/Photos/807/phpPvgWVb.jpeg	\N	\N	6	\N	\N	\N	2025-11-30 11:40:58.74
1260	https://platina.vtcrm.ru/uploads/Photos/807/phpYXvcdq.jpeg	\N	\N	6	\N	\N	\N	2025-11-30 11:40:58.74
1261	https://platina.vtcrm.ru/uploads/Photos/807/phpP23Oq0.jpeg	\N	\N	6	\N	\N	\N	2025-11-30 11:40:58.74
1262	https://platina.vtcrm.ru/uploads/Photos/807/phphuCueg.jpeg	\N	\N	6	\N	\N	\N	2025-11-30 11:40:58.74
1263	https://platina.vtcrm.ru/uploads/Photos/807/phpZkbk0x.jpeg	\N	\N	6	\N	\N	\N	2025-11-30 11:40:58.74
1264	https://platina.vtcrm.ru/uploads/Photos/809/phpu386Nj.jpeg	\N	\N	\N	\N	20	\N	2025-11-30 11:45:27.431
1265	https://platina.vtcrm.ru/uploads/Photos/809/phpcvU1sZ.jpeg	\N	\N	\N	\N	20	\N	2025-11-30 11:45:27.431
1266	https://platina.vtcrm.ru/uploads/Photos/809/phpKFqqUG.jpeg	\N	\N	\N	\N	20	\N	2025-11-30 11:45:27.431
1267	https://platina.vtcrm.ru/uploads/Photos/809/phpg9thEd.jpeg	\N	\N	\N	\N	20	\N	2025-11-30 11:45:27.431
1268	https://platina.vtcrm.ru/uploads/Photos/809/phpFGlSdo.jpeg	\N	\N	\N	\N	20	\N	2025-11-30 11:45:27.431
1269	https://platina.vtcrm.ru/uploads/Photos/809/phpN2BmDe.jpeg	\N	\N	\N	\N	20	\N	2025-11-30 11:45:27.431
1270	https://platina.vtcrm.ru/uploads/Photos/809/phpp0WDVc.jpeg	\N	\N	\N	\N	20	\N	2025-11-30 11:45:27.431
1271	https://platina.vtcrm.ru/uploads/Photos/809/phpg9jkK3.jpeg	\N	\N	\N	\N	20	\N	2025-11-30 11:45:27.431
1272	https://platina.vtcrm.ru/uploads/Photos/809/phpgEwG7t.jpeg	\N	\N	\N	\N	20	\N	2025-11-30 11:45:27.431
1273	https://platina.vtcrm.ru/uploads/Photos/809/phpHYNHLg.jpeg	\N	\N	\N	\N	20	\N	2025-11-30 11:45:27.431
1274	https://platina.vtcrm.ru/uploads/Photos/809/php5Suu0c.jpeg	\N	\N	\N	\N	20	\N	2025-11-30 11:45:27.431
1275	https://platina.vtcrm.ru/uploads/Photos/809/php1TCS3u.jpeg	\N	\N	\N	\N	20	\N	2025-11-30 11:45:27.431
1276	https://platina.vtcrm.ru/uploads/Photos/809/php56B5a6.jpeg	\N	\N	\N	\N	20	\N	2025-11-30 11:45:27.431
1277	https://platina.vtcrm.ru/uploads/Photos/809/php1oEgd7.jpeg	\N	\N	\N	\N	20	\N	2025-11-30 11:45:27.431
1278	https://platina.vtcrm.ru/uploads/Photos/809/php5iBf2Z.jpeg	\N	\N	\N	\N	20	\N	2025-11-30 11:45:27.431
1279	https://platina.vtcrm.ru/uploads/Photos/809/phpU8ACum.jpeg	\N	\N	\N	\N	20	\N	2025-11-30 11:45:27.431
1280	https://platina.vtcrm.ru/uploads/Photos/809/phpGeT5fR.jpeg	\N	\N	\N	\N	20	\N	2025-11-30 11:45:27.431
1281	https://platina.vtcrm.ru/uploads/Photos/809/phpPkSL8I.jpeg	\N	\N	\N	\N	20	\N	2025-11-30 11:45:27.431
1282	https://platina.vtcrm.ru/uploads/Photos/809/phpyZrw0N.jpeg	\N	\N	\N	\N	20	\N	2025-11-30 11:45:27.431
1283	https://platina.vtcrm.ru/uploads/Photos/809/phpTedRns.jpeg	\N	\N	\N	\N	20	\N	2025-11-30 11:45:27.431
1284	https://platina.vtcrm.ru/uploads/Photos/809/phpnCKF71.jpeg	\N	\N	\N	\N	20	\N	2025-11-30 11:45:27.431
1285	https://platina.vtcrm.ru/uploads/Photos/810/phpSPxPZd.jpeg	\N	\N	\N	\N	21	\N	2025-11-30 11:50:39.113
1286	https://platina.vtcrm.ru/uploads/Photos/810/phpdS49H0.jpeg	\N	\N	\N	\N	21	\N	2025-11-30 11:50:39.113
1287	https://platina.vtcrm.ru/uploads/Photos/810/phpXDs8Qw.jpeg	\N	\N	\N	\N	21	\N	2025-11-30 11:50:39.113
1288	https://platina.vtcrm.ru/uploads/Photos/810/phpFattsO.jpeg	\N	\N	\N	\N	21	\N	2025-11-30 11:50:39.113
1289	https://platina.vtcrm.ru/uploads/Photos/810/phpynoqOT.jpeg	\N	\N	\N	\N	21	\N	2025-11-30 11:50:39.113
1290	https://platina.vtcrm.ru/uploads/Photos/810/phpzgwVFx.jpeg	\N	\N	\N	\N	21	\N	2025-11-30 11:50:39.113
1291	https://platina.vtcrm.ru/uploads/Photos/810/phpDdhN4q.jpeg	\N	\N	\N	\N	21	\N	2025-11-30 11:50:39.113
1292	https://platina.vtcrm.ru/uploads/Photos/810/phpIciOjt.jpeg	\N	\N	\N	\N	21	\N	2025-11-30 11:50:39.113
1293	https://platina.vtcrm.ru/uploads/Photos/810/phptPUz4K.jpeg	\N	\N	\N	\N	21	\N	2025-11-30 11:50:39.113
1294	https://platina.vtcrm.ru/uploads/Photos/810/phpq9jAf0.jpeg	\N	\N	\N	\N	21	\N	2025-11-30 11:50:39.113
1295	https://platina.vtcrm.ru/uploads/Photos/810/php9ZlVDB.jpeg	\N	\N	\N	\N	21	\N	2025-11-30 11:50:39.113
1296	https://platina.vtcrm.ru/uploads/Photos/810/phpbGLw36.jpeg	\N	\N	\N	\N	21	\N	2025-11-30 11:50:39.113
1297	https://platina.vtcrm.ru/uploads/Photos/810/phpLpCO3A.jpeg	\N	\N	\N	\N	21	\N	2025-11-30 11:50:39.113
1298	https://platina.vtcrm.ru/uploads/Photos/810/phpw97Uxd.jpeg	\N	\N	\N	\N	21	\N	2025-11-30 11:50:39.113
1299	https://platina.vtcrm.ru/uploads/Photos/810/phpshEqRC.jpeg	\N	\N	\N	\N	21	\N	2025-11-30 11:50:39.113
1300	https://platina.vtcrm.ru/uploads/Photos/810/phpIiU6n8.jpeg	\N	\N	\N	\N	21	\N	2025-11-30 11:50:39.113
1301	https://platina.vtcrm.ru/uploads/Photos/810/phprmE33U.jpeg	\N	\N	\N	\N	21	\N	2025-11-30 11:50:39.113
1302	https://platina.vtcrm.ru/uploads/Photos/810/phpHiFJNK.jpeg	\N	\N	\N	\N	21	\N	2025-11-30 11:50:39.113
1303	https://platina.vtcrm.ru/uploads/Photos/810/phpPEvGh2.jpeg	\N	\N	\N	\N	21	\N	2025-11-30 11:50:39.113
1304	https://platina.vtcrm.ru/uploads/Photos/810/php1iZKRu.jpeg	\N	\N	\N	\N	21	\N	2025-11-30 11:50:39.113
1305	https://platina.vtcrm.ru/uploads/Photos/810/phpFmjwz6.jpeg	\N	\N	\N	\N	21	\N	2025-11-30 11:50:39.113
1306	https://platina.vtcrm.ru/uploads/Photos/810/phpAGNyjp.jpeg	\N	\N	\N	\N	21	\N	2025-11-30 11:50:39.113
1307	https://platina.vtcrm.ru/uploads/Photos/810/php0beFDe.jpeg	\N	\N	\N	\N	21	\N	2025-11-30 11:50:39.113
1308	https://platina.vtcrm.ru/uploads/Photos/810/phpd3XGCK.jpeg	\N	\N	\N	\N	21	\N	2025-11-30 11:50:39.113
1309	https://platina.vtcrm.ru/uploads/Photos/810/phpjBTT6f.jpeg	\N	\N	\N	\N	21	\N	2025-11-30 11:50:39.113
1310	https://platina.vtcrm.ru/uploads/Photos/810/phpDzLhrt.jpeg	\N	\N	\N	\N	21	\N	2025-11-30 11:50:39.113
1311	https://platina.vtcrm.ru/uploads/Photos/875/phpCvnfgp.jpeg	\N	\N	7	\N	\N	\N	2025-11-30 11:56:19.458
1312	https://platina.vtcrm.ru/uploads/Photos/875/phpowJSRL.jpeg	\N	\N	7	\N	\N	\N	2025-11-30 11:56:19.458
1313	https://platina.vtcrm.ru/uploads/Photos/875/phpF3L70s.jpeg	\N	\N	7	\N	\N	\N	2025-11-30 11:56:19.458
1314	https://platina.vtcrm.ru/uploads/Photos/875/phpqF9ojx.jpeg	\N	\N	7	\N	\N	\N	2025-11-30 11:56:19.458
1315	https://platina.vtcrm.ru/uploads/Photos/875/phpumnpNj.jpeg	\N	\N	7	\N	\N	\N	2025-11-30 11:56:19.458
1316	https://platina.vtcrm.ru/uploads/Photos/875/phpXZVCAt.jpeg	\N	\N	7	\N	\N	\N	2025-11-30 11:56:19.458
1317	https://platina.vtcrm.ru/uploads/Photos/875/phpZHAvSh.jpeg	\N	\N	7	\N	\N	\N	2025-11-30 11:56:19.458
1318	https://platina.vtcrm.ru/uploads/Photos/875/phpk5Rpwm.jpeg	\N	\N	7	\N	\N	\N	2025-11-30 11:56:19.458
1319	https://platina.vtcrm.ru/uploads/Photos/875/phpRXM7LU.jpeg	\N	\N	7	\N	\N	\N	2025-11-30 11:56:19.458
1320	https://platina.vtcrm.ru/uploads/Photos/875/phpHJ6hId.jpeg	\N	\N	7	\N	\N	\N	2025-11-30 11:56:19.458
1321	https://platina.vtcrm.ru/uploads/Photos/875/phppBaoIS.jpeg	\N	\N	7	\N	\N	\N	2025-11-30 11:56:19.458
1322	https://platina.vtcrm.ru/uploads/Photos/875/php3aFJCJ.jpeg	\N	\N	7	\N	\N	\N	2025-11-30 11:56:19.458
1323	https://platina.vtcrm.ru/uploads/Photos/875/phpt9lwQX.jpeg	\N	\N	7	\N	\N	\N	2025-11-30 11:56:19.458
1324	https://platina.vtcrm.ru/uploads/Photos/875/phpYLlpmN.jpeg	\N	\N	7	\N	\N	\N	2025-11-30 11:56:19.458
1325	https://platina.vtcrm.ru/uploads/Photos/875/phppFTljY.jpeg	\N	\N	7	\N	\N	\N	2025-11-30 11:56:19.458
1326	https://platina.vtcrm.ru/uploads/Photos/944/phpYeMz7J.jpeg	\N	\N	8	\N	\N	\N	2025-11-30 12:00:19.303
1327	https://platina.vtcrm.ru/uploads/Photos/944/phpoK8awO.jpeg	\N	\N	8	\N	\N	\N	2025-11-30 12:00:19.303
1328	https://platina.vtcrm.ru/uploads/Photos/944/phpLrDqOn.jpeg	\N	\N	8	\N	\N	\N	2025-11-30 12:00:19.303
1329	https://platina.vtcrm.ru/uploads/Photos/944/phpchzJr7.jpeg	\N	\N	8	\N	\N	\N	2025-11-30 12:00:19.303
1330	https://platina.vtcrm.ru/uploads/Photos/944/phpJiJoiy.jpeg	\N	\N	8	\N	\N	\N	2025-11-30 12:00:19.303
1331	https://platina.vtcrm.ru/uploads/Photos/944/phpQ7ntfe.jpeg	\N	\N	8	\N	\N	\N	2025-11-30 12:00:19.303
1332	https://platina.vtcrm.ru/uploads/Photos/944/phpJLcLVs.jpeg	\N	\N	8	\N	\N	\N	2025-11-30 12:00:19.303
1333	https://platina.vtcrm.ru/uploads/Photos/944/phpRgxZxr.jpeg	\N	\N	8	\N	\N	\N	2025-11-30 12:00:19.303
1334	https://platina.vtcrm.ru/uploads/Photos/944/phpefKNLZ.jpeg	\N	\N	8	\N	\N	\N	2025-11-30 12:00:19.303
1335	https://platina.vtcrm.ru/uploads/Photos/944/phpysgeLY.jpeg	\N	\N	8	\N	\N	\N	2025-11-30 12:00:19.303
1336	https://platina.vtcrm.ru/uploads/Photos/944/phpJtR9bA.jpeg	\N	\N	8	\N	\N	\N	2025-11-30 12:00:19.303
1337	https://platina.vtcrm.ru/uploads/Photos/944/php7RIRhc.jpeg	\N	\N	8	\N	\N	\N	2025-11-30 12:00:19.303
1338	https://platina.vtcrm.ru/uploads/Photos/944/phpm0EI6x.jpeg	\N	\N	8	\N	\N	\N	2025-11-30 12:00:19.303
1339	https://platina.vtcrm.ru/uploads/Photos/944/phpmMCwjQ.jpeg	\N	\N	8	\N	\N	\N	2025-11-30 12:00:19.303
1340	https://platina.vtcrm.ru/uploads/Photos/944/phpCgfzUu.jpeg	\N	\N	8	\N	\N	\N	2025-11-30 12:00:19.303
1341	https://platina.vtcrm.ru/uploads/Photos/945/phpXciK5V.jpeg	\N	\N	9	\N	\N	\N	2025-11-30 12:03:45.391
1342	https://platina.vtcrm.ru/uploads/Photos/945/phpqDI3Cs.jpeg	\N	\N	9	\N	\N	\N	2025-11-30 12:03:45.391
1343	https://platina.vtcrm.ru/uploads/Photos/945/phpJGxOkB.jpeg	\N	\N	9	\N	\N	\N	2025-11-30 12:03:45.391
1344	https://platina.vtcrm.ru/uploads/Photos/948/phpegrPK1.jpeg	\N	\N	10	\N	\N	\N	2025-11-30 12:07:37.991
1345	https://platina.vtcrm.ru/uploads/Photos/948/phplKzf1s.jpeg	\N	\N	10	\N	\N	\N	2025-11-30 12:07:37.991
1346	https://platina.vtcrm.ru/uploads/Photos/948/phpCRS7ny.jpeg	\N	\N	10	\N	\N	\N	2025-11-30 12:07:37.991
1347	https://platina.vtcrm.ru/uploads/Photos/948/phpJ20Gld.jpeg	\N	\N	10	\N	\N	\N	2025-11-30 12:07:37.991
1348	https://platina.vtcrm.ru/uploads/Photos/948/phpzqzKT3.jpeg	\N	\N	10	\N	\N	\N	2025-11-30 12:07:37.991
1349	https://platina.vtcrm.ru/uploads/Photos/948/phpKU41r3.jpeg	\N	\N	10	\N	\N	\N	2025-11-30 12:07:37.991
1350	https://platina.vtcrm.ru/uploads/Photos/948/phpBKlen7.jpeg	\N	\N	10	\N	\N	\N	2025-11-30 12:07:37.991
1351	https://platina.vtcrm.ru/uploads/Photos/948/phpGBGtgS.jpeg	\N	\N	10	\N	\N	\N	2025-11-30 12:07:37.991
1352	https://platina.vtcrm.ru/uploads/Photos/948/phpIXpfS4.jpeg	\N	\N	10	\N	\N	\N	2025-11-30 12:07:37.991
1353	https://platina.vtcrm.ru/uploads/Photos/948/phpfw0lIz.jpeg	\N	\N	10	\N	\N	\N	2025-11-30 12:07:37.991
1354	https://platina.vtcrm.ru/uploads/Photos/948/phpOpFZPA.jpeg	\N	\N	10	\N	\N	\N	2025-11-30 12:07:37.991
1355	https://platina.vtcrm.ru/uploads/Photos/948/phpublbxh.jpeg	\N	\N	10	\N	\N	\N	2025-11-30 12:07:37.991
1356	https://platina.vtcrm.ru/uploads/Photos/948/phpXIEXxm.jpeg	\N	\N	10	\N	\N	\N	2025-11-30 12:07:37.991
1357	https://platina.vtcrm.ru/uploads/Photos/948/phps3JWM5.jpeg	\N	\N	10	\N	\N	\N	2025-11-30 12:07:37.991
1358	https://platina.vtcrm.ru/uploads/Photos/948/phpjTJLE2.jpeg	\N	\N	10	\N	\N	\N	2025-11-30 12:07:37.991
1359	https://platina.vtcrm.ru/uploads/Photos/948/phpyHTbeY.jpeg	\N	\N	10	\N	\N	\N	2025-11-30 12:07:37.991
1360	https://platina.vtcrm.ru/uploads/Photos/1147/phptY3t3n.jpeg	\N	\N	\N	\N	22	\N	2025-11-30 12:14:13.374
1361	https://platina.vtcrm.ru/uploads/Photos/1147/phpBQcEQD.jpeg	\N	\N	\N	\N	22	\N	2025-11-30 12:14:13.374
1362	https://platina.vtcrm.ru/uploads/Photos/1147/phpL4breg.jpeg	\N	\N	\N	\N	22	\N	2025-11-30 12:14:13.374
1363	https://platina.vtcrm.ru/uploads/Photos/1147/php7j4MHs.jpeg	\N	\N	\N	\N	22	\N	2025-11-30 12:14:13.374
1364	https://platina.vtcrm.ru/uploads/Photos/1147/phpdmEiH4.jpeg	\N	\N	\N	\N	22	\N	2025-11-30 12:14:13.374
1365	https://platina.vtcrm.ru/uploads/Photos/1147/php1cGhf9.jpeg	\N	\N	\N	\N	22	\N	2025-11-30 12:14:13.374
1366	https://platina.vtcrm.ru/uploads/Photos/1147/phpV2B9VC.jpeg	\N	\N	\N	\N	22	\N	2025-11-30 12:14:13.374
1367	https://platina.vtcrm.ru/uploads/Photos/1147/phpPQJ3CA.jpeg	\N	\N	\N	\N	22	\N	2025-11-30 12:14:13.374
1368	https://platina.vtcrm.ru/uploads/Photos/1147/phpGRkdrC.jpeg	\N	\N	\N	\N	22	\N	2025-11-30 12:14:13.374
1369	https://platina.vtcrm.ru/uploads/Photos/1147/phpZDuVGI.jpeg	\N	\N	\N	\N	22	\N	2025-11-30 12:14:13.374
1370	https://platina.vtcrm.ru/uploads/Photos/1147/phpf281zN.jpeg	\N	\N	\N	\N	22	\N	2025-11-30 12:14:13.374
1371	https://platina.vtcrm.ru/uploads/Photos/1147/phpnkhZAk.jpeg	\N	\N	\N	\N	22	\N	2025-11-30 12:14:13.374
1372	https://platina.vtcrm.ru/uploads/Photos/1147/phpXMSxdA.jpeg	\N	\N	\N	\N	22	\N	2025-11-30 12:14:13.374
1373	https://platina.vtcrm.ru/uploads/Photos/1147/phpgcKrx8.jpeg	\N	\N	\N	\N	22	\N	2025-11-30 12:14:13.374
1374	https://platina.vtcrm.ru/uploads/Photos/1147/phpo4lXrk.jpeg	\N	\N	\N	\N	22	\N	2025-11-30 12:14:13.374
1375	https://platina.vtcrm.ru/uploads/Photos/1147/phptrH5Ub.jpeg	\N	\N	\N	\N	22	\N	2025-11-30 12:14:13.374
1376	https://platina.vtcrm.ru/uploads/Photos/1147/phptY3t3n.jpeg	\N	\N	\N	\N	22	\N	2025-11-30 12:14:13.374
1377	https://platina.vtcrm.ru/uploads/Photos/1147/phpBQcEQD.jpeg	\N	\N	\N	\N	22	\N	2025-11-30 12:14:13.374
1378	https://platina.vtcrm.ru/uploads/Photos/1147/phpQgzTFS.jpeg	\N	\N	\N	\N	22	\N	2025-11-30 12:14:13.374
1379	https://platina.vtcrm.ru/uploads/Photos/1147/php3NAjA9.jpeg	\N	\N	\N	\N	22	\N	2025-11-30 12:14:13.374
1380	https://platina.vtcrm.ru/uploads/Photos/1147/phpofPYO7.jpeg	\N	\N	\N	\N	22	\N	2025-11-30 12:14:13.374
1381	https://platina.vtcrm.ru/uploads/Photos/1147/php1HnC5U.jpeg	\N	\N	\N	\N	22	\N	2025-11-30 12:14:13.374
1382	https://platina.vtcrm.ru/uploads/Photos/1147/phpk0VUke.jpeg	\N	\N	\N	\N	22	\N	2025-11-30 12:14:13.374
1383	https://platina.vtcrm.ru/uploads/Photos/1147/phpbAzViZ.jpeg	\N	\N	\N	\N	22	\N	2025-11-30 12:14:13.374
1384	https://platina.vtcrm.ru/uploads/Photos/1169/phpSO3cOR.jpeg	\N	\N	11	\N	\N	\N	2025-11-30 12:20:33.475
1385	https://platina.vtcrm.ru/uploads/Photos/1169/phpxFKCjy.jpeg	\N	\N	11	\N	\N	\N	2025-11-30 12:20:33.475
1386	https://platina.vtcrm.ru/uploads/Photos/1169/phpQ42oHz.jpeg	\N	\N	11	\N	\N	\N	2025-11-30 12:20:33.475
1387	https://platina.vtcrm.ru/uploads/Photos/1169/phpdAk9Zp.jpeg	\N	\N	11	\N	\N	\N	2025-11-30 12:20:33.475
1388	https://platina.vtcrm.ru/uploads/Photos/1169/php1dyp5g.jpeg	\N	\N	11	\N	\N	\N	2025-11-30 12:20:33.475
1389	https://platina.vtcrm.ru/uploads/Photos/1169/phpEw2C9D.jpeg	\N	\N	11	\N	\N	\N	2025-11-30 12:20:33.475
1390	https://platina.vtcrm.ru/uploads/Photos/1169/phpbtQC9T.jpeg	\N	\N	11	\N	\N	\N	2025-11-30 12:20:33.475
1391	https://platina.vtcrm.ru/uploads/Photos/1169/phpSUjuLh.jpeg	\N	\N	11	\N	\N	\N	2025-11-30 12:20:33.475
1392	https://platina.vtcrm.ru/uploads/Photos/1169/phpgpizNA.jpeg	\N	\N	11	\N	\N	\N	2025-11-30 12:20:33.475
1393	https://platina.vtcrm.ru/uploads/Photos/1169/phpYxvR16.jpeg	\N	\N	11	\N	\N	\N	2025-11-30 12:20:33.475
1394	https://platina.vtcrm.ru/uploads/Photos/1169/phpNRFC6p.jpeg	\N	\N	11	\N	\N	\N	2025-11-30 12:20:33.475
1395	https://platina.vtcrm.ru/uploads/Photos/1169/phpfoNGXn.jpeg	\N	\N	11	\N	\N	\N	2025-11-30 12:20:33.475
1396	https://platina.vtcrm.ru/uploads/Photos/1169/phpXyrG1i.jpeg	\N	\N	11	\N	\N	\N	2025-11-30 12:20:33.475
1397	https://platina.vtcrm.ru/uploads/Photos/1169/phpwKjZjR.jpeg	\N	\N	11	\N	\N	\N	2025-11-30 12:20:33.475
1398	https://platina.vtcrm.ru/uploads/Photos/1169/phpHmES7G.jpeg	\N	\N	11	\N	\N	\N	2025-11-30 12:20:33.475
1399	https://platina.vtcrm.ru/uploads/Photos/1169/php06gUmR.jpeg	\N	\N	11	\N	\N	\N	2025-11-30 12:20:33.475
1400	https://platina.vtcrm.ru/uploads/Photos/1196/phpvV5UWf.jpeg	\N	\N	12	\N	\N	\N	2025-11-30 12:31:02.573
1401	https://platina.vtcrm.ru/uploads/Photos/1196/phpjQSuz1.jpeg	\N	\N	12	\N	\N	\N	2025-11-30 12:31:02.573
1402	https://platina.vtcrm.ru/uploads/Photos/1196/phpTh0OW5.jpeg	\N	\N	12	\N	\N	\N	2025-11-30 12:31:02.573
1403	https://platina.vtcrm.ru/uploads/Photos/1196/phpbXMY1t.jpeg	\N	\N	12	\N	\N	\N	2025-11-30 12:31:02.573
1404	https://platina.vtcrm.ru/uploads/Photos/1196/phprZmLu3.jpeg	\N	\N	12	\N	\N	\N	2025-11-30 12:31:02.573
1405	https://platina.vtcrm.ru/uploads/Photos/1196/phpL4DtNo.jpeg	\N	\N	12	\N	\N	\N	2025-11-30 12:31:02.573
1406	https://platina.vtcrm.ru/uploads/Photos/1196/phpyumRk2.jpeg	\N	\N	12	\N	\N	\N	2025-11-30 12:31:02.573
1407	https://platina.vtcrm.ru/uploads/Photos/1196/phpoa5IQw.jpeg	\N	\N	12	\N	\N	\N	2025-11-30 12:31:02.573
1408	https://platina.vtcrm.ru/uploads/Photos/1196/phplJB7cS.jpeg	\N	\N	12	\N	\N	\N	2025-11-30 12:31:02.573
1409	https://platina.vtcrm.ru/uploads/Photos/1196/php7PQI9D.jpeg	\N	\N	12	\N	\N	\N	2025-11-30 12:31:02.573
1410	https://platina.vtcrm.ru/uploads/Photos/1196/phpodLKna.jpeg	\N	\N	12	\N	\N	\N	2025-11-30 12:31:02.573
1411	https://platina.vtcrm.ru/uploads/Photos/1196/phph73Pu2.jpeg	\N	\N	12	\N	\N	\N	2025-11-30 12:31:02.573
1412	https://platina.vtcrm.ru/uploads/Photos/1196/phptsFDcq.jpeg	\N	\N	12	\N	\N	\N	2025-11-30 12:31:02.573
1413	https://platina.vtcrm.ru/uploads/Photos/1196/phpNoqP6i.jpeg	\N	\N	12	\N	\N	\N	2025-11-30 12:31:02.573
1414	https://platina.vtcrm.ru/uploads/Photos/1196/phpNYyx4m.jpeg	\N	\N	12	\N	\N	\N	2025-11-30 12:31:02.573
1415	https://platina.vtcrm.ru/uploads/Photos/1196/phptByHy5.jpeg	\N	\N	12	\N	\N	\N	2025-11-30 12:31:02.573
1416	https://platina.vtcrm.ru/uploads/Photos/1199/phpA5hm5E.jpeg	\N	\N	13	\N	\N	\N	2025-11-30 12:41:57.108
1417	https://platina.vtcrm.ru/uploads/Photos/1199/phphVDrB3.jpeg	\N	\N	13	\N	\N	\N	2025-11-30 12:41:57.108
1418	https://platina.vtcrm.ru/uploads/Photos/1199/phpH781fz.jpeg	\N	\N	13	\N	\N	\N	2025-11-30 12:41:57.108
1419	https://platina.vtcrm.ru/uploads/Photos/1199/phpUEDySh.jpeg	\N	\N	13	\N	\N	\N	2025-11-30 12:41:57.108
1420	https://platina.vtcrm.ru/uploads/Photos/1199/phpXIegmQ.jpeg	\N	\N	13	\N	\N	\N	2025-11-30 12:41:57.108
1421	https://platina.vtcrm.ru/uploads/Photos/1199/phpZMJ6Yu.jpeg	\N	\N	13	\N	\N	\N	2025-11-30 12:41:57.108
1422	https://platina.vtcrm.ru/uploads/Photos/1201/phpbqqfTd.jpeg	\N	\N	\N	\N	\N	6	2025-11-30 12:45:11.901
1423	https://platina.vtcrm.ru/uploads/Photos/1201/phpt0D3gl.jpeg	\N	\N	\N	\N	\N	6	2025-11-30 12:45:11.901
1424	https://platina.vtcrm.ru/uploads/Photos/1201/phpdnfPI9.jpeg	\N	\N	\N	\N	\N	6	2025-11-30 12:45:11.901
1425	https://platina.vtcrm.ru/uploads/Photos/1201/phpYwXolv.jpeg	\N	\N	\N	\N	\N	6	2025-11-30 12:45:11.901
1426	https://platina.vtcrm.ru/uploads/Photos/1201/php3AVEDy.jpeg	\N	\N	\N	\N	\N	6	2025-11-30 12:45:11.901
1427	https://platina.vtcrm.ru/uploads/Photos/1201/phpbqqfTd.jpeg	\N	\N	\N	\N	\N	7	2025-11-30 12:46:53.576
1428	https://platina.vtcrm.ru/uploads/Photos/1201/phpt0D3gl.jpeg	\N	\N	\N	\N	\N	7	2025-11-30 12:46:53.576
1429	https://platina.vtcrm.ru/uploads/Photos/1201/phpdnfPI9.jpeg	\N	\N	\N	\N	\N	7	2025-11-30 12:46:53.576
1430	https://platina.vtcrm.ru/uploads/Photos/1201/phpYwXolv.jpeg	\N	\N	\N	\N	\N	7	2025-11-30 12:46:53.576
1431	https://platina.vtcrm.ru/uploads/Photos/1201/php3AVEDy.jpeg	\N	\N	\N	\N	\N	7	2025-11-30 12:46:53.576
1432	https://platina.vtcrm.ru/uploads/Photos/1249/phpnWeNr0.jpeg	\N	\N	\N	\N	23	\N	2025-11-30 12:55:16.585
1433	https://platina.vtcrm.ru/uploads/Photos/1249/php8VHM0h.jpeg	\N	\N	\N	\N	23	\N	2025-11-30 12:55:16.585
1434	https://platina.vtcrm.ru/uploads/Photos/1249/phprJhAfE.jpeg	\N	\N	\N	\N	23	\N	2025-11-30 12:55:16.585
1435	https://platina.vtcrm.ru/uploads/Photos/1249/phpv829N6.jpeg	\N	\N	\N	\N	23	\N	2025-11-30 12:55:16.585
1436	https://platina.vtcrm.ru/uploads/Photos/1249/phpsfIlp8.jpeg	\N	\N	\N	\N	23	\N	2025-11-30 12:55:16.585
1437	https://platina.vtcrm.ru/uploads/Photos/1249/phpCPnzAY.jpeg	\N	\N	\N	\N	23	\N	2025-11-30 12:55:16.585
1438	https://platina.vtcrm.ru/uploads/Photos/1249/php8GCTlo.jpeg	\N	\N	\N	\N	23	\N	2025-11-30 12:55:16.585
1439	https://platina.vtcrm.ru/uploads/Photos/1249/php0PgSTm.jpeg	\N	\N	\N	\N	23	\N	2025-11-30 12:55:16.585
1440	https://platina.vtcrm.ru/uploads/Photos/1249/phpAaddV8.jpeg	\N	\N	\N	\N	23	\N	2025-11-30 12:55:16.585
1441	https://platina.vtcrm.ru/uploads/Photos/1249/phpf0EfMI.jpeg	\N	\N	\N	\N	23	\N	2025-11-30 12:55:16.585
1442	https://platina.vtcrm.ru/uploads/Photos/1259/phpwXj9YN.jpeg	\N	\N	\N	\N	8	\N	2025-11-30 13:10:35.511
1443	https://platina.vtcrm.ru/uploads/Photos/1259/phpOnJwSR.jpeg	\N	\N	\N	\N	8	\N	2025-11-30 13:10:35.511
1444	https://platina.vtcrm.ru/uploads/Photos/1259/php5DkYrT.jpeg	\N	\N	\N	\N	8	\N	2025-11-30 13:10:35.511
1445	https://platina.vtcrm.ru/uploads/Photos/1259/phphY0Q8D.jpeg	\N	\N	\N	\N	8	\N	2025-11-30 13:10:35.511
1446	https://platina.vtcrm.ru/uploads/Photos/1259/phpsYVxsY.jpeg	\N	\N	\N	\N	8	\N	2025-11-30 13:10:35.511
1447	https://platina.vtcrm.ru/uploads/Photos/1259/php84zBBB.jpeg	\N	\N	\N	\N	8	\N	2025-11-30 13:10:35.511
1448	https://platina.vtcrm.ru/uploads/Photos/1259/phpzxIDdW.jpeg	\N	\N	\N	\N	8	\N	2025-11-30 13:10:35.511
1449	https://platina.vtcrm.ru/uploads/Photos/1259/phpwXj9YN.jpeg	\N	\N	\N	\N	\N	8	2025-11-30 13:11:05.692
1450	https://platina.vtcrm.ru/uploads/Photos/1259/phpOnJwSR.jpeg	\N	\N	\N	\N	\N	8	2025-11-30 13:11:05.692
1451	https://platina.vtcrm.ru/uploads/Photos/1259/php5DkYrT.jpeg	\N	\N	\N	\N	\N	8	2025-11-30 13:11:05.692
1452	https://platina.vtcrm.ru/uploads/Photos/1259/phphY0Q8D.jpeg	\N	\N	\N	\N	\N	8	2025-11-30 13:11:05.692
1453	https://platina.vtcrm.ru/uploads/Photos/1259/phpsYVxsY.jpeg	\N	\N	\N	\N	\N	8	2025-11-30 13:11:05.692
1454	https://platina.vtcrm.ru/uploads/Photos/1259/php84zBBB.jpeg	\N	\N	\N	\N	\N	8	2025-11-30 13:11:05.692
1455	https://platina.vtcrm.ru/uploads/Photos/1259/phpzxIDdW.jpeg	\N	\N	\N	\N	\N	8	2025-11-30 13:11:05.692
1456	https://platina.vtcrm.ru/uploads/Photos/785/phpmPNiGj.jpeg	\N	\N	\N	40	\N	\N	2025-12-02 10:55:25.656
1457	https://platina.vtcrm.ru/uploads/Photos/785/php0buBlL.jpeg	\N	\N	\N	40	\N	\N	2025-12-02 10:55:25.656
1458	https://platina.vtcrm.ru/uploads/Photos/785/phpDdjl8J.jpeg	\N	\N	\N	40	\N	\N	2025-12-02 10:55:25.656
1459	https://platina.vtcrm.ru/uploads/Photos/785/php0apaBH.jpeg	\N	\N	\N	40	\N	\N	2025-12-02 10:55:25.656
1460	https://platina.vtcrm.ru/uploads/Photos/785/phpycMYuC.jpeg	\N	\N	\N	40	\N	\N	2025-12-02 10:55:25.656
1461	https://platina.vtcrm.ru/uploads/Photos/785/phpsrcen8.jpeg	\N	\N	\N	40	\N	\N	2025-12-02 10:55:25.656
1462	https://platina.vtcrm.ru/uploads/Photos/785/phprHQARZ.jpeg	\N	\N	\N	40	\N	\N	2025-12-02 10:55:25.656
1463	https://platina.vtcrm.ru/uploads/Photos/785/php1li2mZ.jpeg	\N	\N	\N	40	\N	\N	2025-12-02 10:55:25.656
1464	https://platina.vtcrm.ru/uploads/Photos/785/phpUvvUia.jpeg	\N	\N	\N	40	\N	\N	2025-12-02 10:55:25.656
1465	https://platina.vtcrm.ru/uploads/Photos/785/phpmPNiGj.jpeg	\N	\N	\N	48	\N	\N	2025-12-02 10:57:03.559
1466	https://platina.vtcrm.ru/uploads/Photos/785/php0buBlL.jpeg	\N	\N	\N	48	\N	\N	2025-12-02 10:57:03.559
1467	https://platina.vtcrm.ru/uploads/Photos/785/phpDdjl8J.jpeg	\N	\N	\N	48	\N	\N	2025-12-02 10:57:03.559
1468	https://platina.vtcrm.ru/uploads/Photos/785/php0apaBH.jpeg	\N	\N	\N	48	\N	\N	2025-12-02 10:57:03.559
1469	https://platina.vtcrm.ru/uploads/Photos/785/phpycMYuC.jpeg	\N	\N	\N	48	\N	\N	2025-12-02 10:57:03.559
1470	https://platina.vtcrm.ru/uploads/Photos/785/phpsrcen8.jpeg	\N	\N	\N	48	\N	\N	2025-12-02 10:57:03.559
1471	https://platina.vtcrm.ru/uploads/Photos/785/phprHQARZ.jpeg	\N	\N	\N	48	\N	\N	2025-12-02 10:57:03.559
1472	https://platina.vtcrm.ru/uploads/Photos/785/php1li2mZ.jpeg	\N	\N	\N	48	\N	\N	2025-12-02 10:57:03.559
1473	https://platina.vtcrm.ru/uploads/Photos/785/phpUvvUia.jpeg	\N	\N	\N	48	\N	\N	2025-12-02 10:57:03.559
1474	https://platina.vtcrm.ru/uploads/Photos/786/phpY9DSCD.jpeg	\N	\N	\N	49	\N	\N	2025-12-02 10:58:51.471
1475	https://platina.vtcrm.ru/uploads/Photos/786/phpbdYlti.jpeg	\N	\N	\N	49	\N	\N	2025-12-02 10:58:51.471
1476	https://platina.vtcrm.ru/uploads/Photos/786/phpf4p8uZ.jpeg	\N	\N	\N	49	\N	\N	2025-12-02 10:58:51.471
1477	https://platina.vtcrm.ru/uploads/Photos/786/phpCKAmn7.jpeg	\N	\N	\N	49	\N	\N	2025-12-02 10:58:51.471
1478	https://platina.vtcrm.ru/uploads/Photos/786/phprawuIC.jpeg	\N	\N	\N	49	\N	\N	2025-12-02 10:58:51.471
1479	https://platina.vtcrm.ru/uploads/Photos/786/phpmLFCyH.jpeg	\N	\N	\N	49	\N	\N	2025-12-02 10:58:51.471
1480	https://platina.vtcrm.ru/uploads/Photos/786/phpqkOiTd.jpeg	\N	\N	\N	49	\N	\N	2025-12-02 10:58:51.471
1481	https://platina.vtcrm.ru/uploads/Photos/786/php4m6AxD.jpeg	\N	\N	\N	49	\N	\N	2025-12-02 10:58:51.471
1482	https://platina.vtcrm.ru/uploads/Photos/786/php2YbRpx.jpeg	\N	\N	\N	49	\N	\N	2025-12-02 10:58:51.471
1483	https://platina.vtcrm.ru/uploads/Photos/787/php8g921E.jpeg	\N	\N	\N	50	\N	\N	2025-12-02 11:01:12.121
1484	https://platina.vtcrm.ru/uploads/Photos/787/phpsJvVy2.jpeg	\N	\N	\N	50	\N	\N	2025-12-02 11:01:12.121
1485	https://platina.vtcrm.ru/uploads/Photos/787/phpV2s1YP.jpeg	\N	\N	\N	50	\N	\N	2025-12-02 11:01:12.121
1486	https://platina.vtcrm.ru/uploads/Photos/787/phpb9TbRR.jpeg	\N	\N	\N	50	\N	\N	2025-12-02 11:01:12.121
1487	https://platina.vtcrm.ru/uploads/Photos/787/phpSzehkV.jpeg	\N	\N	\N	50	\N	\N	2025-12-02 11:01:12.121
1488	https://platina.vtcrm.ru/uploads/Photos/788/php4CtrCy.jpeg	\N	\N	\N	51	\N	\N	2025-12-02 11:03:43.19
1489	https://platina.vtcrm.ru/uploads/Photos/788/php4Fslpq.jpeg	\N	\N	\N	51	\N	\N	2025-12-02 11:03:43.19
1490	https://platina.vtcrm.ru/uploads/Photos/788/php0zs6YP.jpeg	\N	\N	\N	51	\N	\N	2025-12-02 11:03:43.19
1491	https://platina.vtcrm.ru/uploads/Photos/788/phpIZYCG1.jpeg	\N	\N	\N	51	\N	\N	2025-12-02 11:03:43.19
1492	https://platina.vtcrm.ru/uploads/Photos/788/phpV4Pbg7.jpeg	\N	\N	\N	51	\N	\N	2025-12-02 11:03:43.19
1493	https://platina.vtcrm.ru/uploads/Photos/788/phpbBWZrh.jpeg	\N	\N	\N	51	\N	\N	2025-12-02 11:03:43.19
1494	https://platina.vtcrm.ru/uploads/Photos/788/phpswxh3j.jpeg	\N	\N	\N	51	\N	\N	2025-12-02 11:03:43.19
1495	https://platina.vtcrm.ru/uploads/Photos/788/phpSGWSNi.jpeg	\N	\N	\N	51	\N	\N	2025-12-02 11:03:43.19
1496	https://platina.vtcrm.ru/uploads/Photos/788/phpoMakH1.jpeg	\N	\N	\N	51	\N	\N	2025-12-02 11:03:43.19
1497	https://platina.vtcrm.ru/uploads/Photos/789/phplc7sh6.jpeg	\N	\N	\N	52	\N	\N	2025-12-02 11:06:13.285
1498	https://platina.vtcrm.ru/uploads/Photos/789/phpS3s2K2.jpeg	\N	\N	\N	52	\N	\N	2025-12-02 11:06:13.285
1499	https://platina.vtcrm.ru/uploads/Photos/789/phpYG3xrW.jpeg	\N	\N	\N	52	\N	\N	2025-12-02 11:06:13.285
1500	https://platina.vtcrm.ru/uploads/Photos/789/phpGOPqlv.jpeg	\N	\N	\N	52	\N	\N	2025-12-02 11:06:13.285
1501	https://platina.vtcrm.ru/uploads/Photos/789/phpf32rUg.jpeg	\N	\N	\N	52	\N	\N	2025-12-02 11:06:13.285
1502	https://platina.vtcrm.ru/uploads/Photos/789/phpE4eGR2.jpeg	\N	\N	\N	52	\N	\N	2025-12-02 11:06:13.285
1503	https://platina.vtcrm.ru/uploads/Photos/790/phpplXGy0.jpeg	\N	\N	\N	53	\N	\N	2025-12-02 11:09:06.34
1504	https://platina.vtcrm.ru/uploads/Photos/790/phpdp1BBN.jpeg	\N	\N	\N	53	\N	\N	2025-12-02 11:09:06.34
1505	https://platina.vtcrm.ru/uploads/Photos/790/phpImEXh7.jpeg	\N	\N	\N	53	\N	\N	2025-12-02 11:09:06.34
1506	https://platina.vtcrm.ru/uploads/Photos/790/phptC1eik.jpeg	\N	\N	\N	53	\N	\N	2025-12-02 11:09:06.34
1507	https://platina.vtcrm.ru/uploads/Photos/790/phpKjz2dE.jpeg	\N	\N	\N	53	\N	\N	2025-12-02 11:09:06.34
1508	https://platina.vtcrm.ru/uploads/Photos/790/phpZBjKvr.jpeg	\N	\N	\N	53	\N	\N	2025-12-02 11:09:06.34
1509	https://platina.vtcrm.ru/uploads/Photos/790/phpqTquGm.jpeg	\N	\N	\N	53	\N	\N	2025-12-02 11:09:06.34
1510	https://platina.vtcrm.ru/uploads/Photos/790/phpakeuyi.jpeg	\N	\N	\N	53	\N	\N	2025-12-02 11:09:06.34
1511	https://platina.vtcrm.ru/uploads/Photos/790/phpurArfn.jpeg	\N	\N	\N	53	\N	\N	2025-12-02 11:09:06.34
1512	https://platina.vtcrm.ru/uploads/Photos/790/phpVlvKmp.jpeg	\N	\N	\N	53	\N	\N	2025-12-02 11:09:06.34
1513	https://platina.vtcrm.ru/uploads/Photos/791/phpE1ENn3.jpeg	\N	\N	\N	54	\N	\N	2025-12-02 11:11:34.95
1514	https://platina.vtcrm.ru/uploads/Photos/791/phpPyqvMR.jpeg	\N	\N	\N	54	\N	\N	2025-12-02 11:11:34.95
1515	https://platina.vtcrm.ru/uploads/Photos/791/phpWY31cC.jpeg	\N	\N	\N	54	\N	\N	2025-12-02 11:11:34.95
1516	https://platina.vtcrm.ru/uploads/Photos/791/phpS0uhv0.jpeg	\N	\N	\N	54	\N	\N	2025-12-02 11:11:34.95
1517	https://platina.vtcrm.ru/uploads/Photos/791/phpqNKaSe.jpeg	\N	\N	\N	54	\N	\N	2025-12-02 11:11:34.95
1518	https://platina.vtcrm.ru/uploads/Photos/791/phpWVyibH.jpeg	\N	\N	\N	54	\N	\N	2025-12-02 11:11:34.95
1519	https://platina.vtcrm.ru/uploads/Photos/791/phpKqYBFM.jpeg	\N	\N	\N	54	\N	\N	2025-12-02 11:11:34.95
1520	https://platina.vtcrm.ru/uploads/Photos/791/phpZrv4Tb.jpeg	\N	\N	\N	54	\N	\N	2025-12-02 11:11:34.95
1521	https://platina.vtcrm.ru/uploads/Photos/791/php6JteBv.jpeg	\N	\N	\N	54	\N	\N	2025-12-02 11:11:34.95
1522	https://platina.vtcrm.ru/uploads/Photos/792/phpbjdyQf.jpeg	\N	\N	\N	55	\N	\N	2025-12-02 11:13:49.707
1523	https://platina.vtcrm.ru/uploads/Photos/792/php5pBF5e.jpeg	\N	\N	\N	55	\N	\N	2025-12-02 11:13:49.707
1524	https://platina.vtcrm.ru/uploads/Photos/792/phpodgqLG.jpeg	\N	\N	\N	55	\N	\N	2025-12-02 11:13:49.707
1525	https://platina.vtcrm.ru/uploads/Photos/792/phpc0WIdY.jpeg	\N	\N	\N	55	\N	\N	2025-12-02 11:13:49.707
1526	https://platina.vtcrm.ru/uploads/Photos/792/phpiDzuiC.jpeg	\N	\N	\N	55	\N	\N	2025-12-02 11:13:49.707
1527	https://platina.vtcrm.ru/uploads/Photos/792/phpLEScCa.jpeg	\N	\N	\N	55	\N	\N	2025-12-02 11:13:49.707
1528	https://platina.vtcrm.ru/uploads/Photos/792/phprp8zXE.jpeg	\N	\N	\N	55	\N	\N	2025-12-02 11:13:49.707
1529	https://platina.vtcrm.ru/uploads/Photos/793/phpyaXLio.jpeg	\N	\N	\N	56	\N	\N	2025-12-02 11:16:25.918
1530	https://platina.vtcrm.ru/uploads/Photos/793/php29K1iW.jpeg	\N	\N	\N	56	\N	\N	2025-12-02 11:16:25.918
1531	https://platina.vtcrm.ru/uploads/Photos/793/phprvKuJ7.jpeg	\N	\N	\N	56	\N	\N	2025-12-02 11:16:25.918
1532	https://platina.vtcrm.ru/uploads/Photos/793/phppXzFQk.jpeg	\N	\N	\N	56	\N	\N	2025-12-02 11:16:25.918
1533	https://platina.vtcrm.ru/uploads/Photos/793/phpwbGirX.jpeg	\N	\N	\N	56	\N	\N	2025-12-02 11:16:25.918
1534	https://platina.vtcrm.ru/uploads/Photos/793/phpbJeFTW.jpeg	\N	\N	\N	56	\N	\N	2025-12-02 11:16:25.918
1535	https://platina.vtcrm.ru/uploads/Photos/793/phpBqQ1bv.jpeg	\N	\N	\N	56	\N	\N	2025-12-02 11:16:25.918
1536	https://platina.vtcrm.ru/uploads/Photos/793/phpgO9yAR.jpeg	\N	\N	\N	56	\N	\N	2025-12-02 11:16:25.918
1537	https://platina.vtcrm.ru/uploads/Photos/793/phpjUnRRq.jpeg	\N	\N	\N	56	\N	\N	2025-12-02 11:16:25.918
1538	https://platina.vtcrm.ru/uploads/Photos/794/phpUWfS7g.jpeg	\N	\N	\N	57	\N	\N	2025-12-02 11:18:32.838
1539	https://platina.vtcrm.ru/uploads/Photos/794/php7LdUnd.jpeg	\N	\N	\N	57	\N	\N	2025-12-02 11:18:32.838
1540	https://platina.vtcrm.ru/uploads/Photos/794/phpkxU2u3.jpeg	\N	\N	\N	57	\N	\N	2025-12-02 11:18:32.838
1541	https://platina.vtcrm.ru/uploads/Photos/794/php7BTEZC.jpeg	\N	\N	\N	57	\N	\N	2025-12-02 11:18:32.838
1542	https://platina.vtcrm.ru/uploads/Photos/794/phpDw2hPm.jpeg	\N	\N	\N	57	\N	\N	2025-12-02 11:18:32.838
1543	https://platina.vtcrm.ru/uploads/Photos/794/phpuTVXp6.jpeg	\N	\N	\N	57	\N	\N	2025-12-02 11:18:32.838
1544	https://platina.vtcrm.ru/uploads/Photos/794/php1pIj9J.jpeg	\N	\N	\N	57	\N	\N	2025-12-02 11:18:32.838
1545	https://platina.vtcrm.ru/uploads/Photos/796/php2pQ03T.jpeg	\N	\N	\N	58	\N	\N	2025-12-02 11:20:52.711
1546	https://platina.vtcrm.ru/uploads/Photos/796/phpEA1hrF.jpeg	\N	\N	\N	58	\N	\N	2025-12-02 11:20:52.711
1547	https://platina.vtcrm.ru/uploads/Photos/796/phpo5f03N.jpeg	\N	\N	\N	58	\N	\N	2025-12-02 11:20:52.711
1548	https://platina.vtcrm.ru/uploads/Photos/796/phpOrOHAG.jpeg	\N	\N	\N	58	\N	\N	2025-12-02 11:20:52.711
1549	https://platina.vtcrm.ru/uploads/Photos/796/phpofhWuu.jpeg	\N	\N	\N	58	\N	\N	2025-12-02 11:20:52.711
1550	https://platina.vtcrm.ru/uploads/Photos/796/phpvjUG6h.jpeg	\N	\N	\N	58	\N	\N	2025-12-02 11:20:52.711
1551	https://platina.vtcrm.ru/uploads/Photos/796/php5137nA.jpeg	\N	\N	\N	58	\N	\N	2025-12-02 11:20:52.711
1552	https://platina.vtcrm.ru/uploads/Photos/798/phpvL52Ov.jpeg	\N	\N	\N	59	\N	\N	2025-12-02 11:23:15.192
1553	https://platina.vtcrm.ru/uploads/Photos/798/phpz3itHa.jpeg	\N	\N	\N	59	\N	\N	2025-12-02 11:23:15.192
1554	https://platina.vtcrm.ru/uploads/Photos/798/phpugW7ES.jpeg	\N	\N	\N	59	\N	\N	2025-12-02 11:23:15.192
1555	https://platina.vtcrm.ru/uploads/Photos/798/phpTeRmOG.jpeg	\N	\N	\N	59	\N	\N	2025-12-02 11:23:15.192
1556	https://platina.vtcrm.ru/uploads/Photos/798/phpgOnDyI.jpeg	\N	\N	\N	59	\N	\N	2025-12-02 11:23:15.192
1557	https://platina.vtcrm.ru/uploads/Photos/798/phpICN6Yz.jpeg	\N	\N	\N	59	\N	\N	2025-12-02 11:23:15.192
1558	https://platina.vtcrm.ru/uploads/Photos/799/phpr0gYGi.jpeg	\N	\N	\N	60	\N	\N	2025-12-02 11:25:37.448
1559	https://platina.vtcrm.ru/uploads/Photos/799/phpkLuVDN.jpeg	\N	\N	\N	60	\N	\N	2025-12-02 11:25:37.448
1560	https://platina.vtcrm.ru/uploads/Photos/799/phprPftbk.jpeg	\N	\N	\N	60	\N	\N	2025-12-02 11:25:37.448
1561	https://platina.vtcrm.ru/uploads/Photos/799/php2s7ZdK.jpeg	\N	\N	\N	60	\N	\N	2025-12-02 11:25:37.448
1562	https://platina.vtcrm.ru/uploads/Photos/799/phpxHmT2J.jpeg	\N	\N	\N	60	\N	\N	2025-12-02 11:25:37.448
1563	https://platina.vtcrm.ru/uploads/Photos/799/phpssPEFH.jpeg	\N	\N	\N	60	\N	\N	2025-12-02 11:25:37.448
1564	https://platina.vtcrm.ru/uploads/Photos/799/phpHT1jHr.jpeg	\N	\N	\N	60	\N	\N	2025-12-02 11:25:37.448
1565	https://platina.vtcrm.ru/uploads/Photos/799/php1TK3wX.jpeg	\N	\N	\N	60	\N	\N	2025-12-02 11:25:37.448
1566	https://platina.vtcrm.ru/uploads/Photos/804/phpWBnfwP.jpeg	\N	\N	\N	61	\N	\N	2025-12-02 11:40:09.893
1567	https://platina.vtcrm.ru/uploads/Photos/804/phpSyzFof.jpeg	\N	\N	\N	61	\N	\N	2025-12-02 11:40:09.893
1568	https://platina.vtcrm.ru/uploads/Photos/804/phpPAljNd.jpeg	\N	\N	\N	61	\N	\N	2025-12-02 11:40:09.893
1569	https://platina.vtcrm.ru/uploads/Photos/804/phpLYcE3k.jpeg	\N	\N	\N	61	\N	\N	2025-12-02 11:40:09.893
1570	https://platina.vtcrm.ru/uploads/Photos/804/phplZ1x2h.jpeg	\N	\N	\N	61	\N	\N	2025-12-02 11:40:09.893
1571	https://platina.vtcrm.ru/uploads/Photos/804/phpGwdVud.jpeg	\N	\N	\N	61	\N	\N	2025-12-02 11:40:09.893
1572	https://platina.vtcrm.ru/uploads/Photos/804/php0F99QZ.jpeg	\N	\N	\N	61	\N	\N	2025-12-02 11:40:09.893
1573	https://platina.vtcrm.ru/uploads/Photos/805/phpj9D6vg.jpeg	\N	\N	\N	62	\N	\N	2025-12-02 11:42:45.098
1574	https://platina.vtcrm.ru/uploads/Photos/805/php0dJ0FZ.jpeg	\N	\N	\N	62	\N	\N	2025-12-02 11:42:45.098
1575	https://platina.vtcrm.ru/uploads/Photos/805/php7gLZlf.jpeg	\N	\N	\N	62	\N	\N	2025-12-02 11:42:45.098
1576	https://platina.vtcrm.ru/uploads/Photos/805/phpfOt51V.jpeg	\N	\N	\N	62	\N	\N	2025-12-02 11:42:45.098
1577	https://platina.vtcrm.ru/uploads/Photos/805/php7jRsC1.jpeg	\N	\N	\N	62	\N	\N	2025-12-02 11:42:45.098
1578	https://platina.vtcrm.ru/uploads/Photos/805/phpHbSC9p.jpeg	\N	\N	\N	62	\N	\N	2025-12-02 11:42:45.098
1579	https://platina.vtcrm.ru/uploads/Photos/805/phpPhZlWM.jpeg	\N	\N	\N	62	\N	\N	2025-12-02 11:42:45.098
1580	https://platina.vtcrm.ru/uploads/Photos/806/phptKO1H0.jpeg	\N	\N	\N	63	\N	\N	2025-12-02 11:49:39.074
1581	https://platina.vtcrm.ru/uploads/Photos/806/phpdlTQbM.jpeg	\N	\N	\N	63	\N	\N	2025-12-02 11:49:39.074
1582	https://platina.vtcrm.ru/uploads/Photos/806/phpoMaiLP.jpeg	\N	\N	\N	63	\N	\N	2025-12-02 11:49:39.074
1583	https://platina.vtcrm.ru/uploads/Photos/806/php972Z1p.jpeg	\N	\N	\N	63	\N	\N	2025-12-02 11:49:39.074
1584	https://platina.vtcrm.ru/uploads/Photos/806/phpUXyiVh.jpeg	\N	\N	\N	63	\N	\N	2025-12-02 11:49:39.074
1585	https://platina.vtcrm.ru/uploads/Photos/806/phpebZXxm.jpeg	\N	\N	\N	63	\N	\N	2025-12-02 11:49:39.074
1586	https://platina.vtcrm.ru/uploads/Photos/806/phpPhRu1w.jpeg	\N	\N	\N	63	\N	\N	2025-12-02 11:49:39.074
1587	https://platina.vtcrm.ru/uploads/Photos/806/phpkKzIpY.jpeg	\N	\N	\N	63	\N	\N	2025-12-02 11:49:39.074
1588	https://platina.vtcrm.ru/uploads/Photos/806/phpvZBgzj.jpeg	\N	\N	\N	63	\N	\N	2025-12-02 11:49:39.074
1589	https://platina.vtcrm.ru/uploads/Photos/817/phpaBHUra.jpeg	\N	\N	\N	64	\N	\N	2025-12-02 11:52:57.995
1590	https://platina.vtcrm.ru/uploads/Photos/817/phpl9UWt6.jpeg	\N	\N	\N	64	\N	\N	2025-12-02 11:52:57.995
1591	https://platina.vtcrm.ru/uploads/Photos/817/phptnjVdN.jpeg	\N	\N	\N	64	\N	\N	2025-12-02 11:52:57.995
1592	https://platina.vtcrm.ru/uploads/Photos/817/phpHKnhfa.jpeg	\N	\N	\N	64	\N	\N	2025-12-02 11:52:57.995
1593	https://platina.vtcrm.ru/uploads/Photos/817/phpGltdLX.jpeg	\N	\N	\N	64	\N	\N	2025-12-02 11:52:57.995
1594	https://platina.vtcrm.ru/uploads/Photos/817/phpVvRfrk.jpeg	\N	\N	\N	64	\N	\N	2025-12-02 11:52:57.995
1595	https://platina.vtcrm.ru/uploads/Photos/817/phpySIEl8.jpeg	\N	\N	\N	64	\N	\N	2025-12-02 11:52:57.995
1596	https://platina.vtcrm.ru/uploads/Photos/819/phpUu3VbJ.jpeg	\N	\N	\N	65	\N	\N	2025-12-02 11:58:25.692
1597	https://platina.vtcrm.ru/uploads/Photos/819/phpWijrYk.jpeg	\N	\N	\N	65	\N	\N	2025-12-02 11:58:25.692
1598	https://platina.vtcrm.ru/uploads/Photos/819/php27Mgsi.jpeg	\N	\N	\N	65	\N	\N	2025-12-02 11:58:25.692
1599	https://platina.vtcrm.ru/uploads/Photos/819/phpjiMwDs.jpeg	\N	\N	\N	65	\N	\N	2025-12-02 11:58:25.692
1600	https://platina.vtcrm.ru/uploads/Photos/819/phpypCJtK.jpeg	\N	\N	\N	65	\N	\N	2025-12-02 11:58:25.692
1601	https://platina.vtcrm.ru/uploads/Photos/819/php0RYQh8.jpeg	\N	\N	\N	65	\N	\N	2025-12-02 11:58:25.692
1602	https://platina.vtcrm.ru/uploads/Photos/819/php8LrGTj.jpeg	\N	\N	\N	65	\N	\N	2025-12-02 11:58:25.692
1603	https://platina.vtcrm.ru/uploads/Photos/819/phpA75IG2.jpeg	\N	\N	\N	65	\N	\N	2025-12-02 11:58:25.692
1604	https://platina.vtcrm.ru/uploads/Photos/833/phpIjtLOD.jpeg	\N	\N	\N	66	\N	\N	2025-12-02 12:02:00.98
1605	https://platina.vtcrm.ru/uploads/Photos/833/phpFCwEQ4.jpeg	\N	\N	\N	66	\N	\N	2025-12-02 12:02:00.98
1606	https://platina.vtcrm.ru/uploads/Photos/833/phpl0ueCs.jpeg	\N	\N	\N	66	\N	\N	2025-12-02 12:02:00.98
1607	https://platina.vtcrm.ru/uploads/Photos/833/phprUp9GK.jpeg	\N	\N	\N	66	\N	\N	2025-12-02 12:02:00.98
1608	https://platina.vtcrm.ru/uploads/Photos/833/phpMN8r6r.jpeg	\N	\N	\N	66	\N	\N	2025-12-02 12:02:00.98
1609	https://platina.vtcrm.ru/uploads/Photos/833/phpL1mR9k.jpeg	\N	\N	\N	66	\N	\N	2025-12-02 12:02:00.98
1610	https://platina.vtcrm.ru/uploads/Photos/833/phpTGueN0.jpeg	\N	\N	\N	66	\N	\N	2025-12-02 12:02:00.98
1611	https://platina.vtcrm.ru/uploads/Photos/833/phpUQ63ec.jpeg	\N	\N	\N	66	\N	\N	2025-12-02 12:02:00.98
1612	https://platina.vtcrm.ru/uploads/Photos/836/phprTYs5X.jpeg	\N	\N	\N	67	\N	\N	2025-12-02 12:06:01.648
1613	https://platina.vtcrm.ru/uploads/Photos/836/phpSBcotg.jpeg	\N	\N	\N	67	\N	\N	2025-12-02 12:06:01.648
1614	https://platina.vtcrm.ru/uploads/Photos/836/phpUNXyag.jpeg	\N	\N	\N	67	\N	\N	2025-12-02 12:06:01.648
1615	https://platina.vtcrm.ru/uploads/Photos/836/phpqjMWpF.jpeg	\N	\N	\N	67	\N	\N	2025-12-02 12:06:01.648
1616	https://platina.vtcrm.ru/uploads/Photos/836/php70XUKG.jpeg	\N	\N	\N	67	\N	\N	2025-12-02 12:06:01.648
1617	https://platina.vtcrm.ru/uploads/Photos/836/php8fe4mp.jpeg	\N	\N	\N	67	\N	\N	2025-12-02 12:06:01.648
1618	https://platina.vtcrm.ru/uploads/Photos/836/phpZBY95N.jpeg	\N	\N	\N	67	\N	\N	2025-12-02 12:06:01.648
1619	https://platina.vtcrm.ru/uploads/Photos/836/phpnUjVpd.jpeg	\N	\N	\N	67	\N	\N	2025-12-02 12:06:01.648
1620	https://platina.vtcrm.ru/uploads/Photos/836/phpQjSqOX.jpeg	\N	\N	\N	67	\N	\N	2025-12-02 12:06:01.648
1621	https://platina.vtcrm.ru/uploads/Photos/836/php33CGLz.jpeg	\N	\N	\N	67	\N	\N	2025-12-02 12:06:01.648
1622	https://platina.vtcrm.ru/uploads/Photos/837/phpnBnjNg.jpeg	\N	\N	\N	68	\N	\N	2025-12-02 12:13:12.156
1623	https://platina.vtcrm.ru/uploads/Photos/837/phpt6lHMI.jpeg	\N	\N	\N	68	\N	\N	2025-12-02 12:13:12.156
1624	https://platina.vtcrm.ru/uploads/Photos/837/phpzp2qEG.jpeg	\N	\N	\N	68	\N	\N	2025-12-02 12:13:12.156
1625	https://platina.vtcrm.ru/uploads/Photos/837/phpHo6gMA.jpeg	\N	\N	\N	68	\N	\N	2025-12-02 12:13:12.156
1626	https://platina.vtcrm.ru/uploads/Photos/837/phpCM9rci.jpeg	\N	\N	\N	68	\N	\N	2025-12-02 12:13:12.156
1627	https://platina.vtcrm.ru/uploads/Photos/837/phpQVeTEo.jpeg	\N	\N	\N	68	\N	\N	2025-12-02 12:13:12.156
1628	https://platina.vtcrm.ru/uploads/Photos/837/phpFWU1J4.jpeg	\N	\N	\N	68	\N	\N	2025-12-02 12:13:12.156
1629	https://platina.vtcrm.ru/uploads/Photos/837/phpITVnkX.jpeg	\N	\N	\N	68	\N	\N	2025-12-02 12:13:12.156
1630	https://platina.vtcrm.ru/uploads/Photos/837/phpvKrkBI.jpeg	\N	\N	\N	68	\N	\N	2025-12-02 12:13:12.156
1631	https://platina.vtcrm.ru/uploads/Photos/837/phpd3LLZt.jpeg	\N	\N	\N	68	\N	\N	2025-12-02 12:13:12.156
1632	https://platina.vtcrm.ru/uploads/Photos/837/phpUYlpYC.jpeg	\N	\N	\N	68	\N	\N	2025-12-02 12:13:12.156
1633	https://platina.vtcrm.ru/uploads/Photos/837/phpoT2Qgs.jpeg	\N	\N	\N	68	\N	\N	2025-12-02 12:13:12.156
1634	https://platina.vtcrm.ru/uploads/Photos/837/phplhS7Mo.jpeg	\N	\N	\N	68	\N	\N	2025-12-02 12:13:12.156
1635	https://platina.vtcrm.ru/uploads/Photos/837/phprhFALN.jpeg	\N	\N	\N	68	\N	\N	2025-12-02 12:13:12.156
1636	https://platina.vtcrm.ru/uploads/Photos/837/php1hWcpN.jpeg	\N	\N	\N	68	\N	\N	2025-12-02 12:13:12.156
1637	https://platina.vtcrm.ru/uploads/Photos/837/phpH2jVGV.jpeg	\N	\N	\N	68	\N	\N	2025-12-02 12:13:12.156
1638	https://platina.vtcrm.ru/uploads/Photos/837/php9i25sa.jpeg	\N	\N	\N	68	\N	\N	2025-12-02 12:13:12.156
1639	https://platina.vtcrm.ru/uploads/Photos/837/php69H95U.jpeg	\N	\N	\N	68	\N	\N	2025-12-02 12:13:12.156
1640	https://platina.vtcrm.ru/uploads/Photos/838/phpDa1rVT.jpeg	\N	\N	\N	69	\N	\N	2025-12-02 12:31:26.474
1641	https://platina.vtcrm.ru/uploads/Photos/838/phpV5GDAX.jpeg	\N	\N	\N	69	\N	\N	2025-12-02 12:31:26.474
1642	https://platina.vtcrm.ru/uploads/Photos/838/phpSJJdOT.jpeg	\N	\N	\N	69	\N	\N	2025-12-02 12:31:26.474
1643	https://platina.vtcrm.ru/uploads/Photos/838/phpgzZnla.jpeg	\N	\N	\N	69	\N	\N	2025-12-02 12:31:26.474
1644	https://platina.vtcrm.ru/uploads/Photos/838/phpslrpLX.jpeg	\N	\N	\N	69	\N	\N	2025-12-02 12:31:26.474
1645	https://platina.vtcrm.ru/uploads/Photos/838/phpNn0GZj.jpeg	\N	\N	\N	69	\N	\N	2025-12-02 12:31:26.474
1646	https://platina.vtcrm.ru/uploads/Photos/838/php3ZELyC.jpeg	\N	\N	\N	69	\N	\N	2025-12-02 12:31:26.474
1647	https://platina.vtcrm.ru/uploads/Photos/838/phpdUFV1b.jpeg	\N	\N	\N	69	\N	\N	2025-12-02 12:31:26.474
1648	https://platina.vtcrm.ru/uploads/Photos/838/phpV21mf3.jpeg	\N	\N	\N	69	\N	\N	2025-12-02 12:31:26.474
1649	https://platina.vtcrm.ru/uploads/Photos/838/php3OZ9ZM.jpeg	\N	\N	\N	69	\N	\N	2025-12-02 12:31:26.474
1650	https://platina.vtcrm.ru/uploads/Photos/838/phpnuoln1.jpeg	\N	\N	\N	69	\N	\N	2025-12-02 12:31:26.474
1651	https://platina.vtcrm.ru/uploads/Photos/838/phpxGfy6b.jpeg	\N	\N	\N	69	\N	\N	2025-12-02 12:31:26.474
1652	https://platina.vtcrm.ru/uploads/Photos/838/phpGXrxO8.jpeg	\N	\N	\N	69	\N	\N	2025-12-02 12:31:26.474
1653	https://platina.vtcrm.ru/uploads/Photos/838/phpFhA3na.jpeg	\N	\N	\N	69	\N	\N	2025-12-02 12:31:26.474
1654	https://platina.vtcrm.ru/uploads/Photos/838/phpMgtGWf.jpeg	\N	\N	\N	69	\N	\N	2025-12-02 12:31:26.474
1655	https://platina.vtcrm.ru/uploads/Photos/838/phpgHjwtW.jpeg	\N	\N	\N	69	\N	\N	2025-12-02 12:31:26.474
1656	https://platina.vtcrm.ru/uploads/Photos/838/php1Y5eVi.jpeg	\N	\N	\N	69	\N	\N	2025-12-02 12:31:26.474
1657	https://platina.vtcrm.ru/uploads/Photos/838/phpWB8z3X.jpeg	\N	\N	\N	69	\N	\N	2025-12-02 12:31:26.474
1658	https://platina.vtcrm.ru/uploads/Photos/838/phprjcTLk.jpeg	\N	\N	\N	69	\N	\N	2025-12-02 12:31:26.474
1659	https://platina.vtcrm.ru/uploads/Photos/838/phpKonmrz.jpeg	\N	\N	\N	69	\N	\N	2025-12-02 12:31:26.474
1660	https://platina.vtcrm.ru/uploads/Photos/838/phpWXPJtO.jpeg	\N	\N	\N	69	\N	\N	2025-12-02 12:31:26.474
1661	https://platina.vtcrm.ru/uploads/Photos/838/phpu4p79c.jpeg	\N	\N	\N	69	\N	\N	2025-12-02 12:31:26.474
1662	https://platina.vtcrm.ru/uploads/Photos/838/php4uJ0nl.jpeg	\N	\N	\N	69	\N	\N	2025-12-02 12:31:26.474
1663	https://platina.vtcrm.ru/uploads/Photos/839/phpMaAPQq.jpeg	\N	\N	\N	70	\N	\N	2025-12-02 12:36:42.48
1664	https://platina.vtcrm.ru/uploads/Photos/839/phpcs0l6v.jpeg	\N	\N	\N	70	\N	\N	2025-12-02 12:36:42.48
1665	https://platina.vtcrm.ru/uploads/Photos/839/phpQqD93j.jpeg	\N	\N	\N	70	\N	\N	2025-12-02 12:36:42.48
1666	https://platina.vtcrm.ru/uploads/Photos/839/phpEfNZ6c.jpeg	\N	\N	\N	70	\N	\N	2025-12-02 12:36:42.48
1667	https://platina.vtcrm.ru/uploads/Photos/839/php5wSZKm.jpeg	\N	\N	\N	70	\N	\N	2025-12-02 12:36:42.48
1668	https://platina.vtcrm.ru/uploads/Photos/839/php96KI6r.jpeg	\N	\N	\N	70	\N	\N	2025-12-02 12:36:42.48
1669	https://platina.vtcrm.ru/uploads/Photos/839/phpTNlkSt.jpeg	\N	\N	\N	70	\N	\N	2025-12-02 12:36:42.48
1670	https://platina.vtcrm.ru/uploads/Photos/839/phpxisuMf.jpeg	\N	\N	\N	70	\N	\N	2025-12-02 12:36:42.48
1671	https://platina.vtcrm.ru/uploads/Photos/839/phpOlIKNu.jpeg	\N	\N	\N	70	\N	\N	2025-12-02 12:36:42.48
1672	https://platina.vtcrm.ru/uploads/Photos/839/phpX1NyDC.jpeg	\N	\N	\N	70	\N	\N	2025-12-02 12:36:42.48
1673	https://platina.vtcrm.ru/uploads/Photos/839/phpoQ8sNN.jpeg	\N	\N	\N	70	\N	\N	2025-12-02 12:36:42.48
1674	https://platina.vtcrm.ru/uploads/Photos/839/phpmzgARL.jpeg	\N	\N	\N	70	\N	\N	2025-12-02 12:36:42.48
1675	https://platina.vtcrm.ru/uploads/Photos/839/phpF08Uwa.jpeg	\N	\N	\N	70	\N	\N	2025-12-02 12:36:42.48
1676	https://platina.vtcrm.ru/uploads/Photos/839/phpsbSqzc.jpeg	\N	\N	\N	70	\N	\N	2025-12-02 12:36:42.48
1677	https://platina.vtcrm.ru/uploads/Photos/839/phpHElNyo.jpeg	\N	\N	\N	70	\N	\N	2025-12-02 12:36:42.48
1678	https://platina.vtcrm.ru/uploads/Photos/839/phplHhBHP.jpeg	\N	\N	\N	70	\N	\N	2025-12-02 12:36:42.48
1679	https://platina.vtcrm.ru/uploads/Photos/839/php0gk1Yu.jpeg	\N	\N	\N	70	\N	\N	2025-12-02 12:36:42.48
1680	https://platina.vtcrm.ru/uploads/Photos/839/phpdD6U8X.jpeg	\N	\N	\N	70	\N	\N	2025-12-02 12:36:42.48
1681	https://platina.vtcrm.ru/uploads/Photos/839/phpegGXsP.jpeg	\N	\N	\N	70	\N	\N	2025-12-02 12:36:42.48
1682	https://platina.vtcrm.ru/uploads/Photos/839/phpiQSpvc.jpeg	\N	\N	\N	70	\N	\N	2025-12-02 12:36:42.48
1683	https://platina.vtcrm.ru/uploads/Photos/839/phpdV5Wb7.jpeg	\N	\N	\N	70	\N	\N	2025-12-02 12:36:42.48
1684	https://platina.vtcrm.ru/uploads/Photos/839/phpqIRAyv.jpeg	\N	\N	\N	70	\N	\N	2025-12-02 12:36:42.48
1685	https://platina.vtcrm.ru/uploads/Photos/839/phpOwHPOW.jpeg	\N	\N	\N	70	\N	\N	2025-12-02 12:36:42.48
1686	https://platina.vtcrm.ru/uploads/Photos/839/php1Nervq.jpeg	\N	\N	\N	70	\N	\N	2025-12-02 12:36:42.48
1687	https://platina.vtcrm.ru/uploads/Photos/842/phpa548Da.jpeg	\N	\N	\N	71	\N	\N	2025-12-02 12:40:14.399
1688	https://platina.vtcrm.ru/uploads/Photos/842/phpU8gNy6.jpeg	\N	\N	\N	71	\N	\N	2025-12-02 12:40:14.399
1689	https://platina.vtcrm.ru/uploads/Photos/842/phptjsYM3.jpeg	\N	\N	\N	71	\N	\N	2025-12-02 12:40:14.399
1690	https://platina.vtcrm.ru/uploads/Photos/842/phpcTdSYO.jpeg	\N	\N	\N	71	\N	\N	2025-12-02 12:40:14.399
1691	https://platina.vtcrm.ru/uploads/Photos/842/phpXSkNQJ.jpeg	\N	\N	\N	71	\N	\N	2025-12-02 12:40:14.399
1692	https://platina.vtcrm.ru/uploads/Photos/842/phpVYSEl3.jpeg	\N	\N	\N	71	\N	\N	2025-12-02 12:40:14.399
1693	https://platina.vtcrm.ru/uploads/Photos/842/phpoM9m1u.jpeg	\N	\N	\N	71	\N	\N	2025-12-02 12:40:14.399
1694	https://platina.vtcrm.ru/uploads/Photos/842/phpn0lAgs.jpeg	\N	\N	\N	71	\N	\N	2025-12-02 12:40:14.399
1695	https://platina.vtcrm.ru/uploads/Photos/842/php8ttfYZ.jpeg	\N	\N	\N	71	\N	\N	2025-12-02 12:40:14.399
1696	https://platina.vtcrm.ru/uploads/Photos/842/php0m8D7b.jpeg	\N	\N	\N	71	\N	\N	2025-12-02 12:40:14.399
1697	https://platina.vtcrm.ru/uploads/Photos/842/phpxCnw54.jpeg	\N	\N	\N	71	\N	\N	2025-12-02 12:40:14.399
1698	https://platina.vtcrm.ru/uploads/Photos/842/phpAd8P7g.jpeg	\N	\N	\N	71	\N	\N	2025-12-02 12:40:14.399
1699	https://platina.vtcrm.ru/uploads/Photos/854/phpcHN70l.jpeg	\N	\N	\N	72	\N	\N	2025-12-02 12:42:29.911
1700	https://platina.vtcrm.ru/uploads/Photos/854/phpuufNws.jpeg	\N	\N	\N	72	\N	\N	2025-12-02 12:42:29.911
1701	https://platina.vtcrm.ru/uploads/Photos/854/phpFJqLyV.jpeg	\N	\N	\N	72	\N	\N	2025-12-02 12:42:29.911
1702	https://platina.vtcrm.ru/uploads/Photos/854/phpshjMRF.jpeg	\N	\N	\N	72	\N	\N	2025-12-02 12:42:29.911
1703	https://platina.vtcrm.ru/uploads/Photos/854/phpPsXNPb.jpeg	\N	\N	\N	72	\N	\N	2025-12-02 12:42:29.911
1704	https://platina.vtcrm.ru/uploads/Photos/854/phpXBl8fd.jpeg	\N	\N	\N	72	\N	\N	2025-12-02 12:42:29.911
1705	https://platina.vtcrm.ru/uploads/Photos/862/phpzcBzFn.jpeg	\N	\N	\N	73	\N	\N	2025-12-02 12:49:00.441
1706	https://platina.vtcrm.ru/uploads/Photos/862/phpHFgRQo.jpeg	\N	\N	\N	73	\N	\N	2025-12-02 12:49:00.441
1707	https://platina.vtcrm.ru/uploads/Photos/862/phphWjU9Y.jpeg	\N	\N	\N	73	\N	\N	2025-12-02 12:49:00.441
1708	https://platina.vtcrm.ru/uploads/Photos/862/phpqIpMLC.jpeg	\N	\N	\N	73	\N	\N	2025-12-02 12:49:00.441
1709	https://platina.vtcrm.ru/uploads/Photos/862/phpwjcdV7.jpeg	\N	\N	\N	73	\N	\N	2025-12-02 12:49:00.441
1710	https://platina.vtcrm.ru/uploads/Photos/862/php5WV5Z2.jpeg	\N	\N	\N	73	\N	\N	2025-12-02 12:49:00.441
1711	https://platina.vtcrm.ru/uploads/Photos/862/phpQZDh1l.jpeg	\N	\N	\N	73	\N	\N	2025-12-02 12:49:00.441
1712	https://platina.vtcrm.ru/uploads/Photos/862/phpVWzPah.jpeg	\N	\N	\N	73	\N	\N	2025-12-02 12:49:00.441
1713	https://platina.vtcrm.ru/uploads/Photos/862/phpyPkwwj.jpeg	\N	\N	\N	73	\N	\N	2025-12-02 12:49:00.441
1714	https://platina.vtcrm.ru/uploads/Photos/862/phpr4E9JX.jpeg	\N	\N	\N	73	\N	\N	2025-12-02 12:49:00.441
1715	https://platina.vtcrm.ru/uploads/Photos/862/phplq7OMc.jpeg	\N	\N	\N	73	\N	\N	2025-12-02 12:49:00.441
1716	https://platina.vtcrm.ru/uploads/Photos/862/php1pZ6LO.jpeg	\N	\N	\N	73	\N	\N	2025-12-02 12:49:00.441
1717	https://platina.vtcrm.ru/uploads/Photos/863/phpVMm6ny.jpeg	\N	\N	\N	74	\N	\N	2025-12-02 12:52:00.955
1718	https://platina.vtcrm.ru/uploads/Photos/863/phppfKBdR.jpeg	\N	\N	\N	74	\N	\N	2025-12-02 12:52:00.955
1719	https://platina.vtcrm.ru/uploads/Photos/863/phpSPAQ41.jpeg	\N	\N	\N	74	\N	\N	2025-12-02 12:52:00.955
1720	https://platina.vtcrm.ru/uploads/Photos/863/phpIyn27j.jpeg	\N	\N	\N	74	\N	\N	2025-12-02 12:52:00.955
1721	https://platina.vtcrm.ru/uploads/Photos/863/phpoGGfkE.jpeg	\N	\N	\N	74	\N	\N	2025-12-02 12:52:00.955
1722	https://platina.vtcrm.ru/uploads/Photos/863/php21paTY.jpeg	\N	\N	\N	74	\N	\N	2025-12-02 12:52:00.955
1723	https://platina.vtcrm.ru/uploads/Photos/863/phpLPqxod.jpeg	\N	\N	\N	74	\N	\N	2025-12-02 12:52:00.955
1724	https://platina.vtcrm.ru/uploads/Photos/863/phpqJY8RU.jpeg	\N	\N	\N	74	\N	\N	2025-12-02 12:52:00.955
1725	https://platina.vtcrm.ru/uploads/Photos/863/phplR5lwS.jpeg	\N	\N	\N	74	\N	\N	2025-12-02 12:52:00.955
1726	https://platina.vtcrm.ru/uploads/Photos/864/phpGkqFB2.jpeg	\N	\N	\N	75	\N	\N	2025-12-02 12:54:36.368
1727	https://platina.vtcrm.ru/uploads/Photos/864/phpc7G7O1.jpeg	\N	\N	\N	75	\N	\N	2025-12-02 12:54:36.368
1728	https://platina.vtcrm.ru/uploads/Photos/864/phpN2X2Fp.jpeg	\N	\N	\N	75	\N	\N	2025-12-02 12:54:36.368
1729	https://platina.vtcrm.ru/uploads/Photos/864/phpJb5is1.jpeg	\N	\N	\N	75	\N	\N	2025-12-02 12:54:36.368
1730	https://platina.vtcrm.ru/uploads/Photos/864/phpfrHCCk.jpeg	\N	\N	\N	75	\N	\N	2025-12-02 12:54:36.368
1731	https://platina.vtcrm.ru/uploads/Photos/864/phpjvzDZu.jpeg	\N	\N	\N	75	\N	\N	2025-12-02 12:54:36.368
1732	https://platina.vtcrm.ru/uploads/Photos/867/php0mpaBK.jpeg	\N	\N	\N	76	\N	\N	2025-12-02 12:57:09.699
1733	https://platina.vtcrm.ru/uploads/Photos/867/phpqjkw6D.jpeg	\N	\N	\N	76	\N	\N	2025-12-02 12:57:09.699
1734	https://platina.vtcrm.ru/uploads/Photos/867/phpFOZ0IH.jpeg	\N	\N	\N	76	\N	\N	2025-12-02 12:57:09.699
1735	https://platina.vtcrm.ru/uploads/Photos/867/phpLJSgDb.jpeg	\N	\N	\N	76	\N	\N	2025-12-02 12:57:09.699
1736	https://platina.vtcrm.ru/uploads/Photos/867/phptOoGxT.jpeg	\N	\N	\N	76	\N	\N	2025-12-02 12:57:09.699
1737	https://platina.vtcrm.ru/uploads/Photos/880/phpNmC8Nw.jpeg	\N	\N	\N	77	\N	\N	2025-12-02 13:00:53.344
1738	https://platina.vtcrm.ru/uploads/Photos/880/phpTBjGy7.jpeg	\N	\N	\N	77	\N	\N	2025-12-02 13:00:53.344
1739	https://platina.vtcrm.ru/uploads/Photos/880/phpcBRtlE.jpeg	\N	\N	\N	77	\N	\N	2025-12-02 13:00:53.344
1740	https://platina.vtcrm.ru/uploads/Photos/880/phpqgkBiG.jpeg	\N	\N	\N	77	\N	\N	2025-12-02 13:00:53.344
1741	https://platina.vtcrm.ru/uploads/Photos/880/phpVBv7Su.jpeg	\N	\N	\N	77	\N	\N	2025-12-02 13:00:53.344
1742	https://platina.vtcrm.ru/uploads/Photos/880/phpRnnRLE.jpeg	\N	\N	\N	77	\N	\N	2025-12-02 13:00:53.344
1743	https://platina.vtcrm.ru/uploads/Photos/880/phpgP4NNl.jpeg	\N	\N	\N	77	\N	\N	2025-12-02 13:00:53.344
1744	https://platina.vtcrm.ru/uploads/Photos/880/php5wPwBz.jpeg	\N	\N	\N	77	\N	\N	2025-12-02 13:00:53.344
1745	https://platina.vtcrm.ru/uploads/Photos/880/phpsKLL0Q.jpeg	\N	\N	\N	77	\N	\N	2025-12-02 13:00:53.344
1746	https://platina.vtcrm.ru/uploads/Photos/880/php02xxmB.jpeg	\N	\N	\N	77	\N	\N	2025-12-02 13:00:53.344
1747	https://platina.vtcrm.ru/uploads/Photos/880/phpPjmLW5.jpeg	\N	\N	\N	77	\N	\N	2025-12-02 13:00:53.344
1748	https://platina.vtcrm.ru/uploads/Photos/880/phpAvU0D1.jpeg	\N	\N	\N	77	\N	\N	2025-12-02 13:00:53.344
1749	https://platina.vtcrm.ru/uploads/Photos/881/phpy5GBVW.jpeg	\N	\N	\N	78	\N	\N	2025-12-02 13:04:22.143
1750	https://platina.vtcrm.ru/uploads/Photos/881/phpOKMsF7.jpeg	\N	\N	\N	78	\N	\N	2025-12-02 13:04:22.143
1751	https://platina.vtcrm.ru/uploads/Photos/881/phpVea2Sd.jpeg	\N	\N	\N	78	\N	\N	2025-12-02 13:04:22.143
1752	https://platina.vtcrm.ru/uploads/Photos/881/phpfDml5b.jpeg	\N	\N	\N	78	\N	\N	2025-12-02 13:04:22.143
1753	https://platina.vtcrm.ru/uploads/Photos/881/phpuTTiJ2.jpeg	\N	\N	\N	78	\N	\N	2025-12-02 13:04:22.143
1754	https://platina.vtcrm.ru/uploads/Photos/881/phpGtuk7S.jpeg	\N	\N	\N	78	\N	\N	2025-12-02 13:04:22.143
1755	https://platina.vtcrm.ru/uploads/Photos/881/phpa7OyYj.jpeg	\N	\N	\N	78	\N	\N	2025-12-02 13:04:22.143
1756	https://platina.vtcrm.ru/uploads/Photos/881/phpdJd4Xl.jpeg	\N	\N	\N	78	\N	\N	2025-12-02 13:04:22.143
1757	https://platina.vtcrm.ru/uploads/Photos/882/phpVtTfWI.jpeg	\N	\N	\N	79	\N	\N	2025-12-02 13:07:02.539
1758	https://platina.vtcrm.ru/uploads/Photos/882/phpWvY2wH.jpeg	\N	\N	\N	79	\N	\N	2025-12-02 13:07:02.539
1759	https://platina.vtcrm.ru/uploads/Photos/882/phpby5oJW.jpeg	\N	\N	\N	79	\N	\N	2025-12-02 13:07:02.539
1760	https://platina.vtcrm.ru/uploads/Photos/882/php62eVhm.jpeg	\N	\N	\N	79	\N	\N	2025-12-02 13:07:02.539
1761	https://platina.vtcrm.ru/uploads/Photos/882/php0SuJ8p.jpeg	\N	\N	\N	79	\N	\N	2025-12-02 13:07:02.539
1762	https://platina.vtcrm.ru/uploads/Photos/882/phpANYDpE.jpeg	\N	\N	\N	79	\N	\N	2025-12-02 13:07:02.539
1763	https://platina.vtcrm.ru/uploads/Photos/882/phpB02XkL.jpeg	\N	\N	\N	79	\N	\N	2025-12-02 13:07:02.539
1764	https://platina.vtcrm.ru/uploads/Photos/890/php7TEnX9.jpeg	\N	\N	\N	80	\N	\N	2025-12-02 13:09:46.823
1765	https://platina.vtcrm.ru/uploads/Photos/890/phpyWIuH1.jpeg	\N	\N	\N	80	\N	\N	2025-12-02 13:09:46.823
1766	https://platina.vtcrm.ru/uploads/Photos/890/phpemz5HR.jpeg	\N	\N	\N	80	\N	\N	2025-12-02 13:09:46.823
1767	https://platina.vtcrm.ru/uploads/Photos/890/php3zHMfJ.jpeg	\N	\N	\N	80	\N	\N	2025-12-02 13:09:46.823
1768	https://platina.vtcrm.ru/uploads/Photos/890/phpqQzD9L.jpeg	\N	\N	\N	80	\N	\N	2025-12-02 13:09:46.823
1769	https://platina.vtcrm.ru/uploads/Photos/890/php4ScDS1.jpeg	\N	\N	\N	80	\N	\N	2025-12-02 13:09:46.823
1770	https://platina.vtcrm.ru/uploads/Photos/890/phpVp8Qax.jpeg	\N	\N	\N	80	\N	\N	2025-12-02 13:09:46.823
1771	https://platina.vtcrm.ru/uploads/Photos/890/phpaWtF4R.jpeg	\N	\N	\N	80	\N	\N	2025-12-02 13:09:46.823
1772	https://platina.vtcrm.ru/uploads/Photos/894/phptItrxm.jpeg	\N	\N	\N	81	\N	\N	2025-12-02 13:18:59.119
1773	https://platina.vtcrm.ru/uploads/Photos/894/php9WBUv9.jpeg	\N	\N	\N	81	\N	\N	2025-12-02 13:18:59.119
1774	https://platina.vtcrm.ru/uploads/Photos/894/phpg508hm.jpeg	\N	\N	\N	81	\N	\N	2025-12-02 13:18:59.119
1775	https://platina.vtcrm.ru/uploads/Photos/894/phpDIPyOK.jpeg	\N	\N	\N	81	\N	\N	2025-12-02 13:18:59.119
1776	https://platina.vtcrm.ru/uploads/Photos/895/phpOqASYw.jpeg	\N	\N	\N	82	\N	\N	2025-12-02 13:27:17.504
1777	https://platina.vtcrm.ru/uploads/Photos/895/phpUlext1.jpeg	\N	\N	\N	82	\N	\N	2025-12-02 13:27:17.504
1778	https://platina.vtcrm.ru/uploads/Photos/895/phpFMBqtm.jpeg	\N	\N	\N	82	\N	\N	2025-12-02 13:27:17.504
1779	https://platina.vtcrm.ru/uploads/Photos/895/phpvIf1yR.jpeg	\N	\N	\N	82	\N	\N	2025-12-02 13:27:17.504
1780	https://platina.vtcrm.ru/uploads/Photos/895/phpmIJu55.jpeg	\N	\N	\N	82	\N	\N	2025-12-02 13:27:17.504
1781	https://platina.vtcrm.ru/uploads/Photos/895/phpN4j0x1.jpeg	\N	\N	\N	82	\N	\N	2025-12-02 13:27:17.504
1782	https://platina.vtcrm.ru/uploads/Photos/895/phpd3KOZl.jpeg	\N	\N	\N	82	\N	\N	2025-12-02 13:27:17.504
1783	https://platina.vtcrm.ru/uploads/Photos/895/phpBSDniV.jpeg	\N	\N	\N	82	\N	\N	2025-12-02 13:27:17.504
1784	https://platina.vtcrm.ru/uploads/Photos/895/phpg62m2I.jpeg	\N	\N	\N	82	\N	\N	2025-12-02 13:27:17.504
1785	https://platina.vtcrm.ru/uploads/Photos/895/phpXVP8A6.jpeg	\N	\N	\N	82	\N	\N	2025-12-02 13:27:17.504
1786	https://platina.vtcrm.ru/uploads/Photos/895/phpYzJNUc.jpeg	\N	\N	\N	82	\N	\N	2025-12-02 13:27:17.504
1787	https://platina.vtcrm.ru/uploads/Photos/898/phpPjfbYj.jpeg	\N	\N	\N	83	\N	\N	2025-12-02 13:29:14.632
1788	https://platina.vtcrm.ru/uploads/Photos/898/php40AXtz.jpeg	\N	\N	\N	83	\N	\N	2025-12-02 13:29:14.632
1789	https://platina.vtcrm.ru/uploads/Photos/898/phpOFaklV.jpeg	\N	\N	\N	83	\N	\N	2025-12-02 13:29:14.632
1790	https://platina.vtcrm.ru/uploads/Photos/898/phpprOqmN.jpeg	\N	\N	\N	83	\N	\N	2025-12-02 13:29:14.632
1791	https://platina.vtcrm.ru/uploads/Photos/898/phpPZrdmP.jpeg	\N	\N	\N	83	\N	\N	2025-12-02 13:29:14.632
1792	https://platina.vtcrm.ru/uploads/Photos/900/phpFIUNIy.jpeg	\N	\N	\N	84	\N	\N	2025-12-02 13:32:00.941
1793	https://platina.vtcrm.ru/uploads/Photos/900/phph6aqRG.jpeg	\N	\N	\N	84	\N	\N	2025-12-02 13:32:00.941
1794	https://platina.vtcrm.ru/uploads/Photos/900/phpvLUgr4.jpeg	\N	\N	\N	84	\N	\N	2025-12-02 13:32:00.941
1795	https://platina.vtcrm.ru/uploads/Photos/900/phph0eb04.jpeg	\N	\N	\N	84	\N	\N	2025-12-02 13:32:00.941
1796	https://platina.vtcrm.ru/uploads/Photos/900/phpvbf8Iv.jpeg	\N	\N	\N	84	\N	\N	2025-12-02 13:32:00.941
1797	https://platina.vtcrm.ru/uploads/Photos/900/phpsA70vb.jpeg	\N	\N	\N	84	\N	\N	2025-12-02 13:32:00.941
1798	https://platina.vtcrm.ru/uploads/Photos/907/phpswvyVO.jpeg	\N	\N	\N	85	\N	\N	2025-12-02 13:34:07.547
1799	https://platina.vtcrm.ru/uploads/Photos/907/php4vZhN7.jpeg	\N	\N	\N	85	\N	\N	2025-12-02 13:34:07.547
1800	https://platina.vtcrm.ru/uploads/Photos/907/phpxHhxY5.jpeg	\N	\N	\N	85	\N	\N	2025-12-02 13:34:07.547
1801	https://platina.vtcrm.ru/uploads/Photos/907/phpmiPaLe.jpeg	\N	\N	\N	85	\N	\N	2025-12-02 13:34:07.547
1802	https://platina.vtcrm.ru/uploads/Photos/907/php5EFXYU.jpeg	\N	\N	\N	85	\N	\N	2025-12-02 13:34:07.547
1803	https://platina.vtcrm.ru/uploads/Photos/907/phphtw9sr.jpeg	\N	\N	\N	85	\N	\N	2025-12-02 13:34:07.547
1804	https://platina.vtcrm.ru/uploads/Photos/907/phpO0fgq7.jpeg	\N	\N	\N	85	\N	\N	2025-12-02 13:34:07.547
1805	https://platina.vtcrm.ru/uploads/Photos/908/phpTuJDlq.jpeg	\N	\N	\N	86	\N	\N	2025-12-02 13:36:55.846
1806	https://platina.vtcrm.ru/uploads/Photos/908/phpFBVTgw.jpeg	\N	\N	\N	86	\N	\N	2025-12-02 13:36:55.846
1807	https://platina.vtcrm.ru/uploads/Photos/908/phprbfO0y.jpeg	\N	\N	\N	86	\N	\N	2025-12-02 13:36:55.846
1808	https://platina.vtcrm.ru/uploads/Photos/908/phpJwqKNk.jpeg	\N	\N	\N	86	\N	\N	2025-12-02 13:36:55.846
1809	https://platina.vtcrm.ru/uploads/Photos/908/phpMHHprb.jpeg	\N	\N	\N	86	\N	\N	2025-12-02 13:36:55.846
1810	https://platina.vtcrm.ru/uploads/Photos/908/phpL1uQKJ.jpeg	\N	\N	\N	86	\N	\N	2025-12-02 13:36:55.846
1811	https://platina.vtcrm.ru/uploads/Photos/908/php6w3ogP.jpeg	\N	\N	\N	86	\N	\N	2025-12-02 13:36:55.846
1812	https://platina.vtcrm.ru/uploads/Photos/908/phpKztlGd.jpeg	\N	\N	\N	86	\N	\N	2025-12-02 13:36:55.846
1813	https://platina.vtcrm.ru/uploads/Photos/908/phpl1FPQd.jpeg	\N	\N	\N	86	\N	\N	2025-12-02 13:36:55.846
1814	https://platina.vtcrm.ru/uploads/Photos/908/phpNQ3T3a.jpeg	\N	\N	\N	86	\N	\N	2025-12-02 13:36:55.846
1815	https://platina.vtcrm.ru/uploads/Photos/920/phpkJzgIE.jpeg	\N	\N	\N	87	\N	\N	2025-12-02 13:39:20.967
1816	https://platina.vtcrm.ru/uploads/Photos/920/phpPFh8ap.jpeg	\N	\N	\N	87	\N	\N	2025-12-02 13:39:20.967
1817	https://platina.vtcrm.ru/uploads/Photos/920/phpowH0m4.jpeg	\N	\N	\N	87	\N	\N	2025-12-02 13:39:20.967
1818	https://platina.vtcrm.ru/uploads/Photos/920/phpgO3MRA.jpeg	\N	\N	\N	87	\N	\N	2025-12-02 13:39:20.967
1819	https://platina.vtcrm.ru/uploads/Photos/920/phpBNPdyb.jpeg	\N	\N	\N	87	\N	\N	2025-12-02 13:39:20.967
1820	https://platina.vtcrm.ru/uploads/Photos/920/php0FWBCX.jpeg	\N	\N	\N	87	\N	\N	2025-12-02 13:39:20.967
1821	https://platina.vtcrm.ru/uploads/Photos/920/phpBuofpm.jpeg	\N	\N	\N	87	\N	\N	2025-12-02 13:39:20.967
1822	https://platina.vtcrm.ru/uploads/Photos/920/phpnTuhYX.jpeg	\N	\N	\N	87	\N	\N	2025-12-02 13:39:20.967
1823	https://platina.vtcrm.ru/uploads/Photos/939/php7dsyTN.jpeg	\N	\N	\N	88	\N	\N	2025-12-02 13:42:13.168
1824	https://platina.vtcrm.ru/uploads/Photos/939/php3km1Km.jpeg	\N	\N	\N	88	\N	\N	2025-12-02 13:42:13.168
1825	https://platina.vtcrm.ru/uploads/Photos/939/phpuetoee.jpeg	\N	\N	\N	88	\N	\N	2025-12-02 13:42:13.168
1826	https://platina.vtcrm.ru/uploads/Photos/939/phpC1aHSi.jpeg	\N	\N	\N	88	\N	\N	2025-12-02 13:42:13.168
1827	https://platina.vtcrm.ru/uploads/Photos/939/phpaA5KuX.jpeg	\N	\N	\N	88	\N	\N	2025-12-02 13:42:13.168
1828	https://platina.vtcrm.ru/uploads/Photos/939/phpcOFTy3.jpeg	\N	\N	\N	88	\N	\N	2025-12-02 13:42:13.168
1829	https://platina.vtcrm.ru/uploads/Photos/939/phpcH4oBv.jpeg	\N	\N	\N	88	\N	\N	2025-12-02 13:42:13.168
1830	https://platina.vtcrm.ru/uploads/Photos/939/phpSICj0A.jpeg	\N	\N	\N	88	\N	\N	2025-12-02 13:42:13.168
1831	https://platina.vtcrm.ru/uploads/Photos/939/phpwiCtbX.jpeg	\N	\N	\N	88	\N	\N	2025-12-02 13:42:13.168
1832	https://platina.vtcrm.ru/uploads/Photos/939/phpeIuWYj.jpeg	\N	\N	\N	88	\N	\N	2025-12-02 13:42:13.168
1833	https://platina.vtcrm.ru/uploads/Photos/939/phpcOWNfU.jpeg	\N	\N	\N	88	\N	\N	2025-12-02 13:42:13.168
1834	https://platina.vtcrm.ru/uploads/Photos/941/phpKJznqu.jpeg	\N	\N	\N	89	\N	\N	2025-12-02 13:44:48.351
1835	https://platina.vtcrm.ru/uploads/Photos/941/phpNYrAig.jpeg	\N	\N	\N	89	\N	\N	2025-12-02 13:44:48.351
1836	https://platina.vtcrm.ru/uploads/Photos/941/phpZortz3.jpeg	\N	\N	\N	89	\N	\N	2025-12-02 13:44:48.351
1837	https://platina.vtcrm.ru/uploads/Photos/941/phpAp44sE.jpeg	\N	\N	\N	89	\N	\N	2025-12-02 13:44:48.351
1838	https://platina.vtcrm.ru/uploads/Photos/941/phpovQOgo.jpeg	\N	\N	\N	89	\N	\N	2025-12-02 13:44:48.351
1839	https://platina.vtcrm.ru/uploads/Photos/941/phpkHnjjC.jpeg	\N	\N	\N	89	\N	\N	2025-12-02 13:44:48.351
1840	https://platina.vtcrm.ru/uploads/Photos/941/phpoQxSML.jpeg	\N	\N	\N	89	\N	\N	2025-12-02 13:44:48.351
1841	https://platina.vtcrm.ru/uploads/Photos/941/phpibCqY5.jpeg	\N	\N	\N	89	\N	\N	2025-12-02 13:44:48.351
1842	https://platina.vtcrm.ru/uploads/Photos/941/phpDkp72u.jpeg	\N	\N	\N	89	\N	\N	2025-12-02 13:44:48.351
1843	https://platina.vtcrm.ru/uploads/Photos/946/php6A1kyJ.jpeg	\N	\N	\N	90	\N	\N	2025-12-02 13:47:08.432
1844	https://platina.vtcrm.ru/uploads/Photos/946/phpRoVzy5.jpeg	\N	\N	\N	90	\N	\N	2025-12-02 13:47:08.432
1845	https://platina.vtcrm.ru/uploads/Photos/946/phpE5GVPa.jpeg	\N	\N	\N	90	\N	\N	2025-12-02 13:47:08.432
1846	https://platina.vtcrm.ru/uploads/Photos/946/phpI2ZZCs.jpeg	\N	\N	\N	90	\N	\N	2025-12-02 13:47:08.432
1847	https://platina.vtcrm.ru/uploads/Photos/946/phpZO5qB7.jpeg	\N	\N	\N	90	\N	\N	2025-12-02 13:47:08.432
1848	https://platina.vtcrm.ru/uploads/Photos/947/phpT0x6dr.jpeg	\N	\N	\N	91	\N	\N	2025-12-03 11:30:39.675
1849	https://platina.vtcrm.ru/uploads/Photos/947/phpVOk8Rl.jpeg	\N	\N	\N	91	\N	\N	2025-12-03 11:30:39.675
1850	https://platina.vtcrm.ru/uploads/Photos/947/phpH1zqlE.jpeg	\N	\N	\N	91	\N	\N	2025-12-03 11:30:39.675
1851	https://platina.vtcrm.ru/uploads/Photos/947/phpgHBw2u.jpeg	\N	\N	\N	91	\N	\N	2025-12-03 11:30:39.675
1852	https://platina.vtcrm.ru/uploads/Photos/947/phpIFyh0z.jpeg	\N	\N	\N	91	\N	\N	2025-12-03 11:30:39.675
1853	https://platina.vtcrm.ru/uploads/Photos/947/phpy9r0ba.jpeg	\N	\N	\N	91	\N	\N	2025-12-03 11:30:39.675
1854	https://platina.vtcrm.ru/uploads/Photos/947/php3njiGv.jpeg	\N	\N	\N	91	\N	\N	2025-12-03 11:30:39.675
1855	https://platina.vtcrm.ru/uploads/Photos/958/phpVzD5ev.jpeg	\N	\N	\N	92	\N	\N	2025-12-03 11:35:53.333
1856	https://platina.vtcrm.ru/uploads/Photos/958/phpugXq0X.jpeg	\N	\N	\N	92	\N	\N	2025-12-03 11:35:53.333
1857	https://platina.vtcrm.ru/uploads/Photos/958/phpeHQIPh.jpeg	\N	\N	\N	92	\N	\N	2025-12-03 11:35:53.333
1858	https://platina.vtcrm.ru/uploads/Photos/958/phpmeABpg.jpeg	\N	\N	\N	92	\N	\N	2025-12-03 11:35:53.333
1859	https://platina.vtcrm.ru/uploads/Photos/958/php4krCGc.jpeg	\N	\N	\N	92	\N	\N	2025-12-03 11:35:53.333
1860	https://platina.vtcrm.ru/uploads/Photos/958/phpxNoovH.jpeg	\N	\N	\N	92	\N	\N	2025-12-03 11:35:53.333
1861	https://platina.vtcrm.ru/uploads/Photos/958/phpSEAoWc.jpeg	\N	\N	\N	92	\N	\N	2025-12-03 11:35:53.333
1862	https://platina.vtcrm.ru/uploads/Photos/958/phpHHd22h.jpeg	\N	\N	\N	92	\N	\N	2025-12-03 11:35:53.333
1863	https://platina.vtcrm.ru/uploads/Photos/958/phpxDlvxJ.jpeg	\N	\N	\N	92	\N	\N	2025-12-03 11:35:53.333
1864	https://platina.vtcrm.ru/uploads/Photos/958/phpm0om4w.jpeg	\N	\N	\N	92	\N	\N	2025-12-03 11:35:53.333
1865	https://platina.vtcrm.ru/uploads/Photos/958/php2nBlcX.jpeg	\N	\N	\N	92	\N	\N	2025-12-03 11:35:53.333
1866	https://platina.vtcrm.ru/uploads/Photos/958/phpGC0Oau.jpeg	\N	\N	\N	92	\N	\N	2025-12-03 11:35:53.333
1867	https://platina.vtcrm.ru/uploads/Photos/958/phpTwPkP5.jpeg	\N	\N	\N	92	\N	\N	2025-12-03 11:35:53.333
1868	https://platina.vtcrm.ru/uploads/Photos/958/phpN8qaa2.jpeg	\N	\N	\N	92	\N	\N	2025-12-03 11:35:53.333
1869	https://platina.vtcrm.ru/uploads/Photos/958/phpCd3jN3.jpeg	\N	\N	\N	92	\N	\N	2025-12-03 11:35:53.333
1870	https://platina.vtcrm.ru/uploads/Photos/958/php5KeFNs.jpeg	\N	\N	\N	92	\N	\N	2025-12-03 11:35:53.333
1871	https://platina.vtcrm.ru/uploads/Photos/958/phpFjKN1V.jpeg	\N	\N	\N	92	\N	\N	2025-12-03 11:35:53.333
1872	https://platina.vtcrm.ru/uploads/Photos/958/phphP3r9X.jpeg	\N	\N	\N	92	\N	\N	2025-12-03 11:35:53.333
1873	https://platina.vtcrm.ru/uploads/Photos/958/php1qmWRQ.jpeg	\N	\N	\N	92	\N	\N	2025-12-03 11:35:53.333
1874	https://platina.vtcrm.ru/uploads/Photos/958/phpbHV3uB.jpeg	\N	\N	\N	92	\N	\N	2025-12-03 11:35:53.333
1875	https://platina.vtcrm.ru/uploads/Photos/958/phpqZNQry.jpeg	\N	\N	\N	92	\N	\N	2025-12-03 11:35:53.333
1876	https://platina.vtcrm.ru/uploads/Photos/958/phpzVCbnh.jpeg	\N	\N	\N	92	\N	\N	2025-12-03 11:35:53.333
1877	https://platina.vtcrm.ru/uploads/Photos/958/phpxgl8No.jpeg	\N	\N	\N	92	\N	\N	2025-12-03 11:35:53.333
1878	https://platina.vtcrm.ru/uploads/Photos/963/phpt8xkDv.jpeg	\N	\N	\N	93	\N	\N	2025-12-03 11:39:55.241
1879	https://platina.vtcrm.ru/uploads/Photos/963/phpUyxavi.jpeg	\N	\N	\N	93	\N	\N	2025-12-03 11:39:55.241
1880	https://platina.vtcrm.ru/uploads/Photos/963/phpS6MUZX.jpeg	\N	\N	\N	93	\N	\N	2025-12-03 11:39:55.241
1881	https://platina.vtcrm.ru/uploads/Photos/963/phptzG4H9.jpeg	\N	\N	\N	93	\N	\N	2025-12-03 11:39:55.241
1882	https://platina.vtcrm.ru/uploads/Photos/963/phpRrEEmX.jpeg	\N	\N	\N	93	\N	\N	2025-12-03 11:39:55.241
1883	https://platina.vtcrm.ru/uploads/Photos/963/phpyosruK.jpeg	\N	\N	\N	93	\N	\N	2025-12-03 11:39:55.241
1884	https://platina.vtcrm.ru/uploads/Photos/963/phpq9x5HA.jpeg	\N	\N	\N	93	\N	\N	2025-12-03 11:39:55.241
1885	https://platina.vtcrm.ru/uploads/Photos/963/phpoyxFbg.jpeg	\N	\N	\N	93	\N	\N	2025-12-03 11:39:55.241
1886	https://platina.vtcrm.ru/uploads/Photos/964/phphfMmvO.jpeg	\N	\N	\N	94	\N	\N	2025-12-03 11:42:37.66
1887	https://platina.vtcrm.ru/uploads/Photos/964/phpGujLxj.jpeg	\N	\N	\N	94	\N	\N	2025-12-03 11:42:37.66
1888	https://platina.vtcrm.ru/uploads/Photos/964/phpNyqSlG.jpeg	\N	\N	\N	94	\N	\N	2025-12-03 11:42:37.66
1889	https://platina.vtcrm.ru/uploads/Photos/964/phpTNaLXx.jpeg	\N	\N	\N	94	\N	\N	2025-12-03 11:42:37.66
1890	https://platina.vtcrm.ru/uploads/Photos/964/phpziTxQO.jpeg	\N	\N	\N	94	\N	\N	2025-12-03 11:42:37.66
1891	https://platina.vtcrm.ru/uploads/Photos/964/phpfKHLCe.jpeg	\N	\N	\N	94	\N	\N	2025-12-03 11:42:37.66
1892	https://platina.vtcrm.ru/uploads/Photos/964/phpEGNLQ4.jpeg	\N	\N	\N	94	\N	\N	2025-12-03 11:42:37.66
1893	https://platina.vtcrm.ru/uploads/Photos/964/phpLuje53.jpeg	\N	\N	\N	94	\N	\N	2025-12-03 11:42:37.66
1894	https://platina.vtcrm.ru/uploads/Photos/964/phpoCBTgE.jpeg	\N	\N	\N	94	\N	\N	2025-12-03 11:42:37.66
1895	https://platina.vtcrm.ru/uploads/Photos/966/phpPvCXM0.jpeg	\N	\N	\N	95	\N	\N	2025-12-03 11:44:33.811
1896	https://platina.vtcrm.ru/uploads/Photos/966/phpnA7ABb.jpeg	\N	\N	\N	95	\N	\N	2025-12-03 11:44:33.811
1897	https://platina.vtcrm.ru/uploads/Photos/966/phpaHbjb3.jpeg	\N	\N	\N	95	\N	\N	2025-12-03 11:44:33.811
1898	https://platina.vtcrm.ru/uploads/Photos/966/phpNRycV8.jpeg	\N	\N	\N	95	\N	\N	2025-12-03 11:44:33.811
1899	https://platina.vtcrm.ru/uploads/Photos/966/php5iLLvE.jpeg	\N	\N	\N	95	\N	\N	2025-12-03 11:44:33.811
1900	https://platina.vtcrm.ru/uploads/Photos/967/phpyyzUax.jpeg	\N	\N	\N	96	\N	\N	2025-12-03 11:47:17.304
1901	https://platina.vtcrm.ru/uploads/Photos/967/phpnQElMP.jpeg	\N	\N	\N	96	\N	\N	2025-12-03 11:47:17.304
1902	https://platina.vtcrm.ru/uploads/Photos/967/phpRRfEug.jpeg	\N	\N	\N	96	\N	\N	2025-12-03 11:47:17.304
1903	https://platina.vtcrm.ru/uploads/Photos/967/phpIIHt93.jpeg	\N	\N	\N	96	\N	\N	2025-12-03 11:47:17.304
1904	https://platina.vtcrm.ru/uploads/Photos/967/phpsDzJ7I.jpeg	\N	\N	\N	96	\N	\N	2025-12-03 11:47:17.304
1905	https://platina.vtcrm.ru/uploads/Photos/967/phpqqT6RO.jpeg	\N	\N	\N	96	\N	\N	2025-12-03 11:47:17.304
1906	https://platina.vtcrm.ru/uploads/Photos/967/phpNRfrU3.jpeg	\N	\N	\N	96	\N	\N	2025-12-03 11:47:17.304
1907	https://platina.vtcrm.ru/uploads/Photos/967/phpbYJ5EQ.jpeg	\N	\N	\N	96	\N	\N	2025-12-03 11:47:17.304
1908	https://platina.vtcrm.ru/uploads/Photos/967/php2I3LQU.jpeg	\N	\N	\N	96	\N	\N	2025-12-03 11:47:17.304
1909	https://platina.vtcrm.ru/uploads/Photos/967/phpT3uSwG.jpeg	\N	\N	\N	96	\N	\N	2025-12-03 11:47:17.304
1910	https://platina.vtcrm.ru/uploads/Photos/967/phpPWtqj1.jpeg	\N	\N	\N	96	\N	\N	2025-12-03 11:47:17.304
1911	https://platina.vtcrm.ru/uploads/Photos/967/phpQif5h4.jpeg	\N	\N	\N	96	\N	\N	2025-12-03 11:47:17.304
1912	https://platina.vtcrm.ru/uploads/Photos/967/phpQDhpQg.jpeg	\N	\N	\N	96	\N	\N	2025-12-03 11:47:17.304
1913	https://platina.vtcrm.ru/uploads/Photos/968/phpeJuTAP.jpeg	\N	\N	\N	97	\N	\N	2025-12-03 11:49:34.585
1914	https://platina.vtcrm.ru/uploads/Photos/968/php6NJD3P.jpeg	\N	\N	\N	97	\N	\N	2025-12-03 11:49:34.585
1915	https://platina.vtcrm.ru/uploads/Photos/968/phpK4pdbM.jpeg	\N	\N	\N	97	\N	\N	2025-12-03 11:49:34.585
1916	https://platina.vtcrm.ru/uploads/Photos/968/phpmiTqtY.jpeg	\N	\N	\N	97	\N	\N	2025-12-03 11:49:34.585
1917	https://platina.vtcrm.ru/uploads/Photos/968/phpTHqZhD.jpeg	\N	\N	\N	97	\N	\N	2025-12-03 11:49:34.585
1918	https://platina.vtcrm.ru/uploads/Photos/968/php1tNjYC.jpeg	\N	\N	\N	97	\N	\N	2025-12-03 11:49:34.585
1919	https://platina.vtcrm.ru/uploads/Photos/980/phpIhsTbc.jpeg	\N	\N	\N	98	\N	\N	2025-12-03 11:52:31.964
1920	https://platina.vtcrm.ru/uploads/Photos/980/phpSzvwPM.jpeg	\N	\N	\N	98	\N	\N	2025-12-03 11:52:31.964
1921	https://platina.vtcrm.ru/uploads/Photos/980/phpSwz1aX.jpeg	\N	\N	\N	98	\N	\N	2025-12-03 11:52:31.964
1922	https://platina.vtcrm.ru/uploads/Photos/980/phpaL3kmz.jpeg	\N	\N	\N	98	\N	\N	2025-12-03 11:52:31.964
1923	https://platina.vtcrm.ru/uploads/Photos/980/phpp3NMB7.jpeg	\N	\N	\N	98	\N	\N	2025-12-03 11:52:31.964
1924	https://platina.vtcrm.ru/uploads/Photos/980/phpkZG810.jpeg	\N	\N	\N	98	\N	\N	2025-12-03 11:52:31.964
1925	https://platina.vtcrm.ru/uploads/Photos/980/phpKnX2ub.jpeg	\N	\N	\N	98	\N	\N	2025-12-03 11:52:31.964
1926	https://platina.vtcrm.ru/uploads/Photos/980/phpQcZpW9.jpeg	\N	\N	\N	98	\N	\N	2025-12-03 11:52:31.964
1927	https://platina.vtcrm.ru/uploads/Photos/981/phpHyBxAy.jpeg	\N	\N	\N	99	\N	\N	2025-12-03 11:55:14.91
1928	https://platina.vtcrm.ru/uploads/Photos/981/phpfAsool.jpeg	\N	\N	\N	99	\N	\N	2025-12-03 11:55:14.91
1929	https://platina.vtcrm.ru/uploads/Photos/981/phpRjOT74.jpeg	\N	\N	\N	99	\N	\N	2025-12-03 11:55:14.91
1930	https://platina.vtcrm.ru/uploads/Photos/981/phpvQSnY4.jpeg	\N	\N	\N	99	\N	\N	2025-12-03 11:55:14.91
1931	https://platina.vtcrm.ru/uploads/Photos/981/phpp4OmUJ.jpeg	\N	\N	\N	99	\N	\N	2025-12-03 11:55:14.91
1932	https://platina.vtcrm.ru/uploads/Photos/981/phpi4Q3SO.jpeg	\N	\N	\N	99	\N	\N	2025-12-03 11:55:14.91
1933	https://platina.vtcrm.ru/uploads/Photos/981/12fdb25f-5e24-4045-9d06-eadf2baee839.jpeg	\N	\N	\N	99	\N	\N	2025-12-03 11:55:14.91
1934	https://platina.vtcrm.ru/uploads/Photos/981/phpXLFeRc.jpeg	\N	\N	\N	99	\N	\N	2025-12-03 11:55:14.91
1935	https://platina.vtcrm.ru/uploads/Photos/981/099448a2-7150-4398-83dd-02e4c505ed19.jpeg	\N	\N	\N	99	\N	\N	2025-12-03 11:55:14.91
1936	https://platina.vtcrm.ru/uploads/Photos/981/phpJTFteF.jpeg	\N	\N	\N	99	\N	\N	2025-12-03 11:55:14.91
1937	https://platina.vtcrm.ru/uploads/Photos/989/phpSUvtZC.jpeg	\N	\N	\N	100	\N	\N	2025-12-03 11:58:26.936
1938	https://platina.vtcrm.ru/uploads/Photos/989/php7QuyEB.jpeg	\N	\N	\N	100	\N	\N	2025-12-03 11:58:26.936
1939	https://platina.vtcrm.ru/uploads/Photos/989/phpF4aUTk.jpeg	\N	\N	\N	100	\N	\N	2025-12-03 11:58:26.936
1940	https://platina.vtcrm.ru/uploads/Photos/989/php1yyOmE.jpeg	\N	\N	\N	100	\N	\N	2025-12-03 11:58:26.936
1941	https://platina.vtcrm.ru/uploads/Photos/989/phpwbZfpJ.jpeg	\N	\N	\N	100	\N	\N	2025-12-03 11:58:26.936
1942	https://platina.vtcrm.ru/uploads/Photos/989/phpY610KG.jpeg	\N	\N	\N	100	\N	\N	2025-12-03 11:58:26.936
1943	https://platina.vtcrm.ru/uploads/Photos/989/phpi2SWzi.jpeg	\N	\N	\N	100	\N	\N	2025-12-03 11:58:26.936
1944	https://platina.vtcrm.ru/uploads/Photos/989/php40ouP8.jpeg	\N	\N	\N	100	\N	\N	2025-12-03 11:58:26.936
1945	https://platina.vtcrm.ru/uploads/Photos/989/phpjPcXHV.jpeg	\N	\N	\N	100	\N	\N	2025-12-03 11:58:26.936
1946	https://platina.vtcrm.ru/uploads/Photos/989/phpJor07W.jpeg	\N	\N	\N	100	\N	\N	2025-12-03 11:58:26.936
1947	https://platina.vtcrm.ru/uploads/Photos/989/phpVKtfJp.jpeg	\N	\N	\N	100	\N	\N	2025-12-03 11:58:26.936
1948	https://platina.vtcrm.ru/uploads/Photos/989/php5KPyU9.jpeg	\N	\N	\N	100	\N	\N	2025-12-03 11:58:26.936
1949	https://platina.vtcrm.ru/uploads/Photos/991/phpdJDQmI.jpeg	\N	\N	\N	101	\N	\N	2025-12-03 12:10:38.024
1950	https://platina.vtcrm.ru/uploads/Photos/991/phpxEu8wQ.jpeg	\N	\N	\N	101	\N	\N	2025-12-03 12:10:38.024
1951	https://platina.vtcrm.ru/uploads/Photos/991/phpKvkmIu.jpeg	\N	\N	\N	101	\N	\N	2025-12-03 12:10:38.024
1952	https://platina.vtcrm.ru/uploads/Photos/991/phpJ3Hnw9.jpeg	\N	\N	\N	101	\N	\N	2025-12-03 12:10:38.024
1953	https://platina.vtcrm.ru/uploads/Photos/991/phpnWH0b5.jpeg	\N	\N	\N	101	\N	\N	2025-12-03 12:10:38.024
1954	https://platina.vtcrm.ru/uploads/Photos/991/phpnNHJP8.jpeg	\N	\N	\N	101	\N	\N	2025-12-03 12:10:38.024
1955	https://platina.vtcrm.ru/uploads/Photos/991/php4fWcEW.jpeg	\N	\N	\N	101	\N	\N	2025-12-03 12:10:38.024
1956	https://platina.vtcrm.ru/uploads/Photos/991/phpHyardR.jpeg	\N	\N	\N	101	\N	\N	2025-12-03 12:10:38.024
1957	https://platina.vtcrm.ru/uploads/Photos/992/phpEaUVEb.jpeg	\N	\N	\N	102	\N	\N	2025-12-03 12:13:12.152
1958	https://platina.vtcrm.ru/uploads/Photos/992/php2NsEtw.jpeg	\N	\N	\N	102	\N	\N	2025-12-03 12:13:12.152
1959	https://platina.vtcrm.ru/uploads/Photos/992/phpqJk4ML.jpeg	\N	\N	\N	102	\N	\N	2025-12-03 12:13:12.152
1960	https://platina.vtcrm.ru/uploads/Photos/992/phpJv7I3w.jpeg	\N	\N	\N	102	\N	\N	2025-12-03 12:13:12.152
1961	https://platina.vtcrm.ru/uploads/Photos/992/phpT5I0qW.jpeg	\N	\N	\N	102	\N	\N	2025-12-03 12:13:12.152
1962	https://platina.vtcrm.ru/uploads/Photos/992/php2Wtfkj.jpeg	\N	\N	\N	102	\N	\N	2025-12-03 12:13:12.152
1963	https://platina.vtcrm.ru/uploads/Photos/992/phpMYpjDJ.jpeg	\N	\N	\N	102	\N	\N	2025-12-03 12:13:12.152
1964	https://platina.vtcrm.ru/uploads/Photos/1004/phppBu1wk.jpeg	\N	\N	\N	103	\N	\N	2025-12-03 12:15:20.637
1965	https://platina.vtcrm.ru/uploads/Photos/1004/phpwFbUwy.jpeg	\N	\N	\N	103	\N	\N	2025-12-03 12:15:20.637
1966	https://platina.vtcrm.ru/uploads/Photos/1004/phpZdIkuC.jpeg	\N	\N	\N	103	\N	\N	2025-12-03 12:15:20.637
1967	https://platina.vtcrm.ru/uploads/Photos/1004/phpn7iYbb.jpeg	\N	\N	\N	103	\N	\N	2025-12-03 12:15:20.637
1968	https://platina.vtcrm.ru/uploads/Photos/1004/phpxtrnsp.jpeg	\N	\N	\N	103	\N	\N	2025-12-03 12:15:20.637
1969	https://platina.vtcrm.ru/uploads/Photos/1004/phpx1Hq3N.jpeg	\N	\N	\N	103	\N	\N	2025-12-03 12:15:20.637
1970	https://platina.vtcrm.ru/uploads/Photos/1006/php04Zi6R.jpeg	\N	\N	\N	104	\N	\N	2025-12-03 12:18:05.531
1971	https://platina.vtcrm.ru/uploads/Photos/1006/phpXafQD4.jpeg	\N	\N	\N	104	\N	\N	2025-12-03 12:18:05.531
1972	https://platina.vtcrm.ru/uploads/Photos/1006/phpsqISO3.jpeg	\N	\N	\N	104	\N	\N	2025-12-03 12:18:05.531
1973	https://platina.vtcrm.ru/uploads/Photos/1006/php2klw6m.jpeg	\N	\N	\N	104	\N	\N	2025-12-03 12:18:05.531
1974	https://platina.vtcrm.ru/uploads/Photos/1006/phpTBBUZJ.jpeg	\N	\N	\N	104	\N	\N	2025-12-03 12:18:05.531
1975	https://platina.vtcrm.ru/uploads/Photos/1006/php3n5P67.jpeg	\N	\N	\N	104	\N	\N	2025-12-03 12:18:05.531
1976	https://platina.vtcrm.ru/uploads/Photos/1006/phpxX0zFb.jpeg	\N	\N	\N	104	\N	\N	2025-12-03 12:18:05.531
1977	https://platina.vtcrm.ru/uploads/Photos/1006/phpZp7rSP.jpeg	\N	\N	\N	104	\N	\N	2025-12-03 12:18:05.531
1978	https://platina.vtcrm.ru/uploads/Photos/1006/phpm25nvh.jpeg	\N	\N	\N	104	\N	\N	2025-12-03 12:18:05.531
1979	https://platina.vtcrm.ru/uploads/Photos/1006/phpfaGc7p.jpeg	\N	\N	\N	104	\N	\N	2025-12-03 12:18:05.531
1980	https://platina.vtcrm.ru/uploads/Photos/1023/phpRWUZAF.jpeg	\N	\N	\N	105	\N	\N	2025-12-03 12:21:14.42
1981	https://platina.vtcrm.ru/uploads/Photos/1023/phphT72kK.jpeg	\N	\N	\N	105	\N	\N	2025-12-03 12:21:14.42
1982	https://platina.vtcrm.ru/uploads/Photos/1023/phpvlq1rI.jpeg	\N	\N	\N	105	\N	\N	2025-12-03 12:21:14.42
1983	https://platina.vtcrm.ru/uploads/Photos/1023/phpMLS8rb.jpeg	\N	\N	\N	105	\N	\N	2025-12-03 12:21:14.42
1984	https://platina.vtcrm.ru/uploads/Photos/1023/php5uoAI3.jpeg	\N	\N	\N	105	\N	\N	2025-12-03 12:21:14.42
1985	https://platina.vtcrm.ru/uploads/Photos/1023/phpKJvwyD.jpeg	\N	\N	\N	105	\N	\N	2025-12-03 12:21:14.42
1986	https://platina.vtcrm.ru/uploads/Photos/1023/phpTsj1Ix.jpeg	\N	\N	\N	105	\N	\N	2025-12-03 12:21:14.42
1987	https://platina.vtcrm.ru/uploads/Photos/1023/phpZg2AoS.jpeg	\N	\N	\N	105	\N	\N	2025-12-03 12:21:14.42
1988	https://platina.vtcrm.ru/uploads/Photos/1023/phpjr8Pa9.jpeg	\N	\N	\N	105	\N	\N	2025-12-03 12:21:14.42
1989	https://platina.vtcrm.ru/uploads/Photos/1023/php9ACVUN.jpeg	\N	\N	\N	105	\N	\N	2025-12-03 12:21:14.42
1990	https://platina.vtcrm.ru/uploads/Photos/1023/phpyFsaqC.jpeg	\N	\N	\N	105	\N	\N	2025-12-03 12:21:14.42
1991	https://platina.vtcrm.ru/uploads/Photos/1023/php6j2nXD.jpeg	\N	\N	\N	105	\N	\N	2025-12-03 12:21:14.42
1992	https://platina.vtcrm.ru/uploads/Photos/1023/phpITiTo2.jpeg	\N	\N	\N	105	\N	\N	2025-12-03 12:21:14.42
1993	https://platina.vtcrm.ru/uploads/Photos/1025/phpnWubIe.jpeg	\N	\N	\N	106	\N	\N	2025-12-03 12:23:51.066
1994	https://platina.vtcrm.ru/uploads/Photos/1025/phpNtKdQB.jpeg	\N	\N	\N	106	\N	\N	2025-12-03 12:23:51.066
1995	https://platina.vtcrm.ru/uploads/Photos/1025/phpDoyQz6.jpeg	\N	\N	\N	106	\N	\N	2025-12-03 12:23:51.066
1996	https://platina.vtcrm.ru/uploads/Photos/1025/phpT2TwY4.jpeg	\N	\N	\N	106	\N	\N	2025-12-03 12:23:51.066
1997	https://platina.vtcrm.ru/uploads/Photos/1025/php2nUex8.jpeg	\N	\N	\N	106	\N	\N	2025-12-03 12:23:51.066
1998	https://platina.vtcrm.ru/uploads/Photos/1025/phpyB8fMm.jpeg	\N	\N	\N	106	\N	\N	2025-12-03 12:23:51.066
1999	https://platina.vtcrm.ru/uploads/Photos/1025/phpobPo6x.jpeg	\N	\N	\N	106	\N	\N	2025-12-03 12:23:51.066
2000	https://platina.vtcrm.ru/uploads/Photos/1026/phpmzsja0.jpeg	\N	\N	\N	107	\N	\N	2025-12-03 12:26:15.011
2001	https://platina.vtcrm.ru/uploads/Photos/1026/phpuo6EUs.jpeg	\N	\N	\N	107	\N	\N	2025-12-03 12:26:15.011
2002	https://platina.vtcrm.ru/uploads/Photos/1026/php3N76K4.jpeg	\N	\N	\N	107	\N	\N	2025-12-03 12:26:15.011
2003	https://platina.vtcrm.ru/uploads/Photos/1026/phpgkgvCu.jpeg	\N	\N	\N	107	\N	\N	2025-12-03 12:26:15.011
2004	https://platina.vtcrm.ru/uploads/Photos/1026/php7OCUPl.jpeg	\N	\N	\N	107	\N	\N	2025-12-03 12:26:15.011
2005	https://platina.vtcrm.ru/uploads/Photos/1026/phpFUlm39.jpeg	\N	\N	\N	107	\N	\N	2025-12-03 12:26:15.011
2006	https://platina.vtcrm.ru/uploads/Photos/1026/php2iM8b9.jpeg	\N	\N	\N	107	\N	\N	2025-12-03 12:26:15.011
2007	https://platina.vtcrm.ru/uploads/Photos/1027/phpzTnzvd.jpeg	\N	\N	\N	108	\N	\N	2025-12-03 12:28:39.499
2008	https://platina.vtcrm.ru/uploads/Photos/1027/phpl8wUE2.jpeg	\N	\N	\N	108	\N	\N	2025-12-03 12:28:39.499
2009	https://platina.vtcrm.ru/uploads/Photos/1027/php7DbdwX.jpeg	\N	\N	\N	108	\N	\N	2025-12-03 12:28:39.499
2010	https://platina.vtcrm.ru/uploads/Photos/1027/phpfkFopl.jpeg	\N	\N	\N	108	\N	\N	2025-12-03 12:28:39.499
2011	https://platina.vtcrm.ru/uploads/Photos/1027/phpGRYLKB.jpeg	\N	\N	\N	108	\N	\N	2025-12-03 12:28:39.499
2012	https://platina.vtcrm.ru/uploads/Photos/1027/phpPIFmqA.jpeg	\N	\N	\N	108	\N	\N	2025-12-03 12:28:39.499
2013	https://platina.vtcrm.ru/uploads/Photos/1027/phpY0zFHM.jpeg	\N	\N	\N	108	\N	\N	2025-12-03 12:28:39.499
2014	https://platina.vtcrm.ru/uploads/Photos/1027/phpzcvfat.jpeg	\N	\N	\N	108	\N	\N	2025-12-03 12:28:39.499
2015	https://platina.vtcrm.ru/uploads/Photos/1027/phpA3VDiJ.jpeg	\N	\N	\N	108	\N	\N	2025-12-03 12:28:39.499
2016	https://platina.vtcrm.ru/uploads/Photos/1034/phpmT3zpG.jpeg	\N	\N	\N	109	\N	\N	2025-12-03 12:31:01.229
2017	https://platina.vtcrm.ru/uploads/Photos/1034/phpsQetQa.jpeg	\N	\N	\N	109	\N	\N	2025-12-03 12:31:01.229
2018	https://platina.vtcrm.ru/uploads/Photos/1034/phpQFsk8d.jpeg	\N	\N	\N	109	\N	\N	2025-12-03 12:31:01.229
2019	https://platina.vtcrm.ru/uploads/Photos/1034/phpc6L2m0.jpeg	\N	\N	\N	109	\N	\N	2025-12-03 12:31:01.229
2020	https://platina.vtcrm.ru/uploads/Photos/1034/phpixl443.jpeg	\N	\N	\N	109	\N	\N	2025-12-03 12:31:01.229
2021	https://platina.vtcrm.ru/uploads/Photos/1034/php8vVwX7.jpeg	\N	\N	\N	109	\N	\N	2025-12-03 12:31:01.229
2022	https://platina.vtcrm.ru/uploads/Photos/1034/phpMXdXhs.jpeg	\N	\N	\N	109	\N	\N	2025-12-03 12:31:01.229
2023	https://platina.vtcrm.ru/uploads/Photos/1034/phpL2zCPT.jpeg	\N	\N	\N	109	\N	\N	2025-12-03 12:31:01.229
2024	https://platina.vtcrm.ru/uploads/Photos/1036/phprN1YCd.jpeg	\N	\N	\N	110	\N	\N	2025-12-03 12:33:43.066
2025	https://platina.vtcrm.ru/uploads/Photos/1036/phpqZVDIU.jpeg	\N	\N	\N	110	\N	\N	2025-12-03 12:33:43.066
2026	https://platina.vtcrm.ru/uploads/Photos/1036/phpZ1ng0W.jpeg	\N	\N	\N	110	\N	\N	2025-12-03 12:33:43.066
2027	https://platina.vtcrm.ru/uploads/Photos/1036/phpdwXNJ4.jpeg	\N	\N	\N	110	\N	\N	2025-12-03 12:33:43.066
2028	https://platina.vtcrm.ru/uploads/Photos/1036/phpEmVduc.jpeg	\N	\N	\N	110	\N	\N	2025-12-03 12:33:43.066
2029	https://platina.vtcrm.ru/uploads/Photos/1036/phpSJK8Sz.jpeg	\N	\N	\N	110	\N	\N	2025-12-03 12:33:43.066
2030	https://platina.vtcrm.ru/uploads/Photos/1036/phpUny4H8.jpeg	\N	\N	\N	110	\N	\N	2025-12-03 12:33:43.066
2031	https://platina.vtcrm.ru/uploads/Photos/1036/phpqbyICu.jpeg	\N	\N	\N	110	\N	\N	2025-12-03 12:33:43.066
2032	https://platina.vtcrm.ru/uploads/Photos/1036/phpI6B13E.jpeg	\N	\N	\N	110	\N	\N	2025-12-03 12:33:43.066
2033	https://platina.vtcrm.ru/uploads/Photos/1036/phpdjLYoY.jpeg	\N	\N	\N	110	\N	\N	2025-12-03 12:33:43.066
2034	https://platina.vtcrm.ru/uploads/Photos/1037/phpeOjcfx.jpeg	\N	\N	\N	111	\N	\N	2025-12-03 12:45:40.218
2035	https://platina.vtcrm.ru/uploads/Photos/1037/phpMpXVeD.jpeg	\N	\N	\N	111	\N	\N	2025-12-03 12:45:40.218
2036	https://platina.vtcrm.ru/uploads/Photos/1037/phpRNTJqj.jpeg	\N	\N	\N	111	\N	\N	2025-12-03 12:45:40.218
2037	https://platina.vtcrm.ru/uploads/Photos/1037/phpvFepet.jpeg	\N	\N	\N	111	\N	\N	2025-12-03 12:45:40.218
2038	https://platina.vtcrm.ru/uploads/Photos/1037/phpbxrWPl.jpeg	\N	\N	\N	111	\N	\N	2025-12-03 12:45:40.218
2039	https://platina.vtcrm.ru/uploads/Photos/1037/phpRXngbY.jpeg	\N	\N	\N	111	\N	\N	2025-12-03 12:45:40.218
2040	https://platina.vtcrm.ru/uploads/Photos/1037/php1TQLqa.jpeg	\N	\N	\N	111	\N	\N	2025-12-03 12:45:40.218
2041	https://platina.vtcrm.ru/uploads/Photos/1037/phpWqiLCI.jpeg	\N	\N	\N	111	\N	\N	2025-12-03 12:45:40.218
2042	https://platina.vtcrm.ru/uploads/Photos/1037/phpiusSIW.jpeg	\N	\N	\N	111	\N	\N	2025-12-03 12:45:40.218
2043	https://platina.vtcrm.ru/uploads/Photos/1037/phpJ9V8To.jpeg	\N	\N	\N	111	\N	\N	2025-12-03 12:45:40.218
2044	https://platina.vtcrm.ru/uploads/Photos/1037/phpv1IAwD.jpeg	\N	\N	\N	111	\N	\N	2025-12-03 12:45:40.218
2045	https://platina.vtcrm.ru/uploads/Photos/1039/phpGgsd74.jpeg	\N	\N	\N	112	\N	\N	2025-12-03 12:48:23.92
2046	https://platina.vtcrm.ru/uploads/Photos/1039/phpPiuw8R.jpeg	\N	\N	\N	112	\N	\N	2025-12-03 12:48:23.92
2047	https://platina.vtcrm.ru/uploads/Photos/1039/phpVrgj1r.jpeg	\N	\N	\N	112	\N	\N	2025-12-03 12:48:23.92
2048	https://platina.vtcrm.ru/uploads/Photos/1039/phpyBTFlJ.jpeg	\N	\N	\N	112	\N	\N	2025-12-03 12:48:23.92
2049	https://platina.vtcrm.ru/uploads/Photos/1039/phpu8ILe4.jpeg	\N	\N	\N	112	\N	\N	2025-12-03 12:48:23.92
2050	https://platina.vtcrm.ru/uploads/Photos/1039/phpB8FleO.jpeg	\N	\N	\N	112	\N	\N	2025-12-03 12:48:23.92
2051	https://platina.vtcrm.ru/uploads/Photos/1039/phpoP5qsA.jpeg	\N	\N	\N	112	\N	\N	2025-12-03 12:48:23.92
2052	https://platina.vtcrm.ru/uploads/Photos/1039/phpQs463i.jpeg	\N	\N	\N	112	\N	\N	2025-12-03 12:48:23.92
2053	https://platina.vtcrm.ru/uploads/Photos/1039/phpJVCWpY.jpeg	\N	\N	\N	112	\N	\N	2025-12-03 12:48:23.92
2054	https://platina.vtcrm.ru/uploads/Photos/1040/phpEWm6KZ.jpeg	\N	\N	\N	113	\N	\N	2025-12-03 12:51:07.459
2055	https://platina.vtcrm.ru/uploads/Photos/1040/phpcfP6oH.jpeg	\N	\N	\N	113	\N	\N	2025-12-03 12:51:07.459
2056	https://platina.vtcrm.ru/uploads/Photos/1040/phpwfvglA.jpeg	\N	\N	\N	113	\N	\N	2025-12-03 12:51:07.459
2057	https://platina.vtcrm.ru/uploads/Photos/1040/phpP7k3Bc.jpeg	\N	\N	\N	113	\N	\N	2025-12-03 12:51:07.459
2058	https://platina.vtcrm.ru/uploads/Photos/1040/phpXUjm5S.jpeg	\N	\N	\N	113	\N	\N	2025-12-03 12:51:07.459
2059	https://platina.vtcrm.ru/uploads/Photos/1040/phpRtq6HO.jpeg	\N	\N	\N	113	\N	\N	2025-12-03 12:51:07.459
2060	https://platina.vtcrm.ru/uploads/Photos/1043/phpvm2TKs.jpeg	\N	\N	\N	114	\N	\N	2025-12-03 12:54:53.208
2061	https://platina.vtcrm.ru/uploads/Photos/1043/php5DGRfr.jpeg	\N	\N	\N	114	\N	\N	2025-12-03 12:54:53.208
2062	https://platina.vtcrm.ru/uploads/Photos/1043/phpPQxkHu.jpeg	\N	\N	\N	114	\N	\N	2025-12-03 12:54:53.208
2063	https://platina.vtcrm.ru/uploads/Photos/1043/phpOTgUqb.jpeg	\N	\N	\N	114	\N	\N	2025-12-03 12:54:53.208
2064	https://platina.vtcrm.ru/uploads/Photos/1043/phpaQSffQ.jpeg	\N	\N	\N	114	\N	\N	2025-12-03 12:54:53.208
2065	https://platina.vtcrm.ru/uploads/Photos/1043/phpRuB8ck.jpeg	\N	\N	\N	114	\N	\N	2025-12-03 12:54:53.208
2066	https://platina.vtcrm.ru/uploads/Photos/1043/phphizdJq.jpeg	\N	\N	\N	114	\N	\N	2025-12-03 12:54:53.208
2067	https://platina.vtcrm.ru/uploads/Photos/1043/phpZUsxIJ.jpeg	\N	\N	\N	114	\N	\N	2025-12-03 12:54:53.208
2068	https://platina.vtcrm.ru/uploads/Photos/1043/phpg7VW1C.jpeg	\N	\N	\N	114	\N	\N	2025-12-03 12:54:53.208
2069	https://platina.vtcrm.ru/uploads/Photos/1043/phpHCGplD.jpeg	\N	\N	\N	114	\N	\N	2025-12-03 12:54:53.208
2070	https://platina.vtcrm.ru/uploads/Photos/1043/phpqtPukQ.jpeg	\N	\N	\N	114	\N	\N	2025-12-03 12:54:53.208
2071	https://platina.vtcrm.ru/uploads/Photos/1043/phpg8BPwB.jpeg	\N	\N	\N	114	\N	\N	2025-12-03 12:54:53.208
2072	https://platina.vtcrm.ru/uploads/Photos/1043/phpHLLJeL.jpeg	\N	\N	\N	114	\N	\N	2025-12-03 12:54:53.208
2073	https://platina.vtcrm.ru/uploads/Photos/1043/phpeBwvaF.jpeg	\N	\N	\N	114	\N	\N	2025-12-03 12:54:53.208
2074	https://platina.vtcrm.ru/uploads/Photos/1043/phpWq8bGZ.jpeg	\N	\N	\N	114	\N	\N	2025-12-03 12:54:53.208
2075	https://platina.vtcrm.ru/uploads/Photos/1043/phpw3VCV7.jpeg	\N	\N	\N	114	\N	\N	2025-12-03 12:54:53.208
2076	https://platina.vtcrm.ru/uploads/Photos/1043/phpEq9fv6.jpeg	\N	\N	\N	114	\N	\N	2025-12-03 12:54:53.208
2077	https://platina.vtcrm.ru/uploads/Photos/1043/phpAuD3YX.jpeg	\N	\N	\N	114	\N	\N	2025-12-03 12:54:53.208
2078	https://platina.vtcrm.ru/uploads/Photos/1043/phpQXelqO.jpeg	\N	\N	\N	114	\N	\N	2025-12-03 12:54:53.208
2079	https://platina.vtcrm.ru/uploads/Photos/1047/php7Ml3kb.jpeg	\N	\N	\N	115	\N	\N	2025-12-03 12:57:12.105
2080	https://platina.vtcrm.ru/uploads/Photos/1047/phpAUpsDO.jpeg	\N	\N	\N	115	\N	\N	2025-12-03 12:57:12.105
2081	https://platina.vtcrm.ru/uploads/Photos/1047/phpMmLWHs.jpeg	\N	\N	\N	115	\N	\N	2025-12-03 12:57:12.105
2082	https://platina.vtcrm.ru/uploads/Photos/1047/php30AwqB.jpeg	\N	\N	\N	115	\N	\N	2025-12-03 12:57:12.105
2083	https://platina.vtcrm.ru/uploads/Photos/1047/php67NAkE.jpeg	\N	\N	\N	115	\N	\N	2025-12-03 12:57:12.105
2084	https://platina.vtcrm.ru/uploads/Photos/1047/phpUjqTcz.jpeg	\N	\N	\N	115	\N	\N	2025-12-03 12:57:12.105
2085	https://platina.vtcrm.ru/uploads/Photos/1047/phpgfgcgl.jpeg	\N	\N	\N	115	\N	\N	2025-12-03 12:57:12.105
2086	https://platina.vtcrm.ru/uploads/Photos/1047/php5XKXoc.jpeg	\N	\N	\N	115	\N	\N	2025-12-03 12:57:12.105
2087	https://platina.vtcrm.ru/uploads/Photos/1048/phpgEdM5e.jpeg	\N	\N	\N	116	\N	\N	2025-12-03 12:59:30.512
2088	https://platina.vtcrm.ru/uploads/Photos/1048/phpuuAAtV.jpeg	\N	\N	\N	116	\N	\N	2025-12-03 12:59:30.512
2089	https://platina.vtcrm.ru/uploads/Photos/1048/php5n19o3.jpeg	\N	\N	\N	116	\N	\N	2025-12-03 12:59:30.512
2090	https://platina.vtcrm.ru/uploads/Photos/1048/phpg6Fxl5.jpeg	\N	\N	\N	116	\N	\N	2025-12-03 12:59:30.512
2091	https://platina.vtcrm.ru/uploads/Photos/1048/php9akPOF.jpeg	\N	\N	\N	116	\N	\N	2025-12-03 12:59:30.512
2092	https://platina.vtcrm.ru/uploads/Photos/1048/phpLnh9Bz.jpeg	\N	\N	\N	116	\N	\N	2025-12-03 12:59:30.512
2093	https://platina.vtcrm.ru/uploads/Photos/1048/phpSIFfHF.jpeg	\N	\N	\N	116	\N	\N	2025-12-03 12:59:30.512
2094	https://platina.vtcrm.ru/uploads/Photos/1049/phpKGVlib.jpeg	\N	\N	\N	117	\N	\N	2025-12-03 13:02:07.568
2095	https://platina.vtcrm.ru/uploads/Photos/1049/phpHYjSkX.jpeg	\N	\N	\N	117	\N	\N	2025-12-03 13:02:07.568
2096	https://platina.vtcrm.ru/uploads/Photos/1049/phpA4EGCo.jpeg	\N	\N	\N	117	\N	\N	2025-12-03 13:02:07.568
2097	https://platina.vtcrm.ru/uploads/Photos/1049/phpTm8VJa.jpeg	\N	\N	\N	117	\N	\N	2025-12-03 13:02:07.568
2098	https://platina.vtcrm.ru/uploads/Photos/1049/phpEOeIc6.jpeg	\N	\N	\N	117	\N	\N	2025-12-03 13:02:07.568
2099	https://platina.vtcrm.ru/uploads/Photos/1049/phpwR6DyU.jpeg	\N	\N	\N	117	\N	\N	2025-12-03 13:02:07.568
2100	https://platina.vtcrm.ru/uploads/Photos/1049/phpZvGY4c.jpeg	\N	\N	\N	117	\N	\N	2025-12-03 13:02:07.568
2101	https://platina.vtcrm.ru/uploads/Photos/1049/phpSBUJQz.jpeg	\N	\N	\N	117	\N	\N	2025-12-03 13:02:07.568
2102	https://platina.vtcrm.ru/uploads/Photos/1049/phpl0XX27.jpeg	\N	\N	\N	117	\N	\N	2025-12-03 13:02:07.568
2103	https://platina.vtcrm.ru/uploads/Photos/1054/phpCnUHWh.jpeg	\N	\N	\N	118	\N	\N	2025-12-03 13:08:38.999
2104	https://platina.vtcrm.ru/uploads/Photos/1054/phptKvhRn.jpeg	\N	\N	\N	118	\N	\N	2025-12-03 13:08:38.999
2105	https://platina.vtcrm.ru/uploads/Photos/1054/php68DQsT.jpeg	\N	\N	\N	118	\N	\N	2025-12-03 13:08:38.999
2106	https://platina.vtcrm.ru/uploads/Photos/1054/phpvv3bry.jpeg	\N	\N	\N	118	\N	\N	2025-12-03 13:08:38.999
2107	https://platina.vtcrm.ru/uploads/Photos/1054/phpSjes9t.jpeg	\N	\N	\N	118	\N	\N	2025-12-03 13:08:38.999
2108	https://platina.vtcrm.ru/uploads/Photos/1054/phplTJVn2.jpeg	\N	\N	\N	118	\N	\N	2025-12-03 13:08:38.999
2109	https://platina.vtcrm.ru/uploads/Photos/1054/phpTiJ2YN.jpeg	\N	\N	\N	118	\N	\N	2025-12-03 13:08:38.999
2110	https://platina.vtcrm.ru/uploads/Photos/1067/phpedtToP.jpeg	\N	\N	\N	119	\N	\N	2025-12-03 13:12:36.378
2111	https://platina.vtcrm.ru/uploads/Photos/1067/phpDMpnhv.jpeg	\N	\N	\N	119	\N	\N	2025-12-03 13:12:36.378
2112	https://platina.vtcrm.ru/uploads/Photos/1067/phpagQIz7.jpeg	\N	\N	\N	119	\N	\N	2025-12-03 13:12:36.378
2113	https://platina.vtcrm.ru/uploads/Photos/1067/phpf5phlF.jpeg	\N	\N	\N	119	\N	\N	2025-12-03 13:12:36.378
2114	https://platina.vtcrm.ru/uploads/Photos/1067/php7sZCZ2.jpeg	\N	\N	\N	119	\N	\N	2025-12-03 13:12:36.378
2115	https://platina.vtcrm.ru/uploads/Photos/1067/phpzwKrR2.jpeg	\N	\N	\N	119	\N	\N	2025-12-03 13:12:36.378
2116	https://platina.vtcrm.ru/uploads/Photos/1067/phpidJOHV.jpeg	\N	\N	\N	119	\N	\N	2025-12-03 13:12:36.378
2117	https://platina.vtcrm.ru/uploads/Photos/1067/phpVK58vK.jpeg	\N	\N	\N	119	\N	\N	2025-12-03 13:12:36.378
2118	https://platina.vtcrm.ru/uploads/Photos/1067/phpJzR1yg.jpeg	\N	\N	\N	119	\N	\N	2025-12-03 13:12:36.378
2119	https://platina.vtcrm.ru/uploads/Photos/1067/phprnUblY.jpeg	\N	\N	\N	119	\N	\N	2025-12-03 13:12:36.378
2120	https://platina.vtcrm.ru/uploads/Photos/1067/phpx8YwJ0.jpeg	\N	\N	\N	119	\N	\N	2025-12-03 13:12:36.378
2121	https://platina.vtcrm.ru/uploads/Photos/1067/phpT0hFEL.jpeg	\N	\N	\N	119	\N	\N	2025-12-03 13:12:36.378
2122	https://platina.vtcrm.ru/uploads/Photos/1067/php1rIMwS.jpeg	\N	\N	\N	119	\N	\N	2025-12-03 13:12:36.378
2123	https://platina.vtcrm.ru/uploads/Photos/1067/phpxOA8i8.jpeg	\N	\N	\N	119	\N	\N	2025-12-03 13:12:36.378
2124	https://platina.vtcrm.ru/uploads/Photos/1067/phpoyMMzK.jpeg	\N	\N	\N	119	\N	\N	2025-12-03 13:12:36.378
2125	https://platina.vtcrm.ru/uploads/Photos/1067/phpivbR2S.jpeg	\N	\N	\N	119	\N	\N	2025-12-03 13:12:36.378
2126	https://platina.vtcrm.ru/uploads/Photos/1067/phpLA7EUr.jpeg	\N	\N	\N	119	\N	\N	2025-12-03 13:12:36.378
2127	https://platina.vtcrm.ru/uploads/Photos/1067/phpcAXRlN.jpeg	\N	\N	\N	119	\N	\N	2025-12-03 13:12:36.378
2128	https://platina.vtcrm.ru/uploads/Photos/1067/phpn9vlAO.jpeg	\N	\N	\N	119	\N	\N	2025-12-03 13:12:36.378
2129	https://platina.vtcrm.ru/uploads/Photos/1067/php4OFFV4.jpeg	\N	\N	\N	119	\N	\N	2025-12-03 13:12:36.378
2130	https://platina.vtcrm.ru/uploads/Photos/1077/phpdjt2W6.jpeg	\N	\N	\N	120	\N	\N	2025-12-03 13:15:52.113
2131	https://platina.vtcrm.ru/uploads/Photos/1077/phpnu9z5b.jpeg	\N	\N	\N	120	\N	\N	2025-12-03 13:15:52.113
2132	https://platina.vtcrm.ru/uploads/Photos/1077/phpb0jiLn.jpeg	\N	\N	\N	120	\N	\N	2025-12-03 13:15:52.113
2133	https://platina.vtcrm.ru/uploads/Photos/1077/phpqbwzmf.jpeg	\N	\N	\N	120	\N	\N	2025-12-03 13:15:52.113
2134	https://platina.vtcrm.ru/uploads/Photos/1077/phpedyeUa.jpeg	\N	\N	\N	120	\N	\N	2025-12-03 13:15:52.113
2135	https://platina.vtcrm.ru/uploads/Photos/1077/phph8H10c.jpeg	\N	\N	\N	120	\N	\N	2025-12-03 13:15:52.113
2136	https://platina.vtcrm.ru/uploads/Photos/1077/phpPeTKZm.jpeg	\N	\N	\N	120	\N	\N	2025-12-03 13:15:52.113
2137	https://platina.vtcrm.ru/uploads/Photos/1077/phpG8xrp3.jpeg	\N	\N	\N	120	\N	\N	2025-12-03 13:15:52.113
2138	https://platina.vtcrm.ru/uploads/Photos/1077/phpR3hV9V.jpeg	\N	\N	\N	120	\N	\N	2025-12-03 13:15:52.113
2139	https://platina.vtcrm.ru/uploads/Photos/1077/phpCOPjo9.jpeg	\N	\N	\N	120	\N	\N	2025-12-03 13:15:52.113
2140	https://platina.vtcrm.ru/uploads/Photos/1077/phpDt5mEF.jpeg	\N	\N	\N	120	\N	\N	2025-12-03 13:15:52.113
2141	https://platina.vtcrm.ru/uploads/Photos/1077/phpHFHkpk.jpeg	\N	\N	\N	120	\N	\N	2025-12-03 13:15:52.113
2142	https://platina.vtcrm.ru/uploads/Photos/1077/php1Ienep.jpeg	\N	\N	\N	120	\N	\N	2025-12-03 13:15:52.113
2143	https://platina.vtcrm.ru/uploads/Photos/1077/phppGiHB0.jpeg	\N	\N	\N	120	\N	\N	2025-12-03 13:15:52.113
2144	https://platina.vtcrm.ru/uploads/Photos/1079/php6urQ0y.jpeg	\N	\N	\N	121	\N	\N	2025-12-04 12:08:13.861
2145	https://platina.vtcrm.ru/uploads/Photos/1079/phplQwLk4.jpeg	\N	\N	\N	121	\N	\N	2025-12-04 12:08:13.861
2146	https://platina.vtcrm.ru/uploads/Photos/1079/phpod0BfO.jpeg	\N	\N	\N	121	\N	\N	2025-12-04 12:08:13.861
2147	https://platina.vtcrm.ru/uploads/Photos/1079/phpqlxnGl.jpeg	\N	\N	\N	121	\N	\N	2025-12-04 12:08:13.861
2148	https://platina.vtcrm.ru/uploads/Photos/1079/phpkYV4qi.jpeg	\N	\N	\N	121	\N	\N	2025-12-04 12:08:13.861
2149	https://platina.vtcrm.ru/uploads/Photos/1079/phpPAH6lt.jpeg	\N	\N	\N	121	\N	\N	2025-12-04 12:08:13.861
2150	https://platina.vtcrm.ru/uploads/Photos/1079/phpNmRLxB.jpeg	\N	\N	\N	121	\N	\N	2025-12-04 12:08:13.861
2151	https://platina.vtcrm.ru/uploads/Photos/1079/phpt4Z002.jpeg	\N	\N	\N	121	\N	\N	2025-12-04 12:08:13.861
2152	https://platina.vtcrm.ru/uploads/Photos/1079/php7r32mE.jpeg	\N	\N	\N	121	\N	\N	2025-12-04 12:08:13.861
2153	https://platina.vtcrm.ru/uploads/Photos/1079/phpyut0ZJ.jpeg	\N	\N	\N	121	\N	\N	2025-12-04 12:08:13.861
2154	https://platina.vtcrm.ru/uploads/Photos/1079/php5zCJQs.jpeg	\N	\N	\N	121	\N	\N	2025-12-04 12:08:13.861
2155	https://platina.vtcrm.ru/uploads/Photos/1079/php8OmKPY.jpeg	\N	\N	\N	121	\N	\N	2025-12-04 12:08:13.861
2156	https://platina.vtcrm.ru/uploads/Photos/1085/php4Rw0X2.jpeg	\N	\N	\N	122	\N	\N	2025-12-04 12:11:36.911
2157	https://platina.vtcrm.ru/uploads/Photos/1085/phpuCIprg.jpeg	\N	\N	\N	122	\N	\N	2025-12-04 12:11:36.911
2158	https://platina.vtcrm.ru/uploads/Photos/1085/phpDZI5xk.jpeg	\N	\N	\N	122	\N	\N	2025-12-04 12:11:36.911
2159	https://platina.vtcrm.ru/uploads/Photos/1085/phphqed52.jpeg	\N	\N	\N	122	\N	\N	2025-12-04 12:11:36.911
2160	https://platina.vtcrm.ru/uploads/Photos/1085/phpN39WCo.jpeg	\N	\N	\N	122	\N	\N	2025-12-04 12:11:36.911
2161	https://platina.vtcrm.ru/uploads/Photos/1085/php1eGimS.jpeg	\N	\N	\N	122	\N	\N	2025-12-04 12:11:36.911
2162	https://platina.vtcrm.ru/uploads/Photos/1085/phpSPA8mv.jpeg	\N	\N	\N	122	\N	\N	2025-12-04 12:11:36.911
2163	https://platina.vtcrm.ru/uploads/Photos/1085/php2gmVff.jpeg	\N	\N	\N	122	\N	\N	2025-12-04 12:11:36.911
2164	https://platina.vtcrm.ru/uploads/Photos/1085/php2QDS5R.jpeg	\N	\N	\N	122	\N	\N	2025-12-04 12:11:36.911
2165	https://platina.vtcrm.ru/uploads/Photos/1085/phpqYhETU.jpeg	\N	\N	\N	122	\N	\N	2025-12-04 12:11:36.911
2166	https://platina.vtcrm.ru/uploads/Photos/1085/phpWR4W4O.jpeg	\N	\N	\N	122	\N	\N	2025-12-04 12:11:36.911
2167	https://platina.vtcrm.ru/uploads/Photos/1085/phpq5DsRg.jpeg	\N	\N	\N	122	\N	\N	2025-12-04 12:11:36.911
2168	https://platina.vtcrm.ru/uploads/Photos/1085/php63PKfV.jpeg	\N	\N	\N	122	\N	\N	2025-12-04 12:11:36.911
2169	https://platina.vtcrm.ru/uploads/Photos/1085/phpIjcyM0.jpeg	\N	\N	\N	122	\N	\N	2025-12-04 12:11:36.911
2170	https://platina.vtcrm.ru/uploads/Photos/1087/phpa1lcir.jpeg	\N	\N	\N	123	\N	\N	2025-12-04 12:15:17.979
2171	https://platina.vtcrm.ru/uploads/Photos/1087/phpMfkuXq.jpeg	\N	\N	\N	123	\N	\N	2025-12-04 12:15:17.979
2172	https://platina.vtcrm.ru/uploads/Photos/1087/phpghAySv.jpeg	\N	\N	\N	123	\N	\N	2025-12-04 12:15:17.979
2173	https://platina.vtcrm.ru/uploads/Photos/1087/phpmpTvTv.jpeg	\N	\N	\N	123	\N	\N	2025-12-04 12:15:17.979
2174	https://platina.vtcrm.ru/uploads/Photos/1087/phpXw1D92.jpeg	\N	\N	\N	123	\N	\N	2025-12-04 12:15:17.979
2175	https://platina.vtcrm.ru/uploads/Photos/1087/phpwlzRY2.jpeg	\N	\N	\N	123	\N	\N	2025-12-04 12:15:17.979
2176	https://platina.vtcrm.ru/uploads/Photos/1087/phprKTlR3.jpeg	\N	\N	\N	123	\N	\N	2025-12-04 12:15:17.979
2177	https://platina.vtcrm.ru/uploads/Photos/1087/phpC2tWvH.jpeg	\N	\N	\N	123	\N	\N	2025-12-04 12:15:17.979
2178	https://platina.vtcrm.ru/uploads/Photos/1087/phpmtuIZK.jpeg	\N	\N	\N	123	\N	\N	2025-12-04 12:15:17.979
2179	https://platina.vtcrm.ru/uploads/Photos/1087/phpVVCWnq.jpeg	\N	\N	\N	123	\N	\N	2025-12-04 12:15:17.979
2180	https://platina.vtcrm.ru/uploads/Photos/1087/phpUMLhaW.jpeg	\N	\N	\N	123	\N	\N	2025-12-04 12:15:17.979
2181	https://platina.vtcrm.ru/uploads/Photos/1087/phpAroZK6.jpeg	\N	\N	\N	123	\N	\N	2025-12-04 12:15:17.979
2182	https://platina.vtcrm.ru/uploads/Photos/1087/phpq8ph7h.jpeg	\N	\N	\N	123	\N	\N	2025-12-04 12:15:17.979
2183	https://platina.vtcrm.ru/uploads/Photos/1087/phpm6u4lU.jpeg	\N	\N	\N	123	\N	\N	2025-12-04 12:15:17.979
2184	https://platina.vtcrm.ru/uploads/Photos/1087/phpwyGwiz.jpeg	\N	\N	\N	123	\N	\N	2025-12-04 12:15:17.979
2185	https://platina.vtcrm.ru/uploads/Photos/1087/php68NkU1.jpeg	\N	\N	\N	123	\N	\N	2025-12-04 12:15:17.979
2186	https://platina.vtcrm.ru/uploads/Photos/1087/phpGspO9K.jpeg	\N	\N	\N	123	\N	\N	2025-12-04 12:15:17.979
2187	https://platina.vtcrm.ru/uploads/Photos/1097/phpDTfps1.jpeg	\N	\N	\N	124	\N	\N	2025-12-04 12:17:27.1
2188	https://platina.vtcrm.ru/uploads/Photos/1097/phpe57Xxq.jpeg	\N	\N	\N	124	\N	\N	2025-12-04 12:17:27.1
2189	https://platina.vtcrm.ru/uploads/Photos/1097/phpTzfYd7.jpeg	\N	\N	\N	124	\N	\N	2025-12-04 12:17:27.1
2190	https://platina.vtcrm.ru/uploads/Photos/1097/php7i5QlN.jpeg	\N	\N	\N	124	\N	\N	2025-12-04 12:17:27.1
2191	https://platina.vtcrm.ru/uploads/Photos/1097/php6eKFYO.jpeg	\N	\N	\N	124	\N	\N	2025-12-04 12:17:27.1
2192	https://platina.vtcrm.ru/uploads/Photos/1097/phpnsbtMF.jpeg	\N	\N	\N	124	\N	\N	2025-12-04 12:17:27.1
2193	https://platina.vtcrm.ru/uploads/Photos/1097/phptjD77f.jpeg	\N	\N	\N	124	\N	\N	2025-12-04 12:17:27.1
2194	https://platina.vtcrm.ru/uploads/Photos/1098/phpFyuunK.jpeg	\N	\N	\N	125	\N	\N	2025-12-04 12:19:38.809
2195	https://platina.vtcrm.ru/uploads/Photos/1098/phpHT0SOA.jpeg	\N	\N	\N	125	\N	\N	2025-12-04 12:19:38.809
2196	https://platina.vtcrm.ru/uploads/Photos/1098/phpFqAK78.jpeg	\N	\N	\N	125	\N	\N	2025-12-04 12:19:38.809
2197	https://platina.vtcrm.ru/uploads/Photos/1098/phpKGSCbg.jpeg	\N	\N	\N	125	\N	\N	2025-12-04 12:19:38.809
2198	https://platina.vtcrm.ru/uploads/Photos/1098/phpvCKjoT.jpeg	\N	\N	\N	125	\N	\N	2025-12-04 12:19:38.809
2199	https://platina.vtcrm.ru/uploads/Photos/1098/php0klweJ.jpeg	\N	\N	\N	125	\N	\N	2025-12-04 12:19:38.809
2200	https://platina.vtcrm.ru/uploads/Photos/1103/phpEPXY9N.jpeg	\N	\N	\N	126	\N	\N	2025-12-04 12:22:03.907
2201	https://platina.vtcrm.ru/uploads/Photos/1103/phpgsCmI5.jpeg	\N	\N	\N	126	\N	\N	2025-12-04 12:22:03.907
2202	https://platina.vtcrm.ru/uploads/Photos/1103/phpDZsQOt.jpeg	\N	\N	\N	126	\N	\N	2025-12-04 12:22:03.907
2203	https://platina.vtcrm.ru/uploads/Photos/1103/phpFR3skx.jpeg	\N	\N	\N	126	\N	\N	2025-12-04 12:22:03.907
2204	https://platina.vtcrm.ru/uploads/Photos/1103/phptVmnBi.jpeg	\N	\N	\N	126	\N	\N	2025-12-04 12:22:03.907
2205	https://platina.vtcrm.ru/uploads/Photos/1103/php6cVqZO.jpeg	\N	\N	\N	126	\N	\N	2025-12-04 12:22:03.907
2206	https://platina.vtcrm.ru/uploads/Photos/1103/phpUPkqtL.jpeg	\N	\N	\N	126	\N	\N	2025-12-04 12:22:03.907
2207	https://platina.vtcrm.ru/uploads/Photos/1103/php34IVxq.jpeg	\N	\N	\N	126	\N	\N	2025-12-04 12:22:03.907
2208	https://platina.vtcrm.ru/uploads/Photos/1103/phpixb0RO.jpeg	\N	\N	\N	126	\N	\N	2025-12-04 12:22:03.907
2209	https://platina.vtcrm.ru/uploads/Photos/1117/phpdwfWX0.jpeg	\N	\N	\N	127	\N	\N	2025-12-04 12:31:08.017
2210	https://platina.vtcrm.ru/uploads/Photos/1117/phpSPTUzs.jpeg	\N	\N	\N	127	\N	\N	2025-12-04 12:31:08.017
2211	https://platina.vtcrm.ru/uploads/Photos/1117/phpzG1iMV.jpeg	\N	\N	\N	127	\N	\N	2025-12-04 12:31:08.017
2212	https://platina.vtcrm.ru/uploads/Photos/1117/phph5T96d.jpeg	\N	\N	\N	127	\N	\N	2025-12-04 12:31:08.017
2213	https://platina.vtcrm.ru/uploads/Photos/1117/php6RrtCX.jpeg	\N	\N	\N	127	\N	\N	2025-12-04 12:31:08.017
2214	https://platina.vtcrm.ru/uploads/Photos/1117/php5fmZdS.jpeg	\N	\N	\N	127	\N	\N	2025-12-04 12:31:08.017
2215	https://platina.vtcrm.ru/uploads/Photos/1117/phpclBNeA.jpeg	\N	\N	\N	127	\N	\N	2025-12-04 12:31:08.017
2216	https://platina.vtcrm.ru/uploads/Photos/1117/phpvOkdiR.jpeg	\N	\N	\N	127	\N	\N	2025-12-04 12:31:08.017
2217	https://platina.vtcrm.ru/uploads/Photos/1117/phpQpo4m9.jpeg	\N	\N	\N	127	\N	\N	2025-12-04 12:31:08.017
2218	https://platina.vtcrm.ru/uploads/Photos/1117/phpcKwtuI.jpeg	\N	\N	\N	127	\N	\N	2025-12-04 12:31:08.017
2219	https://platina.vtcrm.ru/uploads/Photos/1117/phpnKjOYD.jpeg	\N	\N	\N	127	\N	\N	2025-12-04 12:31:08.017
2220	https://platina.vtcrm.ru/uploads/Photos/1117/phpQpBFSP.jpeg	\N	\N	\N	127	\N	\N	2025-12-04 12:31:08.017
2221	https://platina.vtcrm.ru/uploads/Photos/1117/phpL7zzZI.jpeg	\N	\N	\N	127	\N	\N	2025-12-04 12:31:08.017
2222	https://platina.vtcrm.ru/uploads/Photos/1117/php1VSF3e.jpeg	\N	\N	\N	127	\N	\N	2025-12-04 12:31:08.017
2223	https://platina.vtcrm.ru/uploads/Photos/1120/php0dqYUM.jpeg	\N	\N	\N	128	\N	\N	2025-12-04 12:35:48.545
2224	https://platina.vtcrm.ru/uploads/Photos/1120/phpUUrDlU.jpeg	\N	\N	\N	128	\N	\N	2025-12-04 12:35:48.545
2225	https://platina.vtcrm.ru/uploads/Photos/1120/phpNEAmRu.jpeg	\N	\N	\N	128	\N	\N	2025-12-04 12:35:48.545
2226	https://platina.vtcrm.ru/uploads/Photos/1120/php57sQGa.jpeg	\N	\N	\N	128	\N	\N	2025-12-04 12:35:48.545
2227	https://platina.vtcrm.ru/uploads/Photos/1120/phpNIAxfE.jpeg	\N	\N	\N	128	\N	\N	2025-12-04 12:35:48.545
2228	https://platina.vtcrm.ru/uploads/Photos/1120/phpfXEhfU.jpeg	\N	\N	\N	128	\N	\N	2025-12-04 12:35:48.545
2229	https://platina.vtcrm.ru/uploads/Photos/1120/php4GP0Tn.jpeg	\N	\N	\N	128	\N	\N	2025-12-04 12:35:48.545
2230	https://platina.vtcrm.ru/uploads/Photos/1120/phpTYFr3b.jpeg	\N	\N	\N	128	\N	\N	2025-12-04 12:35:48.545
2231	https://platina.vtcrm.ru/uploads/Photos/1120/phpPdCjPS.jpeg	\N	\N	\N	128	\N	\N	2025-12-04 12:35:48.545
2232	https://platina.vtcrm.ru/uploads/Photos/1120/phpS3PgMM.jpeg	\N	\N	\N	128	\N	\N	2025-12-04 12:35:48.545
2233	https://platina.vtcrm.ru/uploads/Photos/1120/phpFtq1CC.jpeg	\N	\N	\N	128	\N	\N	2025-12-04 12:35:48.545
2234	https://platina.vtcrm.ru/uploads/Photos/1121/phpClGsLn.jpeg	\N	\N	\N	129	\N	\N	2025-12-04 12:38:45.148
2235	https://platina.vtcrm.ru/uploads/Photos/1121/phpUbMR3x.jpeg	\N	\N	\N	129	\N	\N	2025-12-04 12:38:45.148
2236	https://platina.vtcrm.ru/uploads/Photos/1121/phpc3M5vu.jpeg	\N	\N	\N	129	\N	\N	2025-12-04 12:38:45.148
2237	https://platina.vtcrm.ru/uploads/Photos/1121/phpcKTzCm.jpeg	\N	\N	\N	129	\N	\N	2025-12-04 12:38:45.148
2238	https://platina.vtcrm.ru/uploads/Photos/1121/phpGZVbrB.jpeg	\N	\N	\N	129	\N	\N	2025-12-04 12:38:45.148
2239	https://platina.vtcrm.ru/uploads/Photos/1121/phpBDOqtU.jpeg	\N	\N	\N	129	\N	\N	2025-12-04 12:38:45.148
2240	https://platina.vtcrm.ru/uploads/Photos/1121/phpS6eSI9.jpeg	\N	\N	\N	129	\N	\N	2025-12-04 12:38:45.148
2241	https://platina.vtcrm.ru/uploads/Photos/1121/phpQrJdvS.jpeg	\N	\N	\N	129	\N	\N	2025-12-04 12:38:45.148
2242	https://platina.vtcrm.ru/uploads/Photos/1121/phpS0J1b9.jpeg	\N	\N	\N	129	\N	\N	2025-12-04 12:38:45.148
2243	https://platina.vtcrm.ru/uploads/Photos/1122/php4fqimJ.jpeg	\N	\N	\N	130	\N	\N	2025-12-04 12:41:07.885
2244	https://platina.vtcrm.ru/uploads/Photos/1122/php03RnIT.jpeg	\N	\N	\N	130	\N	\N	2025-12-04 12:41:07.885
2245	https://platina.vtcrm.ru/uploads/Photos/1122/php2i3NLI.jpeg	\N	\N	\N	130	\N	\N	2025-12-04 12:41:07.885
2246	https://platina.vtcrm.ru/uploads/Photos/1122/php3jPkR1.jpeg	\N	\N	\N	130	\N	\N	2025-12-04 12:41:07.885
2247	https://platina.vtcrm.ru/uploads/Photos/1122/phpgYMKqa.jpeg	\N	\N	\N	130	\N	\N	2025-12-04 12:41:07.885
2248	https://platina.vtcrm.ru/uploads/Photos/1122/phpY2ceEr.jpeg	\N	\N	\N	130	\N	\N	2025-12-04 12:41:07.885
2249	https://platina.vtcrm.ru/uploads/Photos/1122/phpXTwPVF.jpeg	\N	\N	\N	130	\N	\N	2025-12-04 12:41:07.885
2250	https://platina.vtcrm.ru/uploads/Photos/1123/phpLNyMoG.jpeg	\N	\N	\N	131	\N	\N	2025-12-04 12:43:16.032
2251	https://platina.vtcrm.ru/uploads/Photos/1123/phpICgaan.jpeg	\N	\N	\N	131	\N	\N	2025-12-04 12:43:16.032
2252	https://platina.vtcrm.ru/uploads/Photos/1123/phpqXCUf5.jpeg	\N	\N	\N	131	\N	\N	2025-12-04 12:43:16.032
2253	https://platina.vtcrm.ru/uploads/Photos/1123/phpRKFNIb.jpeg	\N	\N	\N	131	\N	\N	2025-12-04 12:43:16.032
2254	https://platina.vtcrm.ru/uploads/Photos/1123/phpQ86tzT.jpeg	\N	\N	\N	131	\N	\N	2025-12-04 12:43:16.032
2255	https://platina.vtcrm.ru/uploads/Photos/1123/phpDkHCoO.jpeg	\N	\N	\N	131	\N	\N	2025-12-04 12:43:16.032
2256	https://platina.vtcrm.ru/uploads/Photos/1124/phpB9p41e.jpeg	\N	\N	\N	132	\N	\N	2025-12-04 12:45:33.088
2257	https://platina.vtcrm.ru/uploads/Photos/1124/phpxwy93g.jpeg	\N	\N	\N	132	\N	\N	2025-12-04 12:45:33.088
2258	https://platina.vtcrm.ru/uploads/Photos/1124/phpdXnlXw.jpeg	\N	\N	\N	132	\N	\N	2025-12-04 12:45:33.088
2259	https://platina.vtcrm.ru/uploads/Photos/1124/phplql5jl.jpeg	\N	\N	\N	132	\N	\N	2025-12-04 12:45:33.088
2260	https://platina.vtcrm.ru/uploads/Photos/1124/phpoXvE8w.jpeg	\N	\N	\N	132	\N	\N	2025-12-04 12:45:33.088
2261	https://platina.vtcrm.ru/uploads/Photos/1124/phpRH1JKy.jpeg	\N	\N	\N	132	\N	\N	2025-12-04 12:45:33.088
2262	https://platina.vtcrm.ru/uploads/Photos/1130/phpsvVbm7.jpeg	\N	\N	\N	133	\N	\N	2025-12-04 12:48:44.821
2263	https://platina.vtcrm.ru/uploads/Photos/1130/phpnN1z1v.jpeg	\N	\N	\N	133	\N	\N	2025-12-04 12:48:44.821
2264	https://platina.vtcrm.ru/uploads/Photos/1130/phpVJ7ks3.jpeg	\N	\N	\N	133	\N	\N	2025-12-04 12:48:44.821
2265	https://platina.vtcrm.ru/uploads/Photos/1130/php5zfXgN.jpeg	\N	\N	\N	133	\N	\N	2025-12-04 12:48:44.821
2266	https://platina.vtcrm.ru/uploads/Photos/1130/phpChlxPq.jpeg	\N	\N	\N	133	\N	\N	2025-12-04 12:48:44.821
2267	https://platina.vtcrm.ru/uploads/Photos/1130/phpI79lTX.jpeg	\N	\N	\N	133	\N	\N	2025-12-04 12:48:44.821
2268	https://platina.vtcrm.ru/uploads/Photos/1130/phpi1liC9.jpeg	\N	\N	\N	133	\N	\N	2025-12-04 12:48:44.821
2269	https://platina.vtcrm.ru/uploads/Photos/1130/phpOgwjBh.jpeg	\N	\N	\N	133	\N	\N	2025-12-04 12:48:44.821
2270	https://platina.vtcrm.ru/uploads/Photos/1130/phpPExbD1.jpeg	\N	\N	\N	133	\N	\N	2025-12-04 12:48:44.821
2271	https://platina.vtcrm.ru/uploads/Photos/1130/phpDAwZQ2.jpeg	\N	\N	\N	133	\N	\N	2025-12-04 12:48:44.821
2272	https://platina.vtcrm.ru/uploads/Photos/1130/fdb95e8a-14a7-4e8a-b57e-e3115f342306.jpeg	\N	\N	\N	133	\N	\N	2025-12-04 12:48:44.821
2273	https://platina.vtcrm.ru/uploads/Photos/1130/phpQqawsI.jpeg	\N	\N	\N	133	\N	\N	2025-12-04 12:48:44.821
2274	https://platina.vtcrm.ru/uploads/Photos/1130/phpzhX7Z9.jpeg	\N	\N	\N	133	\N	\N	2025-12-04 12:48:44.821
2275	https://platina.vtcrm.ru/uploads/Photos/1130/de44692f-c41c-49bc-84f6-32be9e121215.jpeg	\N	\N	\N	133	\N	\N	2025-12-04 12:48:44.821
2276	https://platina.vtcrm.ru/uploads/Photos/1130/phpYURtoe.jpeg	\N	\N	\N	133	\N	\N	2025-12-04 12:48:44.821
2277	https://platina.vtcrm.ru/uploads/Photos/1136/phpFjWRo2.jpeg	\N	\N	\N	134	\N	\N	2025-12-04 12:51:51.912
2278	https://platina.vtcrm.ru/uploads/Photos/1136/php97okQH.jpeg	\N	\N	\N	134	\N	\N	2025-12-04 12:51:51.912
2279	https://platina.vtcrm.ru/uploads/Photos/1136/phpPmrPpA.jpeg	\N	\N	\N	134	\N	\N	2025-12-04 12:51:51.912
2280	https://platina.vtcrm.ru/uploads/Photos/1136/phpFcrwHA.jpeg	\N	\N	\N	134	\N	\N	2025-12-04 12:51:51.912
2281	https://platina.vtcrm.ru/uploads/Photos/1136/phpWKdiKR.jpeg	\N	\N	\N	134	\N	\N	2025-12-04 12:51:51.912
2282	https://platina.vtcrm.ru/uploads/Photos/1136/php8fIoQv.jpeg	\N	\N	\N	134	\N	\N	2025-12-04 12:51:51.912
2283	https://platina.vtcrm.ru/uploads/Photos/1136/phprOLTA0.jpeg	\N	\N	\N	134	\N	\N	2025-12-04 12:51:51.912
2284	https://platina.vtcrm.ru/uploads/Photos/1136/phpnfybgs.jpeg	\N	\N	\N	134	\N	\N	2025-12-04 12:51:51.912
2285	https://platina.vtcrm.ru/uploads/Photos/1136/phpTATwLP.jpeg	\N	\N	\N	134	\N	\N	2025-12-04 12:51:51.912
2286	https://platina.vtcrm.ru/uploads/Photos/1136/phpU9slAY.jpeg	\N	\N	\N	134	\N	\N	2025-12-04 12:51:51.912
2287	https://platina.vtcrm.ru/uploads/Photos/1136/phplcmLQB.jpeg	\N	\N	\N	134	\N	\N	2025-12-04 12:51:51.912
2288	https://platina.vtcrm.ru/uploads/Photos/1137/phpRJzKxU.jpeg	\N	\N	\N	135	\N	\N	2025-12-04 12:55:26.738
2289	https://platina.vtcrm.ru/uploads/Photos/1137/phplMCWu3.jpeg	\N	\N	\N	135	\N	\N	2025-12-04 12:55:26.738
2290	https://platina.vtcrm.ru/uploads/Photos/1137/phpiNlrI3.jpeg	\N	\N	\N	135	\N	\N	2025-12-04 12:55:26.738
2291	https://platina.vtcrm.ru/uploads/Photos/1137/php4ooDKy.jpeg	\N	\N	\N	135	\N	\N	2025-12-04 12:55:26.738
2292	https://platina.vtcrm.ru/uploads/Photos/1137/phpdAkBz9.jpeg	\N	\N	\N	135	\N	\N	2025-12-04 12:55:26.738
2293	https://platina.vtcrm.ru/uploads/Photos/1137/php2y6G5n.jpeg	\N	\N	\N	135	\N	\N	2025-12-04 12:55:26.738
2294	https://platina.vtcrm.ru/uploads/Photos/1137/phprYZyAV.jpeg	\N	\N	\N	135	\N	\N	2025-12-04 12:55:26.738
2295	https://platina.vtcrm.ru/uploads/Photos/1137/phpb6eSii.jpeg	\N	\N	\N	135	\N	\N	2025-12-04 12:55:26.738
2296	https://platina.vtcrm.ru/uploads/Photos/1137/phpnVvvmw.jpeg	\N	\N	\N	135	\N	\N	2025-12-04 12:55:26.738
2297	https://platina.vtcrm.ru/uploads/Photos/1137/phpvoRCDv.jpeg	\N	\N	\N	135	\N	\N	2025-12-04 12:55:26.738
2298	https://platina.vtcrm.ru/uploads/Photos/1137/phpecWud9.jpeg	\N	\N	\N	135	\N	\N	2025-12-04 12:55:26.738
2299	https://platina.vtcrm.ru/uploads/Photos/1137/phpKHtvHe.jpeg	\N	\N	\N	135	\N	\N	2025-12-04 12:55:26.738
2300	https://platina.vtcrm.ru/uploads/Photos/1137/phpUdc9Kc.jpeg	\N	\N	\N	135	\N	\N	2025-12-04 12:55:26.738
2301	https://platina.vtcrm.ru/uploads/Photos/1137/phpj2lB6Q.jpeg	\N	\N	\N	135	\N	\N	2025-12-04 12:55:26.738
2302	https://platina.vtcrm.ru/uploads/Photos/1137/phpsagOsn.jpeg	\N	\N	\N	135	\N	\N	2025-12-04 12:55:26.738
2303	https://platina.vtcrm.ru/uploads/Photos/1141/phpx2ZsKu.jpeg	\N	\N	\N	136	\N	\N	2025-12-04 12:58:04.541
2304	https://platina.vtcrm.ru/uploads/Photos/1141/phpFqukow.jpeg	\N	\N	\N	136	\N	\N	2025-12-04 12:58:04.541
2305	https://platina.vtcrm.ru/uploads/Photos/1141/phpwuNZIX.jpeg	\N	\N	\N	136	\N	\N	2025-12-04 12:58:04.541
2306	https://platina.vtcrm.ru/uploads/Photos/1141/phpYEdElq.jpeg	\N	\N	\N	136	\N	\N	2025-12-04 12:58:04.541
2307	https://platina.vtcrm.ru/uploads/Photos/1141/phpluKjG7.jpeg	\N	\N	\N	136	\N	\N	2025-12-04 12:58:04.541
2308	https://platina.vtcrm.ru/uploads/Photos/1141/phpl0w2AV.jpeg	\N	\N	\N	136	\N	\N	2025-12-04 12:58:04.541
2309	https://platina.vtcrm.ru/uploads/Photos/1141/phpmmqt5Y.jpeg	\N	\N	\N	136	\N	\N	2025-12-04 12:58:04.541
2310	https://platina.vtcrm.ru/uploads/Photos/1142/phpNs80p6.jpeg	\N	\N	\N	137	\N	\N	2025-12-04 13:00:42.508
2311	https://platina.vtcrm.ru/uploads/Photos/1142/phpLsNVMX.jpeg	\N	\N	\N	137	\N	\N	2025-12-04 13:00:42.508
2312	https://platina.vtcrm.ru/uploads/Photos/1142/php58Ckly.jpeg	\N	\N	\N	137	\N	\N	2025-12-04 13:00:42.508
2313	https://platina.vtcrm.ru/uploads/Photos/1142/phpc6VEWw.jpeg	\N	\N	\N	137	\N	\N	2025-12-04 13:00:42.508
2314	https://platina.vtcrm.ru/uploads/Photos/1142/phpKK5VzE.jpeg	\N	\N	\N	137	\N	\N	2025-12-04 13:00:42.508
2315	https://platina.vtcrm.ru/uploads/Photos/1142/phpeEntH5.jpeg	\N	\N	\N	137	\N	\N	2025-12-04 13:00:42.508
2316	https://platina.vtcrm.ru/uploads/Photos/1142/phpQNI8mn.jpeg	\N	\N	\N	137	\N	\N	2025-12-04 13:00:42.508
2317	https://platina.vtcrm.ru/uploads/Photos/1143/phpA4d99P.jpeg	\N	\N	\N	138	\N	\N	2025-12-04 13:08:02.852
2318	https://platina.vtcrm.ru/uploads/Photos/1143/phpx5cMxw.jpeg	\N	\N	\N	138	\N	\N	2025-12-04 13:08:02.852
2319	https://platina.vtcrm.ru/uploads/Photos/1143/phpVDqO2y.jpeg	\N	\N	\N	138	\N	\N	2025-12-04 13:08:02.852
2320	https://platina.vtcrm.ru/uploads/Photos/1143/phpg9cUtY.jpeg	\N	\N	\N	138	\N	\N	2025-12-04 13:08:02.852
2321	https://platina.vtcrm.ru/uploads/Photos/1143/phpakREWd.jpeg	\N	\N	\N	138	\N	\N	2025-12-04 13:08:02.852
2322	https://platina.vtcrm.ru/uploads/Photos/1143/phpan7Q1k.jpeg	\N	\N	\N	138	\N	\N	2025-12-04 13:08:02.852
2323	https://platina.vtcrm.ru/uploads/Photos/1143/phprXgYgF.jpeg	\N	\N	\N	138	\N	\N	2025-12-04 13:08:02.852
2324	https://platina.vtcrm.ru/uploads/Photos/1143/phpGLy6ee.jpeg	\N	\N	\N	138	\N	\N	2025-12-04 13:08:02.852
2325	https://platina.vtcrm.ru/uploads/Photos/1143/phpXw7dVp.jpeg	\N	\N	\N	138	\N	\N	2025-12-04 13:08:02.852
2326	https://platina.vtcrm.ru/uploads/Photos/1143/phpllG4bW.jpeg	\N	\N	\N	138	\N	\N	2025-12-04 13:08:02.852
2327	https://platina.vtcrm.ru/uploads/Photos/1144/phptOY6x1.jpeg	\N	\N	\N	139	\N	\N	2025-12-04 13:10:49.166
2328	https://platina.vtcrm.ru/uploads/Photos/1144/phpq4C7ke.jpeg	\N	\N	\N	139	\N	\N	2025-12-04 13:10:49.166
2329	https://platina.vtcrm.ru/uploads/Photos/1144/phpzxSo43.jpeg	\N	\N	\N	139	\N	\N	2025-12-04 13:10:49.166
2330	https://platina.vtcrm.ru/uploads/Photos/1144/phpoiOOOd.jpeg	\N	\N	\N	139	\N	\N	2025-12-04 13:10:49.166
2331	https://platina.vtcrm.ru/uploads/Photos/1144/phpAmZl6g.jpeg	\N	\N	\N	139	\N	\N	2025-12-04 13:10:49.166
2332	https://platina.vtcrm.ru/uploads/Photos/1144/phppQ6VYY.jpeg	\N	\N	\N	139	\N	\N	2025-12-04 13:10:49.166
2333	https://platina.vtcrm.ru/uploads/Photos/1144/phpa9tlq5.jpeg	\N	\N	\N	139	\N	\N	2025-12-04 13:10:49.166
2334	https://platina.vtcrm.ru/uploads/Photos/1145/phpS1xlX4.jpeg	\N	\N	\N	140	\N	\N	2025-12-04 13:13:20.762
2335	https://platina.vtcrm.ru/uploads/Photos/1145/phpuFZgS8.jpeg	\N	\N	\N	140	\N	\N	2025-12-04 13:13:20.762
2336	https://platina.vtcrm.ru/uploads/Photos/1145/phpQvxX5E.jpeg	\N	\N	\N	140	\N	\N	2025-12-04 13:13:20.762
2337	https://platina.vtcrm.ru/uploads/Photos/1145/phpdMpbaU.jpeg	\N	\N	\N	140	\N	\N	2025-12-04 13:13:20.762
2338	https://platina.vtcrm.ru/uploads/Photos/1145/phpPR95iU.jpeg	\N	\N	\N	140	\N	\N	2025-12-04 13:13:20.762
2339	https://platina.vtcrm.ru/uploads/Photos/1145/phpqKXmzk.jpeg	\N	\N	\N	140	\N	\N	2025-12-04 13:13:20.762
2340	https://platina.vtcrm.ru/uploads/Photos/1145/php19JI0Z.jpeg	\N	\N	\N	140	\N	\N	2025-12-04 13:13:20.762
2341	https://platina.vtcrm.ru/uploads/Photos/1145/phpGHGKrE.jpeg	\N	\N	\N	140	\N	\N	2025-12-04 13:13:20.762
2342	https://platina.vtcrm.ru/uploads/Photos/1145/phpTWgrBi.jpeg	\N	\N	\N	140	\N	\N	2025-12-04 13:13:20.762
2343	https://platina.vtcrm.ru/uploads/Photos/1146/phpvMjiWE.jpeg	\N	\N	\N	141	\N	\N	2025-12-04 13:19:57.008
2344	https://platina.vtcrm.ru/uploads/Photos/1146/phpnfXbZ7.jpeg	\N	\N	\N	141	\N	\N	2025-12-04 13:19:57.008
2345	https://platina.vtcrm.ru/uploads/Photos/1146/php4v16B1.jpeg	\N	\N	\N	141	\N	\N	2025-12-04 13:19:57.008
2346	https://platina.vtcrm.ru/uploads/Photos/1146/phpeuI1os.jpeg	\N	\N	\N	141	\N	\N	2025-12-04 13:19:57.008
2347	https://platina.vtcrm.ru/uploads/Photos/1146/phpvp90ee.jpeg	\N	\N	\N	141	\N	\N	2025-12-04 13:19:57.008
2348	https://platina.vtcrm.ru/uploads/Photos/1146/phpqvKB9X.jpeg	\N	\N	\N	141	\N	\N	2025-12-04 13:19:57.008
2349	https://platina.vtcrm.ru/uploads/Photos/1146/phpGGoof2.jpeg	\N	\N	\N	141	\N	\N	2025-12-04 13:19:57.008
2350	https://platina.vtcrm.ru/uploads/Photos/1146/phpZkxKyk.jpeg	\N	\N	\N	141	\N	\N	2025-12-04 13:19:57.008
2351	https://platina.vtcrm.ru/uploads/Photos/1146/phpMPNkTh.jpeg	\N	\N	\N	141	\N	\N	2025-12-04 13:19:57.008
2352	https://platina.vtcrm.ru/uploads/Photos/1146/phpQWqhFw.jpeg	\N	\N	\N	141	\N	\N	2025-12-04 13:19:57.008
2353	https://platina.vtcrm.ru/uploads/Photos/1148/phpKN2DAS.jpeg	\N	\N	\N	142	\N	\N	2025-12-04 13:22:55.935
2354	https://platina.vtcrm.ru/uploads/Photos/1148/php4mMPPb.jpeg	\N	\N	\N	142	\N	\N	2025-12-04 13:22:55.935
2355	https://platina.vtcrm.ru/uploads/Photos/1148/phpYWlngv.jpeg	\N	\N	\N	142	\N	\N	2025-12-04 13:22:55.935
2356	https://platina.vtcrm.ru/uploads/Photos/1148/phpC4Chd5.jpeg	\N	\N	\N	142	\N	\N	2025-12-04 13:22:55.935
2357	https://platina.vtcrm.ru/uploads/Photos/1148/phpBfCGdy.jpeg	\N	\N	\N	142	\N	\N	2025-12-04 13:22:55.935
2358	https://platina.vtcrm.ru/uploads/Photos/1148/phpQQFQnB.jpeg	\N	\N	\N	142	\N	\N	2025-12-04 13:22:55.935
2359	https://platina.vtcrm.ru/uploads/Photos/1148/phpKveox4.jpeg	\N	\N	\N	142	\N	\N	2025-12-04 13:22:55.935
2360	https://platina.vtcrm.ru/uploads/Photos/1148/php1FlQwE.jpeg	\N	\N	\N	142	\N	\N	2025-12-04 13:22:55.935
2361	https://platina.vtcrm.ru/uploads/Photos/1160/phpbyX92w.jpeg	\N	\N	\N	143	\N	\N	2025-12-04 13:27:13.69
2362	https://platina.vtcrm.ru/uploads/Photos/1160/phpn71uYq.jpeg	\N	\N	\N	143	\N	\N	2025-12-04 13:27:13.69
2363	https://platina.vtcrm.ru/uploads/Photos/1160/phpQ5vW71.jpeg	\N	\N	\N	143	\N	\N	2025-12-04 13:27:13.69
2364	https://platina.vtcrm.ru/uploads/Photos/1160/phpET75hT.jpeg	\N	\N	\N	143	\N	\N	2025-12-04 13:27:13.69
2365	https://platina.vtcrm.ru/uploads/Photos/1160/phpQpG2UW.jpeg	\N	\N	\N	143	\N	\N	2025-12-04 13:27:13.69
2366	https://platina.vtcrm.ru/uploads/Photos/1160/phpUmGEaC.jpeg	\N	\N	\N	143	\N	\N	2025-12-04 13:27:13.69
2367	https://platina.vtcrm.ru/uploads/Photos/1160/phpa3D6xt.jpeg	\N	\N	\N	143	\N	\N	2025-12-04 13:27:13.69
2368	https://platina.vtcrm.ru/uploads/Photos/1160/phpQpB4cr.jpeg	\N	\N	\N	143	\N	\N	2025-12-04 13:27:13.69
2369	https://platina.vtcrm.ru/uploads/Photos/1160/phpMWRHBE.jpeg	\N	\N	\N	143	\N	\N	2025-12-04 13:27:13.69
2370	https://platina.vtcrm.ru/uploads/Photos/1161/phpTN8p1E.jpeg	\N	\N	\N	144	\N	\N	2025-12-04 13:29:11.588
2371	https://platina.vtcrm.ru/uploads/Photos/1161/phpsdHbQ8.jpeg	\N	\N	\N	144	\N	\N	2025-12-04 13:29:11.588
2372	https://platina.vtcrm.ru/uploads/Photos/1161/phphJswdW.jpeg	\N	\N	\N	144	\N	\N	2025-12-04 13:29:11.588
2373	https://platina.vtcrm.ru/uploads/Photos/1161/phpdNqDvl.jpeg	\N	\N	\N	144	\N	\N	2025-12-04 13:29:11.588
2374	https://platina.vtcrm.ru/uploads/Photos/1161/phpC79ybe.jpeg	\N	\N	\N	144	\N	\N	2025-12-04 13:29:11.588
2375	https://platina.vtcrm.ru/uploads/Photos/1171/phpzh9HAQ.jpeg	\N	\N	\N	145	\N	\N	2025-12-04 13:32:18.878
2376	https://platina.vtcrm.ru/uploads/Photos/1171/phpgHd3Nv.jpeg	\N	\N	\N	145	\N	\N	2025-12-04 13:32:18.878
2377	https://platina.vtcrm.ru/uploads/Photos/1171/phphOaYaP.jpeg	\N	\N	\N	145	\N	\N	2025-12-04 13:32:18.878
2378	https://platina.vtcrm.ru/uploads/Photos/1171/php0vLhAG.jpeg	\N	\N	\N	145	\N	\N	2025-12-04 13:32:18.878
2379	https://platina.vtcrm.ru/uploads/Photos/1171/phpxz3a7o.jpeg	\N	\N	\N	145	\N	\N	2025-12-04 13:32:18.878
2380	https://platina.vtcrm.ru/uploads/Photos/1171/phpssejzm.jpeg	\N	\N	\N	145	\N	\N	2025-12-04 13:32:18.878
2381	https://platina.vtcrm.ru/uploads/Photos/1171/phpcK7scu.jpeg	\N	\N	\N	145	\N	\N	2025-12-04 13:32:18.878
2382	https://platina.vtcrm.ru/uploads/Photos/1171/phpJgKTa9.jpeg	\N	\N	\N	145	\N	\N	2025-12-04 13:32:18.878
2383	https://platina.vtcrm.ru/uploads/Photos/1173/phpNwAZhN.jpeg	\N	\N	\N	146	\N	\N	2025-12-05 14:29:24.85
2384	https://platina.vtcrm.ru/uploads/Photos/1173/phpUZEt4D.jpeg	\N	\N	\N	146	\N	\N	2025-12-05 14:29:24.85
2385	https://platina.vtcrm.ru/uploads/Photos/1173/phpNtxXqO.jpeg	\N	\N	\N	146	\N	\N	2025-12-05 14:29:24.85
2386	https://platina.vtcrm.ru/uploads/Photos/1173/phpT9UfRW.jpeg	\N	\N	\N	146	\N	\N	2025-12-05 14:29:24.85
2387	https://platina.vtcrm.ru/uploads/Photos/1173/php6t6shW.jpeg	\N	\N	\N	146	\N	\N	2025-12-05 14:29:24.85
2388	https://platina.vtcrm.ru/uploads/Photos/1173/phpPi8pWD.jpeg	\N	\N	\N	146	\N	\N	2025-12-05 14:29:24.85
2389	https://platina.vtcrm.ru/uploads/Photos/1173/php2sjZxb.jpeg	\N	\N	\N	146	\N	\N	2025-12-05 14:29:24.85
2390	https://platina.vtcrm.ru/uploads/Photos/1173/phpMTzxF0.jpeg	\N	\N	\N	146	\N	\N	2025-12-05 14:29:24.85
2391	https://platina.vtcrm.ru/uploads/Photos/1173/php375Da9.jpeg	\N	\N	\N	146	\N	\N	2025-12-05 14:29:24.85
2392	https://platina.vtcrm.ru/uploads/Photos/1173/phpzvKVLP.jpeg	\N	\N	\N	146	\N	\N	2025-12-05 14:29:24.85
2393	https://platina.vtcrm.ru/uploads/Photos/1173/phpbxknVZ.jpeg	\N	\N	\N	146	\N	\N	2025-12-05 14:29:24.85
2394	https://platina.vtcrm.ru/uploads/Photos/1173/phpLZVxrt.jpeg	\N	\N	\N	146	\N	\N	2025-12-05 14:29:24.85
2395	https://platina.vtcrm.ru/uploads/Photos/1173/phpEvvbDe.jpeg	\N	\N	\N	146	\N	\N	2025-12-05 14:29:24.85
2396	https://platina.vtcrm.ru/uploads/Photos/1173/phpxGNz1M.jpeg	\N	\N	\N	146	\N	\N	2025-12-05 14:29:24.85
2397	https://platina.vtcrm.ru/uploads/Photos/1173/phpJnoCqi.jpeg	\N	\N	\N	146	\N	\N	2025-12-05 14:29:24.85
2398	https://platina.vtcrm.ru/uploads/Photos/1177/php3RuaOh.jpeg	\N	\N	\N	147	\N	\N	2025-12-05 14:34:09.264
2399	https://platina.vtcrm.ru/uploads/Photos/1177/phpG8OhCy.jpeg	\N	\N	\N	147	\N	\N	2025-12-05 14:34:09.264
2400	https://platina.vtcrm.ru/uploads/Photos/1177/php34lm39.jpeg	\N	\N	\N	147	\N	\N	2025-12-05 14:34:09.264
2401	https://platina.vtcrm.ru/uploads/Photos/1177/phpkKThY3.jpeg	\N	\N	\N	147	\N	\N	2025-12-05 14:34:09.264
2402	https://platina.vtcrm.ru/uploads/Photos/1177/phpHKSxwi.jpeg	\N	\N	\N	147	\N	\N	2025-12-05 14:34:09.264
2403	https://platina.vtcrm.ru/uploads/Photos/1177/phpnuZvUb.jpeg	\N	\N	\N	147	\N	\N	2025-12-05 14:34:09.264
2404	https://platina.vtcrm.ru/uploads/Photos/1177/phpvKY5Fj.jpeg	\N	\N	\N	147	\N	\N	2025-12-05 14:34:09.264
2405	https://platina.vtcrm.ru/uploads/Photos/1177/phpDSaD3R.jpeg	\N	\N	\N	147	\N	\N	2025-12-05 14:34:09.264
2406	https://platina.vtcrm.ru/uploads/Photos/1177/phpitxiwG.jpeg	\N	\N	\N	147	\N	\N	2025-12-05 14:34:09.264
2407	https://platina.vtcrm.ru/uploads/Photos/1177/phpoS3Jas.jpeg	\N	\N	\N	147	\N	\N	2025-12-05 14:34:09.264
2408	https://platina.vtcrm.ru/uploads/Photos/1177/phpmEHPG2.jpeg	\N	\N	\N	147	\N	\N	2025-12-05 14:34:09.264
2409	https://platina.vtcrm.ru/uploads/Photos/1178/phpvpsFHe.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:37:58.051
2410	https://platina.vtcrm.ru/uploads/Photos/1178/phpnaRbuR.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:37:58.051
2411	https://platina.vtcrm.ru/uploads/Photos/1178/php2A3eFH.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:37:58.051
2412	https://platina.vtcrm.ru/uploads/Photos/1178/phpSkax2W.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:37:58.051
2413	https://platina.vtcrm.ru/uploads/Photos/1178/phpL6y3Qv.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:37:58.051
2414	https://platina.vtcrm.ru/uploads/Photos/1178/phpce5PI1.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:37:58.051
2415	https://platina.vtcrm.ru/uploads/Photos/1178/phpJSa2vJ.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:37:58.051
2416	https://platina.vtcrm.ru/uploads/Photos/1178/phpgOrSPT.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:37:58.051
2417	https://platina.vtcrm.ru/uploads/Photos/1178/phpvMP1zD.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:37:58.051
2418	https://platina.vtcrm.ru/uploads/Photos/1178/phpU5ByRr.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:37:58.051
2419	https://platina.vtcrm.ru/uploads/Photos/1178/phprZ1o8p.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:37:58.051
2420	https://platina.vtcrm.ru/uploads/Photos/1178/phpMrJsbU.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:37:58.051
2421	https://platina.vtcrm.ru/uploads/Photos/1178/phpHUcTmS.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:37:58.051
2422	https://platina.vtcrm.ru/uploads/Photos/1178/phpqA4dcy.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:37:58.051
2423	https://platina.vtcrm.ru/uploads/Photos/1178/phpcEmdLs.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:37:58.051
2424	https://platina.vtcrm.ru/uploads/Photos/1178/php6vGxIA.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:37:58.051
2425	https://platina.vtcrm.ru/uploads/Photos/1178/php1LY1qK.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:37:58.051
2426	https://platina.vtcrm.ru/uploads/Photos/1178/phpIo0wmv.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:37:58.051
2427	https://platina.vtcrm.ru/uploads/Photos/1179/phpeKb2b5.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:41:12.419
2428	https://platina.vtcrm.ru/uploads/Photos/1179/phpIVq1XJ.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:41:12.419
2429	https://platina.vtcrm.ru/uploads/Photos/1179/phpJ40f2T.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:41:12.419
2430	https://platina.vtcrm.ru/uploads/Photos/1179/phpzoFpEw.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:41:12.419
2431	https://platina.vtcrm.ru/uploads/Photos/1179/phpNKeChe.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:41:12.419
2432	https://platina.vtcrm.ru/uploads/Photos/1179/phpHVV8oO.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:41:12.419
2433	https://platina.vtcrm.ru/uploads/Photos/1179/php4LwoER.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:41:12.419
2434	https://platina.vtcrm.ru/uploads/Photos/1179/phptIti3w.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:41:12.419
2435	https://platina.vtcrm.ru/uploads/Photos/1179/php4HS1Eo.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:41:12.419
2436	https://platina.vtcrm.ru/uploads/Photos/1179/phplSFNsy.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:41:12.419
2437	https://platina.vtcrm.ru/uploads/Photos/1179/phpbFopVP.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:41:12.419
2438	https://platina.vtcrm.ru/uploads/Photos/1179/phpzV3k1C.jpeg	\N	\N	\N	148	\N	\N	2025-12-05 14:41:12.419
2439	https://platina.vtcrm.ru/uploads/Photos/1179/phpeKb2b5.jpeg	\N	\N	\N	149	\N	\N	2025-12-05 14:41:25.188
2440	https://platina.vtcrm.ru/uploads/Photos/1179/phpIVq1XJ.jpeg	\N	\N	\N	149	\N	\N	2025-12-05 14:41:25.188
2441	https://platina.vtcrm.ru/uploads/Photos/1179/phpJ40f2T.jpeg	\N	\N	\N	149	\N	\N	2025-12-05 14:41:25.188
2442	https://platina.vtcrm.ru/uploads/Photos/1179/phpzoFpEw.jpeg	\N	\N	\N	149	\N	\N	2025-12-05 14:41:25.188
2443	https://platina.vtcrm.ru/uploads/Photos/1179/phpNKeChe.jpeg	\N	\N	\N	149	\N	\N	2025-12-05 14:41:25.188
2444	https://platina.vtcrm.ru/uploads/Photos/1179/phpHVV8oO.jpeg	\N	\N	\N	149	\N	\N	2025-12-05 14:41:25.188
2445	https://platina.vtcrm.ru/uploads/Photos/1179/php4LwoER.jpeg	\N	\N	\N	149	\N	\N	2025-12-05 14:41:25.188
2446	https://platina.vtcrm.ru/uploads/Photos/1179/phptIti3w.jpeg	\N	\N	\N	149	\N	\N	2025-12-05 14:41:25.188
2447	https://platina.vtcrm.ru/uploads/Photos/1179/php4HS1Eo.jpeg	\N	\N	\N	149	\N	\N	2025-12-05 14:41:25.188
2448	https://platina.vtcrm.ru/uploads/Photos/1179/phplSFNsy.jpeg	\N	\N	\N	149	\N	\N	2025-12-05 14:41:25.188
2449	https://platina.vtcrm.ru/uploads/Photos/1179/phpbFopVP.jpeg	\N	\N	\N	149	\N	\N	2025-12-05 14:41:25.188
2450	https://platina.vtcrm.ru/uploads/Photos/1179/phpzV3k1C.jpeg	\N	\N	\N	149	\N	\N	2025-12-05 14:41:25.188
2451	https://platina.vtcrm.ru/uploads/Photos/1180/phpqse1tO.jpeg	\N	\N	\N	150	\N	\N	2025-12-05 14:44:27.377
2452	https://platina.vtcrm.ru/uploads/Photos/1180/phpjqdd7U.jpeg	\N	\N	\N	150	\N	\N	2025-12-05 14:44:27.377
2453	https://platina.vtcrm.ru/uploads/Photos/1180/php0h4dxy.jpeg	\N	\N	\N	150	\N	\N	2025-12-05 14:44:27.377
2454	https://platina.vtcrm.ru/uploads/Photos/1180/phpSmFd3t.jpeg	\N	\N	\N	150	\N	\N	2025-12-05 14:44:27.377
2455	https://platina.vtcrm.ru/uploads/Photos/1180/php5ayONB.jpeg	\N	\N	\N	150	\N	\N	2025-12-05 14:44:27.377
2456	https://platina.vtcrm.ru/uploads/Photos/1180/phpjrnF3O.jpeg	\N	\N	\N	150	\N	\N	2025-12-05 14:44:27.377
2457	https://platina.vtcrm.ru/uploads/Photos/1180/phpJcPQox.jpeg	\N	\N	\N	150	\N	\N	2025-12-05 14:44:27.377
2458	https://platina.vtcrm.ru/uploads/Photos/1180/phpNNz8DA.jpeg	\N	\N	\N	150	\N	\N	2025-12-05 14:44:27.377
2459	https://platina.vtcrm.ru/uploads/Photos/1180/phpoQuW7c.jpeg	\N	\N	\N	150	\N	\N	2025-12-05 14:44:27.377
2460	https://platina.vtcrm.ru/uploads/Photos/1180/phpoDzsIF.jpeg	\N	\N	\N	150	\N	\N	2025-12-05 14:44:27.377
2461	https://platina.vtcrm.ru/uploads/Photos/1181/php8IcpbG.jpeg	\N	\N	\N	151	\N	\N	2025-12-05 14:47:08.85
2462	https://platina.vtcrm.ru/uploads/Photos/1181/phpwVMtKu.jpeg	\N	\N	\N	151	\N	\N	2025-12-05 14:47:08.85
2463	https://platina.vtcrm.ru/uploads/Photos/1181/phpTyrVN5.jpeg	\N	\N	\N	151	\N	\N	2025-12-05 14:47:08.85
2464	https://platina.vtcrm.ru/uploads/Photos/1181/phpIVvW6z.jpeg	\N	\N	\N	151	\N	\N	2025-12-05 14:47:08.85
2465	https://platina.vtcrm.ru/uploads/Photos/1181/phpqQQZkT.jpeg	\N	\N	\N	151	\N	\N	2025-12-05 14:47:08.85
2466	https://platina.vtcrm.ru/uploads/Photos/1181/php7KrZaO.jpeg	\N	\N	\N	151	\N	\N	2025-12-05 14:47:08.85
2467	https://platina.vtcrm.ru/uploads/Photos/1182/phpT4IGNE.jpeg	\N	\N	\N	152	\N	\N	2025-12-05 14:51:13.335
2468	https://platina.vtcrm.ru/uploads/Photos/1182/phpJ9wi7D.jpeg	\N	\N	\N	152	\N	\N	2025-12-05 14:51:13.335
2469	https://platina.vtcrm.ru/uploads/Photos/1182/phpoMJkjp.jpeg	\N	\N	\N	152	\N	\N	2025-12-05 14:51:13.335
2470	https://platina.vtcrm.ru/uploads/Photos/1182/phpC50g3h.jpeg	\N	\N	\N	152	\N	\N	2025-12-05 14:51:13.335
2471	https://platina.vtcrm.ru/uploads/Photos/1182/phpYjDKxz.jpeg	\N	\N	\N	152	\N	\N	2025-12-05 14:51:13.335
2472	https://platina.vtcrm.ru/uploads/Photos/1182/phpcnBJqO.jpeg	\N	\N	\N	152	\N	\N	2025-12-05 14:51:13.335
2473	https://platina.vtcrm.ru/uploads/Photos/1182/php4bVnkv.jpeg	\N	\N	\N	152	\N	\N	2025-12-05 14:51:13.335
2474	https://platina.vtcrm.ru/uploads/Photos/1182/phprc3EFE.jpeg	\N	\N	\N	152	\N	\N	2025-12-05 14:51:13.335
2475	https://platina.vtcrm.ru/uploads/Photos/1182/phpxc8AYn.jpeg	\N	\N	\N	152	\N	\N	2025-12-05 14:51:13.335
2476	https://platina.vtcrm.ru/uploads/Photos/1182/phpjPGXz3.jpeg	\N	\N	\N	152	\N	\N	2025-12-05 14:51:13.335
2477	https://platina.vtcrm.ru/uploads/Photos/1182/phpul32E0.jpeg	\N	\N	\N	152	\N	\N	2025-12-05 14:51:13.335
2478	https://platina.vtcrm.ru/uploads/Photos/1182/phpgsYECw.jpeg	\N	\N	\N	152	\N	\N	2025-12-05 14:51:13.335
2479	https://platina.vtcrm.ru/uploads/Photos/1182/phpWaAN5n.jpeg	\N	\N	\N	152	\N	\N	2025-12-05 14:51:13.335
2480	https://platina.vtcrm.ru/uploads/Photos/1182/phpRjvYdC.jpeg	\N	\N	\N	152	\N	\N	2025-12-05 14:51:13.335
2481	https://platina.vtcrm.ru/uploads/Photos/1183/phpbdHXyW.jpeg	\N	\N	\N	153	\N	\N	2025-12-05 14:53:34.715
2482	https://platina.vtcrm.ru/uploads/Photos/1183/phpzWUEgb.jpeg	\N	\N	\N	153	\N	\N	2025-12-05 14:53:34.715
2483	https://platina.vtcrm.ru/uploads/Photos/1183/phpUEPDIs.jpeg	\N	\N	\N	153	\N	\N	2025-12-05 14:53:34.715
2484	https://platina.vtcrm.ru/uploads/Photos/1183/phpC5I3zZ.jpeg	\N	\N	\N	153	\N	\N	2025-12-05 14:53:34.715
2485	https://platina.vtcrm.ru/uploads/Photos/1183/php1Swbve.jpeg	\N	\N	\N	153	\N	\N	2025-12-05 14:53:34.715
2486	https://platina.vtcrm.ru/uploads/Photos/1183/phpjoLxDo.jpeg	\N	\N	\N	153	\N	\N	2025-12-05 14:53:34.715
2487	https://platina.vtcrm.ru/uploads/Photos/1183/phps9jx4Y.jpeg	\N	\N	\N	153	\N	\N	2025-12-05 14:53:34.715
2488	https://platina.vtcrm.ru/uploads/Photos/1183/phpO0b41G.jpeg	\N	\N	\N	153	\N	\N	2025-12-05 14:53:34.715
2489	https://platina.vtcrm.ru/uploads/Photos/1183/phpVjldNJ.jpeg	\N	\N	\N	153	\N	\N	2025-12-05 14:53:34.715
2490	https://platina.vtcrm.ru/uploads/Photos/1184/phpdXOs3z.jpeg	\N	\N	\N	154	\N	\N	2025-12-05 14:56:53.133
2491	https://platina.vtcrm.ru/uploads/Photos/1184/phpenYvrG.jpeg	\N	\N	\N	154	\N	\N	2025-12-05 14:56:53.133
2492	https://platina.vtcrm.ru/uploads/Photos/1184/phpKU0ygi.jpeg	\N	\N	\N	154	\N	\N	2025-12-05 14:56:53.133
2493	https://platina.vtcrm.ru/uploads/Photos/1184/phpJt1Ker.jpeg	\N	\N	\N	154	\N	\N	2025-12-05 14:56:53.133
2494	https://platina.vtcrm.ru/uploads/Photos/1184/php3Q9qyY.jpeg	\N	\N	\N	154	\N	\N	2025-12-05 14:56:53.133
2495	https://platina.vtcrm.ru/uploads/Photos/1184/phpdG0TN1.jpeg	\N	\N	\N	154	\N	\N	2025-12-05 14:56:53.133
2496	https://platina.vtcrm.ru/uploads/Photos/1184/phpXHayDs.jpeg	\N	\N	\N	154	\N	\N	2025-12-05 14:56:53.133
2497	https://platina.vtcrm.ru/uploads/Photos/1184/php09JM15.jpeg	\N	\N	\N	154	\N	\N	2025-12-05 14:56:53.133
2498	https://platina.vtcrm.ru/uploads/Photos/1184/php4rCqCK.jpeg	\N	\N	\N	154	\N	\N	2025-12-05 14:56:53.133
2499	https://platina.vtcrm.ru/uploads/Photos/1184/phpX6M6xX.jpeg	\N	\N	\N	154	\N	\N	2025-12-05 14:56:53.133
2500	https://platina.vtcrm.ru/uploads/Photos/1184/phpwZlh1H.jpeg	\N	\N	\N	154	\N	\N	2025-12-05 14:56:53.133
2501	https://platina.vtcrm.ru/uploads/Photos/1184/php2Y4rf8.jpeg	\N	\N	\N	154	\N	\N	2025-12-05 14:56:53.133
2502	https://platina.vtcrm.ru/uploads/Photos/1184/phpZ8EAny.jpeg	\N	\N	\N	154	\N	\N	2025-12-05 14:56:53.133
2503	https://platina.vtcrm.ru/uploads/Photos/1185/phpin1L3G.jpeg	\N	\N	\N	155	\N	\N	2025-12-05 14:59:34.379
2504	https://platina.vtcrm.ru/uploads/Photos/1185/phpdRVCzK.jpeg	\N	\N	\N	155	\N	\N	2025-12-05 14:59:34.379
2505	https://platina.vtcrm.ru/uploads/Photos/1185/phpK993p7.jpeg	\N	\N	\N	155	\N	\N	2025-12-05 14:59:34.379
2506	https://platina.vtcrm.ru/uploads/Photos/1185/phpyCXPkK.jpeg	\N	\N	\N	155	\N	\N	2025-12-05 14:59:34.379
2507	https://platina.vtcrm.ru/uploads/Photos/1185/phpn13Ae4.jpeg	\N	\N	\N	155	\N	\N	2025-12-05 14:59:34.379
2508	https://platina.vtcrm.ru/uploads/Photos/1187/phpf4eUqW.jpeg	\N	\N	\N	156	\N	\N	2025-12-05 15:01:09.888
2509	https://platina.vtcrm.ru/uploads/Photos/1187/phpevNKnb.jpeg	\N	\N	\N	156	\N	\N	2025-12-05 15:01:09.888
2510	https://platina.vtcrm.ru/uploads/Photos/1187/phpLCM2p0.jpeg	\N	\N	\N	156	\N	\N	2025-12-05 15:01:09.888
2511	https://platina.vtcrm.ru/uploads/Photos/1188/phphwCgHw.jpeg	\N	\N	\N	157	\N	\N	2025-12-05 15:06:06.879
2512	https://platina.vtcrm.ru/uploads/Photos/1188/phphA5zFk.jpeg	\N	\N	\N	157	\N	\N	2025-12-05 15:06:06.879
2513	https://platina.vtcrm.ru/uploads/Photos/1188/phpnYz4mQ.jpeg	\N	\N	\N	157	\N	\N	2025-12-05 15:06:06.879
2514	https://platina.vtcrm.ru/uploads/Photos/1188/phpQXog6r.jpeg	\N	\N	\N	157	\N	\N	2025-12-05 15:06:06.879
2515	https://platina.vtcrm.ru/uploads/Photos/1188/phpRCY5r1.jpeg	\N	\N	\N	157	\N	\N	2025-12-05 15:06:06.879
2516	https://platina.vtcrm.ru/uploads/Photos/1188/phpxuqlIt.jpeg	\N	\N	\N	157	\N	\N	2025-12-05 15:06:06.879
2517	https://platina.vtcrm.ru/uploads/Photos/1188/phpdbUmH5.jpeg	\N	\N	\N	157	\N	\N	2025-12-05 15:06:06.879
2518	https://platina.vtcrm.ru/uploads/Photos/1188/phpbI9IIX.jpeg	\N	\N	\N	157	\N	\N	2025-12-05 15:06:06.879
2519	https://platina.vtcrm.ru/uploads/Photos/1188/php9fahY8.jpeg	\N	\N	\N	157	\N	\N	2025-12-05 15:06:06.879
2520	https://platina.vtcrm.ru/uploads/Photos/1202/phpmrzY7m.jpeg	\N	\N	\N	158	\N	\N	2025-12-05 15:28:19.927
2521	https://platina.vtcrm.ru/uploads/Photos/1202/phpiuYOfp.jpeg	\N	\N	\N	158	\N	\N	2025-12-05 15:28:19.927
2522	https://platina.vtcrm.ru/uploads/Photos/1202/phprLdxLI.jpeg	\N	\N	\N	158	\N	\N	2025-12-05 15:28:19.927
2523	https://platina.vtcrm.ru/uploads/Photos/1202/phpJPnK4N.jpeg	\N	\N	\N	158	\N	\N	2025-12-05 15:28:19.927
2524	https://platina.vtcrm.ru/uploads/Photos/1202/phpvR37Zr.jpeg	\N	\N	\N	158	\N	\N	2025-12-05 15:28:19.927
2525	https://platina.vtcrm.ru/uploads/Photos/1202/phpWUsX8S.jpeg	\N	\N	\N	158	\N	\N	2025-12-05 15:28:19.927
2526	https://platina.vtcrm.ru/uploads/Photos/1203/php55Dwry.jpeg	\N	\N	\N	159	\N	\N	2025-12-05 15:31:52.33
2527	https://platina.vtcrm.ru/uploads/Photos/1203/php0bcWoS.jpeg	\N	\N	\N	159	\N	\N	2025-12-05 15:31:52.33
2528	https://platina.vtcrm.ru/uploads/Photos/1203/phpdyylVX.jpeg	\N	\N	\N	159	\N	\N	2025-12-05 15:31:52.33
2529	https://platina.vtcrm.ru/uploads/Photos/1203/phpfvjdjN.jpeg	\N	\N	\N	159	\N	\N	2025-12-05 15:31:52.33
2530	https://platina.vtcrm.ru/uploads/Photos/1203/phpvuBfZL.jpeg	\N	\N	\N	159	\N	\N	2025-12-05 15:31:52.33
2531	https://platina.vtcrm.ru/uploads/Photos/1203/phpfgxYwj.jpeg	\N	\N	\N	159	\N	\N	2025-12-05 15:31:52.33
2532	https://platina.vtcrm.ru/uploads/Photos/1203/phpvn0hgX.jpeg	\N	\N	\N	159	\N	\N	2025-12-05 15:31:52.33
2533	https://platina.vtcrm.ru/uploads/Photos/1203/phphc34sT.jpeg	\N	\N	\N	159	\N	\N	2025-12-05 15:31:52.33
2534	https://platina.vtcrm.ru/uploads/Photos/1203/phpKyDP1v.jpeg	\N	\N	\N	159	\N	\N	2025-12-05 15:31:52.33
2535	https://platina.vtcrm.ru/uploads/Photos/1203/phpwMXjwN.jpeg	\N	\N	\N	159	\N	\N	2025-12-05 15:31:52.33
2536	https://platina.vtcrm.ru/uploads/Photos/1204/php4p2PnH.jpeg	\N	\N	\N	160	\N	\N	2025-12-05 15:35:39.951
2537	https://platina.vtcrm.ru/uploads/Photos/1204/phpJdfo5m.jpeg	\N	\N	\N	160	\N	\N	2025-12-05 15:35:39.951
2538	https://platina.vtcrm.ru/uploads/Photos/1204/phphT2REG.jpeg	\N	\N	\N	160	\N	\N	2025-12-05 15:35:39.951
2539	https://platina.vtcrm.ru/uploads/Photos/1204/phpJkNoPq.jpeg	\N	\N	\N	160	\N	\N	2025-12-05 15:35:39.951
2540	https://platina.vtcrm.ru/uploads/Photos/1204/phpdBHnkJ.jpeg	\N	\N	\N	160	\N	\N	2025-12-05 15:35:39.951
2541	https://platina.vtcrm.ru/uploads/Photos/1204/phpVuv7j9.jpeg	\N	\N	\N	160	\N	\N	2025-12-05 15:35:39.951
2542	https://platina.vtcrm.ru/uploads/Photos/1204/phpbmJdII.jpeg	\N	\N	\N	160	\N	\N	2025-12-05 15:35:39.951
2543	https://platina.vtcrm.ru/uploads/Photos/1207/phpckQAaN.jpeg	\N	\N	\N	161	\N	\N	2025-12-06 09:46:52.507
2544	https://platina.vtcrm.ru/uploads/Photos/1207/phppg2H0R.jpeg	\N	\N	\N	161	\N	\N	2025-12-06 09:46:52.507
2545	https://platina.vtcrm.ru/uploads/Photos/1207/phpYLkOjG.jpeg	\N	\N	\N	161	\N	\N	2025-12-06 09:46:52.507
2546	https://platina.vtcrm.ru/uploads/Photos/1207/phpJ588ki.jpeg	\N	\N	\N	161	\N	\N	2025-12-06 09:46:52.507
2547	https://platina.vtcrm.ru/uploads/Photos/1207/phpacJhzE.jpeg	\N	\N	\N	161	\N	\N	2025-12-06 09:46:52.507
2548	https://platina.vtcrm.ru/uploads/Photos/1207/phpmvl3PM.jpeg	\N	\N	\N	161	\N	\N	2025-12-06 09:46:52.507
2549	https://platina.vtcrm.ru/uploads/Photos/1207/phpu5YFiY.jpeg	\N	\N	\N	161	\N	\N	2025-12-06 09:46:52.507
2550	https://platina.vtcrm.ru/uploads/Photos/1207/phpd5UFcA.jpeg	\N	\N	\N	161	\N	\N	2025-12-06 09:46:52.507
2551	https://platina.vtcrm.ru/uploads/Photos/1210/php6nwJCQ.jpeg	\N	\N	\N	162	\N	\N	2025-12-06 09:48:39.611
2552	https://platina.vtcrm.ru/uploads/Photos/1210/phpnEMjAK.jpeg	\N	\N	\N	162	\N	\N	2025-12-06 09:48:39.611
2553	https://platina.vtcrm.ru/uploads/Photos/1210/phpZLZD9d.jpeg	\N	\N	\N	162	\N	\N	2025-12-06 09:48:39.611
2554	https://platina.vtcrm.ru/uploads/Photos/1210/phpZm2cPp.jpeg	\N	\N	\N	162	\N	\N	2025-12-06 09:48:39.611
2555	https://platina.vtcrm.ru/uploads/Photos/1211/phpuFf2oa.jpeg	\N	\N	\N	163	\N	\N	2025-12-06 09:51:36.063
2556	https://platina.vtcrm.ru/uploads/Photos/1211/phpFNXn0y.jpeg	\N	\N	\N	163	\N	\N	2025-12-06 09:51:36.063
2557	https://platina.vtcrm.ru/uploads/Photos/1211/phphlMtTj.jpeg	\N	\N	\N	163	\N	\N	2025-12-06 09:51:36.063
2558	https://platina.vtcrm.ru/uploads/Photos/1211/phpjUtGzh.jpeg	\N	\N	\N	163	\N	\N	2025-12-06 09:51:36.063
2559	https://platina.vtcrm.ru/uploads/Photos/1211/phpVJO2CA.jpeg	\N	\N	\N	163	\N	\N	2025-12-06 09:51:36.063
2560	https://platina.vtcrm.ru/uploads/Photos/1211/phpTojcyq.jpeg	\N	\N	\N	163	\N	\N	2025-12-06 09:51:36.063
2561	https://platina.vtcrm.ru/uploads/Photos/1211/phpE9zCab.jpeg	\N	\N	\N	163	\N	\N	2025-12-06 09:51:36.063
2562	https://platina.vtcrm.ru/uploads/Photos/1211/php7nQGT1.jpeg	\N	\N	\N	163	\N	\N	2025-12-06 09:51:36.063
2563	https://platina.vtcrm.ru/uploads/Photos/1211/phpWEM1TH.jpeg	\N	\N	\N	163	\N	\N	2025-12-06 09:51:36.063
2564	https://platina.vtcrm.ru/uploads/Photos/1211/phphyIvUM.jpeg	\N	\N	\N	163	\N	\N	2025-12-06 09:51:36.063
2565	https://platina.vtcrm.ru/uploads/Photos/1214/php4j2mz6.jpeg	\N	\N	\N	164	\N	\N	2025-12-06 09:55:13.956
2566	https://platina.vtcrm.ru/uploads/Photos/1214/phpfsJ8sk.jpeg	\N	\N	\N	164	\N	\N	2025-12-06 09:55:13.956
2567	https://platina.vtcrm.ru/uploads/Photos/1214/phpeeplw1.jpeg	\N	\N	\N	164	\N	\N	2025-12-06 09:55:13.956
2568	https://platina.vtcrm.ru/uploads/Photos/1214/phpjQOQ4R.jpeg	\N	\N	\N	164	\N	\N	2025-12-06 09:55:13.956
2569	https://platina.vtcrm.ru/uploads/Photos/1214/phpfZVR8H.jpeg	\N	\N	\N	164	\N	\N	2025-12-06 09:55:13.956
2570	https://platina.vtcrm.ru/uploads/Photos/1214/php8bSIaB.jpeg	\N	\N	\N	164	\N	\N	2025-12-06 09:55:13.956
2571	https://platina.vtcrm.ru/uploads/Photos/1214/phpbtRmIv.jpeg	\N	\N	\N	164	\N	\N	2025-12-06 09:55:13.956
2572	https://platina.vtcrm.ru/uploads/Photos/1214/phphR6rVD.jpeg	\N	\N	\N	164	\N	\N	2025-12-06 09:55:13.956
2573	https://platina.vtcrm.ru/uploads/Photos/1214/php277bMo.jpeg	\N	\N	\N	164	\N	\N	2025-12-06 09:55:13.956
2574	https://platina.vtcrm.ru/uploads/Photos/1214/php8BfqWV.jpeg	\N	\N	\N	164	\N	\N	2025-12-06 09:55:13.956
2575	https://platina.vtcrm.ru/uploads/Photos/1214/phpoCd5u6.jpeg	\N	\N	\N	164	\N	\N	2025-12-06 09:55:13.956
2576	https://platina.vtcrm.ru/uploads/Photos/1214/phplzBPkN.jpeg	\N	\N	\N	164	\N	\N	2025-12-06 09:55:13.956
2577	https://platina.vtcrm.ru/uploads/Photos/1214/phpzcQdMc.jpeg	\N	\N	\N	164	\N	\N	2025-12-06 09:55:13.956
2578	https://platina.vtcrm.ru/uploads/Photos/1214/phpKntEmq.jpeg	\N	\N	\N	164	\N	\N	2025-12-06 09:55:13.956
2579	https://platina.vtcrm.ru/uploads/Photos/1214/phpF5z7aF.jpeg	\N	\N	\N	164	\N	\N	2025-12-06 09:55:13.956
2580	https://platina.vtcrm.ru/uploads/Photos/1214/phpNQz34G.jpeg	\N	\N	\N	164	\N	\N	2025-12-06 09:55:13.956
2581	https://platina.vtcrm.ru/uploads/Photos/1214/phpIMsf5W.jpeg	\N	\N	\N	164	\N	\N	2025-12-06 09:55:13.956
2582	https://platina.vtcrm.ru/uploads/Photos/1214/phpKYr74l.jpeg	\N	\N	\N	164	\N	\N	2025-12-06 09:55:13.956
2583	https://platina.vtcrm.ru/uploads/Photos/1214/phpIZ5gKA.jpeg	\N	\N	\N	164	\N	\N	2025-12-06 09:55:13.956
2584	https://platina.vtcrm.ru/uploads/Photos/1219/phpFine82.jpeg	\N	\N	\N	165	\N	\N	2025-12-06 10:00:43.692
2585	https://platina.vtcrm.ru/uploads/Photos/1219/phpjZnypH.jpeg	\N	\N	\N	165	\N	\N	2025-12-06 10:00:43.692
2586	https://platina.vtcrm.ru/uploads/Photos/1219/phpQbOcb2.jpeg	\N	\N	\N	165	\N	\N	2025-12-06 10:00:43.692
2587	https://platina.vtcrm.ru/uploads/Photos/1219/php5n44Sy.jpeg	\N	\N	\N	165	\N	\N	2025-12-06 10:00:43.692
2588	https://platina.vtcrm.ru/uploads/Photos/1219/phpScZ14V.jpeg	\N	\N	\N	165	\N	\N	2025-12-06 10:00:43.692
2589	https://platina.vtcrm.ru/uploads/Photos/1219/phpvvVFkF.jpeg	\N	\N	\N	165	\N	\N	2025-12-06 10:00:43.692
2590	https://platina.vtcrm.ru/uploads/Photos/1219/phpl1vDpg.jpeg	\N	\N	\N	165	\N	\N	2025-12-06 10:00:43.692
2591	https://platina.vtcrm.ru/uploads/Photos/1219/phpSYSJfD.jpeg	\N	\N	\N	165	\N	\N	2025-12-06 10:00:43.692
2592	https://platina.vtcrm.ru/uploads/Photos/1219/phpvNdRca.jpeg	\N	\N	\N	165	\N	\N	2025-12-06 10:00:43.692
2593	https://platina.vtcrm.ru/uploads/Photos/1221/php47qlMI.jpeg	\N	\N	\N	166	\N	\N	2025-12-06 10:03:10.543
2594	https://platina.vtcrm.ru/uploads/Photos/1221/phpE9uIvi.jpeg	\N	\N	\N	166	\N	\N	2025-12-06 10:03:10.543
2595	https://platina.vtcrm.ru/uploads/Photos/1221/phpzQQ620.jpeg	\N	\N	\N	166	\N	\N	2025-12-06 10:03:10.543
2596	https://platina.vtcrm.ru/uploads/Photos/1221/phpWOvGUX.jpeg	\N	\N	\N	166	\N	\N	2025-12-06 10:03:10.543
2597	https://platina.vtcrm.ru/uploads/Photos/1221/phpus7im0.jpeg	\N	\N	\N	166	\N	\N	2025-12-06 10:03:10.543
2598	https://platina.vtcrm.ru/uploads/Photos/1221/phpAhr6Po.jpeg	\N	\N	\N	166	\N	\N	2025-12-06 10:03:10.543
2599	https://platina.vtcrm.ru/uploads/Photos/1221/phpkD2Ve9.jpeg	\N	\N	\N	166	\N	\N	2025-12-06 10:03:10.543
2600	https://platina.vtcrm.ru/uploads/Photos/1223/phpBaNbLA.jpeg	\N	\N	\N	167	\N	\N	2025-12-06 10:07:19.754
2601	https://platina.vtcrm.ru/uploads/Photos/1223/php5gAzmh.jpeg	\N	\N	\N	167	\N	\N	2025-12-06 10:07:19.754
2602	https://platina.vtcrm.ru/uploads/Photos/1223/phpFQ0KwL.jpeg	\N	\N	\N	167	\N	\N	2025-12-06 10:07:19.754
2603	https://platina.vtcrm.ru/uploads/Photos/1223/phpSapfnV.jpeg	\N	\N	\N	167	\N	\N	2025-12-06 10:07:19.754
2604	https://platina.vtcrm.ru/uploads/Photos/1223/php25qZhg.jpeg	\N	\N	\N	167	\N	\N	2025-12-06 10:07:19.754
2605	https://platina.vtcrm.ru/uploads/Photos/1223/phpHuwwTF.jpeg	\N	\N	\N	167	\N	\N	2025-12-06 10:07:19.754
2606	https://platina.vtcrm.ru/uploads/Photos/1223/phpiOuOCB.jpeg	\N	\N	\N	167	\N	\N	2025-12-06 10:07:19.754
2607	https://platina.vtcrm.ru/uploads/Photos/1223/phpoWwpA6.jpeg	\N	\N	\N	167	\N	\N	2025-12-06 10:07:19.754
2608	https://platina.vtcrm.ru/uploads/Photos/1223/php8We8cC.jpeg	\N	\N	\N	167	\N	\N	2025-12-06 10:07:19.754
2609	https://platina.vtcrm.ru/uploads/Photos/1223/phpMucWYt.jpeg	\N	\N	\N	167	\N	\N	2025-12-06 10:07:19.754
2610	https://platina.vtcrm.ru/uploads/Photos/1223/phpTua6W0.jpeg	\N	\N	\N	167	\N	\N	2025-12-06 10:07:19.754
2611	https://platina.vtcrm.ru/uploads/Photos/1223/phpX9bMXU.jpeg	\N	\N	\N	167	\N	\N	2025-12-06 10:07:19.754
2612	https://platina.vtcrm.ru/uploads/Photos/1223/phpLT9gRs.jpeg	\N	\N	\N	167	\N	\N	2025-12-06 10:07:19.754
2613	https://platina.vtcrm.ru/uploads/Photos/1225/phpT0wcEC.jpeg	\N	\N	\N	168	\N	\N	2025-12-06 10:10:18.921
2614	https://platina.vtcrm.ru/uploads/Photos/1225/phpF47Mrr.jpeg	\N	\N	\N	168	\N	\N	2025-12-06 10:10:18.921
2615	https://platina.vtcrm.ru/uploads/Photos/1225/phpES2N6u.jpeg	\N	\N	\N	168	\N	\N	2025-12-06 10:10:18.921
2616	https://platina.vtcrm.ru/uploads/Photos/1225/phpGJK7PF.jpeg	\N	\N	\N	168	\N	\N	2025-12-06 10:10:18.921
2617	https://platina.vtcrm.ru/uploads/Photos/1225/phpNHbyVg.jpeg	\N	\N	\N	168	\N	\N	2025-12-06 10:10:18.921
2618	https://platina.vtcrm.ru/uploads/Photos/1225/phpTThqUG.jpeg	\N	\N	\N	168	\N	\N	2025-12-06 10:10:18.921
2619	https://platina.vtcrm.ru/uploads/Photos/1225/phpRDAhzR.jpeg	\N	\N	\N	168	\N	\N	2025-12-06 10:10:18.921
2620	https://platina.vtcrm.ru/uploads/Photos/1225/phpW8sZmU.jpeg	\N	\N	\N	168	\N	\N	2025-12-06 10:10:18.921
2621	https://platina.vtcrm.ru/uploads/Photos/1225/phpJqk9pt.jpeg	\N	\N	\N	168	\N	\N	2025-12-06 10:10:18.921
2622	https://platina.vtcrm.ru/uploads/Photos/1225/phpio3nZ8.jpeg	\N	\N	\N	168	\N	\N	2025-12-06 10:10:18.921
2623	https://platina.vtcrm.ru/uploads/Photos/1225/php981m1e.jpeg	\N	\N	\N	168	\N	\N	2025-12-06 10:10:18.921
2624	https://platina.vtcrm.ru/uploads/Photos/1225/phpWhB0Gx.jpeg	\N	\N	\N	168	\N	\N	2025-12-06 10:10:18.921
2625	https://platina.vtcrm.ru/uploads/Photos/1225/php3avkRC.jpeg	\N	\N	\N	168	\N	\N	2025-12-06 10:10:18.921
2626	https://platina.vtcrm.ru/uploads/Photos/1226/phpznipp0.jpeg	\N	\N	\N	169	\N	\N	2025-12-06 10:13:30.733
2627	https://platina.vtcrm.ru/uploads/Photos/1226/phpBNoDOY.jpeg	\N	\N	\N	169	\N	\N	2025-12-06 10:13:30.733
2628	https://platina.vtcrm.ru/uploads/Photos/1226/phpuBoxmJ.jpeg	\N	\N	\N	169	\N	\N	2025-12-06 10:13:30.733
2629	https://platina.vtcrm.ru/uploads/Photos/1226/phpAvYkkc.jpeg	\N	\N	\N	169	\N	\N	2025-12-06 10:13:30.733
2630	https://platina.vtcrm.ru/uploads/Photos/1226/phpCkBNQX.jpeg	\N	\N	\N	169	\N	\N	2025-12-06 10:13:30.733
2631	https://platina.vtcrm.ru/uploads/Photos/1226/phpqGOIux.jpeg	\N	\N	\N	169	\N	\N	2025-12-06 10:13:30.733
2632	https://platina.vtcrm.ru/uploads/Photos/1226/phpOzbiix.jpeg	\N	\N	\N	169	\N	\N	2025-12-06 10:13:30.733
2633	https://platina.vtcrm.ru/uploads/Photos/1226/phpocsCr3.jpeg	\N	\N	\N	169	\N	\N	2025-12-06 10:13:30.733
2634	https://platina.vtcrm.ru/uploads/Photos/1226/php0HKVHI.jpeg	\N	\N	\N	169	\N	\N	2025-12-06 10:13:30.733
2635	https://platina.vtcrm.ru/uploads/Photos/1226/phpj4zMGp.jpeg	\N	\N	\N	169	\N	\N	2025-12-06 10:13:30.733
2636	https://platina.vtcrm.ru/uploads/Photos/1226/phpFjxtKi.jpeg	\N	\N	\N	169	\N	\N	2025-12-06 10:13:30.733
2637	https://platina.vtcrm.ru/uploads/Photos/1226/phpioLlgb.jpeg	\N	\N	\N	169	\N	\N	2025-12-06 10:13:30.733
2638	https://platina.vtcrm.ru/uploads/Photos/1226/php9YjFBr.jpeg	\N	\N	\N	169	\N	\N	2025-12-06 10:13:30.733
2639	https://platina.vtcrm.ru/uploads/Photos/1226/phpHtIT4C.jpeg	\N	\N	\N	169	\N	\N	2025-12-06 10:13:30.733
2640	https://platina.vtcrm.ru/uploads/Photos/1226/phpmiUIq3.jpeg	\N	\N	\N	169	\N	\N	2025-12-06 10:13:30.733
2641	https://platina.vtcrm.ru/uploads/Photos/1227/phpQG9KLr.jpeg	\N	\N	\N	170	\N	\N	2025-12-06 10:16:40.645
2642	https://platina.vtcrm.ru/uploads/Photos/1227/phpuDS3f0.jpeg	\N	\N	\N	170	\N	\N	2025-12-06 10:16:40.645
2643	https://platina.vtcrm.ru/uploads/Photos/1227/phpOfnywE.jpeg	\N	\N	\N	170	\N	\N	2025-12-06 10:16:40.645
2644	https://platina.vtcrm.ru/uploads/Photos/1227/phpzhU2XT.jpeg	\N	\N	\N	170	\N	\N	2025-12-06 10:16:40.645
2645	https://platina.vtcrm.ru/uploads/Photos/1227/phpUbneRF.jpeg	\N	\N	\N	170	\N	\N	2025-12-06 10:16:40.645
2646	https://platina.vtcrm.ru/uploads/Photos/1227/phpBUYg5s.jpeg	\N	\N	\N	170	\N	\N	2025-12-06 10:16:40.645
2647	https://platina.vtcrm.ru/uploads/Photos/1227/phpuob4Gz.jpeg	\N	\N	\N	170	\N	\N	2025-12-06 10:16:40.645
2648	https://platina.vtcrm.ru/uploads/Photos/1227/phpCvKYOq.jpeg	\N	\N	\N	170	\N	\N	2025-12-06 10:16:40.645
2649	https://platina.vtcrm.ru/uploads/Photos/1227/php4qGtP9.jpeg	\N	\N	\N	170	\N	\N	2025-12-06 10:16:40.645
2650	https://platina.vtcrm.ru/uploads/Photos/1227/phpAXTgOg.jpeg	\N	\N	\N	170	\N	\N	2025-12-06 10:16:40.645
2651	https://platina.vtcrm.ru/uploads/Photos/1227/phpYzUTN5.jpeg	\N	\N	\N	170	\N	\N	2025-12-06 10:16:40.645
2652	https://platina.vtcrm.ru/uploads/Photos/1227/phpI58JMi.jpeg	\N	\N	\N	170	\N	\N	2025-12-06 10:16:40.645
2653	https://platina.vtcrm.ru/uploads/Photos/1231/phpk7bRKw.jpeg	\N	\N	\N	171	\N	\N	2025-12-06 10:19:17.499
2654	https://platina.vtcrm.ru/uploads/Photos/1231/phpnJ7s5d.jpeg	\N	\N	\N	171	\N	\N	2025-12-06 10:19:17.499
2655	https://platina.vtcrm.ru/uploads/Photos/1231/phpVtkBYU.jpeg	\N	\N	\N	171	\N	\N	2025-12-06 10:19:17.499
2656	https://platina.vtcrm.ru/uploads/Photos/1231/phpdwjy54.jpeg	\N	\N	\N	171	\N	\N	2025-12-06 10:19:17.499
2657	https://platina.vtcrm.ru/uploads/Photos/1231/phpsqHoxz.jpeg	\N	\N	\N	171	\N	\N	2025-12-06 10:19:17.499
2658	https://platina.vtcrm.ru/uploads/Photos/1235/php86Cqb3.jpeg	\N	\N	\N	172	\N	\N	2025-12-06 10:22:32.855
2659	https://platina.vtcrm.ru/uploads/Photos/1235/phpiDDdFL.jpeg	\N	\N	\N	172	\N	\N	2025-12-06 10:22:32.855
2660	https://platina.vtcrm.ru/uploads/Photos/1235/phpQgW5Ov.jpeg	\N	\N	\N	172	\N	\N	2025-12-06 10:22:32.855
2661	https://platina.vtcrm.ru/uploads/Photos/1235/phpW42JGf.jpeg	\N	\N	\N	172	\N	\N	2025-12-06 10:22:32.855
2662	https://platina.vtcrm.ru/uploads/Photos/1235/phpVmBiyH.jpeg	\N	\N	\N	172	\N	\N	2025-12-06 10:22:32.855
2663	https://platina.vtcrm.ru/uploads/Photos/1235/phpDJSf0w.jpeg	\N	\N	\N	172	\N	\N	2025-12-06 10:22:32.855
2664	https://platina.vtcrm.ru/uploads/Photos/1235/phppLiIhz.jpeg	\N	\N	\N	172	\N	\N	2025-12-06 10:22:32.855
2665	https://platina.vtcrm.ru/uploads/Photos/1235/phpIrULZd.jpeg	\N	\N	\N	172	\N	\N	2025-12-06 10:22:32.855
2666	https://platina.vtcrm.ru/uploads/Photos/1235/php4s6Vpi.jpeg	\N	\N	\N	172	\N	\N	2025-12-06 10:22:32.855
2667	https://platina.vtcrm.ru/uploads/Photos/1235/phpMGbb4t.jpeg	\N	\N	\N	172	\N	\N	2025-12-06 10:22:32.855
2668	https://platina.vtcrm.ru/uploads/Photos/1235/phpwMymN0.jpeg	\N	\N	\N	172	\N	\N	2025-12-06 10:22:32.855
2669	https://platina.vtcrm.ru/uploads/Photos/1235/phpZpnVK3.jpeg	\N	\N	\N	172	\N	\N	2025-12-06 10:22:32.855
2670	https://platina.vtcrm.ru/uploads/Photos/1235/phpc42yaY.jpeg	\N	\N	\N	172	\N	\N	2025-12-06 10:22:32.855
2671	https://platina.vtcrm.ru/uploads/Photos/1235/phpwTULka.jpeg	\N	\N	\N	172	\N	\N	2025-12-06 10:22:32.855
2672	https://platina.vtcrm.ru/uploads/Photos/1236/phpZ5nYcf.jpeg	\N	\N	\N	173	\N	\N	2025-12-06 10:37:33.273
2673	https://platina.vtcrm.ru/uploads/Photos/1236/phph2VW0s.jpeg	\N	\N	\N	173	\N	\N	2025-12-06 10:37:33.273
2674	https://platina.vtcrm.ru/uploads/Photos/1236/php7DCUYs.jpeg	\N	\N	\N	173	\N	\N	2025-12-06 10:37:33.273
2675	https://platina.vtcrm.ru/uploads/Photos/1236/phpXj92WY.jpeg	\N	\N	\N	173	\N	\N	2025-12-06 10:37:33.273
2676	https://platina.vtcrm.ru/uploads/Photos/1236/phpxrs17B.jpeg	\N	\N	\N	173	\N	\N	2025-12-06 10:37:33.273
2677	https://platina.vtcrm.ru/uploads/Photos/1236/phpXVSrT2.jpeg	\N	\N	\N	173	\N	\N	2025-12-06 10:37:33.273
2678	https://platina.vtcrm.ru/uploads/Photos/1236/phpWtJ29q.jpeg	\N	\N	\N	173	\N	\N	2025-12-06 10:37:33.273
2679	https://platina.vtcrm.ru/uploads/Photos/1236/phpQpXnV0.jpeg	\N	\N	\N	173	\N	\N	2025-12-06 10:37:33.273
2680	https://platina.vtcrm.ru/uploads/Photos/1236/phpi42zxj.jpeg	\N	\N	\N	173	\N	\N	2025-12-06 10:37:33.273
2681	https://platina.vtcrm.ru/uploads/Photos/1236/phpz9Epw5.jpeg	\N	\N	\N	173	\N	\N	2025-12-06 10:37:33.273
2682	https://platina.vtcrm.ru/uploads/Photos/1236/phpXvhF4T.jpeg	\N	\N	\N	173	\N	\N	2025-12-06 10:37:33.273
2683	https://platina.vtcrm.ru/uploads/Photos/1236/phpJzaAXX.jpeg	\N	\N	\N	173	\N	\N	2025-12-06 10:37:33.273
2684	https://platina.vtcrm.ru/uploads/Photos/1236/phprz7CQY.jpeg	\N	\N	\N	173	\N	\N	2025-12-06 10:37:33.273
2685	https://platina.vtcrm.ru/uploads/Photos/1236/phpjFFF46.jpeg	\N	\N	\N	173	\N	\N	2025-12-06 10:37:33.273
2686	https://platina.vtcrm.ru/uploads/Photos/1236/phperCQ7A.jpeg	\N	\N	\N	173	\N	\N	2025-12-06 10:37:33.273
2687	https://platina.vtcrm.ru/uploads/Photos/1236/php7hbIul.jpeg	\N	\N	\N	173	\N	\N	2025-12-06 10:37:33.273
2688	https://platina.vtcrm.ru/uploads/Photos/1236/phpGrmnPM.jpeg	\N	\N	\N	173	\N	\N	2025-12-06 10:37:33.273
2689	https://platina.vtcrm.ru/uploads/Photos/1236/phpt0YzIZ.jpeg	\N	\N	\N	173	\N	\N	2025-12-06 10:37:33.273
2690	https://platina.vtcrm.ru/uploads/Photos/1237/phpdaYgYs.jpeg	\N	\N	\N	174	\N	\N	2025-12-06 10:40:27.965
2691	https://platina.vtcrm.ru/uploads/Photos/1237/php5V1hi2.jpeg	\N	\N	\N	174	\N	\N	2025-12-06 10:40:27.965
2692	https://platina.vtcrm.ru/uploads/Photos/1237/phpBVJ4Wg.jpeg	\N	\N	\N	174	\N	\N	2025-12-06 10:40:27.965
2693	https://platina.vtcrm.ru/uploads/Photos/1237/phpzvEqvk.jpeg	\N	\N	\N	174	\N	\N	2025-12-06 10:40:27.965
2694	https://platina.vtcrm.ru/uploads/Photos/1237/phpWMBY0X.jpeg	\N	\N	\N	174	\N	\N	2025-12-06 10:40:27.965
2695	https://platina.vtcrm.ru/uploads/Photos/1237/phpAVNyUw.jpeg	\N	\N	\N	174	\N	\N	2025-12-06 10:40:27.965
2696	https://platina.vtcrm.ru/uploads/Photos/1237/phpLrTRd9.jpeg	\N	\N	\N	174	\N	\N	2025-12-06 10:40:27.965
2697	https://platina.vtcrm.ru/uploads/Photos/1237/phpWsaean.jpeg	\N	\N	\N	174	\N	\N	2025-12-06 10:40:27.965
2698	https://platina.vtcrm.ru/uploads/Photos/1237/phppBQKim.jpeg	\N	\N	\N	174	\N	\N	2025-12-06 10:40:27.965
2699	https://platina.vtcrm.ru/uploads/Photos/1237/phpui4cpU.jpeg	\N	\N	\N	174	\N	\N	2025-12-06 10:40:27.965
2700	https://platina.vtcrm.ru/uploads/Photos/1237/phpXPP2pa.jpeg	\N	\N	\N	174	\N	\N	2025-12-06 10:40:27.965
2701	https://platina.vtcrm.ru/uploads/Photos/1240/phpKWKybT.jpeg	\N	\N	\N	175	\N	\N	2025-12-06 10:45:26.751
2702	https://platina.vtcrm.ru/uploads/Photos/1240/phpCvi5Fy.jpeg	\N	\N	\N	175	\N	\N	2025-12-06 10:45:26.751
2703	https://platina.vtcrm.ru/uploads/Photos/1240/phpljb7C2.jpeg	\N	\N	\N	175	\N	\N	2025-12-06 10:45:26.751
2704	https://platina.vtcrm.ru/uploads/Photos/1240/phpGLy35G.jpeg	\N	\N	\N	175	\N	\N	2025-12-06 10:45:26.751
2705	https://platina.vtcrm.ru/uploads/Photos/1240/phpNlKoe2.jpeg	\N	\N	\N	175	\N	\N	2025-12-06 10:45:26.751
2706	https://platina.vtcrm.ru/uploads/Photos/1240/phpCVUcAM.jpeg	\N	\N	\N	175	\N	\N	2025-12-06 10:45:26.751
2707	https://platina.vtcrm.ru/uploads/Photos/1240/php8wEPkK.jpeg	\N	\N	\N	175	\N	\N	2025-12-06 10:45:26.751
2708	https://platina.vtcrm.ru/uploads/Photos/1240/php1UTU4L.jpeg	\N	\N	\N	175	\N	\N	2025-12-06 10:45:26.751
2709	https://platina.vtcrm.ru/uploads/Photos/1240/phpVZ7vdr.jpeg	\N	\N	\N	175	\N	\N	2025-12-06 10:45:26.751
2710	https://platina.vtcrm.ru/uploads/Photos/1240/phpmEJW3p.jpeg	\N	\N	\N	175	\N	\N	2025-12-06 10:45:26.751
2711	https://platina.vtcrm.ru/uploads/Photos/1240/phpLu1thd.jpeg	\N	\N	\N	175	\N	\N	2025-12-06 10:45:26.751
2712	https://platina.vtcrm.ru/uploads/Photos/1240/phpje5Jt3.jpeg	\N	\N	\N	175	\N	\N	2025-12-06 10:45:26.751
2713	https://platina.vtcrm.ru/uploads/Photos/1240/phpetQ2io.jpeg	\N	\N	\N	175	\N	\N	2025-12-06 10:45:26.751
2714	https://platina.vtcrm.ru/uploads/Photos/1245/phpnVvyTo.jpeg	\N	\N	\N	176	\N	\N	2025-12-06 10:48:24.693
2715	https://platina.vtcrm.ru/uploads/Photos/1245/phpSNA5no.jpeg	\N	\N	\N	176	\N	\N	2025-12-06 10:48:24.693
2716	https://platina.vtcrm.ru/uploads/Photos/1245/phpEZDp25.jpeg	\N	\N	\N	176	\N	\N	2025-12-06 10:48:24.693
2717	https://platina.vtcrm.ru/uploads/Photos/1245/php0bQCBs.jpeg	\N	\N	\N	176	\N	\N	2025-12-06 10:48:24.693
2718	https://platina.vtcrm.ru/uploads/Photos/1245/phphSiHVb.jpeg	\N	\N	\N	176	\N	\N	2025-12-06 10:48:24.693
2719	https://platina.vtcrm.ru/uploads/Photos/1245/phpizeNDn.jpeg	\N	\N	\N	176	\N	\N	2025-12-06 10:48:24.693
2720	https://platina.vtcrm.ru/uploads/Photos/1245/phpsmiKLn.jpeg	\N	\N	\N	176	\N	\N	2025-12-06 10:48:24.693
2721	https://platina.vtcrm.ru/uploads/Photos/1245/phpmaUVea.jpeg	\N	\N	\N	176	\N	\N	2025-12-06 10:48:24.693
2722	https://platina.vtcrm.ru/uploads/Photos/1245/php2dCmkT.jpeg	\N	\N	\N	176	\N	\N	2025-12-06 10:48:24.693
2723	https://platina.vtcrm.ru/uploads/Photos/1245/phpJpstJQ.jpeg	\N	\N	\N	176	\N	\N	2025-12-06 10:48:24.693
2724	https://platina.vtcrm.ru/uploads/Photos/1245/phpA9tdxv.jpeg	\N	\N	\N	176	\N	\N	2025-12-06 10:48:24.693
2725	https://platina.vtcrm.ru/uploads/Photos/1245/php56EE0w.jpeg	\N	\N	\N	176	\N	\N	2025-12-06 10:48:24.693
2726	https://platina.vtcrm.ru/uploads/Photos/1248/phpYVNepR.jpeg	\N	\N	\N	177	\N	\N	2025-12-06 10:52:13.767
2727	https://platina.vtcrm.ru/uploads/Photos/1248/phpvVQWS4.jpeg	\N	\N	\N	177	\N	\N	2025-12-06 10:52:13.767
2728	https://platina.vtcrm.ru/uploads/Photos/1248/php2Yqj9L.jpeg	\N	\N	\N	177	\N	\N	2025-12-06 10:52:13.767
2729	https://platina.vtcrm.ru/uploads/Photos/1248/phpPlfU69.jpeg	\N	\N	\N	177	\N	\N	2025-12-06 10:52:13.767
2730	https://platina.vtcrm.ru/uploads/Photos/1248/phpyqokHx.jpeg	\N	\N	\N	177	\N	\N	2025-12-06 10:52:13.767
2731	https://platina.vtcrm.ru/uploads/Photos/1248/phpVfSdx5.jpeg	\N	\N	\N	177	\N	\N	2025-12-06 10:52:13.767
2732	https://platina.vtcrm.ru/uploads/Photos/1248/phpdmi0rl.jpeg	\N	\N	\N	177	\N	\N	2025-12-06 10:52:13.767
2733	https://platina.vtcrm.ru/uploads/Photos/1248/phpAhyJKt.jpeg	\N	\N	\N	177	\N	\N	2025-12-06 10:52:13.767
2734	https://platina.vtcrm.ru/uploads/Photos/1248/phpuS6tYz.jpeg	\N	\N	\N	177	\N	\N	2025-12-06 10:52:13.767
2735	https://platina.vtcrm.ru/uploads/Photos/1248/phppeW4qy.jpeg	\N	\N	\N	177	\N	\N	2025-12-06 10:52:13.767
2736	https://platina.vtcrm.ru/uploads/Photos/1248/phphL0DPX.jpeg	\N	\N	\N	177	\N	\N	2025-12-06 10:52:13.767
2737	https://platina.vtcrm.ru/uploads/Photos/1248/phpURBKgf.jpeg	\N	\N	\N	177	\N	\N	2025-12-06 10:52:13.767
2738	https://platina.vtcrm.ru/uploads/Photos/1248/phpjDsRfh.jpeg	\N	\N	\N	177	\N	\N	2025-12-06 10:52:13.767
2739	https://platina.vtcrm.ru/uploads/Photos/1248/phpWYpku8.jpeg	\N	\N	\N	177	\N	\N	2025-12-06 10:52:13.767
2740	https://platina.vtcrm.ru/uploads/Photos/1248/php7hpLVx.jpeg	\N	\N	\N	177	\N	\N	2025-12-06 10:52:13.767
2741	https://platina.vtcrm.ru/uploads/Photos/1255/phpjS9sVV.jpeg	\N	\N	\N	178	\N	\N	2025-12-06 10:55:45.909
2742	https://platina.vtcrm.ru/uploads/Photos/1255/phpJJy41W.jpeg	\N	\N	\N	178	\N	\N	2025-12-06 10:55:45.909
2743	https://platina.vtcrm.ru/uploads/Photos/1255/phpdh3JPE.jpeg	\N	\N	\N	178	\N	\N	2025-12-06 10:55:45.909
2744	https://platina.vtcrm.ru/uploads/Photos/1255/phplWn6FR.jpeg	\N	\N	\N	178	\N	\N	2025-12-06 10:55:45.909
2745	https://platina.vtcrm.ru/uploads/Photos/1255/phpECeBQ6.jpeg	\N	\N	\N	178	\N	\N	2025-12-06 10:55:45.909
2746	https://platina.vtcrm.ru/uploads/Photos/1255/phpCHww9L.jpeg	\N	\N	\N	178	\N	\N	2025-12-06 10:55:45.909
2747	https://platina.vtcrm.ru/uploads/Photos/1255/phpOGnadN.jpeg	\N	\N	\N	178	\N	\N	2025-12-06 10:55:45.909
2748	https://platina.vtcrm.ru/uploads/Photos/1255/phpDe96c5.jpeg	\N	\N	\N	178	\N	\N	2025-12-06 10:55:45.909
2749	https://platina.vtcrm.ru/uploads/Photos/1255/phpRtqTmU.jpeg	\N	\N	\N	178	\N	\N	2025-12-06 10:55:45.909
2750	https://platina.vtcrm.ru/uploads/Photos/1255/phpJCfBzL.jpeg	\N	\N	\N	178	\N	\N	2025-12-06 10:55:45.909
2751	https://platina.vtcrm.ru/uploads/Photos/1255/phpsVia0T.jpeg	\N	\N	\N	178	\N	\N	2025-12-06 10:55:45.909
2752	https://platina.vtcrm.ru/uploads/Photos/1255/phpzOc0YU.jpeg	\N	\N	\N	178	\N	\N	2025-12-06 10:55:45.909
2753	https://platina.vtcrm.ru/uploads/Photos/1255/phprgu4NG.jpeg	\N	\N	\N	178	\N	\N	2025-12-06 10:55:45.909
2754	https://platina.vtcrm.ru/uploads/Photos/1255/php3rBucZ.jpeg	\N	\N	\N	178	\N	\N	2025-12-06 10:55:45.909
2755	https://platina.vtcrm.ru/uploads/Photos/1255/phpRoABLG.jpeg	\N	\N	\N	178	\N	\N	2025-12-06 10:55:45.909
2756	https://platina.vtcrm.ru/uploads/Photos/1255/phpvsSxBQ.jpeg	\N	\N	\N	178	\N	\N	2025-12-06 10:55:45.909
2757	https://platina.vtcrm.ru/uploads/Photos/1258/phpmNrQep.jpeg	\N	\N	\N	179	\N	\N	2025-12-06 10:58:29.418
2758	https://platina.vtcrm.ru/uploads/Photos/1258/phpTwfEYb.jpeg	\N	\N	\N	179	\N	\N	2025-12-06 10:58:29.418
2759	https://platina.vtcrm.ru/uploads/Photos/1258/phpY8l4JC.jpeg	\N	\N	\N	179	\N	\N	2025-12-06 10:58:29.418
2760	https://platina.vtcrm.ru/uploads/Photos/1258/phpGoIDX9.jpeg	\N	\N	\N	179	\N	\N	2025-12-06 10:58:29.418
2761	https://platina.vtcrm.ru/uploads/Photos/1258/phpTFO9i4.jpeg	\N	\N	\N	179	\N	\N	2025-12-06 10:58:29.418
2762	https://platina.vtcrm.ru/uploads/Photos/1258/phpHBMLzl.jpeg	\N	\N	\N	179	\N	\N	2025-12-06 10:58:29.418
2763	https://platina.vtcrm.ru/uploads/Photos/1258/php5zKqC4.jpeg	\N	\N	\N	179	\N	\N	2025-12-06 10:58:29.418
2764	https://platina.vtcrm.ru/uploads/Photos/1258/php9D9hMV.jpeg	\N	\N	\N	179	\N	\N	2025-12-06 10:58:29.418
2765	https://platina.vtcrm.ru/uploads/Photos/1260/phpQHICdP.jpeg	\N	\N	\N	180	\N	\N	2025-12-06 11:18:47.747
2766	https://platina.vtcrm.ru/uploads/Photos/1260/phpKgU1CL.jpeg	\N	\N	\N	180	\N	\N	2025-12-06 11:18:47.747
2767	https://platina.vtcrm.ru/uploads/Photos/1260/phpjaUapH.jpeg	\N	\N	\N	180	\N	\N	2025-12-06 11:18:47.747
2768	https://platina.vtcrm.ru/uploads/Photos/1260/phpfU3DFV.jpeg	\N	\N	\N	180	\N	\N	2025-12-06 11:18:47.747
2769	https://platina.vtcrm.ru/uploads/Photos/1260/phpi3zkWD.jpeg	\N	\N	\N	180	\N	\N	2025-12-06 11:18:47.747
2770	https://platina.vtcrm.ru/uploads/Photos/1260/phpKqwngo.jpeg	\N	\N	\N	180	\N	\N	2025-12-06 11:18:47.747
2771	https://platina.vtcrm.ru/uploads/Photos/1271/phpRBbLbp.jpeg	\N	\N	\N	181	\N	\N	2025-12-06 11:24:32.882
2772	https://platina.vtcrm.ru/uploads/Photos/1271/phpSuWIfJ.jpeg	\N	\N	\N	181	\N	\N	2025-12-06 11:24:32.882
2773	https://platina.vtcrm.ru/uploads/Photos/1271/phpUTnWGI.jpeg	\N	\N	\N	181	\N	\N	2025-12-06 11:24:32.882
2774	https://platina.vtcrm.ru/uploads/Photos/1271/php5IaO72.jpeg	\N	\N	\N	181	\N	\N	2025-12-06 11:24:32.882
2775	https://platina.vtcrm.ru/uploads/Photos/1271/phpelESrO.jpeg	\N	\N	\N	181	\N	\N	2025-12-06 11:24:32.882
2776	https://platina.vtcrm.ru/uploads/Photos/1271/phpUkjJVG.jpeg	\N	\N	\N	181	\N	\N	2025-12-06 11:24:32.882
2777	https://platina.vtcrm.ru/uploads/Photos/1271/phpm7do5h.jpeg	\N	\N	\N	181	\N	\N	2025-12-06 11:24:32.882
2778	https://platina.vtcrm.ru/uploads/Photos/1271/phpT2w8nS.jpeg	\N	\N	\N	181	\N	\N	2025-12-06 11:24:32.882
2779	https://platina.vtcrm.ru/uploads/Photos/1271/phpJatfPT.jpeg	\N	\N	\N	181	\N	\N	2025-12-06 11:24:32.882
2780	https://platina.vtcrm.ru/uploads/Photos/1271/phpVdkauQ.jpeg	\N	\N	\N	181	\N	\N	2025-12-06 11:24:32.882
2781	https://platina.vtcrm.ru/uploads/Photos/1271/php5qrBmG.jpeg	\N	\N	\N	181	\N	\N	2025-12-06 11:24:32.882
2782	https://platina.vtcrm.ru/uploads/Photos/1271/phpqcUIVm.jpeg	\N	\N	\N	181	\N	\N	2025-12-06 11:24:32.882
2783	https://platina.vtcrm.ru/uploads/Photos/1271/phpvZBsgI.jpeg	\N	\N	\N	181	\N	\N	2025-12-06 11:24:32.882
2784	https://platina.vtcrm.ru/uploads/Photos/1271/phpkRM4qT.jpeg	\N	\N	\N	181	\N	\N	2025-12-06 11:24:32.882
2785	https://platina.vtcrm.ru/uploads/Photos/1271/phpCTSmtd.jpeg	\N	\N	\N	181	\N	\N	2025-12-06 11:24:32.882
2786	https://platina.vtcrm.ru/uploads/Photos/1271/phppmq7tB.jpeg	\N	\N	\N	181	\N	\N	2025-12-06 11:24:32.882
2787	https://platina.vtcrm.ru/uploads/Photos/1271/phpgeiPIa.jpeg	\N	\N	\N	181	\N	\N	2025-12-06 11:24:32.882
2788	https://platina.vtcrm.ru/uploads/Photos/1271/phpPoXDyb.jpeg	\N	\N	\N	181	\N	\N	2025-12-06 11:24:32.882
2789	https://platina.vtcrm.ru/uploads/Photos/1271/php2W9Kpn.jpeg	\N	\N	\N	181	\N	\N	2025-12-06 11:24:32.882
2790	https://platina.vtcrm.ru/uploads/Photos/1271/phpDQ3x1g.jpeg	\N	\N	\N	181	\N	\N	2025-12-06 11:24:32.882
2791	https://platina.vtcrm.ru/uploads/Photos/1271/phpeiJLCa.jpeg	\N	\N	\N	181	\N	\N	2025-12-06 11:24:32.882
2792	https://platina.vtcrm.ru/uploads/Photos/1277/phpL3jkpe.jpeg	\N	\N	\N	182	\N	\N	2025-12-06 11:27:15.332
2793	https://platina.vtcrm.ru/uploads/Photos/1277/phpuGiyWc.jpeg	\N	\N	\N	182	\N	\N	2025-12-06 11:27:15.332
2794	https://platina.vtcrm.ru/uploads/Photos/1277/phpllZ1pu.jpeg	\N	\N	\N	182	\N	\N	2025-12-06 11:27:15.332
2795	https://platina.vtcrm.ru/uploads/Photos/1277/phptYlLiq.jpeg	\N	\N	\N	182	\N	\N	2025-12-06 11:27:15.332
2796	https://platina.vtcrm.ru/uploads/Photos/1277/php8UsIYS.jpeg	\N	\N	\N	182	\N	\N	2025-12-06 11:27:15.332
2797	https://platina.vtcrm.ru/uploads/Photos/1277/phpUMHy1g.jpeg	\N	\N	\N	182	\N	\N	2025-12-06 11:27:15.332
2798	https://platina.vtcrm.ru/uploads/Photos/1277/phpQlJArV.jpeg	\N	\N	\N	182	\N	\N	2025-12-06 11:27:15.332
2799	https://platina.vtcrm.ru/uploads/Photos/1277/phpGJcaya.jpeg	\N	\N	\N	182	\N	\N	2025-12-06 11:27:15.332
2800	https://platina.vtcrm.ru/uploads/Photos/1278/phpLkPM6N.jpeg	\N	\N	\N	183	\N	\N	2025-12-06 11:30:04.27
2801	https://platina.vtcrm.ru/uploads/Photos/1278/phpryVzZf.jpeg	\N	\N	\N	183	\N	\N	2025-12-06 11:30:04.27
2802	https://platina.vtcrm.ru/uploads/Photos/1278/phprWgF8G.jpeg	\N	\N	\N	183	\N	\N	2025-12-06 11:30:04.27
2803	https://platina.vtcrm.ru/uploads/Photos/1278/phpkAykLq.jpeg	\N	\N	\N	183	\N	\N	2025-12-06 11:30:04.27
2804	https://platina.vtcrm.ru/uploads/Photos/1278/php6N15fT.jpeg	\N	\N	\N	183	\N	\N	2025-12-06 11:30:04.27
2805	https://platina.vtcrm.ru/uploads/Photos/1278/phpPbFCzx.jpeg	\N	\N	\N	183	\N	\N	2025-12-06 11:30:04.27
2806	https://platina.vtcrm.ru/uploads/Photos/1278/phph72IUS.jpeg	\N	\N	\N	183	\N	\N	2025-12-06 11:30:04.27
2807	https://platina.vtcrm.ru/uploads/Photos/1278/phpfHq21o.jpeg	\N	\N	\N	183	\N	\N	2025-12-06 11:30:04.27
2808	https://platina.vtcrm.ru/uploads/Photos/1278/phpIt5Srx.jpeg	\N	\N	\N	183	\N	\N	2025-12-06 11:30:04.27
2809	https://platina.vtcrm.ru/uploads/Photos/1278/phpd9ZM0L.jpeg	\N	\N	\N	183	\N	\N	2025-12-06 11:30:04.27
2810	https://platina.vtcrm.ru/uploads/Photos/1278/php3RrjFQ.jpeg	\N	\N	\N	183	\N	\N	2025-12-06 11:30:04.27
2811	https://platina.vtcrm.ru/uploads/Photos/1279/phpn6toc8.jpeg	\N	\N	\N	184	\N	\N	2025-12-06 11:32:28.366
2812	https://platina.vtcrm.ru/uploads/Photos/1279/phpi87CS5.jpeg	\N	\N	\N	184	\N	\N	2025-12-06 11:32:28.366
2813	https://platina.vtcrm.ru/uploads/Photos/1279/phpF3b7pF.jpeg	\N	\N	\N	184	\N	\N	2025-12-06 11:32:28.366
2814	https://platina.vtcrm.ru/uploads/Photos/1279/phpwqLiYz.jpeg	\N	\N	\N	184	\N	\N	2025-12-06 11:32:28.366
2815	https://platina.vtcrm.ru/uploads/Photos/1279/php0IBZMG.jpeg	\N	\N	\N	184	\N	\N	2025-12-06 11:32:28.366
2816	https://platina.vtcrm.ru/uploads/Photos/1279/phpgqArkV.jpeg	\N	\N	\N	184	\N	\N	2025-12-06 11:32:28.366
2817	https://platina.vtcrm.ru/uploads/Photos/1281/php0eUQ9M.jpeg	\N	\N	\N	185	\N	\N	2025-12-06 11:35:15.875
2818	https://platina.vtcrm.ru/uploads/Photos/1281/phpQkGFy1.jpeg	\N	\N	\N	185	\N	\N	2025-12-06 11:35:15.875
2819	https://platina.vtcrm.ru/uploads/Photos/1281/phpSwSh7u.jpeg	\N	\N	\N	185	\N	\N	2025-12-06 11:35:15.875
2820	https://platina.vtcrm.ru/uploads/Photos/1281/phpGHieEu.jpeg	\N	\N	\N	185	\N	\N	2025-12-06 11:35:15.875
2821	https://platina.vtcrm.ru/uploads/Photos/1281/phpIjJ748.jpeg	\N	\N	\N	185	\N	\N	2025-12-06 11:35:15.875
2822	https://platina.vtcrm.ru/uploads/Photos/1281/php0cn221.jpeg	\N	\N	\N	185	\N	\N	2025-12-06 11:35:15.875
2823	https://platina.vtcrm.ru/uploads/Photos/1281/phpMzdlkP.jpeg	\N	\N	\N	185	\N	\N	2025-12-06 11:35:15.875
2824	https://platina.vtcrm.ru/uploads/Photos/1281/phpbmcoiM.jpeg	\N	\N	\N	185	\N	\N	2025-12-06 11:35:15.875
2825	https://platina.vtcrm.ru/uploads/Photos/1281/phpI4iUFI.jpeg	\N	\N	\N	185	\N	\N	2025-12-06 11:35:15.875
2826	https://platina.vtcrm.ru/uploads/Photos/1282/phpdVLAYz.jpeg	\N	\N	\N	186	\N	\N	2025-12-06 11:49:44.24
2827	https://platina.vtcrm.ru/uploads/Photos/1282/phpnkUofB.jpeg	\N	\N	\N	186	\N	\N	2025-12-06 11:49:44.24
2828	https://platina.vtcrm.ru/uploads/Photos/1282/phprKIH7W.jpeg	\N	\N	\N	186	\N	\N	2025-12-06 11:49:44.24
2829	https://platina.vtcrm.ru/uploads/Photos/1282/phpB5zj15.jpeg	\N	\N	\N	186	\N	\N	2025-12-06 11:49:44.24
2830	https://platina.vtcrm.ru/uploads/Photos/1282/phpJ4pO71.jpeg	\N	\N	\N	186	\N	\N	2025-12-06 11:49:44.24
2831	https://platina.vtcrm.ru/uploads/Photos/1282/phpbDkNSl.jpeg	\N	\N	\N	186	\N	\N	2025-12-06 11:49:44.24
2832	https://platina.vtcrm.ru/uploads/Photos/1282/phpshapsQ.jpeg	\N	\N	\N	186	\N	\N	2025-12-06 11:49:44.24
2833	https://platina.vtcrm.ru/uploads/Photos/1282/phpllNnDr.jpeg	\N	\N	\N	186	\N	\N	2025-12-06 11:49:44.24
2834	https://platina.vtcrm.ru/uploads/Photos/1282/phpy51lrD.jpeg	\N	\N	\N	186	\N	\N	2025-12-06 11:49:44.24
2835	https://platina.vtcrm.ru/uploads/Photos/1283/phpZ9f06Z.jpeg	\N	\N	\N	187	\N	\N	2025-12-06 11:52:46.181
2836	https://platina.vtcrm.ru/uploads/Photos/1283/phpGCRQm4.jpeg	\N	\N	\N	187	\N	\N	2025-12-06 11:52:46.181
2837	https://platina.vtcrm.ru/uploads/Photos/1283/phprq8Kb2.jpeg	\N	\N	\N	187	\N	\N	2025-12-06 11:52:46.181
2838	https://platina.vtcrm.ru/uploads/Photos/1283/phpNrOGNo.jpeg	\N	\N	\N	187	\N	\N	2025-12-06 11:52:46.181
2839	https://platina.vtcrm.ru/uploads/Photos/1283/php06KcOd.jpeg	\N	\N	\N	187	\N	\N	2025-12-06 11:52:46.181
2840	https://platina.vtcrm.ru/uploads/Photos/1283/phpGs26Zn.jpeg	\N	\N	\N	187	\N	\N	2025-12-06 11:52:46.181
2841	https://platina.vtcrm.ru/uploads/Photos/1283/phpzXCgyA.jpeg	\N	\N	\N	187	\N	\N	2025-12-06 11:52:46.181
2842	https://platina.vtcrm.ru/uploads/Photos/1288/phpApAZGM.jpeg	\N	\N	\N	188	\N	\N	2025-12-06 11:55:22.449
2843	https://platina.vtcrm.ru/uploads/Photos/1288/phpclic3d.jpeg	\N	\N	\N	188	\N	\N	2025-12-06 11:55:22.449
2844	https://platina.vtcrm.ru/uploads/Photos/1288/phpThCDN7.jpeg	\N	\N	\N	188	\N	\N	2025-12-06 11:55:22.449
2845	https://platina.vtcrm.ru/uploads/Photos/1288/php52DtxL.jpeg	\N	\N	\N	188	\N	\N	2025-12-06 11:55:22.449
2846	https://platina.vtcrm.ru/uploads/Photos/1288/phpxBpU4S.jpeg	\N	\N	\N	188	\N	\N	2025-12-06 11:55:22.449
2847	https://platina.vtcrm.ru/uploads/Photos/1288/php18rklV.jpeg	\N	\N	\N	188	\N	\N	2025-12-06 11:55:22.449
2848	https://platina.vtcrm.ru/uploads/Photos/1288/php6AOb2U.jpeg	\N	\N	\N	188	\N	\N	2025-12-06 11:55:22.449
2849	https://platina.vtcrm.ru/uploads/Photos/1288/phpih1JOb.jpeg	\N	\N	\N	188	\N	\N	2025-12-06 11:55:22.449
2850	https://platina.vtcrm.ru/uploads/Photos/1289/phpHGlch9.jpeg	\N	\N	\N	189	\N	\N	2025-12-06 11:57:59.492
2851	https://platina.vtcrm.ru/uploads/Photos/1289/phpXDDZvm.jpeg	\N	\N	\N	189	\N	\N	2025-12-06 11:57:59.492
2852	https://platina.vtcrm.ru/uploads/Photos/1289/phpp7piWA.jpeg	\N	\N	\N	189	\N	\N	2025-12-06 11:57:59.492
2853	https://platina.vtcrm.ru/uploads/Photos/1289/phptVYsPf.jpeg	\N	\N	\N	189	\N	\N	2025-12-06 11:57:59.492
2854	https://platina.vtcrm.ru/uploads/Photos/1289/phps3ebgH.jpeg	\N	\N	\N	189	\N	\N	2025-12-06 11:57:59.492
2855	https://platina.vtcrm.ru/uploads/Photos/1289/phpqKQtaj.jpeg	\N	\N	\N	189	\N	\N	2025-12-06 11:57:59.492
2856	https://platina.vtcrm.ru/uploads/Photos/1289/php6kjoKH.jpeg	\N	\N	\N	189	\N	\N	2025-12-06 11:57:59.492
2857	https://platina.vtcrm.ru/uploads/Photos/1290/phpHmwBSu.jpeg	\N	\N	\N	190	\N	\N	2025-12-06 12:00:12.453
2858	https://platina.vtcrm.ru/uploads/Photos/1290/php3RpjTq.jpeg	\N	\N	\N	190	\N	\N	2025-12-06 12:00:12.453
2859	https://platina.vtcrm.ru/uploads/Photos/1290/phpD6wPjr.jpeg	\N	\N	\N	190	\N	\N	2025-12-06 12:00:12.453
2860	https://platina.vtcrm.ru/uploads/Photos/1298/phpZOUOLp.jpeg	\N	\N	\N	191	\N	\N	2025-12-06 12:03:04.959
2861	https://platina.vtcrm.ru/uploads/Photos/1298/phpzvFcqg.jpeg	\N	\N	\N	191	\N	\N	2025-12-06 12:03:04.959
2862	https://platina.vtcrm.ru/uploads/Photos/1298/phpX2MEt0.jpeg	\N	\N	\N	191	\N	\N	2025-12-06 12:03:04.959
2863	https://platina.vtcrm.ru/uploads/Photos/1298/php3ccWAw.jpeg	\N	\N	\N	191	\N	\N	2025-12-06 12:03:04.959
2864	https://platina.vtcrm.ru/uploads/Photos/1298/phpy5FCIV.jpeg	\N	\N	\N	191	\N	\N	2025-12-06 12:03:04.959
2865	https://platina.vtcrm.ru/uploads/Photos/1298/phpyjHPZM.jpeg	\N	\N	\N	191	\N	\N	2025-12-06 12:03:04.959
2866	https://platina.vtcrm.ru/uploads/Photos/1298/phptt2Ptb.jpeg	\N	\N	\N	191	\N	\N	2025-12-06 12:03:04.959
2867	https://platina.vtcrm.ru/uploads/Photos/1298/phpW8CV9h.jpeg	\N	\N	\N	191	\N	\N	2025-12-06 12:03:04.959
2868	https://platina.vtcrm.ru/uploads/Photos/1298/phpd8IJxG.jpeg	\N	\N	\N	191	\N	\N	2025-12-06 12:03:04.959
2869	https://platina.vtcrm.ru/uploads/Photos/1299/phpc9AmLM.jpeg	\N	\N	\N	192	\N	\N	2025-12-06 12:05:24.628
2870	https://platina.vtcrm.ru/uploads/Photos/1299/phpwoHrnX.jpeg	\N	\N	\N	192	\N	\N	2025-12-06 12:05:24.628
2871	https://platina.vtcrm.ru/uploads/Photos/1299/phpAZSw6g.jpeg	\N	\N	\N	192	\N	\N	2025-12-06 12:05:24.628
2872	https://platina.vtcrm.ru/uploads/Photos/1299/phpjCtIOH.jpeg	\N	\N	\N	192	\N	\N	2025-12-06 12:05:24.628
2873	https://platina.vtcrm.ru/uploads/Photos/1299/phpCFg4DL.jpeg	\N	\N	\N	192	\N	\N	2025-12-06 12:05:24.628
2874	https://platina.vtcrm.ru/uploads/Photos/1299/phpdeQsCo.jpeg	\N	\N	\N	192	\N	\N	2025-12-06 12:05:24.628
2875	https://platina.vtcrm.ru/uploads/Photos/1302/phpSZgdGy.jpeg	\N	\N	\N	193	\N	\N	2025-12-06 12:08:38.19
2876	https://platina.vtcrm.ru/uploads/Photos/1302/php0OxS2L.jpeg	\N	\N	\N	193	\N	\N	2025-12-06 12:08:38.19
2877	https://platina.vtcrm.ru/uploads/Photos/1302/php1lXzWO.jpeg	\N	\N	\N	193	\N	\N	2025-12-06 12:08:38.19
2878	https://platina.vtcrm.ru/uploads/Photos/1302/phpKstXME.jpeg	\N	\N	\N	193	\N	\N	2025-12-06 12:08:38.19
2879	https://platina.vtcrm.ru/uploads/Photos/1302/php2Rb8gr.jpeg	\N	\N	\N	193	\N	\N	2025-12-06 12:08:38.19
2880	https://platina.vtcrm.ru/uploads/Photos/1302/phpxjmQ1V.jpeg	\N	\N	\N	193	\N	\N	2025-12-06 12:08:38.19
2881	https://platina.vtcrm.ru/uploads/Photos/1302/phpzmOJ3t.jpeg	\N	\N	\N	193	\N	\N	2025-12-06 12:08:38.19
2882	https://platina.vtcrm.ru/uploads/Photos/1302/phpUh9cey.jpeg	\N	\N	\N	193	\N	\N	2025-12-06 12:08:38.19
2883	https://platina.vtcrm.ru/uploads/Photos/1302/phpilQqBF.jpeg	\N	\N	\N	193	\N	\N	2025-12-06 12:08:38.19
2884	https://platina.vtcrm.ru/uploads/Photos/1302/phpkA6IkZ.jpeg	\N	\N	\N	193	\N	\N	2025-12-06 12:08:38.19
2885	https://platina.vtcrm.ru/uploads/Photos/1302/phpY3ZolM.jpeg	\N	\N	\N	193	\N	\N	2025-12-06 12:08:38.19
2886	https://platina.vtcrm.ru/uploads/Photos/1302/phpJ8DPl4.jpeg	\N	\N	\N	193	\N	\N	2025-12-06 12:08:38.19
2887	https://platina.vtcrm.ru/uploads/Photos/1302/phpjDYUA9.jpeg	\N	\N	\N	193	\N	\N	2025-12-06 12:08:38.19
2888	https://platina.vtcrm.ru/uploads/Photos/1305/phpmyoPMp.jpeg	\N	\N	\N	194	\N	\N	2025-12-06 12:11:19.678
2889	https://platina.vtcrm.ru/uploads/Photos/1305/phponb2jk.jpeg	\N	\N	\N	194	\N	\N	2025-12-06 12:11:19.678
2890	https://platina.vtcrm.ru/uploads/Photos/1305/phpX3Nkl8.jpeg	\N	\N	\N	194	\N	\N	2025-12-06 12:11:19.678
2891	https://platina.vtcrm.ru/uploads/Photos/1305/php6NlHqr.jpeg	\N	\N	\N	194	\N	\N	2025-12-06 12:11:19.678
2892	https://platina.vtcrm.ru/uploads/Photos/1305/phpypUGHl.jpeg	\N	\N	\N	194	\N	\N	2025-12-06 12:11:19.678
2893	https://platina.vtcrm.ru/uploads/Photos/1305/phpMMpQcZ.jpeg	\N	\N	\N	194	\N	\N	2025-12-06 12:11:19.678
2894	https://platina.vtcrm.ru/uploads/Photos/1305/phpADhq8g.jpeg	\N	\N	\N	194	\N	\N	2025-12-06 12:11:19.678
2895	https://platina.vtcrm.ru/uploads/Photos/1305/php64Mufm.jpeg	\N	\N	\N	194	\N	\N	2025-12-06 12:11:19.678
2896	https://platina.vtcrm.ru/uploads/Photos/1305/phpKOLgnk.jpeg	\N	\N	\N	194	\N	\N	2025-12-06 12:11:19.678
2897	https://platina.vtcrm.ru/uploads/Photos/1305/phpGbWoiN.jpeg	\N	\N	\N	194	\N	\N	2025-12-06 12:11:19.678
2898	https://platina.vtcrm.ru/uploads/Photos/1305/phpwR3Cmc.jpeg	\N	\N	\N	194	\N	\N	2025-12-06 12:11:19.678
2899	https://platina.vtcrm.ru/uploads/Photos/1314/phpKx1zXZ.jpeg	\N	\N	\N	195	\N	\N	2025-12-06 12:14:14.847
2900	https://platina.vtcrm.ru/uploads/Photos/1314/php0zY5vm.jpeg	\N	\N	\N	195	\N	\N	2025-12-06 12:14:14.847
2901	https://platina.vtcrm.ru/uploads/Photos/1314/phpbMXI1M.jpeg	\N	\N	\N	195	\N	\N	2025-12-06 12:14:14.847
2902	https://platina.vtcrm.ru/uploads/Photos/1314/phpA4qn9e.jpeg	\N	\N	\N	195	\N	\N	2025-12-06 12:14:14.847
2903	https://platina.vtcrm.ru/uploads/Photos/1314/phpRaIWFJ.jpeg	\N	\N	\N	195	\N	\N	2025-12-06 12:14:14.847
2904	https://platina.vtcrm.ru/uploads/Photos/1314/phpIgvp6V.jpeg	\N	\N	\N	195	\N	\N	2025-12-06 12:14:14.847
2905	https://platina.vtcrm.ru/uploads/Photos/1314/phpRj7Rjv.jpeg	\N	\N	\N	195	\N	\N	2025-12-06 12:14:14.847
2906	https://platina.vtcrm.ru/uploads/Photos/1314/phpxoI9Xf.jpeg	\N	\N	\N	195	\N	\N	2025-12-06 12:14:14.847
2907	https://platina.vtcrm.ru/uploads/Photos/1314/phppARfaF.jpeg	\N	\N	\N	195	\N	\N	2025-12-06 12:14:14.847
2908	https://platina.vtcrm.ru/uploads/Photos/1314/php2TOVBy.jpeg	\N	\N	\N	195	\N	\N	2025-12-06 12:14:14.847
2909	https://platina.vtcrm.ru/uploads/Photos/1333/phpc2jVaT.jpeg	\N	\N	\N	196	\N	\N	2025-12-06 12:24:24.183
2910	https://platina.vtcrm.ru/uploads/Photos/1333/phpUQKCCu.jpeg	\N	\N	\N	196	\N	\N	2025-12-06 12:24:24.183
2911	https://platina.vtcrm.ru/uploads/Photos/1333/phpV05hTv.jpeg	\N	\N	\N	196	\N	\N	2025-12-06 12:24:24.183
2912	https://platina.vtcrm.ru/uploads/Photos/1333/php4VRdOz.jpeg	\N	\N	\N	196	\N	\N	2025-12-06 12:24:24.183
2913	https://platina.vtcrm.ru/uploads/Photos/1333/phpQ83pjx.jpeg	\N	\N	\N	196	\N	\N	2025-12-06 12:24:24.183
2914	https://platina.vtcrm.ru/uploads/Photos/1333/phpdmh6KT.jpeg	\N	\N	\N	196	\N	\N	2025-12-06 12:24:24.183
2915	https://platina.vtcrm.ru/uploads/Photos/1333/php8A3pXq.jpeg	\N	\N	\N	196	\N	\N	2025-12-06 12:24:24.183
2916	https://platina.vtcrm.ru/uploads/Photos/1333/phpngtnxE.jpeg	\N	\N	\N	196	\N	\N	2025-12-06 12:24:24.183
2917	https://platina.vtcrm.ru/uploads/Photos/1333/phpCU1naU.jpeg	\N	\N	\N	196	\N	\N	2025-12-06 12:24:24.183
2918	https://platina.vtcrm.ru/uploads/Photos/1341/phplNi1iy.jpeg	\N	\N	\N	197	\N	\N	2025-12-06 12:27:53.699
2919	https://platina.vtcrm.ru/uploads/Photos/1341/phpGrRMPL.jpeg	\N	\N	\N	197	\N	\N	2025-12-06 12:27:53.699
2920	https://platina.vtcrm.ru/uploads/Photos/1341/phpF902N2.jpeg	\N	\N	\N	197	\N	\N	2025-12-06 12:27:53.699
2921	https://platina.vtcrm.ru/uploads/Photos/1341/phpCJwh8V.jpeg	\N	\N	\N	197	\N	\N	2025-12-06 12:27:53.699
2922	https://platina.vtcrm.ru/uploads/Photos/1341/phpMsMJPe.jpeg	\N	\N	\N	197	\N	\N	2025-12-06 12:27:53.699
2923	https://platina.vtcrm.ru/uploads/Photos/1341/php3Exdye.jpeg	\N	\N	\N	197	\N	\N	2025-12-06 12:27:53.699
2924	https://platina.vtcrm.ru/uploads/Photos/1341/php1piF5W.jpeg	\N	\N	\N	197	\N	\N	2025-12-06 12:27:53.699
2925	https://platina.vtcrm.ru/uploads/Photos/1341/phpnEl7Wj.jpeg	\N	\N	\N	197	\N	\N	2025-12-06 12:27:53.699
2926	https://platina.vtcrm.ru/uploads/Photos/1341/phpzdJMT6.jpeg	\N	\N	\N	197	\N	\N	2025-12-06 12:27:53.699
2927	https://platina.vtcrm.ru/uploads/Photos/1341/phpzz2gDu.jpeg	\N	\N	\N	197	\N	\N	2025-12-06 12:27:53.699
2928	https://platina.vtcrm.ru/uploads/Photos/1341/phpNJgara.jpeg	\N	\N	\N	197	\N	\N	2025-12-06 12:27:53.699
2929	https://platina.vtcrm.ru/uploads/Photos/1341/phpDMDtMT.jpeg	\N	\N	\N	197	\N	\N	2025-12-06 12:27:53.699
2930	https://platina.vtcrm.ru/uploads/Photos/1341/phpAYlf1N.jpeg	\N	\N	\N	197	\N	\N	2025-12-06 12:27:53.699
2931	https://platina.vtcrm.ru/uploads/Photos/1341/phpC7JBFF.jpeg	\N	\N	\N	197	\N	\N	2025-12-06 12:27:53.699
2932	https://platina.vtcrm.ru/uploads/Photos/1341/phpQfpXGy.jpeg	\N	\N	\N	197	\N	\N	2025-12-06 12:27:53.699
2933	https://platina.vtcrm.ru/uploads/Photos/1341/phpqVjOlf.jpeg	\N	\N	\N	197	\N	\N	2025-12-06 12:27:53.699
2934	https://platina.vtcrm.ru/uploads/Photos/1341/phpQlidnZ.jpeg	\N	\N	\N	197	\N	\N	2025-12-06 12:27:53.699
2935	https://platina.vtcrm.ru/uploads/Photos/1342/phpnjhUrP.jpeg	\N	\N	\N	198	\N	\N	2025-12-06 12:30:17.8
2936	https://platina.vtcrm.ru/uploads/Photos/1342/phpNpi4EK.jpeg	\N	\N	\N	198	\N	\N	2025-12-06 12:30:17.8
2937	https://platina.vtcrm.ru/uploads/Photos/1342/php1YLyUx.jpeg	\N	\N	\N	198	\N	\N	2025-12-06 12:30:17.8
2938	https://platina.vtcrm.ru/uploads/Photos/1342/phpwbVtEQ.jpeg	\N	\N	\N	198	\N	\N	2025-12-06 12:30:17.8
2939	https://platina.vtcrm.ru/uploads/Photos/1342/phpNaxYsE.jpeg	\N	\N	\N	198	\N	\N	2025-12-06 12:30:17.8
2940	https://platina.vtcrm.ru/uploads/Photos/1342/php0zI5GY.jpeg	\N	\N	\N	198	\N	\N	2025-12-06 12:30:17.8
2941	https://platina.vtcrm.ru/uploads/Photos/1342/phpM44ESi.jpeg	\N	\N	\N	198	\N	\N	2025-12-06 12:30:17.8
2942	https://platina.vtcrm.ru/uploads/Photos/1346/phpwXDDnJ.jpeg	\N	\N	\N	199	\N	\N	2025-12-06 12:33:09.675
2943	https://platina.vtcrm.ru/uploads/Photos/1346/phpQLZcTo.jpeg	\N	\N	\N	199	\N	\N	2025-12-06 12:33:09.675
2944	https://platina.vtcrm.ru/uploads/Photos/1346/phpgBz6At.jpeg	\N	\N	\N	199	\N	\N	2025-12-06 12:33:09.675
2945	https://platina.vtcrm.ru/uploads/Photos/1346/phpE2dsLy.jpeg	\N	\N	\N	199	\N	\N	2025-12-06 12:33:09.675
2946	https://platina.vtcrm.ru/uploads/Photos/1346/phpTULUT2.jpeg	\N	\N	\N	199	\N	\N	2025-12-06 12:33:09.675
2947	https://platina.vtcrm.ru/uploads/Photos/1346/phprAp1y6.jpeg	\N	\N	\N	199	\N	\N	2025-12-06 12:33:09.675
2948	https://platina.vtcrm.ru/uploads/Photos/1346/phpND3Lnf.jpeg	\N	\N	\N	199	\N	\N	2025-12-06 12:33:09.675
2949	https://platina.vtcrm.ru/uploads/Photos/1346/php2Eiycq.jpeg	\N	\N	\N	199	\N	\N	2025-12-06 12:33:09.675
2950	https://platina.vtcrm.ru/uploads/Photos/1346/phpK3ckJt.jpeg	\N	\N	\N	199	\N	\N	2025-12-06 12:33:09.675
2951	https://platina.vtcrm.ru/uploads/Photos/1346/phpSZm3UP.jpeg	\N	\N	\N	199	\N	\N	2025-12-06 12:33:09.675
2952	https://platina.vtcrm.ru/uploads/Photos/1346/phpknEHvb.jpeg	\N	\N	\N	199	\N	\N	2025-12-06 12:33:09.675
2953	https://platina.vtcrm.ru/uploads/Photos/1347/phpJofZUV.jpeg	\N	\N	\N	200	\N	\N	2025-12-06 12:37:08.496
2954	https://platina.vtcrm.ru/uploads/Photos/1347/phpACtE3c.jpeg	\N	\N	\N	200	\N	\N	2025-12-06 12:37:08.496
2955	https://platina.vtcrm.ru/uploads/Photos/1347/php3SHzB3.jpeg	\N	\N	\N	200	\N	\N	2025-12-06 12:37:08.496
2956	https://platina.vtcrm.ru/uploads/Photos/1347/phpQUH6Qq.jpeg	\N	\N	\N	200	\N	\N	2025-12-06 12:37:08.496
2957	https://platina.vtcrm.ru/uploads/Photos/1347/phpcBBEex.jpeg	\N	\N	\N	200	\N	\N	2025-12-06 12:37:08.496
2958	https://platina.vtcrm.ru/uploads/Photos/1347/phpu8935t.jpeg	\N	\N	\N	200	\N	\N	2025-12-06 12:37:08.496
2959	https://platina.vtcrm.ru/uploads/Photos/1347/phpLlH1AI.jpeg	\N	\N	\N	200	\N	\N	2025-12-06 12:37:08.496
2960	https://platina.vtcrm.ru/uploads/Photos/1347/phpCh2Ysw.jpeg	\N	\N	\N	200	\N	\N	2025-12-06 12:37:08.496
2961	https://platina.vtcrm.ru/uploads/Photos/1347/phpWCjpZr.jpeg	\N	\N	\N	200	\N	\N	2025-12-06 12:37:08.496
2962	https://platina.vtcrm.ru/uploads/Photos/1347/phpHm3Wbd.jpeg	\N	\N	\N	200	\N	\N	2025-12-06 12:37:08.496
2963	https://platina.vtcrm.ru/uploads/Photos/1347/phpNKBXL2.jpeg	\N	\N	\N	200	\N	\N	2025-12-06 12:37:08.496
2964	https://platina.vtcrm.ru/uploads/Photos/1347/phpJa1sFS.jpeg	\N	\N	\N	200	\N	\N	2025-12-06 12:37:08.496
2965	https://platina.vtcrm.ru/uploads/Photos/1347/phpJ69u8q.jpeg	\N	\N	\N	200	\N	\N	2025-12-06 12:37:08.496
2966	https://platina.vtcrm.ru/uploads/Photos/1347/phpiuCrym.jpeg	\N	\N	\N	200	\N	\N	2025-12-06 12:37:08.496
2967	https://platina.vtcrm.ru/uploads/Photos/1347/phpOXzYrm.jpeg	\N	\N	\N	200	\N	\N	2025-12-06 12:37:08.496
2968	https://platina.vtcrm.ru/uploads/Photos/1347/phpeCA1k1.jpeg	\N	\N	\N	200	\N	\N	2025-12-06 12:37:08.496
2969	https://platina.vtcrm.ru/uploads/Photos/1347/phpyqkmK0.jpeg	\N	\N	\N	200	\N	\N	2025-12-06 12:37:08.496
2970	https://platina.vtcrm.ru/uploads/Photos/1347/phpOWWto5.jpeg	\N	\N	\N	200	\N	\N	2025-12-06 12:37:08.496
2971	https://platina.vtcrm.ru/uploads/Photos/1348/phpzURb6R.jpeg	\N	\N	\N	20	\N	\N	2025-12-06 12:47:54.64
2972	https://platina.vtcrm.ru/uploads/Photos/1348/phpkhuc9r.jpeg	\N	\N	\N	20	\N	\N	2025-12-06 12:47:54.64
2973	https://platina.vtcrm.ru/uploads/Photos/1348/phpzcf7jP.jpeg	\N	\N	\N	20	\N	\N	2025-12-06 12:47:54.64
2974	https://platina.vtcrm.ru/uploads/Photos/1348/phpc6Eont.jpeg	\N	\N	\N	20	\N	\N	2025-12-06 12:47:54.64
2975	https://platina.vtcrm.ru/uploads/Photos/1348/phpgocK91.jpeg	\N	\N	\N	20	\N	\N	2025-12-06 12:47:54.64
2976	https://platina.vtcrm.ru/uploads/Photos/1348/phpvGSYzB.jpeg	\N	\N	\N	20	\N	\N	2025-12-06 12:47:54.64
2977	https://platina.vtcrm.ru/uploads/Photos/1348/phpfmYuXX.jpeg	\N	\N	\N	20	\N	\N	2025-12-06 12:47:54.64
2978	https://platina.vtcrm.ru/uploads/Photos/1348/phpCPpwIn.jpeg	\N	\N	\N	20	\N	\N	2025-12-06 12:47:54.64
2979	https://platina.vtcrm.ru/uploads/Photos/1348/phpANFWbM.jpeg	\N	\N	\N	20	\N	\N	2025-12-06 12:47:54.64
2980	https://platina.vtcrm.ru/uploads/Photos/1348/phpWo2oVh.jpeg	\N	\N	\N	20	\N	\N	2025-12-06 12:47:54.64
2981	https://platina.vtcrm.ru/uploads/Photos/1348/phpezI3uO.jpeg	\N	\N	\N	20	\N	\N	2025-12-06 12:47:54.64
2982	https://platina.vtcrm.ru/uploads/Photos/1348/phptjdiKO.jpeg	\N	\N	\N	20	\N	\N	2025-12-06 12:47:54.64
2983	https://platina.vtcrm.ru/uploads/Photos/1348/phpXBNTuG.jpeg	\N	\N	\N	20	\N	\N	2025-12-06 12:47:54.64
2984	https://platina.vtcrm.ru/uploads/Photos/1348/phpzURb6R.jpeg	\N	\N	\N	201	\N	\N	2025-12-06 12:48:00.703
2985	https://platina.vtcrm.ru/uploads/Photos/1348/phpkhuc9r.jpeg	\N	\N	\N	201	\N	\N	2025-12-06 12:48:00.703
2986	https://platina.vtcrm.ru/uploads/Photos/1348/phpzcf7jP.jpeg	\N	\N	\N	201	\N	\N	2025-12-06 12:48:00.703
2987	https://platina.vtcrm.ru/uploads/Photos/1348/phpc6Eont.jpeg	\N	\N	\N	201	\N	\N	2025-12-06 12:48:00.703
2988	https://platina.vtcrm.ru/uploads/Photos/1348/phpgocK91.jpeg	\N	\N	\N	201	\N	\N	2025-12-06 12:48:00.703
2989	https://platina.vtcrm.ru/uploads/Photos/1348/phpvGSYzB.jpeg	\N	\N	\N	201	\N	\N	2025-12-06 12:48:00.703
2990	https://platina.vtcrm.ru/uploads/Photos/1348/phpfmYuXX.jpeg	\N	\N	\N	201	\N	\N	2025-12-06 12:48:00.703
2991	https://platina.vtcrm.ru/uploads/Photos/1348/phpCPpwIn.jpeg	\N	\N	\N	201	\N	\N	2025-12-06 12:48:00.703
2992	https://platina.vtcrm.ru/uploads/Photos/1348/phpANFWbM.jpeg	\N	\N	\N	201	\N	\N	2025-12-06 12:48:00.703
2993	https://platina.vtcrm.ru/uploads/Photos/1348/phpWo2oVh.jpeg	\N	\N	\N	201	\N	\N	2025-12-06 12:48:00.703
2994	https://platina.vtcrm.ru/uploads/Photos/1348/phpezI3uO.jpeg	\N	\N	\N	201	\N	\N	2025-12-06 12:48:00.703
2995	https://platina.vtcrm.ru/uploads/Photos/1348/phptjdiKO.jpeg	\N	\N	\N	201	\N	\N	2025-12-06 12:48:00.703
2996	https://platina.vtcrm.ru/uploads/Photos/1348/phpXBNTuG.jpeg	\N	\N	\N	201	\N	\N	2025-12-06 12:48:00.703
2997	https://platina.vtcrm.ru/uploads/Photos/1354/phpctnzik.jpeg	\N	\N	\N	202	\N	\N	2025-12-06 12:51:03.277
2998	https://platina.vtcrm.ru/uploads/Photos/1354/phpjza2u7.jpeg	\N	\N	\N	202	\N	\N	2025-12-06 12:51:03.277
2999	https://platina.vtcrm.ru/uploads/Photos/1354/php05SyCl.jpeg	\N	\N	\N	202	\N	\N	2025-12-06 12:51:03.277
3000	https://platina.vtcrm.ru/uploads/Photos/1354/php9DEqPT.jpeg	\N	\N	\N	202	\N	\N	2025-12-06 12:51:03.277
3001	https://platina.vtcrm.ru/uploads/Photos/1355/phppcsjBN.jpeg	\N	\N	\N	203	\N	\N	2025-12-06 12:54:09.824
3002	https://platina.vtcrm.ru/uploads/Photos/1355/phpzlmXcJ.jpeg	\N	\N	\N	203	\N	\N	2025-12-06 12:54:09.824
3003	https://platina.vtcrm.ru/uploads/Photos/1355/phpYNm1wg.jpeg	\N	\N	\N	203	\N	\N	2025-12-06 12:54:09.824
3004	https://platina.vtcrm.ru/uploads/Photos/1355/phpZVfRFU.jpeg	\N	\N	\N	203	\N	\N	2025-12-06 12:54:09.824
3005	https://platina.vtcrm.ru/uploads/Photos/1355/phpKlMcFZ.jpeg	\N	\N	\N	203	\N	\N	2025-12-06 12:54:09.824
3006	https://platina.vtcrm.ru/uploads/Photos/1355/phpa9NWh5.jpeg	\N	\N	\N	203	\N	\N	2025-12-06 12:54:09.824
3007	https://platina.vtcrm.ru/uploads/Photos/1355/phpj0hyvh.jpeg	\N	\N	\N	203	\N	\N	2025-12-06 12:54:09.824
3008	https://platina.vtcrm.ru/uploads/Photos/1355/phpjVuYdk.jpeg	\N	\N	\N	203	\N	\N	2025-12-06 12:54:09.824
3009	https://platina.vtcrm.ru/uploads/Photos/1355/php7eNHXk.jpeg	\N	\N	\N	203	\N	\N	2025-12-06 12:54:09.824
3010	https://platina.vtcrm.ru/uploads/Photos/1356/phppigEHZ.jpeg	\N	\N	\N	204	\N	\N	2025-12-06 12:56:56.856
3011	https://platina.vtcrm.ru/uploads/Photos/1356/php0dF4JI.jpeg	\N	\N	\N	204	\N	\N	2025-12-06 12:56:56.856
3012	https://platina.vtcrm.ru/uploads/Photos/1356/phpeUtAPR.jpeg	\N	\N	\N	204	\N	\N	2025-12-06 12:56:56.856
3013	https://platina.vtcrm.ru/uploads/Photos/1356/phpQRl2fh.jpeg	\N	\N	\N	204	\N	\N	2025-12-06 12:56:56.856
3014	https://platina.vtcrm.ru/uploads/Photos/1356/phplk9eB5.jpeg	\N	\N	\N	204	\N	\N	2025-12-06 12:56:56.856
3015	https://platina.vtcrm.ru/uploads/Photos/1356/phpdLaB0h.jpeg	\N	\N	\N	204	\N	\N	2025-12-06 12:56:56.856
3016	https://platina.vtcrm.ru/uploads/Photos/1356/phpZGET81.jpeg	\N	\N	\N	204	\N	\N	2025-12-06 12:56:56.856
3017	https://platina.vtcrm.ru/uploads/Photos/1357/5bf3650c-1143-4185-806c-8a7aba5928fc.jpeg	\N	\N	\N	205	\N	\N	2025-12-06 12:59:30.582
3018	https://platina.vtcrm.ru/uploads/Photos/1357/phpzCMs29.jpeg	\N	\N	\N	205	\N	\N	2025-12-06 12:59:30.582
3019	https://platina.vtcrm.ru/uploads/Photos/1357/phpTcakRO.jpeg	\N	\N	\N	205	\N	\N	2025-12-06 12:59:30.582
3020	https://platina.vtcrm.ru/uploads/Photos/1357/phpKydMqF.jpeg	\N	\N	\N	205	\N	\N	2025-12-06 12:59:30.582
3021	https://platina.vtcrm.ru/uploads/Photos/1357/phpcjR8ed.jpeg	\N	\N	\N	205	\N	\N	2025-12-06 12:59:30.582
3022	https://platina.vtcrm.ru/uploads/Photos/1357/phpfBx9ub.jpeg	\N	\N	\N	205	\N	\N	2025-12-06 12:59:30.582
3023	https://platina.vtcrm.ru/uploads/Photos/1357/phpbPcVI3.jpeg	\N	\N	\N	205	\N	\N	2025-12-06 12:59:30.582
3024	https://platina.vtcrm.ru/uploads/Photos/1357/phpzSsOvz.jpeg	\N	\N	\N	205	\N	\N	2025-12-06 12:59:30.582
3025	https://platina.vtcrm.ru/uploads/Photos/1357/phpBNLtaa.jpeg	\N	\N	\N	205	\N	\N	2025-12-06 12:59:30.582
3026	https://platina.vtcrm.ru/uploads/Photos/1359/phpRUxjgZ.jpeg	\N	\N	\N	206	\N	\N	2025-12-06 13:02:47.66
3027	https://platina.vtcrm.ru/uploads/Photos/1359/phpW57TDV.jpeg	\N	\N	\N	206	\N	\N	2025-12-06 13:02:47.66
3028	https://platina.vtcrm.ru/uploads/Photos/1359/phpgfrRUu.jpeg	\N	\N	\N	206	\N	\N	2025-12-06 13:02:47.66
3029	https://platina.vtcrm.ru/uploads/Photos/1359/phpMGrB5s.jpeg	\N	\N	\N	206	\N	\N	2025-12-06 13:02:47.66
3030	https://platina.vtcrm.ru/uploads/Photos/1359/phprP1ZLv.jpeg	\N	\N	\N	206	\N	\N	2025-12-06 13:02:47.66
3031	https://platina.vtcrm.ru/uploads/Photos/1359/phpLthYcA.jpeg	\N	\N	\N	206	\N	\N	2025-12-06 13:02:47.66
3032	https://platina.vtcrm.ru/uploads/Photos/1359/phpdUwgwA.jpeg	\N	\N	\N	206	\N	\N	2025-12-06 13:02:47.66
3033	https://platina.vtcrm.ru/uploads/Photos/1359/phpwbGMBZ.jpeg	\N	\N	\N	206	\N	\N	2025-12-06 13:02:47.66
3034	https://platina.vtcrm.ru/uploads/Photos/1359/phpYJzTNw.jpeg	\N	\N	\N	206	\N	\N	2025-12-06 13:02:47.66
3035	https://platina.vtcrm.ru/uploads/Photos/1359/php3LQeDE.jpeg	\N	\N	\N	206	\N	\N	2025-12-06 13:02:47.66
3036	https://platina.vtcrm.ru/uploads/Photos/1359/phpNqY9V7.jpeg	\N	\N	\N	206	\N	\N	2025-12-06 13:02:47.66
3037	https://platina.vtcrm.ru/uploads/Photos/1359/phpPlZjwT.jpeg	\N	\N	\N	206	\N	\N	2025-12-06 13:02:47.66
3038	https://platina.vtcrm.ru/uploads/Photos/1359/phpKMDJj7.jpeg	\N	\N	\N	206	\N	\N	2025-12-06 13:02:47.66
3039	https://platina.vtcrm.ru/uploads/Photos/1360/phplVBW1D.jpeg	\N	\N	\N	207	\N	\N	2025-12-06 13:05:13.291
3040	https://platina.vtcrm.ru/uploads/Photos/1360/phpXubK61.jpeg	\N	\N	\N	207	\N	\N	2025-12-06 13:05:13.291
3041	https://platina.vtcrm.ru/uploads/Photos/1360/php4IiI2H.jpeg	\N	\N	\N	207	\N	\N	2025-12-06 13:05:13.291
3042	https://platina.vtcrm.ru/uploads/Photos/1360/phpwfED4I.jpeg	\N	\N	\N	207	\N	\N	2025-12-06 13:05:13.291
3043	https://platina.vtcrm.ru/uploads/Photos/1360/phpDeOmit.jpeg	\N	\N	\N	207	\N	\N	2025-12-06 13:05:13.291
3044	https://platina.vtcrm.ru/uploads/Photos/1360/phppeWjLH.jpeg	\N	\N	\N	207	\N	\N	2025-12-06 13:05:13.291
3045	https://platina.vtcrm.ru/uploads/Photos/1360/phpikSWnY.jpeg	\N	\N	\N	207	\N	\N	2025-12-06 13:05:13.291
3046	https://platina.vtcrm.ru/uploads/Photos/1363/php1jtmX0.jpeg	\N	\N	\N	208	\N	\N	2025-12-06 13:07:52.112
3047	https://platina.vtcrm.ru/uploads/Photos/1363/phpqqlP8b.jpeg	\N	\N	\N	208	\N	\N	2025-12-06 13:07:52.112
3048	https://platina.vtcrm.ru/uploads/Photos/1363/phpZeAQzq.jpeg	\N	\N	\N	208	\N	\N	2025-12-06 13:07:52.112
3049	https://platina.vtcrm.ru/uploads/Photos/1363/php32zmm6.jpeg	\N	\N	\N	208	\N	\N	2025-12-06 13:07:52.112
3050	https://platina.vtcrm.ru/uploads/Photos/1363/php8WunzB.jpeg	\N	\N	\N	208	\N	\N	2025-12-06 13:07:52.112
3051	https://platina.vtcrm.ru/uploads/Photos/1363/phpj57v6O.jpeg	\N	\N	\N	208	\N	\N	2025-12-06 13:07:52.112
3052	https://platina.vtcrm.ru/uploads/Photos/1364/phpoQscI4.jpeg	\N	\N	\N	209	\N	\N	2025-12-06 13:11:00.499
3053	https://platina.vtcrm.ru/uploads/Photos/1364/phpFFDZLM.jpeg	\N	\N	\N	209	\N	\N	2025-12-06 13:11:00.499
3054	https://platina.vtcrm.ru/uploads/Photos/1364/phpKqF3lq.jpeg	\N	\N	\N	209	\N	\N	2025-12-06 13:11:00.499
3055	https://platina.vtcrm.ru/uploads/Photos/1364/php3q2nf1.jpeg	\N	\N	\N	209	\N	\N	2025-12-06 13:11:00.499
3056	https://platina.vtcrm.ru/uploads/Photos/1364/phpJlRh8F.jpeg	\N	\N	\N	209	\N	\N	2025-12-06 13:11:00.499
3057	https://platina.vtcrm.ru/uploads/Photos/1364/phpaBhkoB.jpeg	\N	\N	\N	209	\N	\N	2025-12-06 13:11:00.499
3058	https://platina.vtcrm.ru/uploads/Photos/1364/phprrzJHm.jpeg	\N	\N	\N	209	\N	\N	2025-12-06 13:11:00.499
3059	https://platina.vtcrm.ru/uploads/Photos/1364/php1zTYE2.jpeg	\N	\N	\N	209	\N	\N	2025-12-06 13:11:00.499
3060	https://platina.vtcrm.ru/uploads/Photos/1364/phpmcKfvx.jpeg	\N	\N	\N	209	\N	\N	2025-12-06 13:11:00.499
3061	https://platina.vtcrm.ru/uploads/Photos/1364/phpeMKoRr.jpeg	\N	\N	\N	209	\N	\N	2025-12-06 13:11:00.499
3062	https://platina.vtcrm.ru/uploads/Photos/1364/phpCEpq1r.jpeg	\N	\N	\N	209	\N	\N	2025-12-06 13:11:00.499
3063	https://platina.vtcrm.ru/uploads/Photos/1364/phpkuW4Zc.jpeg	\N	\N	\N	209	\N	\N	2025-12-06 13:11:00.499
3064	https://platina.vtcrm.ru/uploads/Photos/1364/phpwLryV7.jpeg	\N	\N	\N	209	\N	\N	2025-12-06 13:11:00.499
3065	https://platina.vtcrm.ru/uploads/Photos/1365/php1TSlEV.jpeg	\N	\N	\N	210	\N	\N	2025-12-06 13:13:20.707
3066	https://platina.vtcrm.ru/uploads/Photos/1365/phpeIFNlD.jpeg	\N	\N	\N	210	\N	\N	2025-12-06 13:13:20.707
3067	https://platina.vtcrm.ru/uploads/Photos/1365/phpJSkF10.jpeg	\N	\N	\N	210	\N	\N	2025-12-06 13:13:20.707
3068	https://platina.vtcrm.ru/uploads/Photos/1365/phpUovF4m.jpeg	\N	\N	\N	210	\N	\N	2025-12-06 13:13:20.707
3069	https://platina.vtcrm.ru/uploads/Photos/1365/phpbufZMo.jpeg	\N	\N	\N	210	\N	\N	2025-12-06 13:13:20.707
3070	https://platina.vtcrm.ru/uploads/Photos/1365/phpzVVqGQ.jpeg	\N	\N	\N	210	\N	\N	2025-12-06 13:13:20.707
3071	https://platina.vtcrm.ru/uploads/Photos/1365/phpwGnH30.jpeg	\N	\N	\N	210	\N	\N	2025-12-06 13:13:20.707
3072	https://platina.vtcrm.ru/uploads/Photos/1373/692ee9a390f3f.jpeg	\N	\N	\N	211	\N	\N	2025-12-06 13:18:11.055
3073	https://platina.vtcrm.ru/uploads/Photos/1373/692ee9a26c4f7.jpeg	\N	\N	\N	211	\N	\N	2025-12-06 13:18:11.055
3074	https://platina.vtcrm.ru/uploads/Photos/1373/692ee99cea642.jpeg	\N	\N	\N	211	\N	\N	2025-12-06 13:18:11.055
3075	https://platina.vtcrm.ru/uploads/Photos/1373/692ee9a36f9c2.jpeg	\N	\N	\N	211	\N	\N	2025-12-06 13:18:11.055
3076	https://platina.vtcrm.ru/uploads/Photos/1373/692ee99d1f00d.jpeg	\N	\N	\N	211	\N	\N	2025-12-06 13:18:11.055
3077	https://platina.vtcrm.ru/uploads/Photos/1373/692ee99d45148.jpeg	\N	\N	\N	211	\N	\N	2025-12-06 13:18:11.055
3078	https://platina.vtcrm.ru/uploads/Photos/1373/692ee99d69ee7.jpeg	\N	\N	\N	211	\N	\N	2025-12-06 13:18:11.055
3079	https://platina.vtcrm.ru/uploads/Photos/1373/692ee99d90d63.jpeg	\N	\N	\N	211	\N	\N	2025-12-06 13:18:11.055
3080	https://platina.vtcrm.ru/uploads/Photos/1373/692ee99db8c8e.jpeg	\N	\N	\N	211	\N	\N	2025-12-06 13:18:11.055
3081	https://platina.vtcrm.ru/uploads/Photos/1373/692ee99df0e52.jpeg	\N	\N	\N	211	\N	\N	2025-12-06 13:18:11.055
3082	https://platina.vtcrm.ru/uploads/Photos/1373/692ee99e308fc.jpeg	\N	\N	\N	211	\N	\N	2025-12-06 13:18:11.055
3083	https://platina.vtcrm.ru/uploads/Photos/1373/692ee99e671ed.jpeg	\N	\N	\N	211	\N	\N	2025-12-06 13:18:11.055
3084	https://platina.vtcrm.ru/uploads/Photos/1373/692ee99ea28f6.jpeg	\N	\N	\N	211	\N	\N	2025-12-06 13:18:11.055
3085	https://platina.vtcrm.ru/uploads/Photos/1373/692ee99ee4795.jpeg	\N	\N	\N	211	\N	\N	2025-12-06 13:18:11.055
3086	https://platina.vtcrm.ru/uploads/Photos/1373/692ee99f32086.jpeg	\N	\N	\N	211	\N	\N	2025-12-06 13:18:11.055
3087	https://platina.vtcrm.ru/uploads/Photos/1373/692ee99f6bf5d.jpeg	\N	\N	\N	211	\N	\N	2025-12-06 13:18:11.055
3088	https://platina.vtcrm.ru/uploads/Photos/1373/692ee9a033b18.jpeg	\N	\N	\N	211	\N	\N	2025-12-06 13:18:11.055
3089	https://platina.vtcrm.ru/uploads/Photos/1373/692ee9a07125a.jpeg	\N	\N	\N	211	\N	\N	2025-12-06 13:18:11.055
3090	https://platina.vtcrm.ru/uploads/Photos/1373/692ee9a0a8d97.jpeg	\N	\N	\N	211	\N	\N	2025-12-06 13:18:11.055
3091	https://platina.vtcrm.ru/uploads/Photos/1373/692ee9a12d3c5.jpeg	\N	\N	\N	211	\N	\N	2025-12-06 13:18:11.055
3092	https://platina.vtcrm.ru/uploads/Photos/1373/692ee9a16c194.jpeg	\N	\N	\N	211	\N	\N	2025-12-06 13:18:11.055
3093	https://platina.vtcrm.ru/uploads/Photos/1373/692ee9a1e9c46.jpeg	\N	\N	\N	211	\N	\N	2025-12-06 13:18:11.055
3094	https://platina.vtcrm.ru/uploads/Photos/1373/692ee9a230d9e.jpeg	\N	\N	\N	211	\N	\N	2025-12-06 13:18:11.055
3095	https://platina.vtcrm.ru/uploads/Photos/1373/692ee9a2ecf70.jpeg	\N	\N	\N	211	\N	\N	2025-12-06 13:18:11.055
3096	https://platina.vtcrm.ru/uploads/Photos/1373/692ee9a326b07.jpeg	\N	\N	\N	211	\N	\N	2025-12-06 13:18:11.055
3097	https://platina.vtcrm.ru/uploads/Photos/1373/692ee9a432201.jpeg	\N	\N	\N	211	\N	\N	2025-12-06 13:18:11.055
3098	https://platina.vtcrm.ru/uploads/Photos/1382/phph94b6L.jpeg	\N	\N	\N	212	\N	\N	2025-12-06 13:20:03.62
3099	https://platina.vtcrm.ru/uploads/Photos/1382/php6jSoDn.jpeg	\N	\N	\N	212	\N	\N	2025-12-06 13:20:03.62
3100	https://platina.vtcrm.ru/uploads/Photos/1382/phpwtViMd.jpeg	\N	\N	\N	212	\N	\N	2025-12-06 13:20:03.62
3101	https://platina.vtcrm.ru/uploads/Photos/1382/phpwwkCVm.jpeg	\N	\N	\N	212	\N	\N	2025-12-06 13:20:03.62
3102	https://platina.vtcrm.ru/uploads/Photos/1382/phpwNuukr.jpeg	\N	\N	\N	212	\N	\N	2025-12-06 13:20:03.62
3103	https://platina.vtcrm.ru/uploads/Photos/1382/phpHO18cm.jpeg	\N	\N	\N	212	\N	\N	2025-12-06 13:20:03.62
3104	https://platina.vtcrm.ru/uploads/Photos/1382/phpaw2Kah.jpeg	\N	\N	\N	212	\N	\N	2025-12-06 13:20:03.62
3105	https://platina.vtcrm.ru/uploads/Photos/1383/phpwOmJ7Q.jpeg	\N	\N	\N	213	\N	\N	2025-12-06 13:22:33.239
3106	https://platina.vtcrm.ru/uploads/Photos/1383/phpQaRIqK.jpeg	\N	\N	\N	213	\N	\N	2025-12-06 13:22:33.239
3107	https://platina.vtcrm.ru/uploads/Photos/1383/phpq3VK6E.jpeg	\N	\N	\N	213	\N	\N	2025-12-06 13:22:33.239
3108	https://platina.vtcrm.ru/uploads/Photos/1383/phpwLOQCv.jpeg	\N	\N	\N	213	\N	\N	2025-12-06 13:22:33.239
3109	https://platina.vtcrm.ru/uploads/Photos/1384/phpzwXr5r.jpeg	\N	\N	\N	214	\N	\N	2025-12-06 13:24:38.437
3110	https://platina.vtcrm.ru/uploads/Photos/1384/phphm9Lwp.jpeg	\N	\N	\N	214	\N	\N	2025-12-06 13:24:38.437
3111	https://platina.vtcrm.ru/uploads/Photos/1384/phpsDhtAe.jpeg	\N	\N	\N	214	\N	\N	2025-12-06 13:24:38.437
3112	https://platina.vtcrm.ru/uploads/Photos/1384/phppUFeie.jpeg	\N	\N	\N	214	\N	\N	2025-12-06 13:24:38.437
3113	https://platina.vtcrm.ru/uploads/Photos/1384/php4muvg4.jpeg	\N	\N	\N	214	\N	\N	2025-12-06 13:24:38.437
3114	https://platina.vtcrm.ru/uploads/Photos/1384/phpixupC0.jpeg	\N	\N	\N	214	\N	\N	2025-12-06 13:24:38.437
3115	https://platina.vtcrm.ru/uploads/Photos/1385/phpeJRpQs.jpeg	\N	\N	\N	215	\N	\N	2025-12-06 13:27:38.048
3116	https://platina.vtcrm.ru/uploads/Photos/1385/phpcwPz05.jpeg	\N	\N	\N	215	\N	\N	2025-12-06 13:27:38.048
3117	https://platina.vtcrm.ru/uploads/Photos/1385/phprgVC7q.jpeg	\N	\N	\N	215	\N	\N	2025-12-06 13:27:38.048
3118	https://platina.vtcrm.ru/uploads/Photos/1385/phpqyY1Ru.jpeg	\N	\N	\N	215	\N	\N	2025-12-06 13:27:38.048
3119	https://platina.vtcrm.ru/uploads/Photos/1385/phpCbDyRM.jpeg	\N	\N	\N	215	\N	\N	2025-12-06 13:27:38.048
3120	https://platina.vtcrm.ru/uploads/Photos/1385/phpbcLGyr.jpeg	\N	\N	\N	215	\N	\N	2025-12-06 13:27:38.048
3121	https://platina.vtcrm.ru/uploads/Photos/1385/phpGBwu7g.jpeg	\N	\N	\N	215	\N	\N	2025-12-06 13:27:38.048
3122	https://platina.vtcrm.ru/uploads/Photos/1385/phpXMfRsn.jpeg	\N	\N	\N	215	\N	\N	2025-12-06 13:27:38.048
3123	https://platina.vtcrm.ru/uploads/Photos/1385/phpjJayZf.jpeg	\N	\N	\N	215	\N	\N	2025-12-06 13:27:38.048
3124	https://platina.vtcrm.ru/uploads/Photos/1385/php8kvtBr.jpeg	\N	\N	\N	215	\N	\N	2025-12-06 13:27:38.048
3125	https://platina.vtcrm.ru/uploads/Photos/1385/php1qtevY.jpeg	\N	\N	\N	215	\N	\N	2025-12-06 13:27:38.048
3126	https://platina.vtcrm.ru/uploads/Photos/1386/php6DVLXp.jpeg	\N	\N	\N	216	\N	\N	2025-12-06 13:39:10.753
3127	https://platina.vtcrm.ru/uploads/Photos/1386/phpucfZMm.jpeg	\N	\N	\N	216	\N	\N	2025-12-06 13:39:10.753
3128	https://platina.vtcrm.ru/uploads/Photos/1386/phpvdujgf.jpeg	\N	\N	\N	216	\N	\N	2025-12-06 13:39:10.753
3129	https://platina.vtcrm.ru/uploads/Photos/1386/phptyUCjx.jpeg	\N	\N	\N	216	\N	\N	2025-12-06 13:39:10.753
3130	https://platina.vtcrm.ru/uploads/Photos/1386/phpqFbxU0.jpeg	\N	\N	\N	216	\N	\N	2025-12-06 13:39:10.753
3131	https://platina.vtcrm.ru/uploads/Photos/1386/phpgSCFik.jpeg	\N	\N	\N	216	\N	\N	2025-12-06 13:39:10.753
3132	https://platina.vtcrm.ru/uploads/Photos/1386/phpxosY3G.jpeg	\N	\N	\N	216	\N	\N	2025-12-06 13:39:10.753
3133	https://platina.vtcrm.ru/uploads/Photos/1386/phpFULPl5.jpeg	\N	\N	\N	216	\N	\N	2025-12-06 13:39:10.753
3134	https://platina.vtcrm.ru/uploads/Photos/1386/phpdswpin.jpeg	\N	\N	\N	216	\N	\N	2025-12-06 13:39:10.753
3135	https://platina.vtcrm.ru/uploads/Photos/1386/phpm8d1vs.jpeg	\N	\N	\N	216	\N	\N	2025-12-06 13:39:10.753
3136	https://platina.vtcrm.ru/uploads/Photos/1386/phpeAzih4.jpeg	\N	\N	\N	216	\N	\N	2025-12-06 13:39:10.753
3137	https://platina.vtcrm.ru/uploads/Photos/1386/phpMPhzwl.jpeg	\N	\N	\N	216	\N	\N	2025-12-06 13:39:10.753
3138	https://platina.vtcrm.ru/uploads/Photos/1386/phpOgygLf.jpeg	\N	\N	\N	216	\N	\N	2025-12-06 13:39:10.753
3139	https://platina.vtcrm.ru/uploads/Photos/1386/phpwBp9PN.jpeg	\N	\N	\N	216	\N	\N	2025-12-06 13:39:10.753
3140	https://platina.vtcrm.ru/uploads/Photos/1387/php64WOOV.jpeg	\N	\N	\N	217	\N	\N	2025-12-06 13:42:23.967
3141	https://platina.vtcrm.ru/uploads/Photos/1387/phpnYqohO.jpeg	\N	\N	\N	217	\N	\N	2025-12-06 13:42:23.967
3142	https://platina.vtcrm.ru/uploads/Photos/1387/phpIvfv2z.jpeg	\N	\N	\N	217	\N	\N	2025-12-06 13:42:23.967
3143	https://platina.vtcrm.ru/uploads/Photos/1387/phpDTtf0B.jpeg	\N	\N	\N	217	\N	\N	2025-12-06 13:42:23.967
3144	https://platina.vtcrm.ru/uploads/Photos/1387/php4HL2NI.jpeg	\N	\N	\N	217	\N	\N	2025-12-06 13:42:23.967
3145	https://platina.vtcrm.ru/uploads/Photos/1387/phpH1cd3f.jpeg	\N	\N	\N	217	\N	\N	2025-12-06 13:42:23.967
3146	https://platina.vtcrm.ru/uploads/Photos/1387/php2zMqwd.jpeg	\N	\N	\N	217	\N	\N	2025-12-06 13:42:23.967
3147	https://platina.vtcrm.ru/uploads/Photos/1387/phpvW6EEt.jpeg	\N	\N	\N	217	\N	\N	2025-12-06 13:42:23.967
3148	https://platina.vtcrm.ru/uploads/Photos/1387/phpNAcMV9.jpeg	\N	\N	\N	217	\N	\N	2025-12-06 13:42:23.967
3149	https://platina.vtcrm.ru/uploads/Photos/1387/phpGXiK1x.jpeg	\N	\N	\N	217	\N	\N	2025-12-06 13:42:23.967
3150	https://platina.vtcrm.ru/uploads/Photos/1387/php5fnp99.jpeg	\N	\N	\N	217	\N	\N	2025-12-06 13:42:23.967
3151	https://platina.vtcrm.ru/uploads/Photos/1387/php7jUVP7.jpeg	\N	\N	\N	217	\N	\N	2025-12-06 13:42:23.967
3152	https://platina.vtcrm.ru/uploads/Photos/1389/php3tikFN.jpeg	\N	\N	\N	218	\N	\N	2025-12-06 13:44:48.445
3153	https://platina.vtcrm.ru/uploads/Photos/1389/php9eENlD.jpeg	\N	\N	\N	218	\N	\N	2025-12-06 13:44:48.445
3154	https://platina.vtcrm.ru/uploads/Photos/1389/phpAm6wzy.jpeg	\N	\N	\N	218	\N	\N	2025-12-06 13:44:48.445
3155	https://platina.vtcrm.ru/uploads/Photos/1389/php8qpTnO.jpeg	\N	\N	\N	218	\N	\N	2025-12-06 13:44:48.445
3156	https://platina.vtcrm.ru/uploads/Photos/1389/php5GDkbg.jpeg	\N	\N	\N	218	\N	\N	2025-12-06 13:44:48.445
3157	https://platina.vtcrm.ru/uploads/Photos/1389/phpMiFbaJ.jpeg	\N	\N	\N	218	\N	\N	2025-12-06 13:44:48.445
3158	https://platina.vtcrm.ru/uploads/Photos/1389/php2ES0Fv.jpeg	\N	\N	\N	218	\N	\N	2025-12-06 13:44:48.445
3159	https://platina.vtcrm.ru/uploads/Photos/1389/phpsX14ik.jpeg	\N	\N	\N	218	\N	\N	2025-12-06 13:44:48.445
3160	https://img.nmarket.pro/photo/pid/fcf18105-c53f-496f-be3f-ebb149bfef72	15	\N	\N	\N	\N	\N	2025-12-07 11:41:09.83
3161	https://img4.nmarket.pro/photo/pid/27c62706-1a82-45d8-924d-d9cce8603383	15	\N	\N	\N	\N	\N	2025-12-07 11:41:09.83
3162	https://img6.nmarket.pro/photo/pid/16bd136f-92d6-4e67-ac86-5ac675375cef	15	\N	\N	\N	\N	\N	2025-12-07 11:41:09.83
3163	https://img1.nmarket.pro/photo/pid/939a0a52-3440-4d3d-88f3-28ddd2190379	15	\N	\N	\N	\N	\N	2025-12-07 11:41:09.83
3164	https://img2.nmarket.pro/photo/pid/afc4f6dc-81c9-4477-9626-96f8e0754e5e	15	\N	\N	\N	\N	\N	2025-12-07 11:41:09.83
3165	https://img3.nmarket.pro/photo/pid/0bff9efc-0968-4cb4-8f70-b0ab71816b15	15	\N	\N	\N	\N	\N	2025-12-07 11:41:09.83
3166	https://img4.nmarket.pro/photo/pid/a98671a7-2199-40dc-80d4-348dbaefb44f	15	\N	\N	\N	\N	\N	2025-12-07 11:41:09.83
3167	https://img5.nmarket.pro/photo/pid/786b19fc-68b9-4ffb-b4f4-2eb3b01c8a51	15	\N	\N	\N	\N	\N	2025-12-07 11:41:09.83
3168	https://img6.nmarket.pro/photo/pid/9850786b-1b28-4460-a8cb-ebe5777541fe	15	\N	\N	\N	\N	\N	2025-12-07 11:41:09.83
3169	https://img3.nmarket.pro/photo/pid/81d980db-c4cd-4438-bfa4-14f878136d19	15	\N	\N	\N	\N	\N	2025-12-07 11:41:09.83
3170	https://img2.nmarket.pro/photo/pid/42c70a16-a735-425c-a180-e5fd07315813	15	\N	\N	\N	\N	\N	2025-12-07 11:41:09.83
3171	https://img1.nmarket.pro/photo/pid/c7a452e0-8365-4a73-85f2-13003f5f8eef	\N	312	\N	\N	\N	\N	2025-12-07 11:44:25.397
3172	https://img1.nmarket.pro/photo/pid/23d0b777-9000-4c6c-addd-48815da3962a	\N	313	\N	\N	\N	\N	2025-12-07 11:46:15.673
3173	https://img1.nmarket.pro/photo/pid/03330792-2978-4b24-ac67-14a7c1d948d4	\N	314	\N	\N	\N	\N	2025-12-07 11:47:09.294
3174	https://img1.nmarket.pro/photo/pid/604b4ce1-76f6-49da-a128-b542ad6e2e2d	\N	315	\N	\N	\N	\N	2025-12-07 11:48:00.857
3175	https://img1.nmarket.pro/photo/pid/1de895c8-1d8f-4673-ba0d-4e75046429b0	\N	316	\N	\N	\N	\N	2025-12-07 11:49:14.647
3176	https://img1.nmarket.pro/photo/pid/e9a49892-18eb-4e53-a22d-9c510a820baf	\N	317	\N	\N	\N	\N	2025-12-07 11:50:17.442
3177	https://img1.nmarket.pro/photo/pid/0a376906-ffd5-4959-b9fc-8fa8d493857f	\N	318	\N	\N	\N	\N	2025-12-07 12:00:43.73
3178	https://img1.nmarket.pro/photo/pid/ae0dd7c5-dd31-4846-935a-c8046ab2cc32	\N	319	\N	\N	\N	\N	2025-12-07 12:01:41.575
3179	https://img1.nmarket.pro/photo/pid/b13f86f6-5d8a-4956-96ec-8202c7195c6f	\N	320	\N	\N	\N	\N	2025-12-07 12:02:42.892
3180	https://img1.nmarket.pro/photo/pid/a8b6bb39-77da-4bd6-a3ef-a17848c73324	\N	321	\N	\N	\N	\N	2025-12-07 12:03:45.924
3181	https://img1.nmarket.pro/photo/pid/a751b21e-3e1f-401b-8b98-efe4771ce0bd	\N	322	\N	\N	\N	\N	2025-12-07 12:04:33.155
3182	https://img1.nmarket.pro/photo/pid/b6270f75-3dae-491b-b466-d0ebcffa18d4	\N	323	\N	\N	\N	\N	2025-12-07 12:05:25.836
3183	https://img1.nmarket.pro/photo/pid/590f39d8-7b35-47a1-a8cf-4ea6ed890c23	\N	324	\N	\N	\N	\N	2025-12-07 12:06:35.508
3184	https://img1.nmarket.pro/photo/pid/292c37d1-7df5-4fb1-a970-b03c3c653d67	\N	325	\N	\N	\N	\N	2025-12-07 12:07:47.919
3185	https://img1.nmarket.pro/photo/pid/011408da-d965-482b-b591-6daa7091e571	\N	326	\N	\N	\N	\N	2025-12-07 12:08:49.852
3186	https://img1.nmarket.pro/photo/pid/efe10510-a26b-4313-91ea-d5fe780d0585	\N	327	\N	\N	\N	\N	2025-12-07 12:09:38.442
3226	https://img1.nmarket.pro/photo/pid/fe532851-592b-4d9e-95a1-1df703ba7238/?type=png&v=1&wpsid=52	\N	356	\N	\N	\N	\N	2025-12-07 13:29:10.924
3193	https://img1.nmarket.pro/photo/pid/66689e3a-4ebf-4916-a281-f299f1654f21/?type=png&v=4&wpsid=52	\N	334	\N	\N	\N	\N	2025-12-07 12:35:10.289
3192	https://img1.nmarket.pro/photo/pid/17169ef4-f436-42ac-b927-0e58e1a3f9aa/?type=png&v=5&wpsid=52	\N	333	\N	\N	\N	\N	2025-12-07 12:33:55.694
3194	https://img1.nmarket.pro/photo/pid/17169ef4-f436-42ac-b927-0e58e1a3f9aa/?type=png&v=5&wpsid=52	\N	335	\N	\N	\N	\N	2025-12-07 12:43:39.147
3191	https://img1.nmarket.pro/photo/pid/04965f23-e2dd-4091-bf4b-08e24432dbe1/?type=png&v=5&wpsid=52	\N	332	\N	\N	\N	\N	2025-12-07 12:15:55.828
3190	https://img1.nmarket.pro/photo/pid/c6e5a3f1-5e1d-4c9f-8b66-4da3638d6fd2/?type=png&v=4&wpsid=52	\N	331	\N	\N	\N	\N	2025-12-07 12:13:40.623
3189	https://img1.nmarket.pro/photo/pid/46da2a62-4084-46bd-984b-c43d7e25fc6e/?type=png&v=4&wpsid=52	\N	330	\N	\N	\N	\N	2025-12-07 12:12:24.787
3188	https://img1.nmarket.pro/photo/pid/db8f29a4-e12e-4c22-b6d8-cbf93066dabf/?type=png&v=4&wpsid=52	\N	329	\N	\N	\N	\N	2025-12-07 12:11:23.067
3187	https://img1.nmarket.pro/photo/pid/a5d39d0c-7622-40ef-aabf-b871e727743e/?type=png&v=4&wpsid=52	\N	328	\N	\N	\N	\N	2025-12-07 12:10:37.421
3195	https://img1.nmarket.pro/photo/pid/7bf63ab0-92d8-47fc-9567-ec1a0ac9ac48/?type=png&v=4&wpsid=52	\N	336	\N	\N	\N	\N	2025-12-07 12:48:02.659
3196	https://img1.nmarket.pro/photo/pid/11ab0a81-abd5-4ade-b527-d2fba6c83d6c/?type=png&v=4&wpsid=52	\N	337	\N	\N	\N	\N	2025-12-07 12:48:42.815
3197	https://img1.nmarket.pro/photo/pid/00ff3d68-edfa-4cfc-b089-8022c411a7bf/?type=png&v=4&wpsid=52	\N	338	\N	\N	\N	\N	2025-12-07 12:49:28.832
3198	https://img5.nmarket.pro/photo/pid/d1053f65-c1a0-4c1d-9978-a4c2f90e5c66/?type=jpg&v=1&wpsid=52&w=800&h=600	16	\N	\N	\N	\N	\N	2025-12-07 13:01:54.176
3199	https://img7.nmarket.pro/photo/pid/583d5cc4-48a1-4c4e-aef5-ceea4218e1c9/?type=jpg&v=1&wpsid=52&w=800&h=600	16	\N	\N	\N	\N	\N	2025-12-07 13:01:54.176
3200	https://img.nmarket.pro/photo/pid/23b8ac42-9a1a-48b9-b1a7-4369a15c2aaa/?type=jpg&v=1&wpsid=52&w=800&h=600	16	\N	\N	\N	\N	\N	2025-12-07 13:01:54.176
3201	https://img1.nmarket.pro/photo/pid/9ee7d13d-2c09-4c5d-8dab-eb01f09c0451/?type=jpg&v=1&wpsid=52&w=800&h=600	16	\N	\N	\N	\N	\N	2025-12-07 13:01:54.176
3202	https://img3.nmarket.pro/photo/pid/765083d5-ff5f-4473-8c20-ba2d9d4be4e9/?type=jpg&v=1&wpsid=52&w=800&h=600	16	\N	\N	\N	\N	\N	2025-12-07 13:01:54.176
3203	https://img4.nmarket.pro/photo/pid/c5c64bd6-7daf-410e-a8c1-8781df67b0a7/?type=jpeg&v=1&wpsid=52&w=800&h=600	16	\N	\N	\N	\N	\N	2025-12-07 13:01:54.176
3204	https://img6.nmarket.pro/photo/pid/dd32f8a8-5bde-4a9a-bcd9-7bbd0aa56265/?type=jpg&v=1&wpsid=52&w=800&h=600	16	\N	\N	\N	\N	\N	2025-12-07 13:01:54.176
3205	https://img7.nmarket.pro/photo/pid/367c2996-794f-4c01-bbe2-1e32a24090fd/?type=jpg&v=1&wpsid=52&w=800&h=600	16	\N	\N	\N	\N	\N	2025-12-07 13:01:54.176
3206	https://img2.nmarket.pro/photo/pid/aa05fbdb-e2b5-4014-b5d3-12eac4d68513/?type=jpg&v=1&wpsid=52&w=800&h=600	16	\N	\N	\N	\N	\N	2025-12-07 13:01:54.176
3207	https://img3.nmarket.pro/photo/pid/ba2b6078-7365-4c5b-b8cc-9e7254d70f1e/?type=jpeg&v=1&wpsid=52&w=800&h=600	16	\N	\N	\N	\N	\N	2025-12-07 13:01:54.176
3208	https://img4.nmarket.pro/photo/pid/ef8d44c8-6a44-40c6-be28-611c8d2a362e/?type=jpeg&v=1&wpsid=52&w=800&h=600	16	\N	\N	\N	\N	\N	2025-12-07 13:01:54.176
3209	https://img1.nmarket.pro/photo/pid/f3ce6f1b-07bf-4133-94db-6be5dedb1021/?type=png&v=1&wpsid=52	\N	339	\N	\N	\N	\N	2025-12-07 13:03:52.667
3210	https://img1.nmarket.pro/photo/pid/b059dd14-5602-4b24-948c-e8075263d0f2/?type=png&v=1&wpsid=52	\N	340	\N	\N	\N	\N	2025-12-07 13:06:19.383
3211	https://img1.nmarket.pro/photo/pid/ec69e7ab-fa8c-4f2f-b5ac-5fa9071e38f2/?type=png&v=1&wpsid=52	\N	341	\N	\N	\N	\N	2025-12-07 13:07:02.254
3212	https://img1.nmarket.pro/photo/pid/3c168faa-439f-453b-865c-4fe882213b97/?type=png&v=1&wpsid=52	\N	342	\N	\N	\N	\N	2025-12-07 13:16:48.797
3213	https://img1.nmarket.pro/photo/pid/01890ca6-9c0e-4503-ae49-59ffa41f6452/?type=png&v=1&wpsid=52	\N	343	\N	\N	\N	\N	2025-12-07 13:17:38.996
3214	https://img1.nmarket.pro/photo/pid/48ad8b3c-856f-4967-b973-b6d0ff42d3d6/?type=png&v=1&wpsid=52	\N	344	\N	\N	\N	\N	2025-12-07 13:18:27.302
3215	https://img1.nmarket.pro/photo/pid/4475e54f-c73f-48c8-b067-9189e0c04311/?type=png&v=1&wpsid=52	\N	345	\N	\N	\N	\N	2025-12-07 13:19:11.569
3216	https://img1.nmarket.pro/photo/pid/2bb7e920-9690-42df-a3ae-5bf64e01974b/?type=png&v=1&wpsid=52	\N	346	\N	\N	\N	\N	2025-12-07 13:20:08.149
3217	https://img1.nmarket.pro/photo/pid/f4b4f2a0-7687-4f2d-8ff4-208220b5a0c9/?type=png&v=1&wpsid=52	\N	347	\N	\N	\N	\N	2025-12-07 13:20:52.211
3218	https://img1.nmarket.pro/photo/pid/60b705b3-67d9-4252-a6d8-7c8a5e91f635/?type=png&v=1&wpsid=52	\N	348	\N	\N	\N	\N	2025-12-07 13:21:39.663
3219	https://img1.nmarket.pro/photo/pid/69747b31-b0ed-41e6-961b-8b5a9b12e973/?type=png&v=1&wpsid=52	\N	349	\N	\N	\N	\N	2025-12-07 13:22:23.153
3220	https://img1.nmarket.pro/photo/pid/4afe0fc6-bc65-4e44-9139-f8d744231653/?type=png&v=1&wpsid=52	\N	350	\N	\N	\N	\N	2025-12-07 13:23:09.256
3221	https://img1.nmarket.pro/photo/pid/33f7cfe4-8ae4-4bee-ba30-4d228dcb9183/?type=png&v=1&wpsid=52	\N	351	\N	\N	\N	\N	2025-12-07 13:23:55.695
3222	https://img1.nmarket.pro/photo/pid/a4c9238b-0a50-4f5d-ac9b-cd3632cc30e1/?type=png&v=1&wpsid=52	\N	352	\N	\N	\N	\N	2025-12-07 13:24:43.132
3223	https://img1.nmarket.pro/photo/pid/3c4fe985-cd6f-4aaf-b9ea-5ccd3e0a36d1/?type=png&v=1&wpsid=52	\N	353	\N	\N	\N	\N	2025-12-07 13:26:50.394
3224	https://img1.nmarket.pro/photo/pid/019d854a-f6a3-4de0-bf3f-836e92380f0b/?type=png&v=1&wpsid=52	\N	354	\N	\N	\N	\N	2025-12-07 13:27:41.998
3225	https://img1.nmarket.pro/photo/pid/402a505e-cfd5-47e4-bca1-ed685213c096/?type=png&v=1&wpsid=52	\N	355	\N	\N	\N	\N	2025-12-07 13:28:28.742
3227	https://img1.nmarket.pro/photo/pid/33755006-f67f-4bf2-8007-3ef96f754749/?type=png&v=1&wpsid=52	\N	357	\N	\N	\N	\N	2025-12-07 13:29:59.311
3228	https://img1.nmarket.pro/photo/pid/3521e0d7-6b93-441a-9229-ce217c72f959/?type=png&v=1&wpsid=52	\N	358	\N	\N	\N	\N	2025-12-07 13:30:47.742
3229	https://img6.nmarket.pro/photo/pid/8e792e41-a82d-47ba-a9df-f054317e6e0b/?type=jpg&v=1&wpsid=52&w=800&h=600	17	\N	\N	\N	\N	\N	2025-12-07 16:18:10.961
3230	https://img7.nmarket.pro/photo/pid/d3ffdb3e-b85e-413e-9d32-69776b55f32a/?type=jpg&v=1&wpsid=52&w=800&h=600	17	\N	\N	\N	\N	\N	2025-12-07 16:18:10.961
3231	https://img.nmarket.pro/photo/pid/0c4aa517-7c41-47f2-a0e6-c3bf7dfa5290/?type=jpg&v=1&wpsid=52&w=800&h=600	17	\N	\N	\N	\N	\N	2025-12-07 16:18:10.961
3232	https://img1.nmarket.pro/photo/pid/91a7c7b2-2ccf-4588-8b8f-ea20cc489581/?type=jpg&v=1&wpsid=52&w=800&h=600	17	\N	\N	\N	\N	\N	2025-12-07 16:18:10.961
3233	https://img2.nmarket.pro/photo/pid/f8497b17-18b0-4a11-b744-c6893f7a826d/?type=jpg&v=1&wpsid=52&w=800&h=600	17	\N	\N	\N	\N	\N	2025-12-07 16:18:10.961
3234	https://img3.nmarket.pro/photo/pid/1ffff001-cf61-4608-a77b-2908a4843380/?type=jpg&v=1&wpsid=52&w=800&h=600	17	\N	\N	\N	\N	\N	2025-12-07 16:18:10.961
3235	https://img4.nmarket.pro/photo/pid/9c58bb61-3900-465e-bbeb-1a03704b47f6/?type=jpg&v=1&wpsid=52&w=800&h=600	17	\N	\N	\N	\N	\N	2025-12-07 16:18:10.961
3236	https://img5.nmarket.pro/photo/pid/e82de6a5-9d05-4cea-8fe4-da498f6535b7/?type=jpg&v=1&wpsid=52&w=800&h=600	17	\N	\N	\N	\N	\N	2025-12-07 16:18:10.961
3237	https://img6.nmarket.pro/photo/pid/5ca246ae-1289-4a44-8ca0-06c7fc317ab0/?type=jpg&v=1&wpsid=52&w=800&h=600	17	\N	\N	\N	\N	\N	2025-12-07 16:18:10.961
3238	https://img7.nmarket.pro/photo/pid/8742dec6-3223-4532-b4ed-d54d64d95569/?type=jpg&v=1&wpsid=52&w=800&h=600	17	\N	\N	\N	\N	\N	2025-12-07 16:18:10.961
3239	https://img.nmarket.pro/photo/pid/7b73872d-b1bf-4869-9d05-bb13c12c0f28/?type=jpg&v=1&wpsid=52&w=800&h=600	17	\N	\N	\N	\N	\N	2025-12-07 16:18:10.961
3240	https://img1.nmarket.pro/photo/pid/7da3beb3-4484-4955-83b7-083049f314a3/?type=jpg&v=1&wpsid=52	\N	359	\N	\N	\N	\N	2025-12-07 16:19:45.459
3241	https://img1.nmarket.pro/photo/pid/5e4dfc06-60cf-4eaf-a714-3ce090b02c21/?type=jpg&v=1&wpsid=52	\N	360	\N	\N	\N	\N	2025-12-07 16:21:18.967
3242	https://img1.nmarket.pro/photo/pid/e0ac3b7a-4932-49cf-88f0-a8241b484816/?type=jpg&v=1&wpsid=52	\N	361	\N	\N	\N	\N	2025-12-07 16:22:53.531
3243	https://img1.nmarket.pro/photo/pid/8e934370-201f-48f3-963e-5c1136ce1fd0/?type=png&v=2&wpsid=52	\N	362	\N	\N	\N	\N	2025-12-07 16:23:45.188
\.


--
-- Data for Name: NearbyPlace; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."NearbyPlace" (id, "complexId", name, category, distance, icon, "createdAt") FROM stdin;
\.


--
-- Data for Name: NewBuildingApartment; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."NewBuildingApartment" (id, "complexId", bedrooms, area, price, "pricePerM2", floor, "totalFloors", city, lat, lng, type, "createdAt", "updatedAt", title, "apartmentNumber", korpus) FROM stdin;
25	1	1	41	6687200	161449	5	10	Казань	55.823574	48.898876	readyApartment	2025-11-27 11:47:03.28	2025-11-27 11:47:03.28	1К квартира 41.42 м²	58	3
27	1	0	27	5149350	187181	5	10	Казань	55.823574	48.898876	readyApartment	2025-11-27 11:49:40.971	2025-11-27 11:49:40.971	Студия 27.51 м²	62	3
28	1	1	44	7038650	158350	5	10	Казань	55.823574	48.898876	readyApartment	2025-11-27 11:50:52.703	2025-11-27 11:50:52.703	1К квартира 44.45 м²	63	3
29	1	0	44	3791450	187975	5	10	Казань	55.823574	48.898876	readyApartment	2025-11-27 11:52:05.45	2025-11-27 11:52:05.45	Студия 20.17 м²	64	3
30	1	2	44	3791450	164134	2	5	Казань	55.823574	48.898876	readyApartment	2025-11-27 11:53:57.973	2025-11-27 11:53:57.973	2К квартира 53.03 м²	5	4
31	1	2	55	9085400	164085	2	5	Казань	55.823574	48.898876	readyApartment	2025-11-27 11:55:38.014	2025-11-27 11:55:38.014	2К квартира 55.37 м²	9	4
32	1	3	88	11628700	130674	2	5	Казань	55.823574	48.898876	readyApartment	2025-11-27 11:57:48.8	2025-11-27 11:57:48.8	3К квартира 88.99 м²	9	4
33	1	2	88	9085310	164084	2	5	Казань	55.823574	48.898876	readyApartment	2025-11-27 11:59:03.949	2025-11-27 11:59:03.949	2К квартира 55.37 м²	47	4
35	3	2	47	10839999	269789	6	11	Казань	55.819545	48.894735	readyApartment	2025-11-27 13:17:15.71	2025-11-27 13:17:15.71	2К квартира 47.27 м²	45	1
1	1	2	53	7898150	149870	8	9	Казань	55.823574	48.898876	readyApartment	2025-11-27 10:03:49.658	2025-11-27 10:03:49.658	2К квартира 52.7 м²	29	1
2	1	2	54	8308500	149870	8	9	Казань	55.823574	48.898876	readyApartment	2025-11-27 10:04:25.131	2025-11-27 10:04:25.131	2К квартира 54.6 м²	31	1
3	1	1	39	6041700	152568	1	9	Казань	55.823574	48.898876	readyApartment	2025-11-27 10:17:46.864	2025-11-27 10:17:46.864	1К квартира 39.6 м²	2	1
4	1	2	39	8308500	152170	7	9	Казань	55.823574	48.898876	readyApartment	2025-11-27 10:27:15.245	2025-11-27 10:27:15.245	2К квартира 54.6 м²	27	1
5	1	2	39	8308500	152170	5	9	Казань	55.823574	48.898876	readyApartment	2025-11-27 10:30:26.874	2025-11-27 10:30:26.874	2К квартира 54.6 м²	19	1
7	1	1	36	5910000	161475	3	9	Казань	55.823574	48.898876	readyApartment	2025-11-27 11:01:02.876	2025-11-27 11:01:02.876	1К квартира 36.6 м²	126	1
8	1	2	58	8881250	151557	8	9	Казань	55.823574	48.898876	readyApartment	2025-11-27 11:04:22.594	2025-11-27 11:04:22.594	2К квартира 58.6 м²	162	1
9	1	2	51	7920000	155294	9	9	Казань	55.823574	48.898876	readyApartment	2025-11-27 11:06:48.375	2025-11-27 11:06:48.375	2К квартира 51 м²	202	1
10	1	2	37	5895000	155952	8	9	Казань	55.823574	48.898876	readyApartment	2025-11-27 11:08:54.8	2025-11-27 11:08:54.8	1К квартира 37.8 м²	235	1
23	13	0	20	3769800	182911	1	10	Казань	55.823574	48.898876	readyApartment	2025-11-27 11:43:54.574	2025-11-28 13:07:00.357	Студия 20.61 м²	6	3
12	1	3	67	9050600	133707	1	9	Казань	55.823574	48.898876	readyApartment	2025-11-27 11:17:20.925	2025-11-27 11:17:20.925	3К квартира 67.69 м²	1	2
14	1	1	37	5798800	146213	1	9	Казань	55.823574	48.898876	readyApartment	2025-11-27 11:22:04.651	2025-11-27 11:22:04.651	1К квартира 39.66 м²	5	2
13	1	1	37	5474000	145973	1	9	Казань	55.823574	48.898876	readyApartment	2025-11-27 11:20:24.818	2025-11-27 11:20:24.818	1К квартира 37.5 м²	4	2
15	1	1	42	6667500	156809	4	9	Казань	55.823574	48.898876	readyApartment	2025-11-27 11:27:11.425	2025-11-27 11:27:11.425	1К квартира 42.52 м²	55	2
16	1	0	21	4013450	187808	8	10	Казань	55.823574	48.898876	readyApartment	2025-11-27 11:30:48.372	2025-11-27 11:30:48.372	Студия 21.37 м²	97	3
17	1	0	19	3756300	188003	8	10	Казань	55.823574	48.898876	readyApartment	2025-11-27 11:32:24.625	2025-11-27 11:32:24.625	Студия 19.98 м²	98	3
18	1	3	70	8887500	125850	3	10	Казань	55.823574	48.898876	readyApartment	2025-11-27 11:35:30.281	2025-11-27 11:35:30.281	3К квартира 70.62 м²	54	3
19	1	3	70	8762500	125862	3	10	Казань	55.823574	48.898876	readyApartment	2025-11-27 11:37:46.205	2025-11-27 11:37:46.205	3К квартира 69.62 м²	9	3
20	1	0	70	4947700	187271	7	10	Казань	55.823574	48.898876	readyApartment	2025-11-27 11:39:29.441	2025-11-27 11:39:29.441	Студия 26.42 м²	85	3
21	1	0	25	4597800	182380	1	10	Казань	55.823574	48.898876	readyApartment	2025-11-27 11:41:01.037	2025-11-27 11:41:01.037	Студия 25.21 м²	5	3
22	1	0	21	4096700	187750	7	10	Казань	55.823574	48.898876	readyApartment	2025-11-27 11:42:43.853	2025-11-27 11:42:43.853	Студия 21.82 м²	86	3
36	3	2	47	10279999	243833	1	11	Казань	55.811911	48.951273	readyApartment	2025-11-27 13:19:38.488	2025-11-27 13:19:38.488	2К квартира 49.6 м²	1	1
37	3	1	35	8399999	277283	1	11	Казань	55.811911	48.951273	readyApartment	2025-11-27 13:21:00.062	2025-11-27 13:21:00.062	1К квартира 35.64 м²	3	1
38	3	1	50	10809999	254353	1	11	Казань	55.811911	48.951273	readyApartment	2025-11-27 13:23:11.239	2025-11-27 13:23:11.239	1К квартира 50 м²	4	1
39	3	1	50	13069999	249943	8	11	Казань	55.811911	48.951273	readyApartment	2025-11-27 13:26:09.468	2025-11-27 13:26:09.468	2К квартира 61.52 м²	4	1
40	3	2	50	12439999	258848	4	11	Казань	55.811911	48.951273	readyApartment	2025-11-27 13:29:20.352	2025-11-27 13:29:20.352	2К квартира 56.54 м²	81	1
41	3	2	50	12579999	261762	6	11	Казань	55.811911	48.951273	readyApartment	2025-11-27 13:31:16.679	2025-11-27 13:31:16.679	2К квартира 56.54 м²	97	1
42	3	2	46	10789999	274586	7	11	Казань	55.811911	48.951273	readyApartment	2025-11-27 13:33:35.555	2025-11-27 13:33:35.555	2К квартира 46.23 м²	97	1
43	3	3	77	15879999	242659	2	11	Казань	55.811911	48.951273	readyApartment	2025-11-27 13:36:55.424	2025-11-27 13:36:55.424	3К квартира 76.99 м²	97	1
44	3	3	77	11029999	264826	5	11	Казань	55.811911	48.951273	readyApartment	2025-11-27 13:38:06.021	2025-11-27 13:38:06.021	2К квартира 49 м²	97	1
45	3	4	79	16549999	245191	5	11	Казань	55.811911	48.951273	readyApartment	2025-11-27 13:39:36.209	2025-11-27 13:39:36.209	4К квартира 79.41 м²	97	1
46	3	4	79	18019999	246254	5	11	Казань	55.811911	48.951273	readyApartment	2025-11-27 13:41:36.309	2025-11-27 13:41:36.309	4К квартира 86.09 м²	86	1
47	3	4	92	25849999	329989	9	11	Казань	55.811911	48.951273	readyApartment	2025-11-27 13:42:57.098	2025-11-27 13:42:57.098	4К квартира 92.16 м²	86	1
48	3	0	92	25059999	270072	1	11	Казань	55.811911	48.951273	commercialProperty	2025-11-27 13:44:47.682	2025-11-27 13:44:47.682	Коммерция 103.1 м²	86	1
49	3	2	47	11229999	276397	8	10	Казань	55.811911	48.951273	readyApartment	2025-11-27 13:46:44.734	2025-11-27 13:46:44.734	2К квартира 47.8 м²	86	1
50	3	1	33	8919999	310018	4	10	Казань	55.811911	48.951273	readyApartment	2025-11-27 13:49:01.062	2025-11-27 13:49:01.062	1К квартира 33.85 м²	86	1
26	1	0	22	4265050	187640	5	10	Казань	55.765939	49.097057	readyApartment	2025-11-27 11:48:35.204	2025-11-28 13:43:34.232	Студия 22.73 м²	61	3
24	13	1	39	6316000	161535	5	10	Казань	55.823574	48.898876	readyApartment	2025-11-27 11:45:22.064	2025-11-28 13:07:19.49	1К квартира 39.1 м²	57	3
51	3	3	66	14249999	251722	4	10	Казань	55.811911	48.951273	readyApartment	2025-11-27 13:50:52.747	2025-11-27 13:50:52.747	3К квартира 66.6 м²	86	1
52	3	3	85	18609999	254879	5	10	Казань	55.811911	48.951273	readyApartment	2025-11-27 13:52:38.719	2025-11-27 13:52:38.719	4К квартира 85.9 м²	86	2
53	3	2	85	11129999	262302	6	10	Казань	55.811911	48.951273	readyApartment	2025-11-27 13:55:12.061	2025-11-27 13:55:12.061	2К квартира 49.92 м²	86	2
54	3	3	82	22259999	319174	8	10	Казань	55.811911	48.951273	readyApartment	2025-11-27 13:56:37.073	2025-11-27 13:56:37.073	3К квартира 82.05 м²	86	2
55	3	1	831	8739999	330622	6	10	Казань	55.811911	48.951273	readyApartment	2025-11-27 13:58:20.405	2025-11-27 13:58:20.405	1К квартира 31.1 м²	86	2
56	3	0	212	52149999	272577	1	10	Казань	55.811911	48.951273	readyApartment	2025-11-27 14:00:40.999	2025-11-27 14:00:40.999	Коммерция 212.58 м²	23	2
59	5	3	110	35392000	320000	2	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:02:48.883	2025-11-28 08:02:48.883	3К квартира 110.6 м²	144	3
60	5	0	66	49164150	735000	1	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:06:32.449	2025-11-28 08:06:32.449	Коммерция 66.89 м²	13	3
61	5	0	83	61343100	735000	1	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:07:51.908	2025-11-28 08:07:51.908	Коммерция 83.46 м²	13	3
62	5	3	96	43886640	453000	8	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:09:11.421	2025-11-28 08:09:11.421	3К квартира 96.88 м²	42	3
63	5	3	109	43299900	395000	7	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:10:24.388	2025-11-28 08:10:24.388	3К квартира 109.62 м²	39	3
64	5	2	68	24394140	354000	2	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:11:32.15	2025-11-28 08:11:32.15	2К квартира 68.91 м²	6	3
65	5	1	68	20677440	476000	7	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:12:38.532	2025-11-28 08:12:38.532	1К квартира 43.44 м²	40	3
66	5	1	43	19493670	447000	7	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:13:54.583	2025-11-28 08:13:54.583	1К квартира 43.61 м²	40	3
67	5	3	104	47501580	453000	8	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:15:02.818	2025-11-28 08:15:02.818	3К квартира 104.86 м²	44	3
68	5	3	108	42960200	395000	7	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:16:08.498	2025-11-28 08:16:08.498	3К квартира 108.76 м²	70	3
69	5	1	40	19477920	476000	7	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:17:15.17	2025-11-28 08:17:15.17	1К квартира 40.92 м²	71	3
70	5	1	40	18921510	447000	7	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:18:09.693	2025-11-28 08:18:09.693	1К квартира 42.33 м²	62	3
71	5	2	68	25594240	406000	6	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:19:30.831	2025-11-28 08:19:30.831	2К квартира 63.04 м²	62	3
72	5	0	68	49179480	762000	1	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:20:57.578	2025-11-28 08:20:57.578	Коммерция 64.54 м²	62	3
73	5	0	69	53157120	762000	1	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:21:56.313	2025-11-28 08:21:56.313	Коммерция 69.76 м²	62	3
74	5	2	56	24827600	443350	6	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:23:50.749	2025-11-28 08:23:50.749	2К квартира 56 м²	17	4
75	5	2	84	33316745	393350	5	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:24:54.121	2025-11-28 08:24:54.121	2К квартира 84.7 м²	14	4
76	5	1	48	21533115	440350	5	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:25:52.249	2025-11-28 08:25:52.249	1К квартира 48.9 м²	15	4
77	5	4	177	81981895	461350	8	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:26:56.024	2025-11-28 08:26:56.024	4К квартира 177.7 м²	15	4
78	5	0	155	106380500	685000	8	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:27:57.145	2025-11-28 08:27:57.145	Коммерция 155.3 м²	10	4
79	5	0	116	82340400	708000	1	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:29:05.242	2025-11-28 08:29:05.242	Коммерция 116.3 м²	10	4
80	5	0	90	65007150	721500	1	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:29:49.242	2025-11-28 08:29:49.242	Коммерция 90.1 м²	10	4
81	5	1	40	18573445	456350	1	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:30:56.169	2025-11-28 08:30:56.169	1К квартира 40.7 м²	53	4
82	5	1	42	19531780	456350	1	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:32:00.915	2025-11-28 08:32:00.915	1К квартира 42.8 м²	53	4
83	5	4	178	70391475	394350	7	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:32:56.744	2025-11-28 08:32:56.744	4К квартира 178.5 м²	53	4
84	5	2	68	27492000	400000	6	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:35:04.513	2025-11-28 08:35:04.513	2К квартира 68.73 м²	39	4
85	5	1	29	15843550	529000	5	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:36:19.605	2025-11-28 08:36:19.605	1К квартира 29.95 м²	32	4
86	5	1	34	17715600	518000	5	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:37:12.099	2025-11-28 08:37:12.099	1К квартира 34.2 м²	32	4
87	5	3	104	37097500	355000	5	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:38:06.701	2025-11-28 08:38:06.701	3К квартира 104.5 м²	32	4
88	5	0	4	463320	117000	1	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:39:25.815	2025-11-28 08:39:25.815	Кладовая 3.96 м²	32	4
89	6	2	60	30620000	508807	6	8	Казань	55.812514	49.1408	readyApartment	2025-11-28 08:55:33.764	2025-11-28 08:55:33.764	2К квартира 60.18 м²	24	4
90	6	2	71	34110000	480152	6	19	Казань	55.799962	49.182618	readyApartment	2025-11-28 08:59:03.541	2025-11-28 08:59:03.541	2К квартира 71.04 м²	25	1
91	6	2	58	27980000	476661	6	19	Казань	55.799962	49.182618	readyApartment	2025-11-28 09:01:06.282	2025-11-28 09:01:06.282	2К квартира 58.7 м²	26	1
92	6	2	59	25140000	424734	2	19	Казань	55.799962	49.182618	readyApartment	2025-11-28 09:02:15.329	2025-11-28 09:02:15.329	2К квартира 59.19 м²	26	1
93	6	1	39	16590000	417779	6	19	Казань	55.799962	49.182618	readyApartment	2025-11-28 09:03:29.197	2025-11-28 09:03:29.197	1К квартира 39.71 м²	27	1
94	6	2	70	36790000	523031	6	19	Казань	55.799962	49.182618	readyApartment	2025-11-28 09:04:42.085	2025-11-28 09:04:42.085	2К квартира 70.34 м²	28	1
95	6	2	65	34250000	521945	6	19	Казань	55.799962	49.182618	readyApartment	2025-11-28 09:05:34.227	2025-11-28 09:05:34.227	2К квартира 65.62 м²	29	1
96	6	2	77	37790000	487487	6	19	Казань	55.799962	49.182618	readyApartment	2025-11-28 09:06:33.084	2025-11-28 09:06:33.084	2К квартира 77.52 м²	86	1
97	6	2	77	31180000	402374	9	19	Казань	55.799962	49.182618	readyApartment	2025-11-28 09:07:25.294	2025-11-28 09:07:25.294	2К квартира 77.49 м²	86	1
98	6	2	62	30930000	494011	9	19	Казань	55.799962	49.182618	readyApartment	2025-11-28 09:08:26.869	2025-11-28 09:08:26.869	2К квартира 62.61 м²	97	1
99	6	2	62	25560000	408502	8	19	Казань	55.799962	49.182618	readyApartment	2025-11-28 09:09:42.962	2025-11-28 09:09:42.962	2К квартира 62.57 м²	97	1
100	6	1	46	18710000	405505	8	19	Казань	55.799962	49.182618	readyApartment	2025-11-28 09:10:40.091	2025-11-28 09:10:40.091	1К квартира 46.14 м²	73	1
101	6	3	82	44100000	494062	11	19	Казань	55.799962	49.182618	readyApartment	2025-11-28 09:25:20.914	2025-11-28 09:25:20.914	3К квартира 89.26 м²	89	1
102	6	3	89	36870000	413434	7	19	Казань	55.799962	49.182618	readyApartment	2025-11-28 09:26:26.772	2025-11-28 09:26:26.772	3К квартира 89.18 м²	89	1
103	6	3	102	53540000	524851	7	19	Казань	55.799962	49.182618	readyApartment	2025-11-28 09:27:14.771	2025-11-28 09:27:14.771	3К квартира 102.01 м²	80	1
104	7	2	55	14929000	267449	1	7	Казань	55.803916	49.055684	readyApartment	2025-11-28 09:38:03.579	2025-11-28 09:38:03.579	2К квартира 55.82 м²	1	2
105	7	2	67	14929000	267449	1	7	Казань	55.803916	49.055684	readyApartment	2025-11-28 09:39:11.99	2025-11-28 09:39:11.99	2К квартира 67.23 м²	2	2
106	7	2	67	17618000	262056	1	7	Казань	55.803916	49.055684	readyApartment	2025-11-28 09:39:56.161	2025-11-28 09:39:56.161	2К квартира 67.23 м²	2	2
107	7	2	67	18201000	270285	1	7	Казань	55.803916	49.055684	readyApartment	2025-11-28 09:40:46.192	2025-11-28 09:40:46.192	2К квартира 67.34 м²	33	2
108	7	2	57	15421000	267030	1	7	Казань	55.803916	49.055684	readyApartment	2025-11-28 09:41:41.461	2025-11-28 09:41:41.461	2К квартира 57.75 м²	35	2
142	8	3	90	11778000	130000	5	5	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:46:52.085	2025-11-28 10:46:52.085	3К квартира 90.6 м²	1	3
109	7	1	90	28118000	310319	1	7	Казань	55.803916	49.055684	readyApartment	2025-11-28 09:42:34.567	2025-11-28 09:45:48.787	1К квартира 90.61 м²	52	2
110	7	2	64	17929000	280097	4	7	Казань	55.803916	49.055684	readyApartment	2025-11-28 09:46:37.521	2025-11-28 09:46:37.521	2К квартира 64.01 м²	52	2
11	1	2	52	28118000	310319	8	9	Казань	55.823574	48.898876	readyApartment	2025-11-27 11:10:45.694	2025-11-28 09:48:47.949	2К квартира 52.6 м²	236	1
111	7	1	100	28118000	310319	4	7	Казань	55.803916	49.055684	readyApartment	2025-11-28 09:47:56.496	2025-11-28 09:48:48.892	1К квартира 100.83 м²	79	2
112	7	1	59	19318000	325932	6	7	Казань	55.803916	49.055684	readyApartment	2025-11-28 09:49:24.412	2025-11-28 09:49:24.412	1К квартира 59.27 м²	79	2
113	7	2	58	17133000	294331	4	7	Казань	55.803916	49.055684	readyApartment	2025-11-28 09:50:30.349	2025-11-28 09:51:19.779	2К квартира 58.21 м²	69	2
114	7	2	61	16725000	271466	3	7	Казань	55.803916	49.055684	readyApartment	2025-11-28 09:51:59.693	2025-11-28 09:51:59.693	2К квартира 61.61 м²	64	2
115	7	2	89	22965000	256879	5	7	Казань	55.803916	49.055684	readyApartment	2025-11-28 09:53:12.193	2025-11-28 09:53:12.193	2К квартира 89.4 м²	100	2
116	7	1	83	20975000	252680	6	7	Казань	55.803916	49.055684	readyApartment	2025-11-28 09:54:10.797	2025-11-28 09:54:10.797	1К квартира 83.01 м²	100	2
117	7	1	55	16000000	289070	3	7	Казань	55.803916	49.055684	readyApartment	2025-11-28 09:55:25.782	2025-11-28 09:55:25.782	1К квартира 55.35 м²	100	2
118	7	1	83	20884000	251584	6	7	Казань	55.803916	49.055684	readyApartment	2025-11-28 09:56:27.065	2025-11-28 09:56:27.065	1К квартира 83.01 м²	109	2
119	7	1	40	14800000	367428	4	7	Казань	55.803916	49.055684	readyApartment	2025-11-28 09:57:20.837	2025-11-28 09:57:20.837	1К квартира 40.28 м²	109	2
120	7	2	64	18521000	287951	5	7	Казань	55.803916	49.055684	readyApartment	2025-11-28 09:59:14.749	2025-11-28 09:59:14.749	2К квартира 64.32 м²	109	2
121	7	2	63	17127000	268028	2	7	Казань	55.803916	49.055684	readyApartment	2025-11-28 10:00:13.473	2025-11-28 10:00:13.473	2К квартира 63.9 м²	181	2
122	7	0	8	784000	97030	2	7	Казань	55.803916	49.055684	readyApartment	2025-11-28 10:01:36.837	2025-11-28 10:01:36.837	Кладовая 8.08 м²	181	2
123	7	3	73	19240000	262411	6	7	Казань	55.803916	49.055684	readyApartment	2025-11-28 10:04:07.866	2025-11-28 10:04:07.866	3К квартира 73.32 м²	23	2
124	7	3	72	18310000	251892	2	7	Казань	55.803916	49.055684	readyApartment	2025-11-28 10:04:55.317	2025-11-28 10:04:55.317	3К квартира 72.69 м²	3	2
125	7	1	37	12460000	329717	3	7	Казань	55.803916	49.055684	readyApartment	2025-11-28 10:08:45.16	2025-11-28 10:08:45.16	1К квартира 37.79 м²	3	2
126	7	3	86	20780000	240983	3	7	Казань	55.803916	49.055684	readyApartment	2025-11-28 10:10:14.037	2025-11-28 10:10:14.037	3К квартира 86.23 м²	135	2
127	8	3	90	11726000	130000	5	7	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:18:53.86	2025-11-28 10:18:53.86	3К квартира 90.2 м²	40	1
128	8	1	49	6951300	141000	4	7	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:20:12.318	2025-11-28 10:20:12.318	1К квартира 49.3 м²	32	1
129	8	2	51	7252000	140000	5	5	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:21:07.03	2025-11-28 10:21:07.03	2К квартира 51.8 м²	32	1
130	8	2	52	7266000	140000	1	5	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:22:20.019	2025-11-28 10:22:20.019	2К квартира 51.9 м²	32	1
131	8	3	77	10062000	130000	1	5	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:23:25.102	2025-11-28 10:23:25.102	3К квартира 77.4 м²	3	1
132	8	2	77	7762500	135000	2	3	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:24:16.337	2025-11-28 10:24:16.337	2К квартира 57.5 м²	7	1
133	8	2	57	7803000	135000	1	3	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:25:05.602	2025-11-28 10:25:05.602	2К квартира 57.8 м²	2	1
134	8	3	76	9958000	130000	1	3	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:26:11.073	2025-11-28 10:26:11.073	3К квартира 76.6 м²	2	1
135	8	3	77	10036000	130000	1	3	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:27:02.03	2025-11-28 10:27:02.03	3К квартира 77.2 м²	2	1
136	8	2	57	7789500	135000	3	3	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:27:56.323	2025-11-28 10:27:56.323	2К квартира 57.7 м²	2	1
137	8	1	40	5843500	145000	3	3	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:28:49.53	2025-11-28 10:28:49.53	1К квартира 40.3 м²	2	1
138	8	2	57	7749000	135000	3	3	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:29:39.289	2025-11-28 10:29:39.289	2К квартира 57.4 м²	2	1
139	8	1	40	5930500	145000	1	3	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:42:21.38	2025-11-28 10:42:21.38	1К квартира 40.9 м²	1	1
140	8	2	51	7266000	140000	1	3	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:43:16.935	2025-11-28 10:43:16.935	2К квартира 51.9 м²	1	1
141	8	2	52	7294000	140000	4	3	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:45:32.633	2025-11-28 10:45:32.633	2К квартира 52.1 м²	1	1
143	8	1	40	5930500	145000	1	5	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:47:47.821	2025-11-28 10:47:47.821	1К квартира 40.9 м²	1	3
144	8	3	76	9984000	130000	1	3	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:48:57.266	2025-11-28 10:48:57.266	3К квартира 76.8 м²	1	4
145	8	1	40	5858000	145000	1	3	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:49:44.812	2025-11-28 10:49:44.812	1К квартира 40.4 м²	1	4
146	8	3	77	10036000	130000	1	3	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:50:32.179	2025-11-28 10:50:32.179	3К квартира 77.2 м²	1	4
147	8	1	40	5441030	133000	1	3	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:51:25.576	2025-11-28 10:51:25.576	1К квартира 40.91 м²	1	4
148	8	2	52	6749280	129000	1	3	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:52:21.393	2025-11-28 10:52:21.393	2К квартира 52.32 м²	1	5
149	8	3	90	10802820	119000	5	5	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:53:15.407	2025-11-28 10:53:15.407	3К квартира 90.78 м²	1	5
150	8	1	41	5593050	135000	5	5	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:54:12.878	2025-11-28 10:54:12.878	1К квартира 41.43 м²	1	5
151	8	1	41	6506280	132000	5	5	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:55:04.163	2025-11-28 10:55:04.163	1К квартира 49.29 м²	1	5
152	8	3	77	9261600	120000	5	5	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:56:04.494	2025-11-28 10:56:04.494	3К квартира 77.18 м²	1	5
153	8	1	40	5517520	136000	5	5	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:57:08.216	2025-11-28 10:57:08.216	1К квартира 40.57 м²	1	5
154	8	3	77	9261600	120000	5	5	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:58:18.098	2025-11-28 10:58:18.098	3К квартира 77.18 м²	1	6
155	8	2	57	7229880	126000	5	5	Казань	55.73577	48.822744	readyApartment	2025-11-28 10:59:10.495	2025-11-28 10:59:10.495	2К квартира 57.38 м²	1	6
156	8	1	40	5517520	136000	5	5	Казань	55.73577	48.822744	readyApartment	2025-11-28 11:00:00.957	2025-11-28 11:00:00.957	1К квартира 40.57 м²	1	6
157	8	2	58	7309260	126000	5	5	Казань	55.73577	48.822744	readyApartment	2025-11-28 11:01:00.201	2025-11-28 11:01:00.201	2К квартира 58.01 м²	1	6
158	8	1	40	5517520	136000	5	5	Казань	55.73577	48.822744	readyApartment	2025-11-28 11:03:12.162	2025-11-28 11:03:12.162	1К квартира 40.57 м²	1	7
159	8	2	57	7301700	126000	5	5	Казань	55.73577	48.822744	readyApartment	2025-11-28 11:04:01.584	2025-11-28 11:04:01.584	2К квартира 57.95 м²	1	7
160	9	4	108	46510000	430210	20	20	Казань	55.815079	49.143865	readyApartment	2025-11-28 11:11:56.561	2025-11-28 11:11:56.561	4К квартира 108.11 м²	1	1
161	9	0	7	883000	127233	1	20	Казань	55.815079	49.143865	readyApartment	2025-11-28 11:13:26.299	2025-11-28 11:13:26.299	Кладовая 6.94 м²	1	1
162	9	0	4	669000	129651	1	20	Казань	55.815079	49.143865	readyApartment	2025-11-28 11:14:19.341	2025-11-28 11:14:19.341	Кладовая 5.16 м²	1	1
163	9	0	9	1144000	125439	1	20	Казань	55.815079	49.143865	readyApartment	2025-11-28 11:15:09.522	2025-11-28 11:15:09.522	Кладовая 9.12 м²	1	1
164	9	0	8	1027000	126167	1	20	Казань	55.815079	49.143865	readyApartment	2025-11-28 11:16:03.115	2025-11-28 11:16:03.115	Кладовая 8.14 м²	1	1
165	9	0	13	3050000	230189	1	20	Казань	55.815079	49.143865	readyApartment	2025-11-28 11:17:20.444	2025-11-28 11:17:20.444	Машиноместо 13.25 м²	1	1
166	10	2	60	10099000	167535	8	9	Казань	55.872707	49.301328	readyApartment	2025-11-28 11:25:55.146	2025-11-28 11:25:55.146	2К квартира 60.28 м²	1	1
167	10	3	75	11500000	151996	6	9	Казань	55.872707	49.301328	readyApartment	2025-11-28 11:27:02.799	2025-11-28 11:27:02.799	3К квартира 75.66 м²	1	2
168	10	1	34	7705000	222302	4	9	Казань	55.872707	49.301328	readyApartment	2025-11-28 11:28:06.315	2025-11-28 11:28:06.315	1К квартира 34.66 м²	1	2
169	10	0	25	6319000	245971	7	9	Казань	55.872707	49.301328	readyApartment	2025-11-28 11:28:57.633	2025-11-28 11:28:57.633	Студия 25.69 м²	1	2
170	10	2	65	9571000	146458	1	9	Казань	55.872707	49.301328	readyApartment	2025-11-28 11:29:58.466	2025-11-28 11:29:58.466	2К квартира 65.35 м²	1	2
171	10	1	33	6435000	191006	1	9	Казань	55.872707	49.301328	readyApartment	2025-11-28 11:30:48.266	2025-11-28 11:30:48.266	1К квартира 33.69 м²	1	2
172	10	1	34	6444000	187108	1	9	Казань	55.872707	49.301328	readyApartment	2025-11-28 11:31:45.375	2025-11-28 11:31:45.375	1К квартира 34.44 м²	1	2
173	10	2	53	8169000	153524	1	9	Казань	55.872707	49.301328	readyApartment	2025-11-28 11:32:33.083	2025-11-28 11:32:33.083	2К квартира 53.21 м²	1	2
174	10	0	25	6933000	269872	7	9	Казань	55.872707	49.301328	readyApartment	2025-11-28 11:40:39.989	2025-11-28 11:40:39.989	Студия 25.69 м²	1	2
175	10	0	25	6958000	269272	7	9	Казань	55.872707	49.301328	readyApartment	2025-11-28 11:41:46.19	2025-11-28 11:41:46.19	Студия 25.84 м²	1	2
176	10	3	75	12424000	164796	7	9	Казань	55.872707	49.301328	readyApartment	2025-11-28 11:43:15.448	2025-11-28 11:43:15.448	3К квартира 75.39 м²	1	2
177	10	3	75	11936000	157884	7	9	Казань	55.872707	49.301328	readyApartment	2025-11-28 11:44:06.394	2025-11-28 11:44:06.394	3К квартира 75.6 м²	1	2
178	10	2	59	8800000	147825	6	9	Казань	55.872707	49.301328	readyApartment	2025-11-28 11:45:04.322	2025-11-28 11:45:04.322	2К квартира 59.53 м²	1	2
179	10	2	59	10292000	172280	6	9	Казань	55.872707	49.301328	readyApartment	2025-11-28 11:45:49.087	2025-11-28 11:45:49.087	2К квартира 59.74 м²	1	2
180	10	2	59	8601000	141487	7	9	Казань	55.872707	49.301328	readyApartment	2025-11-28 11:46:40.48	2025-11-28 11:46:40.48	2К квартира 60.79 м²	1	2
181	10	1	34	6450000	187282	7	9	Казань	55.872707	49.301328	readyApartment	2025-11-28 11:47:33.26	2025-11-28 11:47:33.26	1К квартира 34.44 м²	1	2
182	10	1	34	6383000	184160	7	9	Казань	55.872707	49.301328	readyApartment	2025-11-28 11:48:19.639	2025-11-28 11:48:19.639	1К квартира 34.66 м²	1	2
183	10	1	33	6525000	193678	7	9	Казань	55.872707	49.301328	readyApartment	2025-11-28 11:49:19.145	2025-11-28 11:49:19.145	1К квартира 33.69 м²	1	2
184	10	2	60	8571000	142186	7	9	Казань	55.872707	49.301328	readyApartment	2025-11-28 11:50:17.414	2025-11-28 11:50:17.414	2К квартира 60.28 м²	1	2
185	10	1	35	6462000	184576	7	9	Казань	55.872707	49.301328	readyApartment	2025-11-28 11:51:27.456	2025-11-28 11:51:27.456	1К квартира 35.01 м²	1	2
186	10	1	47	7545000	159987	7	9	Казань	55.872707	49.301328	readyApartment	2025-11-28 11:52:56.253	2025-11-28 11:52:56.253	1К квартира 47.16 м²	1	2
187	10	3	80	10810000	133490	7	9	Казань	55.872707	49.301328	readyApartment	2025-11-28 11:53:52.947	2025-11-28 11:53:52.947	3К квартира 80.98 м²	1	2
188	10	3	81	10505000	129340	7	9	Казань	55.872707	49.301328	readyApartment	2025-11-28 11:54:37.625	2025-11-28 11:54:37.625	3К квартира 81.22 м²	1	2
189	10	1	39	6956000	178222	7	9	Казань	55.872707	49.301328	readyApartment	2025-11-28 11:55:35.075	2025-11-28 11:55:35.075	1К квартира 39.03 м²	1	2
190	10	1	37	6699000	176336	7	9	Казань	55.872707	49.301328	readyApartment	2025-11-28 11:56:25.207	2025-11-28 11:56:25.207	1К квартира 37.99 м²	1	2
191	10	1	34	6885000	199971	7	9	Казань	55.872707	49.301328	readyApartment	2025-11-28 11:57:24.955	2025-11-28 11:57:24.955	1К квартира 34.43 м²	1	2
192	11	2	58	16728778	285036	25	25	Казань	55.872707	49.301328	readyApartment	2025-11-28 12:05:46.986	2025-11-28 12:05:46.986	2К квартира 58.69 м²	1	2
193	11	2	58	16565071	282247	25	25	Казань	55.872707	49.301328	readyApartment	2025-11-28 12:06:40.891	2025-11-28 12:06:40.891	2К квартира 58.69 м²	1	2
195	12	1	48	14962564	311461	14	14	Казань	55.872707	49.301328	readyApartment	2025-11-28 12:12:53.733	2025-11-28 12:12:53.733	1К квартира 48.04 м²	1	1
197	12	2	61	17581475	287561	13	14	Казань	55.872707	49.301328	readyApartment	2025-11-28 12:15:09.934	2025-11-28 12:15:09.934	2К квартира 61.14 м²	1	1
194	12	0	29	11044655	378112	14	14	Казань	55.872707	49.301328	readyApartment	2025-11-28 12:11:36.809	2025-11-28 12:13:43.579	Студия 29.21 м²	1	1
196	12	1	41	12864588	312172	13	14	Казань	55.872707	49.301328	readyApartment	2025-11-28 12:14:22.995	2025-11-28 12:14:22.995	1К квартира 41.21 м²	1	1
198	12	0	30	11587822	384467	13	14	Казань	55.872707	49.301328	readyApartment	2025-11-28 12:15:58.511	2025-11-28 12:15:58.511	Студия 30.14 м²	1	1
199	12	2	48	14135958	294254	13	14	Казань	55.872707	49.301328	readyApartment	2025-11-28 12:16:55.794	2025-11-28 12:16:55.794	2К квартира 48.04 м²	1	2
200	12	2	48	14302157	294041	13	14	Казань	55.872707	49.301328	readyApartment	2025-11-28 12:18:09.495	2025-11-28 12:18:09.495	2К квартира 48.64 м²	1	2
201	12	1	41	13776750	334306	12	14	Казань	55.872707	49.301328	readyApartment	2025-11-28 12:19:01.803	2025-11-28 12:19:01.803	1К квартира 41.21 м²	1	2
202	12	3	68	17288826	251145	8	14	Казань	55.872707	49.301328	readyApartment	2025-11-28 12:20:00.323	2025-11-28 12:20:00.323	3К квартира 68.84 м²	1	2
203	12	1	41	13901781	337340	13	14	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:21:19.753	2025-11-28 12:21:19.753	1К квартира 41.21 м²	1	2
204	12	2	61	16811589	275104	12	14	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:22:13.309	2025-11-28 12:22:13.309	2К квартира 61.11 м²	1	2
205	12	0	30	10703235	355117	12	14	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:22:58.701	2025-11-28 12:22:58.701	Студия 30.14 м²	1	2
206	12	2	61	17037951	278489	19	22	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:24:00.823	2025-11-28 12:24:00.823	2К квартира 61.18 м²	1	2
207	12	2	65	17787238	269831	17	22	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:24:56.016	2025-11-28 12:24:56.016	2К квартира 65.92 м²	1	2
208	12	2	55	16611455	299954	21	22	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:25:47.723	2025-11-28 12:25:47.723	2К квартира 55.38 м²	1	2
209	12	2	78	19685314	251763	17	22	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:26:34.643	2025-11-28 12:26:34.643	2К квартира 78.19 м²	1	2
210	12	2	61	17123375	279383	20	22	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:27:33.804	2025-11-28 12:27:33.804	2К квартира 61.29 м²	1	2
211	12	3	65	17892586	271429	19	22	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:28:23.395	2025-11-28 12:28:23.395	3К квартира 65.92 м²	1	2
212	12	3	78	21403213	273000	17	22	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:29:10.248	2025-11-28 12:29:10.248	3К квартира 78.4 м²	1	2
213	12	2	55	15735793	283579	17	22	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:30:07.902	2025-11-28 12:30:07.902	2К квартира 55.49 м²	1	2
214	12	2	59	16514837	279675	15	22	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:30:57.489	2025-11-28 12:30:57.489	2К квартира 59.05 м²	1	2
215	12	3	78	21294178	272409	21	22	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:31:55.42	2025-11-28 12:31:55.42	3К квартира 78.17 м²	1	2
216	12	2	55	15050037	270587	18	22	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:33:01.546	2025-11-28 12:33:01.546	2К квартира 55.62 м²	1	2
217	12	2	52	14323040	274335	19	22	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:33:48.89	2025-11-28 12:33:48.89	2К квартира 52.21 м²	1	2
218	12	2	60	15367251	254931	15	22	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:34:35.757	2025-11-28 12:34:35.757	2К квартира 60.28 м²	1	2
219	12	0	25	10429623	401603	22	22	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:35:33.139	2025-11-28 12:35:33.139	Студия 25.97 м²	1	2
220	12	2	53	14700104	276526	22	22	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:36:37.423	2025-11-28 12:36:37.423	2К квартира 53.16 м²	1	2
221	12	2	54	14468056	266398	22	22	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:37:32.185	2025-11-28 12:37:32.185	2К квартира 54.31 м²	1	2
222	12	2	65	16560947	252300	16	22	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:38:28.41	2025-11-28 12:38:28.41	2К квартира 65.64 м²	1	2
223	12	0	29	11099057	379975	14	14	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:39:49.585	2025-11-28 12:39:49.585	Студия 29.21 м²	1	2
224	12	1	48	14949867	311196	14	14	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:40:40.654	2025-11-28 12:40:40.654	1К квартира 48.04 м²	1	2
225	12	1	48	14715372	302536	14	14	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:41:22.836	2025-11-28 12:41:22.836	1К квартира 48.64 м²	1	2
226	12	1	41	12864588	312172	12	14	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:42:12.726	2025-11-28 12:42:12.726	1К квартира 41.21 м²	1	2
227	12	2	61	17308927	283103	12	14	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:43:02.443	2025-11-28 12:43:02.443	2К квартира 61.14 м²	1	2
228	12	0	30	11216053	372132	12	14	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:43:48.665	2025-11-28 12:43:48.665	Студия 30.14 м²	1	2
229	12	0	154	49275826	319869	1	14	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:45:01.739	2025-11-28 12:45:01.739	Коммерция 154.05 м²	1	2
230	12	2	59	15575505	261817	11	14	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:47:58.322	2025-11-28 12:47:58.322	2К квартира 59.49 м²	1	2
231	12	3	65	16167064	245253	8	14	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:48:54.301	2025-11-28 12:48:54.301	3К квартира 65.92 м²	1	2
232	12	3	78	19537578	249204	8	14	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:50:24.237	2025-11-28 12:50:24.237	3К квартира 78.4 м²	1	2
241	13	3	72	16471074	227501	2	9	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:11:15.429	2025-11-28 13:11:15.429	3К квартира 72.4 м²	1	1
234	13	3	69	15871322	227546	2	9	Казань	55.765731	49.19311	readyApartment	2025-11-28 12:59:53.491	2025-11-28 13:06:51.687	3К квартира 69.75 м²	1	1
240	13	3	90	20564846	226261	8	9	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:05:41.279	2025-11-28 13:11:40.762	3К квартира 90.89 м²	1	1
237	13	3	91	20548725	223672	6	9	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:02:36.799	2025-11-28 13:12:01.883	3К квартира 91.87 м²	1	1
238	12	3	66	15449120	232248	2	9	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:03:37.703	2025-11-28 13:11:54.637	3К квартира 66.52 м²	1	1
239	13	3	66	17109393	257207	9	9	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:04:24.754	2025-11-28 13:11:49.82	3К квартира 66.52 м²	1	1
233	13	3	89	22003551	245493	13	14	Казань	55.777188	49.202616	readyApartment	2025-11-28 12:51:17.308	2025-11-28 13:07:49.573	3К квартира 89.63 м²	1	2
235	13	3	75	17190873	226285	2	9	Казань	55.765731	49.19311	readyApartment	2025-11-28 13:00:53.87	2025-11-28 13:09:22.269	3К квартира 75.97 м²	1	1
242	13	3	91	20403950	223678	6	9	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:13:29.234	2025-11-28 13:13:29.234	3К квартира 91.22 м²	1	1
236	12	3	91	20568621	224966	7	9	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:01:47.119	2025-11-28 13:12:04.644	3К квартира 91.43 м²	1	1
243	13	3	90	20398361	224974	7	9	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:14:21.351	2025-11-28 13:14:21.351	3К квартира 90.67 м²	1	1
244	13	3	72	16581973	227493	2	9	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:15:00.023	2025-11-28 13:15:00.023	3К квартира 72.89 м²	1	1
245	13	3	66	15602758	234557	2	9	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:15:41.903	2025-11-28 13:15:41.903	3К квартира 66.52 м²	1	1
246	13	3	91	20450724	223676	6	9	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:16:33.719	2025-11-28 13:16:33.719	3К квартира 91.43 м²	1	1
247	13	2	54	15144929	277838	22	23	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:17:42.306	2025-11-28 13:17:42.306	2К квартира 54.51 м²	1	1
248	13	2	53	14794174	274373	20	23	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:18:35.299	2025-11-28 13:18:35.299	2К квартира 53.92 м²	1	1
249	13	2	54	14757217	270874	18	23	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:19:21.105	2025-11-28 13:19:21.105	2К квартира 54.48 м²	1	1
250	13	2	49	14032545	282402	21	23	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:20:10.18	2025-11-28 13:20:10.18	2К квартира 49.69 м²	1	1
251	13	2	49	13382517	272556	16	23	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:21:05.969	2025-11-28 13:21:05.969	2К квартира 49.1 м²	1	1
252	13	2	49	13979220	282408	21	23	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:21:49.544	2025-11-28 13:21:49.544	2К квартира 49.5 м²	1	1
253	13	1	34	11989599	351911	23	23	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:22:38.188	2025-11-28 13:22:38.188	1К квартира 34.07 м²	1	1
254	13	1	33	11622279	347141	21	23	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:23:30.885	2025-11-28 13:23:30.885	1К квартира 33.48 м²	1	1
255	13	2	33	13207102	280525	20	23	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:24:26.663	2025-11-28 13:24:26.663	2К квартира 47.08 м²	1	1
256	13	3	88	21306830	240837	18	23	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:25:13.5	2025-11-28 13:25:13.5	3К квартира 88.47 м²	1	1
257	13	2	57	15191010	263824	16	23	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:26:04.337	2025-11-28 13:26:04.337	2К квартира 57.58 м²	1	1
258	13	2	53	14796846	277875	22	23	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:27:06.144	2025-11-28 13:27:06.144	2К квартира 53.25 м²	1	1
259	13	2	44	13518916	306066	22	23	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:27:56.51	2025-11-28 13:27:56.51	2К квартира 44.17 м²	1	1
260	13	2	65	16972133	259117	19	23	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:28:37.961	2025-11-28 13:28:37.961	2К квартира 65.5 м²	1	1
261	13	2	49	13718314	279054	19	23	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:29:27.371	2025-11-28 13:29:27.371	2К квартира 49.16 м²	1	1
262	13	1	44	13718229	306621	22	23	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:30:12.433	2025-11-28 13:30:12.433	1К квартира 44.74 м²	1	1
263	13	1	44	13882436	310291	22	23	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:30:51.238	2025-11-28 13:30:51.238	1К квартира 44.74 м²	1	1
264	13	1	45	13048923	287675	22	23	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:31:32.451	2025-11-28 13:31:32.451	1К квартира 45.36 м²	1	1
265	13	0	27	10029911	366055	20	23	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:32:09.302	2025-11-28 13:32:09.302	Студия 27.4 м²	1	1
266	13	0	27	10058940	366046	20	23	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:32:46.971	2025-11-28 13:32:46.971	Студия 27.48 м²	1	1
267	13	2	56	15697727	277198	21	23	Казань	55.777188	49.202616	readyApartment	2025-11-28 13:34:06.445	2025-11-28 13:34:06.445	2К квартира 56.63 м²	1	1
270	14	4	188	57849214	307627	5	8	Казань	55.765939	49.097057	readyApartment	2025-11-28 13:43:04.948	2025-11-28 13:43:04.948	4К квартира 188.05 м²	1	1
268	14	3	183	51002955	276874	2	8	Казань	55.765939	49.097057	readyApartment	2025-11-28 13:40:37.611	2025-11-28 13:43:30.457	3К квартира 184.21 м²	1	1
269	14	3	142	44506497	311343	4	8	Казань	55.765939	49.097057	readyApartment	2025-11-28 13:42:00.575	2025-11-28 13:43:44.455	3К квартира 142.95 м²	1	1
271	14	3	107	36467946	338733	5	8	Казань	55.765939	49.097057	readyApartment	2025-11-28 13:45:36.529	2025-11-28 13:45:36.529	3К квартира 107.66 м²	1	1
272	14	4	160	46814807	292264	2	8	Казань	55.765939	49.097057	readyApartment	2025-11-28 13:46:30.961	2025-11-28 13:46:30.961	4К квартира 160.18 м²	1	1
273	14	4	175	76529414	435346	4	8	Казань	55.765939	49.097057	readyApartment	2025-11-28 13:47:16.16	2025-11-28 13:47:16.16	4К квартира 175.79 м²	1	1
274	14	2	62	20643145	331138	2	8	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:11:35.8	2025-11-28 14:11:35.8	2К квартира 62.34 м²	1	1
275	14	3	98	31848216	323694	4	8	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:13:57.792	2025-11-28 14:13:57.792	3К квартира 98.39 м²	1	1
276	14	2	53	18129523	339504	2	8	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:14:56.751	2025-11-28 14:14:56.751	2К квартира 53.4 м²	1	1
277	14	2	102	31603324	307695	2	8	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:16:06.117	2025-11-28 14:16:06.117	3К квартира 102.71 м²	1	1
278	14	3	92	29650609	321346	3	8	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:16:55.961	2025-11-28 14:16:55.961	3К квартира 92.27 м²	1	1
279	14	0	65	20202162	307725	2	8	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:18:06.745	2025-11-28 14:18:06.745	Студия 65.65 м²	1	1
280	14	3	74	23975931	320662	9	10	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:19:13.298	2025-11-28 14:19:13.298	3К квартира 74.77 м²	1	1
281	14	2	65	20027352	305062	2	10	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:20:01.262	2025-11-28 14:20:01.262	2К квартира 65.65 м²	1	1
282	14	3	74	23475960	313724	10	10	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:20:47.744	2025-11-28 14:20:47.744	3К квартира 74.83 м²	1	1
283	14	2	44	18289024	411267	8	10	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:21:41.093	2025-11-28 14:21:41.093	2К квартира 44.47 м²	1	1
284	14	3	121	40076259	328979	9	10	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:22:42.468	2025-11-28 14:23:38.898	3К квартира 121.82 м²	1	1
285	14	2	76	23501811	308950	7	10	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:24:11.256	2025-11-28 14:24:11.256	2К квартира 76.07 м²	1	1
286	14	2	66	23868552	359574	12	10	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:25:08.684	2025-11-28 14:25:08.684	2К квартира 66.38 м²	1	1
287	14	2	66	22966991	345316	10	15	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:25:59.364	2025-11-28 14:25:59.364	2К квартира 66.51 м²	1	1
288	14	5	148	46534238	313320	10	15	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:26:39.125	2025-11-28 14:26:39.125	5К квартира 148.52 м²	1	1
289	14	3	74	22680877	306416	7	15	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:27:59.473	2025-11-28 14:27:59.473	3К квартира 74.02 м²	1	1
290	14	3	77	22710043	292504	2	15	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:28:47.57	2025-11-28 14:28:47.57	3К квартира 77.64 м²	1	1
291	14	3	70	22188833	313048	11	15	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:30:08.961	2025-11-28 14:30:08.961	3К квартира 70.88 м²	1	1
292	14	3	70	22217005	313048	11	15	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:31:00.116	2025-11-28 14:31:00.116	3К квартира 70.97 м²	1	1
293	14	3	71	22005176	309888	11	15	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:31:56.595	2025-11-28 14:31:56.595	3К квартира 71.01 м²	1	1
294	14	3	71	22034891	310351	7	15	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:32:49.743	2025-11-28 14:32:49.743	3К квартира 71 м²	1	1
295	14	0	145	86935539	598812	1	15	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:33:41.903	2025-11-28 14:33:41.903	Коммерция 145.18 м²	1	1
296	14	0	139	86935539	598812	1	15	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:34:20.806	2025-11-28 14:34:20.806	Коммерция 139.13 м²	1	1
297	14	2	74	21773783	294161	2	15	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:35:08.174	2025-11-28 14:35:08.174	2К квартира 74.02 м²	1	1
298	14	3	95	29746689	312498	13	15	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:36:07.55	2025-11-28 14:36:07.55	3К квартира 95.19 м²	1	1
299	14	2	61	22922627	374553	12	15	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:37:09.475	2025-11-28 14:37:09.475	2К квартира 61.2 м²	1	1
300	14	1	55	34622862	621595	10	15	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:38:06.341	2025-11-28 14:38:06.341	1К квартира 55.7 м²	1	1
301	14	1	56	29466139	519410	4	15	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:39:07.686	2025-11-28 14:39:07.686	1К квартира 56.73 м²	1	1
302	14	1	54	29474834	545023	5	15	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:39:58.246	2025-11-28 14:39:58.246	1К квартира 54.08 м²	1	1
303	14	0	166	85901970	517015	1	15	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:41:50.359	2025-11-28 14:41:50.359	Коммерция 166.15 м²	1	1
304	14	2	86	26607814	308819	4	15	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:42:59.324	2025-11-28 14:42:59.324	2К квартира 86.16 м²	1	1
305	14	2	98	28752177	292613	2	15	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:44:05.324	2025-11-28 14:44:05.324	2К квартира 98.26 м²	1	1
306	14	2	71	21556184	301950	4	15	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:45:06.519	2025-11-28 14:45:06.519	2К квартира 71.39 м²	1	1
307	14	2	73	25934069	351077	13	19	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:50:34.713	2025-11-28 14:50:34.713	2К квартира 73.87 м²	1	1
308	14	1	55	21095833	379490	14	19	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:51:23.514	2025-11-28 14:51:23.514	1К квартира 55.59 м²	1	1
309	14	0	40	15967518	390690	7	19	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:52:23.639	2025-11-28 14:52:53.763	Студия 40.87 м²	1	1
310	14	1	45	17045641	370961	7	19	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:53:57.848	2025-11-28 14:53:57.848	1К квартира 45.95 м²	1	1
311	14	4	110	37517785	338303	6	9	Казань	55.765939	49.097057	readyApartment	2025-11-28 14:55:06.172	2025-11-28 14:55:06.172	4К квартира 110.9 м²	1	1
312	15	1	40	9020000	220538	14	15	Казань	55.846169	49.093968	readyApartment	2025-12-07 11:43:48.287	2025-12-07 11:43:48.287	1К квартира 40.9 м²	1	6
313	15	2	66	12280000	185948	1	15	Казань	55.846169	49.093968	readyApartment	2025-12-07 11:46:01.058	2025-12-07 11:46:01.058	2К квартира 66.04 м²	1	6
314	15	1	33	8950000	267564	9	15	Казань	55.846169	49.093968	readyApartment	2025-12-07 11:46:56.593	2025-12-07 11:46:56.593	1К квартира 33.45 м²	1	6
315	15	1	44	9590000	216576	9	15	Казань	55.846169	49.093968	readyApartment	2025-12-07 11:47:47.842	2025-12-07 11:47:47.842	1К квартира 44.28 м²	1	6
316	15	1	46	9680000	209297	9	15	Казань	55.846169	49.093968	readyApartment	2025-12-07 11:48:57.81	2025-12-07 11:48:57.81	1К квартира 46.25 м²	1	6
317	15	2	55	10410000	186159	1	15	Казань	55.846169	49.093968	readyApartment	2025-12-07 11:50:05.062	2025-12-07 11:50:05.062	2К квартира 55.92 м²	1	6
318	15	2	55	10430000	188505	13	15	Казань	55.846169	49.093968	readyApartment	2025-12-07 12:00:28.784	2025-12-07 12:00:28.784	2К квартира 55.33 м²	1	6
319	15	2	56	10640000	188052	13	15	Казань	55.846169	49.093968	readyApartment	2025-12-07 12:01:27.672	2025-12-07 12:01:27.672	2К квартира 56.58 м²	1	6
320	15	1	41	9140000	222872	13	15	Казань	55.846169	49.093968	readyApartment	2025-12-07 12:02:30.045	2025-12-07 12:02:30.045	1К квартира 41.01 м²	1	6
321	15	2	56	10510000	185362	1	15	Казань	55.846169	49.093968	readyApartment	2025-12-07 12:03:32.16	2025-12-07 12:03:32.16	2К квартира 56.7 м²	1	6
322	15	2	56	10610000	186730	2	15	Казань	55.846169	49.093968	readyApartment	2025-12-07 12:04:20.137	2025-12-07 12:04:20.137	2К квартира 56.82 м²	1	6
323	15	3	77	15032000	194463	9	15	Казань	55.846169	49.093968	readyApartment	2025-12-07 12:05:05.534	2025-12-07 12:05:05.534	3К квартира 77.3 м²	1	6
324	15	3	92	16110000	174012	1	15	Казань	55.846169	49.093968	readyApartment	2025-12-07 12:06:22.234	2025-12-07 12:06:22.234	3К квартира 92.58 м²	1	6
325	15	2	53	11453000	215525	7	15	Казань	55.846169	49.093968	readyApartment	2025-12-07 12:07:19.061	2025-12-07 12:07:19.061	2К квартира 53.14 м²	1	6
326	15	0	30	8965000	289661	8	15	Казань	55.846169	49.093968	readyApartment	2025-12-07 12:08:32.855	2025-12-07 12:08:32.855	Студия 30.95 м²	1	6
327	15	2	55	11822000	211409	6	15	Казань	55.846169	49.093968	readyApartment	2025-12-07 12:09:25.824	2025-12-07 12:09:25.824	2К квартира 55.92 м²	1	6
328	15	2	54	10430000	192364	8	15	Казань	55.846169	49.093968	readyApartment	2025-12-07 12:10:20.62	2025-12-07 12:10:20.62	2К квартира 54.22 м²	1	6
329	15	1	34	8470000	248096	7	15	Казань	55.846169	49.093968	readyApartment	2025-12-07 12:11:09.242	2025-12-07 12:11:09.242	1К квартира 34.14 м²	1	6
330	15	2	54	10510000	193840	6	15	Казань	55.846169	49.093968	readyApartment	2025-12-07 12:12:07.407	2025-12-07 12:12:07.407	2К квартира 54.22 м²	1	6
339	16	2	77	23007199	296944	19	22	Казань	55.767261	49.09642	readyApartment	2025-12-07 13:03:22.043	2025-12-07 13:03:22.043	2К квартира 77.48 м²	1	6
331	15	1	34	8380000	245460	8	15	Казань	55.846169	49.093968	readyApartment	2025-12-07 12:13:27.786	2025-12-07 12:13:27.786	1К квартира 34.14 м²	1	6
332	15	3	78	13890000	175912	8	15	Казань	55.846169	49.093968	readyApartment	2025-12-07 12:15:44.101	2025-12-07 12:15:44.101	3К квартира 78.96 м²	1	6
333	15	2	52	10400000	199005	8	15	Казань	55.846169	49.093968	readyApartment	2025-12-07 12:33:44.487	2025-12-07 12:33:44.487	2К квартира 52.26 м²	1	6
334	15	2	51	10210000	199025	6	15	Казань	55.846169	49.093968	readyApartment	2025-12-07 12:34:55.906	2025-12-07 12:34:55.906	2К квартира 51.3 м²	1	6
335	15	3	77	13720000	178228	7	10	Казань	55.846169	49.093968	readyApartment	2025-12-07 12:35:57.904	2025-12-07 12:35:57.904	3К квартира 76.98 м²	1	6
336	15	2	55	10640000	193736	7	10	Казань	55.846169	49.093968	readyApartment	2025-12-07 12:47:52.924	2025-12-07 12:47:52.924	2К квартира 54.92 м²	1	6
337	15	1	33	8260000	250076	7	10	Казань	55.846169	49.093968	readyApartment	2025-12-07 12:48:34.215	2025-12-07 12:48:34.215	1К квартира 33.03 м²	1	6
338	15	2	55	10670000	193859	7	10	Казань	55.846169	49.093968	readyApartment	2025-12-07 12:49:19.304	2025-12-07 12:49:19.304	2К квартира 55.04 м²	1	6
340	16	2	77	19317803	274167	8	22	Казань	55.767261	49.09642	readyApartment	2025-12-07 13:06:08.895	2025-12-07 13:06:08.895	2К квартира 70.46 м²	1	6
341	16	2	69	18613422	268669	2	22	Казань	55.767261	49.09642	readyApartment	2025-12-07 13:06:53.184	2025-12-07 13:06:53.184	2К квартира 69.28 м²	1	6
342	16	1	39	16090048	404578	18	22	Казань	55.767261	49.09642	readyApartment	2025-12-07 13:16:39.51	2025-12-07 13:16:39.51	1К квартира 39.77 м²	1	6
343	16	1	43	16822695	389234	15	22	Казань	55.767261	49.09642	readyApartment	2025-12-07 13:17:28.752	2025-12-07 13:17:28.752	1К квартира 43.22 м²	1	6
344	16	2	90	28918195	321528	15	22	Казань	55.767261	49.09642	readyApartment	2025-12-07 13:18:17.853	2025-12-07 13:18:17.853	2К квартира 89.94 м²	1	6
345	16	3	95	25811499	270164	7	22	Казань	55.767261	49.09642	readyApartment	2025-12-07 13:19:01.33	2025-12-07 13:19:01.33	3К квартира 95.54 м²	1	6
346	16	3	98	24281846	245693	3	6	Казань	55.767261	49.09642	readyApartment	2025-12-07 13:19:59.329	2025-12-07 13:19:59.329	3К квартира 98.83 м²	1	6
347	16	3	94	23495257	248680	3	6	Казань	55.767261	49.09642	readyApartment	2025-12-07 13:20:42.241	2025-12-07 13:20:42.241	3К квартира 94.48 м²	1	6
348	16	3	98	24072967	245743	3	6	Казань	55.767261	49.09642	readyApartment	2025-12-07 13:21:29.046	2025-12-07 13:21:29.046	3К квартира 97.96 м²	1	6
349	16	2	74	19268244	259330	4	6	Казань	55.767261	49.09642	readyApartment	2025-12-07 13:22:13.949	2025-12-07 13:22:13.949	2К квартира 74.3 м²	1	6
350	16	2	57	15972450	278654	4	6	Казань	55.767261	49.09642	readyApartment	2025-12-07 13:22:58.777	2025-12-07 13:22:58.777	2К квартира 57.32 м²	1	6
351	16	2	62	16854151	270662	4	6	Казань	55.767261	49.09642	readyApartment	2025-12-07 13:23:47.761	2025-12-07 13:23:47.761	2К квартира 62.27 м²	1	6
352	16	2	69	18299665	264676	4	6	Казань	55.767261	49.09642	readyApartment	2025-12-07 13:24:35.729	2025-12-07 13:24:35.729	2К квартира 69.14 м²	1	6
353	16	3	88	22375232	254466	10	16	Казань	55.767261	49.09642	readyApartment	2025-12-07 13:26:42.846	2025-12-07 13:26:42.846	3К квартира 87.93 м²	1	6
354	16	2	88	19115927	238175	2	16	Казань	55.767261	49.09642	readyApartment	2025-12-07 13:27:32.8	2025-12-07 13:27:32.8	2К квартира 80.26 м²	1	6
355	16	2	41	13042003	316017	9	16	Казань	55.767261	49.09642	readyApartment	2025-12-07 13:28:18.361	2025-12-07 13:28:18.361	2К квартира 41.27 м²	1	6
356	16	0	33	10199040	302283	2	16	Казань	55.767261	49.09642	readyApartment	2025-12-07 13:29:00.462	2025-12-07 13:29:00.462	Студия 33.74 м²	1	6
357	16	2	69	19175867	275832	7	16	Казань	55.767261	49.09642	readyApartment	2025-12-07 13:29:47.315	2025-12-07 13:29:47.315	2К квартира 69.52 м²	1	6
358	16	2	60	17406565	286953	5	16	Казань	55.767261	49.09642	readyApartment	2025-12-07 13:30:37.252	2025-12-07 13:30:37.252	2К квартира 60.66 м²	1	6
359	17	3	83	21994850	263254	23	24	Казань	55.81078	49.074102	readyApartment	2025-12-07 16:19:26.347	2025-12-07 16:19:26.347	3К квартира 83.55 м²	1	6
360	17	3	102	25087626	243924	15	15	Казань	55.81078	49.074102	readyApartment	2025-12-07 16:21:08.82	2025-12-07 16:21:08.82	3К квартира 102.85 м²	1	6
361	17	2	99	21905418	220376	6	18	Казань	55.81078	49.074102	readyApartment	2025-12-07 16:22:40.511	2025-12-07 16:22:40.511	2К квартира 99.4 м²	1	6
362	17	0	285	85530000	300000	1	18	Казань	55.81078	49.074102	readyApartment	2025-12-07 16:23:36.861	2025-12-07 16:23:36.861	Коммерция 285.1 м²	1	6
\.


--
-- Data for Name: NewBuildingComplex; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."NewBuildingComplex" (id, name, address, district, metro, "metroDistance", city, developer, "priceFrom", "areaFrom", "buildingClass", floors, "totalApartments", "availableApartments", lat, lng, "completionDate", height, "hasParking", description, "createdAt", "updatedAt") FROM stdin;
1	ЖК Terra	Ильича ул.	Бабушкинский	Козья слобода	10	\N	СК Бриз	3600000	28	COMFORT	10	281	281	55.823574	48.898876	2028-06-30 00:00:00	0	t	Жилой комплекс расположен в Кировском районе Казани на опушке векового хвойного леса. Одно из самых живописных мест, рядом с озером Изумрудное. Дома переменной этажности 5-9 этажей имеют разнообразные планировки и благоустроенную придомовую территорию. На первых этажах будут располагаться магазины, аптеки, уютные кафе, в которых можно посидеть с друзьями или поработать. В шаговой доступности: детские сады, школы, больница, магазины, Дворец культуры железнодорожников, Ледовая арена Юдино. Пикники летом и прогулки на лыжах зимой. Близкое расположение озера Изумрудное позволяет отдыхать на берегу и купаться, не выезжая за пределы района. Композиции из деревьев и кустарников общей площадью более 10 000 кв.м. украшают комплекс круглый год.\n\nДля удобства жителей остановка общественного транспорта находится в шаговой доступности от ЖК, а в 15 минутах пешком — железнодорожная станция «Юдино».\n\nВход в каждый подъезд будет находиться на уровне земли — без ступенек и пандусов. По территории жилого комплекса могут совершенно свободно передвигаться как молодые семьи с детскими колясками и велосипедами, так и маломобильная группа граждан.\n\nНа территории жилого комплекса организован раздельный сбор мусора — такая система уменьшает негативное влияние на окружающую среду. В комплексе предусмотрен подземный паркинг, в котором автомобиль будет в безопасности. 	2025-11-27 09:53:11.921	2025-11-27 09:53:11.921
3	ЖК GloraX Экосити	Завокзальная ул.	Бабушкинский	Козья слобода	10	\N	GloraX	80999000	35	COMFORT	10	192	192	55.811911	48.951273	2028-06-30 00:00:00	0	f	Жилой комплекс - настоящий оазис природы в черте города. Масштабный проект комфорт-класса расположится в Аракчино Кировского района. С одной стороны, его окружает лес «Лебяжье», с другой — открывается вид на реку Казанка, также в непосредственной близости располагается Храм всех религий - архитектурный комплекс, объединяющий 16 мировых религий.\n\nВнутренние дворы каждого урбан-блока созданы по принципу отдельного собственного мира. Каждый двор неповторим, у каждого свой природный язык и эстетика. Пространство дворов спроектировано стать тихой гаванью для жителей дома. Несмотря на то, что во дворах есть небольшие игровые зоны для малышей, грамотное зонирование дает возможность проводить время во дворах в тишине. Пространство двора недоступно автомобилям — здесь территория людей, гостей и детства. В каждом дворе принято наряжать елку на новый год, устраивать междворовые соревнования.\n\nКвартирография комплекса разнообразна. Студии и однокомнатные лоты для индивидуалистов. Компактные двухкомнатные квартиры для небольших семей. Огромные трехкомнатные и четырехкомнатные квартиры с мастер-спальнями. Все пространства оснащены просторной кухней-гостиной, чтобы семья могла комфортно проводить время вместе. В целях безопасности в детских комнатах отсутствуют балконы и лоджии. А квартиры на первых этажах спроектированы с собственным палисадником, патио и выходом во двор.\n\nВсе квартиры предусматривают полную подготовку под установку «Умного дома» с возможностью управлять линиями электропитания, контролировать протечки и удаленно перекрывать воду, управлять отоплением и освещением, отслеживать безопасность квартиры в ваше отсутствие.\n\nСобственное парковочное место — идеальное решение для современной жизни. Для организации парковочного пространства жителей созданы два отдельных многоэтажных паркинга на 300 и 360 машиномест. Всем жителям проекта доступен также плоскостной паркинг вокруг территории проекта с возможностью в приложении дома получить информацию о наличии парковочных мест.\n\nНа нижнем этаже домов предусмотрены кладовые помещения с разными вариациями по площади. Кладовые комнаты — это удобный способ хранения сезонных и крупногабаритных вещей. На случай экстренной ситуации на всей территории сработает система автоматического пожаротушения.\n\nНа территории будут расположены детский сад и школа, что позволит сократить время на дорогу до минимума. Все активные пешеходные потоки направлены на достаточном удалении от садика и школы, что обеспечит дополнительную безопасность детей, а дорога от дома займет всего пару минут.	2025-11-27 13:14:30.641	2025-11-27 13:14:30.641
7	ЖК Statum	Адмиралтейская ул.	Бабушкинский	Козья слобода	10	\N	Унистрой	80999000	35	COMFORT	19	192	192	55.803916	49.055684	2028-06-30 00:00:00	0	f	Жилой комплекс – проект бизнес-класса в исторической части Казани на улице Адмиралтейская. До центра города всего 10 минут на машине, до ближайших остановок общественного транспорта – 10 минут неспешным шагом. Рядом с комплексом находятся несколько детских садов, школ, Зилантов монастырь. Старое русло Казанки в скором времени будет благоустроено по программе «12 парков Казани» с сохранением исторического природного ландшафта местности, его флоры и фауны.\n\nБизнес-класс, экстерьер в английском промышленном стиле с фасадом из керамического кирпича и арочными конструкциями, уютные дворы с обилием зелени и продуманным ландшафтным дизайном, бизнес-холлы, удобный подземный паркинг. В Statum представлено большое разнообразие планировочных решений: коллекционные двухуровневые квартиры, в свободной планировке с видом на Волгу, террасы, мастер-спальни с ванными и гардеробными.\n\nStatum – это жизнь в исторической части города, при этом в тихом уютном месте у воды. Разработан с бережным отношением к истории места и авторской архитектурой. Статусный проект для ценителей повышенного комфорта.	2025-11-28 09:34:13.73	2025-11-28 09:34:13.73
5	Costura Town	Алексея Козина ул.	Бабушкинский	Козья слобода	10	\N	Садовое кольцо Казань	80999000	35	COMFORT	10	192	192	55.77754	49.138457	2028-06-30 00:00:00	0	f	Жилой комплекс расположен в историческом районе Казани "Суконная Слобода". Развитая инфраструктура района обеспечивает высокое качество жизни и неограниченные возможности. Торговые и Бизнес-центры, государственные и административные учреждения, лучшие школы и ВУЗы, парки и скверы, кафе и рестораны – всё находится здесь.\n\nУникальная концепция застройки квартала выполнена по эскизу Хосе Асебильо, бывшего главного архитектора Барселоны. Основа концепции - вернуть жизнь в район Суконной слободы, наполнить его функциями, соединив историческое наследие и новые архитектурные формы и технологии. Полная и насыщенная жизнь города подразумевает, что все функции реализуются в любой его части, особенно в центре. Это касается и работы, и развлечений, и образования, и культуры. Потому что концепция "жить в одном месте, а трудиться в другом" - не рецепт успешного города.\n\nКвартальная застройка традиционна для Казани и комфортна для современных горожан. Внутренний двор квартала - приватная зона, только для жителей, а благоустройство внешней улицы - место для общих встреч и коммуникации. Вертикальное зонирование позволяет грамотно сочетать разные сценарии взаимодействия с кварталом. На первом уровне располагаются общественные помещения: магазины, кафе, офисы и паркинг, на втором - закрытый двор - сад, на третьем - частные квартиры Фасад из кирпича и панелей с текстурой дерева отсылают нас к исторической застройке Суконной слободы, выполненной в основном из дерева и красного кирпича.\n\nДвор-сквер на уровне 2 этажа — это приватное безопасное пространство только для жильцов дома. Современная детская площадка из эко материалов способствует развитию в процессе игры и отличное настроение для ваших детей. Стильный ландшафтный дизайн с прудом, многолетними растениями и теплым трехуровневым освещением, местами для прогулок и отдыха превратили двор в настоящий уютный сквер. Трехуровневое теплое освещение в вечернее время превращает двор жилого комплекса в уютный сквер с мощеными тропинками.\n\nДизайнерская отделка подъездов с использованием высококачественных материалов изящно дополняет премиальный внешний вид и архитектуру здания. Светлые и просторные холлы на 1 этаже в каждом подъезде создают уют для жильцов уже с порога дома.\n\nВидео IP домофон расположен в теплом тамбуре, чтобы гости не мерзли на входе, а для жильцов предусмотрен бесконтактный доступ по Face ID. Безбарьерная среда на всей территории комплекса гарантирует комфорт и простоту перемещения для родителей с колясками людей с ограниченными возможностями.	2025-11-28 08:00:49.47	2025-11-28 08:00:49.47
6	ЖК ART CITY	Николая Ершова ул.	Бабушкинский	 Суконная слобода	10	\N	Унистрой	80999000	35	PREMIUM	19	192	192	55.799962	49.182618	2028-06-30 00:00:00	0	f	Новый комплекс расположился в Советском районе, на востоке Казани, вдоль улиц Н. Ершова и П. Лумумбы. Благодаря удачному расположению комплекса, жителям его понадобится не более 15 минут, чтобы добраться до центра города. До станции метро Проспект Победы 34 мин общественным транспортом. Комплекс огорожен от оживленных магистралей жилыми домами, который состоит из 10 этажных зданий. Возведение зданий комплекса осуществляется по технологии монолитного домостроения. Проектом предусмотрены 1, 2, 3 комнатные квартиры. Территория комплекса полностью огорожена и охраняется. Первый этаж занимают жилые помещения.\n\nВ шаге от здания расположились такие объекты инфраструктуры, как зоны отдыха с бесплатным wi-fi, велосипедные дорожки, парковая зона, пешеходный мост, 2 детских сада, зеленая зона с деревьями и клумбами. Рядом есть супермаркет Бахетле, магазин Пятерочка, ТЦ Советский, McDonald's, спортивный клуб "Окинава", ProfiSport, Holiday Gym, банк ВТБ-24, Сбербанк, АКБ Банк Москвы, Татфондбанк, Банк Казани, банк "Открытие", медицинский центр "Здоровье семьи", Городской диагностический центр, детская поликлиника №6, НУЗ Отделенческая клиническая больница, салон красоты "Бизнес-леди", салон красоты "Wella Табакчи", салон красоты "Виртуоз". Поблизости расположено несколько образовательных учреждений: гимназия №126, Казанская банковская школа, школа с углубленным изучением немецкого языка №72, школа №15, школа №110, Высшая школа экономики Казанского государственного технологического университета. Два детских сада построены на территории комплекса, также рядом находятся: детский сад №52, детский сад №290, детский сад №349, детский сад №155, детский сад №352.	2025-11-28 08:51:36.141	2025-11-28 08:51:36.141
8	ЖК Dolce vita	Лесные Моркваши село, Поселковая ул.	Бабушкинский	Козья слобода	10	\N	СЗ Дольче Вита	80999000	35	COMFORT	5	192	192	55.73577	48.822744	2028-06-30 00:00:00	0	f	Жилой комплекс комфортного проживания с детским садом, школой, торговым центром, офисными зданиями, одно из которых – коворкинг центр. Фермерская лавка, автомойка -высокотехнологичная тоннельная мойка.\n\nКомплекс расположен в экологически чистом районе, окруженном озерами, лесом, родниками. Недалеко от комплекса расположен парк.\n\nВ доме панорамные окна, лифт в пятиэтажных домах, 2 станции для электроавтомобилей.\n\nУ квартир на 1 этаже индивидуальный выход на собственную площадку придомовой территории, огороженную зеленой изгородью. Каждая квартира обеспечена 1 бесплатным парковочным местом.\n\nВ данном ЖК реализован принцип комплексного строительства, где вся инфраструктура (школа, детский сад, поликлиника, бизнес-центр предусмотрены в шаговой доступности). Комфортное проживание обусловлено не только продуманной инфраструктурой, но и расположением ЖК.\n\nЖизнь здесь – это комфорт городской квартиры в гармонии с природой. В привычный ритм города можно окунуться очень быстро, ЖК расположен в непосредственной близости от города Иннополис, в 20 минутах на автомобиле до Казани. На территории ЖК планируется благоустройство ландшафтного парка, детские и спортивные площадки в каждом дворе.\n\nВ строительстве используются экологичные материалы. Собственная котельная помогает устанавливать температуру в квартире, которая создаст нужный климат именно вам. Водозаборная станция с системой очистки и умягчения воды на территории ЖК подаёт воду высокого качества в квартиры. В подъездах планируются колясочные, что поможет сохранить больше свободного пространства в квартирах. Чистая энергия: для придомовой территории и мест общего пользования она генерируется через солнечные батареи.\n\nПанорамное остекление, просторные лоджии дарят умиротворение, погружая в атмосферу гармоничной жизни с ежедневным видом на лес или двор. Благодаря расположению домов и панорамному остеклению, жилые пространства наполнены светом в любое время года. Есть возможность купить квартиру с ремонтом.\n\nС весны 2024 года застройщик за счёт собственных средств запускает рейсовый регулярный автобус по маршруту: ЖК - ИННОПОЛИС - КАЗАНЬ.	2025-11-28 10:15:03.034	2025-11-28 10:15:59.247
9	ЖК UNO	Сибгата Хакима ул.	Бабушкинский	Козья слобода	10	\N	Унистрой	80999000	35	COMFORT	5	192	192	55.815079	49.143865	2028-06-30 00:00:00	0	f	Многофункциональный жилой комплекс Казани - единая комплексная застройка, сочетающая в себе жилой дом из трех корпусов, бизнес-центр с коворкингом, детский сад, торговую галерею. Комплекс расположен в развитом Ново-Савиновском районе города, на улице Сибгата Хакима. В 5 минутах ходьбы от ЖК – набережная Казанки./n/Городской проект с небольшой плотностью застройки и большим расстоянием до соседних объектов. Концепция проекта организована в виде современного инфраструктурного кластера./n/Рядом находится Дворец водных видов спорта, Центр пляжного волейбола, Ак Барс Арена. В будущем возле жилого комплекса будет большой Спортивный парк с пирсом, открытыми площадками для командных видов спорта, зоной для пикников, беговыми и велодорожками. Напротив комплекса - Русско-Немецкая Швейцария - зеленый парк с каскадными садами./n/В ЖК представлена широкая палитра планировочных решений: квартиры-пентхаусы на последних этажах, коллекционные варианты с видом на набережную, Кремль, Русско-Немецкую Швейцарию, угловыми панорамными окнами, европланировки. Найдутся варианты, где можно лаконично организовать пространство для одного-двух людей, так и большие квартиры для ценителей повышенного комфорта./n/Пространство внутри двора разделено на несколько уединенных локаций. Максимальное использование альтернативных способов получения энергии, спортивные и детские площадки, выполненные в «эко-стиле»./n/Территория комплекса выполнена в виде парка с лаконичным благоустройством. По периметру – зона торговой галереи и объекты house-service, где в шаговой доступности от домов будут расположены супермаркет, food-mall, ресторан, винотека, салон красоты, барбершопы, химчистка, ателье./n/Вестибюли первых этажей подарят уровень высокого сервиса и комфорта, здесь будут расположены функциональные помещения: две колясочные комнаты с входом с улицы и зарядками для электросамокатов./n/В подземном паркинге предусмотрено 285 мест для автомобилей и келлеров для хранения зимних шин, инструментов и других вещей. Паркинг будет оборудован охраной и видеонаблюдением, с въездом автомобилей по автоматической системе распознавания номеров./n/На всей территории комплекса видеонаблюдение и система охраны.	2025-11-28 11:09:01.061	2025-11-28 11:09:01.061
10	ЖК Атмосфера	Высокая Гора село, Ирека Миннахметова ул.	Бабушкинский	Суконная слобода	10	\N	Унистрой	80999000	35	COMFORT	9	192	192	55.872707	49.301328	2028-06-30 00:00:00	0	f	Проект расположен в 5 минутах езды от Казани, в Высокогорском районе Республики Татарстан. Это комплекс, который подарит вам дружных соседей и лучших друзей, гармоничный образ жизни и неповторимую атмосферу загородного уюта и комфорта, при этом со всеми преимуществами проживания в комфортабельных городских квартирах. Проект комфорт-класса состоит из 14 домов с закрытыми дворами, собственными детскими садами, школой, бульваром для прогулок, разнообразными общественными пространствами и просторным паркингом. Здесь будет создана особенная атмосфера за счет комплексной жилой застройки, комфортной среды для жизни и отдыха, а также обилия зеленых насаждений и живописного рельефа района./n/Объект расположен в Высокогорском районе Республики Татарстан. Из города в ЖК через Дербышки можно доехать за 5 минут по многополосной дороге. Также в комплекс ведет дорога с выездом через Мамадышский тракт. Для жителей будет оборудован удобный заезд в ЖК с трассы. Любителям активного отдыха - рядом автодром KazanRing. Для семейных и корпоративных встреч - гостиничный комплекс. Благородная европейская архитектура, закрытые дворы, разнообразные общественные пространства, благоустройство в европейском стиле подарят жителям чувство уюта и комфорта, а также создадут неповторимую атмосферу единства с окружающей средой, гармонии и безопасности./n/Для формирования культуры добрососедства и единого комьюнити жителей в комплексе будут созданы разнообразные общественные пространства: бульвар для прогулок, места для отдыха взрослых и детей, игровые локации для малышей и подростков, воркаут-зоны с тренажерами, спортивные площадки для игр в футбол, волейбол, баскетбол. Все покрытия детских площадок, прогулочных пространств будут выполнены из природных естественных материалов./n/Для комфорта молодых семей и детей мы предусмотрели закрытые дворы, свободные от машин и доступа посторонних, вход в которые будет только у жителей комплекса. Они будут оснащены службой охраны и видеонаблюдением. Входы в подъезды будут выполнены на уровне земли для свободного проезда детских колясок, велосипедов. Домофоны будут установлены в теплых тамбурах. В домах будут скоростные бесшумные лифты. Также для удобства предусмотрены на первых этажах колясочные комнаты с велопарковками и местами для хранения тюбингов, поэтому санки, велосипеды, лыжи и коляски не будут занимать место в квартире./n/В комплексе будут просторные плоскостные автостоянки. Жителей микрорайона всегда будут ждать места для парковки их автомобилей./n/В комплексе представлены различные планировки: студии, 1-, 2-, 3-комнатные квартиры, в том числе евроформат. Квартиры на любой вкус: с просторными кухнями-гостиными, удобными спальнями, большими ванными, отдельным местом для гардеробных, установка стиральных машин, а также увеличенными оконными проёмами. Среди 1-комнатных квартир можно найти двусторонние и угловые форматы. В комплексе будет представлен уникальный формат квартир с террасами на первых этажах. Можно выбрать квартиру, как с тёплой лоджией, так и совсем без неё. В каждой квартире будет техническая возможность установки видеодомофона. Дома будут сдаваться в качественной предчистовой отделке White Box./n/Комплекс спроектирован с учетом максимально эффективной дальнейшей эксплуатации. Показания приборов учёта воды, электричества, тепла, установленных в общем коллекторе на этаже, будут автоматически передаваться в Сервисную компанию./n/На территории комплекса будут школа на 500 мест и 2 детских сада на 120 и 260 мест. Пространство в комплексе спроектировано таким образом, что до любого социального объекта: школы, детского сада, спортивных, игровых локаций, бульвара можно пройти пешком за 10 минут. Детские учреждения будут выполнены в единой стилистике и концепции комплекса и станут отличной образовательной базой для детей.	2025-11-28 11:21:29.163	2025-11-28 11:21:29.163
11	ЖК Яратам	Бухарская ул.	Бабушкинский	 Горки	10	\N	СМУ-88	80999000	35	COMFORT	9	192	192	55.775586	49.206145	2028-06-30 00:00:00	0	f	Жилой комплекс расположен в развивающейся части Советского района Казани — на улице Бухарской. Добраться из любимого дома в любую точку города теперь не проблема. В пешей доступности — ТЦ «Мега», Castorama, ИКЕА, ТРЦ «Южный», Горкинско-Ометьевский лес, а до центра Казани — 10 минут на авто./n/В удобном зеленом дворе-скверике, свободном от машин, расположатся зоны для занятия спортом, детские игровые площадки и пространство для отдыха, а прямо на территории комплекса будет построен муниципальный детский сад на 260 мест - ваш ребенок рядом с домом и в безопасности./n/Подземный паркинг избавит жильцов от необходимости каждый день искать место для автомобиля и переживать о погодных условиях. Оставив машину на индивидуальном парковочном месте, можно подняться на свой этаж на скоростном лифте./n/Просторный и чистый подъезд будет поднимать жителям настроение каждый день: зоны хранения, где можно оставить коляски, велосипеды и другой спортинвентарь, бесшумные и быстрые лифты OTIS и эстетичные входные группы сделают жизнь комфортнее и проще./n/Проектировщики сделали планировки в доме рациональными, чтобы жильцы могли жить так, как задумывали. Светлые уютные комнаты, просторные балконы и лоджии, эффективные квадратные метры — вот что такое любимая квартира./n/Дома возводятся по современным нормам и технологиям строительства. Основанием домов будет монолитный каркас, а стены будут заполняться кирпичом.	2025-11-28 12:03:00.435	2025-11-28 12:03:00.435
12	ЖК Вознесенский квартал	Бухарская ул.	Бабушкинский	 Горки	10	\N	СМУ-88	80999000	35	COMFORT	9	192	192	55.777188	49.202616	2028-06-30 00:00:00	0	f	Жилой комплекс расположен на ул. Бухарская в городе Казань и воплощает стремление найти баланс уюта и мультизадачности общественных зон, архитектурной идеи и продуманного благоустройства./n/Архитектура проекта выражает наиболее успешные мировые тренды в современных высотных кварталах. Изящный фасад и переменная этажность создают плавный силуэт квартала, а благородные оттенки материалов добавляют изысканности и ощущения завершенности образа. Дизайнерское атмосферное лобби поведает резидентам историю безмятежности на лоне природы. Оригинальный проект зимнего сада подарит резидентам и их гостям настоящий дендрологический восторг от обилия волжской флоры./n/Квартиры с потолками от 3 м, эргономичными планировками, ароматы цветов во дворе, зимний сад и звуки музыки в лобби, лайфворкинг и кинозал — элегантные детали, которые добавят красок в вашу повседневную жизнь. В ЖК серия квартир с личными террасами. Современные планировки позволяют рационально использовать все пространство квартиры. Большой коридор, просторные гостиная и кухня, в которые органично впишутся бытовая техника и мебель, рабочее и релакс-пространство, а также уютная спальня с большой кроватью — в такой атмосфере всегда комфортно и спокойно.	2025-11-28 12:08:59.793	2025-11-28 12:08:59.793
13	ЖК Адали	Аделя Кутуя ул.	Бабушкинский	 Горки	10	\N	СМУ-88	80999000	35	COMFORT	23	192	192	55.765731	49.19311	2028-06-30 00:00:00	0	f	Современный жилой комплекс бизнес-класса расположен в сердце Советского района, на улице Аделя Кутуя, которая превращается в оживленный городской хаб с бизнес-средой и развитой инфраструктурой. Близость станции метро «Горки» и удобные транспортные развязки позволяют быстро добраться до любой точки города./n/Изысканное сочетание материалов создает идеальный баланс между функциональностью и эстетикой, а также отражает промышленное прошлое территории. Элегантные горизонтальные и вертикальные линии с яркими акцентами формируют стильный и гармоничный облик./n/Двор предлагает идеальное пространство для всех: зеленые зоны, современные спортивные и детские площадки, уютное кинопатио с проектором для совместных просмотров и коворкинг на свежем воздухе./n/Просторные и светлые холлы с уютными зонами ожидания создают приятный и плавный переход между внешним миром и вашим домом. Вас ждут удобные места для хранения велосипедов и детских колясок, лапомоечная для питомцев и консьерж-сервис./n/Гибкие, эргономичные планировки позволяют вам создать интерьер, о котором вы всегда мечтали. Высокие потолки 2,9 метра и увеличенные оконные проемы наполняют дом светом и создают ощущение простора./n/Современный подземный паркинг гарантирует комфорт и безопасность вашего автомобиля в любую погоду. Для удобства предусмотрена возможность установки станций для зарядки электромобилей. Отдельно оборудованы наземные гостевые парковочные места для визитов ваших близких и деловых встреч.	2025-11-28 12:56:33.336	2025-11-28 12:58:37.822
14	ЖК Яналиф	Дулата Али ул.	Бабушкинский	 Площадь Габдуллы Тукая	10	\N	СМУ-88	80999000	35	COMFORT	19	192	192	55.765939	49.097057	2028-06-30 00:00:00	0	f	Жилой комплекс — это проект, объединяющий искусство и технологичность в многофункциональное пространство. Изысканная архитектура, премиальное лобби, консьерж-сервис и все возможности инфраструктуры центра столицы Татарстана./n/Большое внимание уделено развитию коммерции для «оживления» первых этажей. Даже в вечернее время жилой комплекс остается местом сосредоточения городских активностей: культурных и гастрономических. Это ценный симбиоз активного первого этажа и спокойной гармоничной жизни наверху./n/Расположение на берегу Волги и близость к историческому центру города делают локацию по-настоящему удивительной. Панорамные окна обеспечат обильное освещение и шикарные виды на волжский пейзаж. В стенах комплекса создана инфраструктура — общественные пространства, арт-объекты, набережная с зонами отдыха, современные музеи и галереи, кафе и рестораны./n/Для автовладельцев — современная подземная парковка. Автомобиль всегда будет в теплом и сухом месте. Многофункциональная уличная workout-зона, спортивные площадки для подростков, современное оборудование с системами тренировок./n/Для юных жителей комплекса — развлечения на любой вкус. Все с атравматичным покрытием из высококлассных материалов: комплексы для лазания, игровые башни, столы для игр, домики, качели, карусели, горки-тоннели. А для отдыха — уютные беседки./n/В холлах детей ждут игровые мультиформатные комплексы нового поколения с развивающими и веселыми играми, а для взрослых мягкие зоны для отдыха, многофункциональное пространство для работы./n/Квартирографию проекта отличает разнообразие форматов и планировок. Неизменным остается главное — открыточный вид на Волгу и панораму Казани.	2025-11-28 13:38:11.815	2025-11-28 13:38:11.815
15	ЖК Династия	Михаила Миля ул..	Бабушкинский	 м. Северный вокзал	15	\N	ТСИ	80999000	35	COMFORT	19	192	192	55.846169	49.093968	2028-06-30 00:00:00	0	f	Основная концепция жилого комплекса - компактный микро-город со всей необходимой инфраструктурой для комфортной жизни каждой семьи./n/Жилой квартал находится при въезде в Авиастроительный район со стороны центра Казани, по улице Миля. Удобное расположение позволяет быстро добраться до любой точки города. Микрорайон будущего с необходимой социальной инфраструктурой, развитой транспортной развязкой, созданный для уютной и комфортной жизни каждой семьи./n/Лаконичный, сдержанный фасад жилого комплекса выполнен в природных оттенках, гармонично вписывается в городское пространство. Аккуратный вид зданиям придают внутренние лоджии и корзины для кондиционеров./n/На территории жилого комплекса располагаются: зоны для отдыха и прогулок, спортивные площадки и воркаут-зоны. Безбарьерная среда, увеличенные оконные проемы и угловые окна, просторные колясочные в каждом подъезде, видеонаблюдение, озеленение по всему периметру, рядом 7 детских садов и 8 школ, в 15 минутах ТЦ Парк-Хаус и Тандем, в шаговой доступности гипермаркет Лента./n/Дворы огорожены зелеными насаждениями, а по всей территории комплекса, на первых этажах подъездов и в лифтах, установлено видеонаблюдение.	2025-12-07 11:28:30.261	2025-12-07 11:28:30.261
16	ЖК Минтимер	Портовая ул.	Бабушкинский	 м. Площадь Габдуллы Тукая	10	\N	СМУ-88	80999000	35	COMFORT	19	192	192	55.767261	49.09642	2028-06-30 00:00:00	0	f	Это жилой комплекс бизнес-класса, представляющий собой проверенный баланс комфорта, понятности и стабильности. Ценности остаются прежними — создается разноплановая среда, отвечающая им: безопасная, современная, эстетичная и технологичная. Дом в знаковом месте./n/nЖК станет частью нового будущего города, сохраняя культурную и историческую ценность района. Это идеальное местоположение для проживания рядом с благоустроенной набережной, где вы сможете неспешно прогуливаться, заниматься спортом и каждый день вдохновляться умиротворяющей атмосферой воды./n/nБлагоустроенный двор на стилобате с богатой растительной палитрой, малыми архитектурными формами и продуманными общественными пространствами воплощает идею счастливой и размеренной жизни. Для вашего комфорта — плейхабы последнего поколения с заботой о разностороннем развитии ребенка, воркаут-площадки, приватные зоны отдыха. Архитектура как отражение места силы./n/nКонцепция комплекса разрабатывалась как обращение к индустриальному прошлому территории и отражает это наследие в архитектурном коде фасадов и пространственных решениях. ЖК — это дань уважения целой эпохе, переосмысленная в современных стандартах архитектуры, но сохраняющая динамику и узнаваемый силуэт индустриального прошлого./n/nКонцептуальное оформление лобби и входных групп продолжает архитектурный замысел функциональности и красоты, простоты и гармонии. Синтез утонченности, удобства и современного дизайна обеспечивает пространство, где каждая деталь оправдывает ожидания резидентов: зона с камином и библиотекой, консьерж-сервис, колясочная с отдельным входом. В холлах предусмотрено умное освещение и вход по face ID./n/nПросторные цветущие дворы на стилобате воплощают идею счастливой и размеренной жизни. Воркаут-площадки, игровые пространства и приватные зоны отдыха позволяют реализовать идею счастливой и размеренной жизни./n/nВ комплексе двухуровневая подземная парковка и гостевые парковочные места. На паркинге предусмотрены автоматическая система доступа и охранная система с видеонаблюдением, продуманная разметка с минимизацией «слепых» зон и возможность установки станции зарядки для электроавтомобилей./n/nЭргономичные планировки позволяют довериться себе и обустроить квартиру под собственные потребности. Здесь все устроено максимально удобно, продуманы места хранения, пространства для семейного отдыха и уединения. В светлое время суток комнаты будут наполнены естественным светом. А в кухне-гостиной вся семья сможет собираться за ужином, встречать гостей и проводить вместе время.	2025-12-07 12:59:42.003	2025-12-07 12:59:42.003
17	ЖК Крыловка парк	Ягодинская ул.	Бабушкинский	 м. Козья слобода	20	\N	СМУ-88	80999000	35	COMFORT	19	192	192	55.81078	49.074102	2028-06-30 00:00:00	0	f	Жилой комплекс прагматик-класса на стыке трех районов: Ново-Савиновского, Московского и Кировского в 10 минутах от центра города./nУлица Большая Крыловка на протяжении многих лет является крупным элементом Большого Казанского кольца, по кратчайшему пути соединяющим Ново-Савиновский, Московский, Кировский и Вахитовский районы города./nВсего за 10 минут езды на автомобиле можно добраться до Казанского Кремля, а в пешей доступности расположены гипермаркет Metro и супермаркет EUROSPAR, станция метро «Козья Слобода» и ТРК «Тандем»./nШирокие улицы и удобные транспортные развязки позволят не тратить драгоценное время на пробки и доехать до любой точки города за 15–20 минут./n/nВо дворе проектом предусмотрены зоны воркаут и многофункциональное игровое поле, а для самых маленьких — детская площадка с атравматичным покрытием, а также зоны отдыха с ландшафтным озеленением: многочисленные деревья, аккуратные декоративные кустарники, дизайнерское освещение и даже скамейки с функцией подогрева сидений для комфортного отдыха в любое время года./n/nДвухуровневый подземный паркинг находится под охраной 24/7./nС паркинга на нужный жилой этаж ведет современный лифт./nДля гостей предусмотрен гостевой паркинг на 74 машиноместа./n/nВходные группы ЖК оснащены 2-уровневой системой грязезащиты и антиобледенения./nВ холлах на первом этаже находится зона ожидания, оборудованная диванами, розетками и уникальными устройствами, сочетающими в себе беспроводную зарядную станцию и антибактериальную УФ-лампу./nВ зоне хранения вы можете оставить спортивный инвентарь и детские коляски./nТут же располагается лифтовая зона./n/nВ ЖК представлены по-настоящему просторные квартиры с современными планировками, а увеличенные оконные проемы до 2,6 м, высокие потолки до 3,5 м и лоджия в каждой квартире добавят пространству легкости и естественного света.	2025-12-07 16:16:19.576	2025-12-07 16:16:19.576
\.


--
-- Data for Name: ReadyApartment; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."ReadyApartment" (id, title, "complexName", address, city, area, price, "pricePerM2", bedrooms, floor, "totalFloors", lat, lng, metro, "metroDistance", description, developer, "createdAt", "updatedAt", "currentId") FROM stdin;
1	Квартира 2-комн., 54 м2, 6 / 6 этаж	Нет ифнормации	Москва, ул. Липовый парк, д. 7	Казань	54	4490000	1	2	6	6	55.830943	48.682176	Нет информации	10	🏡 Продаётся уютная двухкомнатная квартира в посёлке Васильево!\n\n✨ Отличное предложение для комфортной жизни! Квартира полностью меблирована, а вся техника остаётся новому владельцу. Вам не нужно тратить время и деньги на обустройство – просто заезжайте и наслаждайтесь своим новым домом!\n\n📍 Удобное расположение: рядом магазины, школы и остановки общественного транспорта.\n\n🌿 Просторные комнаты, светлые окна, свежий ремонт – всё это создаёт атмосферу уюта и комфорта.\n\n💰 Не упустите шанс стать владельцем этой замечательной квартиры! Звоните для записи на просмотр!	lpi	2025-11-29 15:28:10.963	2025-11-29 15:28:10.963	68
2	Квартира 3-комн., 57.10 м2, 1 / 5 этаж	Нет ифнормации	г Казань, ул Кулахметова, д 6	Казань	57	7000000	1	3	1	5	55.822948	49.052659	Нет информации	10	Квартира на продаже\n\nПродается квартира по адресу Куллахметова 6.\n\n- Первый этаж пятиэтажного дома\n- Косметический ремонт\n- Удобное месторасположение\n- Развитая инфраструктура: магазины, школы, детские сады в шаговой доступности\n- Возможен торг\n\nКвартира подходит как для проживания, так и для последующей аренды.\n\nЗвоните для подробностей и записи на просмотр!	lpi	2025-11-29 16:48:52.529	2025-11-29 16:48:52.529	300
3	Квартира 2-комн., 52 м2, 5 / 12 этаж	Нет ифнормации	г Казань, ул Тэцевская, д 4Б	Казань	52	10599000	1	2	5	12	55.850403	49.065963	Нет информации	10	🏢 Продается шикарная квартира!\n\n✨ Дизайнерский ремонт\n📏 Общая площадь 52 кв.м\n📍 Улица Тэцевская, 4Б\n\nКомфорт и уют в отличном районе с развитой инфраструктурой:\n- Закрытая территория\n- В пешей доступности школы, садики, магазины и аптеки\n- Метро рядом\n\n💼 Один взрослый собственник\n📄 Чистая продажа\n\nПоказ в любое удобное для Вас время!\nНе упустите шанс стать владельцем этой стильной квартиры!\n📞 Звоните для записи на просмотр!	lpi	2025-11-30 09:34:33.114	2025-11-30 09:34:33.114	587
4	Квартира 2-комн., 46.5 м2, 4 / 10 этаж	Нет ифнормации	г Казань, ул Рихарда Зорге, д 88	Казань	46	7950000	1	2	4	12	55.74376	49.217796	Нет информации	10	Срочная продажа — уютная 2‑комнатная квартира на ул. Зорге, 88\n\nПродаётся светлая, тёплая двухкомнатная квартира в одном из самых удачных районов города. Идеальный вариант для тех, кто ценит комфорт и удобство — всё в шаговой доступности.\n\nКраткие преимущества:\n- Расположение возле станции метро — быстрое перемещение по городу\n- Развитая инфраструктура: магазины, аптеки, торговые центры рядом\n- Подходит для жизни сразу — заезжай и живи, без необходимости ремонта\n- Комнаты изолированные, удобная планировка\n- Тёплый дом, ухоженный подъезд, безопасный район	lpi	2025-11-30 11:00:30.659	2025-11-30 11:00:30.659	774
5	Квартира 2-комн., 48 м2, 8 / 9 этаж	Нет ифнормации	г Казань, ул Академика Павлова, д 23А	Казань	48	5999000	1	2	8	9	55.864258	49.098437	Нет информации	10	Продаётся 2‑комнатная квартира в удобном районе с развитой инфраструктурой и отличной транспортной доступностью. Идеальный вариант для тех, кто ценит удобство городской жизни и готов вложить силы и средства в обновление интерьера.\n\nОсновные преимущества:\n- Расположение в шаговой доступности от метро — экономит время на поездках\n- Развитая инфраструктура: рядом магазины, аптеки, школы, детские сады и поликлиника\n- Удобная транспортная развязка — быстро добраться в любую точку города\n- Подходит как для комфортного проживания, так и для инвестиций под аренду\n\nОписание квартиры:\n- Формат 2‑комнатной планировки — светлые, просторные комнаты с возможностью перепланировки\n- Требует вложений — отличная возможность сделать ремонт по своему вкусу и повысить стоимость объекта\n- Комнаты правильной геометрии, большие окна, хорошие соседи\n- Санузел и кухня в стандартном состоянии, коммуникации рабочие (подлежат обновлению по желанию покупателя)\n\nДополнительно:\n- Документы готовы к сделке, возможна ипотека и материнский капитал\n- Готов выслушать предложения по цене и показать квартиру в удобное время	lpi	2025-11-30 11:04:30.239	2025-11-30 11:04:30.239	774
6	Квартира 2-комн., 49.9 м2, 4 / 9 этаж	Нет ифнормации	г Республика Татарстан (Татарстан), Казань, проспект Ильгама Шакирова, 20А	Казань	50	7250000	1	2	4	9	55.861388	48.900116	Нет информации	10	Продаётся 2‑комнатная квартира в удобном районе с развитой инфраструктурой и отличной транспортной доступностью. Идеальный вариант для тех, кто ценит удобство городской жизни и готов вложить силы и средства в обновление интерьера.\n\nОсновные преимущества:\n- Расположение в шаговой доступности от метро — экономит время на поездках\n- Развитая инфраструктура: рядом магазины, аптеки, школы, детские сады и поликлиника\n- Удобная транспортная развязка — быстро добраться в любую точку города\n- Подходит как для комфортного проживания, так и для инвестиций под аренду\n\nОписание квартиры:\n- Формат 2‑комнатной планировки — светлые, просторные комнаты с возможностью перепланировки\n- Требует вложений — отличная возможность сделать ремонт по своему вкусу и повысить стоимость объекта\n- Комнаты правильной геометрии, большие окна, хорошие соседи\n- Санузел и кухня в стандартном состоянии, коммуникации рабочие (подлежат обновлению по желанию покупателя)\n\nДополнительно:\n- Документы готовы к сделке, возможна ипотека и материнский капитал\n- Готов выслушать предложения по цене и показать квартиру в удобное время	lpi	2025-11-30 11:38:13.864	2025-11-30 11:38:13.864	807
7	Квартира 2-комн., 42.2 м2, 4 / 5 этаж	Нет ифнормации	г Казань, ул Ютазинская, д 12	Казань	42	4470000	1	2	4	5	55.84214	49.036291	Нет информации	10	Продаётся уютная и светлая двухкомнатная квартира в живописном районе Левченко, г. Казань. Идеальное жилье для семьи или инвесторов!\n\nПросторная гостиная и комфортная спальня позволят обустроить пространство мечты каждого члена вашей семьи.\n\nКвартира расположена в тихом зеленом районе с развитой инфраструктурой: рядом школы, детские сады, магазины, аптеки и зоны отдыха.\n\nУдобная транспортная доступность позволит быстро добраться до любого уголка города.\n\nПлощадь: просторная и функциональная планировка, общий метраж позволяет свободно разместить мебель и создать интерьер своей мечты.\n\nПреимущества покупки:\n- Уютный район с чистым воздухом и зелеными зонами для прогулок\n- Хорошее состояние дома и подъезда обеспечит дополнительное удобство проживания\n- Возможность комфортного обустройства пространства согласно вашим предпочтениям\n\nЖдем вас на просмотр, чтобы вы могли убедиться лично, насколько привлекательна эта недвижимость для вашего будущего! Позвоните нам прямо сейчас и получите подробную консультацию, организуйте удобный просмотр квартиры. Ваш новый дом ждет именно вас!	lpi	2025-11-30 11:52:38.097	2025-11-30 11:52:38.097	874
8	Квартира 1-комн., 47 м2, 3 / 10 этаж	Нет ифнормации	г Казань, ул Ленская, д 10	Казань	47	9499000	1	1	3	10	55.823292	49.080767	Нет информации	10	Продам квартиру на улице Ленская — отличный выбор для комфортной жизни!\n\n✔ Удобное расположение — квартира находится в районе с развитой инфраструктурой\n✔ Транспортная доступность — рядом остановки общественного транспорта, что позволяет легко добираться в любую точку города\n✔ Метро Яшьлек в шаговой доступности — идеальный вариант для тех, кто ценит скорость и комфорт в поездках\n✔ Тихий и зеленый район — для уютных прогулок и отдыха\n\nЭто отличное предложение для тех, кто ищет удобное жилье в центре городской жизни! Звоните и приходите на просмотр!	lpi	2025-11-30 11:58:19.926	2025-11-30 11:58:19.926	944
9	Квартира Студия 26.6 м2, 3 / 20 этаж	Нет ифнормации	Республика Татарстан (Татарстан), Казань, ЖК Ку на Кулагина	Казань	26	7699000	1	0	3	3	55.737198	49.143757	Нет информации	20	Q на Кулагина\n\nЖилой комплекс от компании «Унистрой» расположен в Приволжском районе Казани, на улице Кулагина, в активно застраиваемой и развивающейся части города. «Q на Кулагина» включает дома переменной высотности 3-20 этажей, фасады с подсветкой, дворы-парки с сенсорными садами, холлы и подземный паркинг с лифтом. Предлагаются квартиры с различными вариантами планировок.\n\nЛокация:\nПроект расположен в Приволжском районе на улице Кулагина. Рядом набережная озера Нижний Кабан, пешеходные маршруты, каскад водных растений, велодорожки и лодочная станция. Инфраструктура: школы, детские сады, спортивный комплекс «Бустан», центр гребных видов спорта, благоустроенные набережные и озеро Средний Кабан. На первых этажах — офисы, кофейни, спортивные студии, детские развивающие центры, клиники.\n\nАрхитектура:\nКомплекс состоит из 3 домов квартальной застройки, объединённых прогулочными зонами. Переменная высотность 9-20 этажей, фасады из крупноформатных панелей с подсветкой, природные светлые и тёмные тона создают уют и визуальный комфорт.\n\nПространства:\nПриватные дворы с игровыми площадками из природных материалов, спортивные зоны, места для отдыха и работы, прогулочные маршруты, беседки, релакс-парки.\n\nИнтерьеры:\nДворы и входы без пандусов и ступеней, входные группы в современном стиле, холлы по авторскому дизайн-проекту с домофонами, бесшумными лифтами, местами ожидания и паркингом для колясок.\n\nКвартиры:\nКвартиры с террасами, просторными кухнями-гостиными, мастер-спальнями с ванными и гардеробными, тёплыми лоджиями и эркерами. На верхних этажах террасы с видом на Волгу и Гребной канал.\n\nОтделка:\nПредчистовая отделка: металлические двери, тепло- и шумоизоляция, энергоэффективные стеклопакеты, скрытая разводка коммуникаций, радиаторы с терморегуляцией.\n\nПерсонификация:\nДвери с электронными замками (ключи или отпечаток пальца). Питьевая вода с фильтрацией и ионизацией. Автоматизированный учет потребления ресурсов.\n\nПаркинг:\nПодземный паркинг, охраняемые дворы и входные группы, видеонаблюдение, многоуровневый паркинг, гостевые места, зарядные станции для электромобилей.\n\nДополнительно:\nЧистая продажа. Срок сдачи: 3 квартал 2026 года.	lpi	2025-11-30 12:02:41.089	2025-11-30 12:02:41.089	945
10	Квартира 1-комн., 26.7 м2, 2 / 3 этаж	Нет ифнормации	Республика Татарстан (Татарстан), Лаишевский район, село Нармонка, улица Габишева, 2	Казань	26	2050000	1	1	2	3	55.493018	49.298698	Нет информации	20	Продаётся уютная однокомнатная квартира в живописном Лаишевском районе, село Нармонка.\n\nОкружённая природой, эта квартира станет идеальным местом для тех, кто мечтает о спокойствии и комфорте вдали от городской суеты.\n\nПросторная комната позволит воплотить дизайнерские идеи.\nКухню можно обустроить по своему вкусу.\nСанузел удобный и функциональный.\n\nРядом: футбольное и обычное поле, детский сад и школа.\nМагазины, дом культуры, остановка общественного транспорта — в шаговой доступности.\nРазвитая инфраструктура района делает жизнь комфортной и беззаботной.\n\nЭта квартира ждёт именно вас! Сделайте первый шаг навстречу своему новому дому уже сегодня!	lpi	2025-11-30 12:05:29.843	2025-11-30 12:05:29.843	948
11	Квартира 2-комн., 54 м2, 2 / 10 этаж	Нет ифнормации	г Казань, ул Генерала Махмута Гареева, д 7А	Казань	54	7499000	1	2	2	3	55.858372	48.907644	Нет информации	20	Продается уютная квартира в новом ЖК "Сандугач"\nАдрес: Генерала Махута Гареева, 7А\n\n✨ Особенности объекта:\n- Современный новый жилой комплекс с комфортной планировкой\n- Отличная транспортная развязка, позволяющая быстро добраться в любую часть города\n- Рядом находятся престижные лицеи и школы — идеальное решение для семей с детьми\n- Великолепный парк для прогулок и отдыха на свежем воздухе\n- Магазины, аптеки и торговые центры в шаговой доступности — вся необходимая инфраструктура под рукой\n\n🌟 Идеальное жилье для тех, кто ценит комфорт, удобство и развитую инфраструктуру!\n\nСвяжитесь с нами, чтобы узнать подробности и организовать просмотр.	lpi	2025-11-30 12:18:09.218	2025-11-30 12:18:09.218	1169
12	Квартира 2-комн., 57.2 м2, 3 / 5 этаж	Нет ифнормации	Республика Татарстан (Татарстан), Менделеевск, улица Фомина, 18	Казань	57	5099000	1	2	3	5	55.894298	52.315178	Нет информации	20	Уютная двухкомнатная квартира в центре Менделеевска\n\nПредлагается к продаже комфортная двухкомнатная квартира в самом сердце города Менделеевска. Отличное расположение — вся городская инфраструктура в шаговой доступности: школы, магазины, аптеки, транспортные развязки.\n\nКвартира находится в кирпичном доме, что гарантирует хорошую звуко- и теплоизоляцию. Жильё просторное и светлое, идеально подходит как для молодой семьи, так и для тех, кто ценит уют и комфорт.\n\nЭто выгодное предложение по соотношению цена – качество в центре города с развитой инфраструктурой. Отличный вариант для тех, кто хочет жить в удобном и спокойном районе с удобным доступом ко всем городским объектам.	lpi	2025-11-30 12:24:27.664	2025-11-30 12:24:27.664	1196
13	Квартира 2-комн., 55 м2, 5 / 5 этаж	Нет ифнормации	Республика Татарстан (Татарстан), Зеленодольский район, Осиновское сельское поселение, село Осиново, Дорожная улица, 33	Казань	55	9800000	1	2	5	5	55.875743	48.869492	Нет информации	20	Продаётся 2-комнатная квартира в ЖК «Достояние»\n\nИдеальный вариант для комфортной жизни и инвестиций!\n\n- Новостройка с современной планировкой\n- Возможность покупки по льготной ипотеке с выгодными условиями\n- Прекрасное расположение: рядом живописное озеро и лес, идеальное место для прогулок и отдыха на природе\n- Развитая инфраструктура и удобная транспортная доступность\n\nНе упустите шанс стать владельцем уютного жилья в экологически чистом районе!\n\nЗвоните прямо сейчас, подробности по телефону!	lpi	2025-11-30 12:40:53.693	2025-11-30 12:40:53.693	1199
\.


--
-- Data for Name: Realtor; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."Realtor" (id, "fullName", phone, email, "avatarUrl", "position", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: RentalApartment; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."RentalApartment" (id, title, address, area, "pricePerMonth", bedrooms, lat, lng, floor, "totalFloors", city, metro, "metroDistance", description, "createdAt", "updatedAt", "currentId") FROM stdin;
5	Квартира 2-комн., 65 м2, 5 / 18 этаж	г Казань, ул Виктора Сажинова, д 6/9	65	25000	2	55.866667	48.875798	5	18	Казань	не указан	1	Сдаётся уютная 2-комнатная квартира с современным ремонтом! Это идеальное место для комфортной жизни. В квартире всё новое и первоклассное: стильная мебель, качественная отделка и евроремонт. Просторные комнаты наполняются светом и теплом, создавая атмосферу домашнего уюта. Открытая кухня объединяет пространство, идеально подходит для кулинарных экспериментов и встреч с друзьями. Удачное расположение: рядом продукты магазины, кафе и транспорт. Отличный вариант для тех, кто ценит качество и комфорт. Не упустите возможность стать первым хозяином этой замечательной квартиры!	2025-11-29 15:48:43.472	2025-11-29 15:48:43.472	137
2	Квартира 3-комн., 75 м2, 5 / 20 этаж	г Казань, ул Комсомольская, д 2	75	90000	3	55.8117	49.095419	5	20	Казань	не указан	1	Элитная трехкомнатная квартира с дизайнерским ремонтом Эта потрясающая квартира в престижном жилом комплексе 5 звезд — ваш идеальный выбор для комфортной и стильной жизни. Просторные и светлые комнаты наполняют атмосферу уюта и гармонии. Дизайнерский ремонт выполнен с использованием высококачественных материалов, создавая незабываемую атмосферу. Комфорт для жизни Каждое помещение тщательно продумано: уютная гостиная, элегантная кухня и стильные спальни, готовые для вас. Квартира полностью укомплектована современной мебелью и техникой, что позволяет сразу же наслаждаться проживанием. Уникальные преимущества Жилой комплекс предлагает отличный уровень сервиса, защищённую территорию и множество удобств: бассейны, фитнес-центр, зона для отдыха и многое другое. Аренда на долгий срок Эта квартира станет вашим идеальным пространством для жизни. Не упустите шанс жить в роскошном месте!	2025-11-29 15:32:49.537	2025-11-29 15:32:49.537	88
1	Квартира 1-комн., 79 м2, 3 / 18 этаж	Республика Татарстан (Татарстан), Казань, Приволжский район, микрорайон Горки-3, микрорайон Экопарк Дубрава, улица Абубекира Терегулова, 8Б	79	40000	1	55.736483	49.207088	3	18	Казань	не указан	1	Предлагаю евродвухкомнатную квартиру в городе Казань в ЖК Экопарк Дубрава.\n—вся необходимая техника для Вашего комфорта.\n—комфортный 3 этаж.\n—уют и комфорт от проживания.\nИНОСТРАННЫХ ГРАЖДАН НЕ РАССМАТРИВАЕМ!!!\nКроме того, Вы получите отличное расположение:\n—экологически чистый район города;\n—выгодная транспортная развязка;\n—в шаговой доступности школы, детские сады, торговые центры, остановки.\nЗвоните! Договоримся о просмотре!	2025-11-29 14:13:52.213	2025-11-29 14:13:52.213	12
3	Квартира 2-комн., 68 м2, 8 / 18 этаж	г Казань, пр-кт Победы, д 80	68	25000	2	55.763543	49.221803	8	18	Казань	не указан	1	Сдается уютная 2-комнатная квартира!\n\nПредлагаем вам арендовать светлую и просторную квартиру в отличном районе города. Идеально подойдет для тех, кто ценит комфорт и уют!\n\n✨ Особенности:\n- Современный ремонт\n- Мебель и техника (холодильник, стиральная машина)\n- Возможность установки кровати при заселении\n- Разрешено проживание с домашними животными\n- Подходит для семей с детьми\n\n🏡 Расположение:\n- Рядом с парком для прогулок\n- В пешей доступности магазины, школы и детские сады\n- Хорошая транспортная доступность\n\n💼 Условия аренды:\n- Долгосрочная аренда\n- Граждане РФ\n- Залог 10'000\n- Возможен торг\n\n🔑 Показы квартиры проводятся ежедневно!\nЗвоните прямо сейчас, чтобы забронировать просмотр и узнать больше деталей.\n\nВаш новый дом ждет вас!	2025-11-29 15:42:10.171	2025-11-29 15:42:10.171	131
4	Квартира 2-комн., 55 м2, 5 / 9 этаж	Респ Татарстан, Зеленодольский р-н, село Осиново, ул М.Ф.Гайсина, д 2Б	55	30000	2	55.868965	48.87808	5	9	Казань	не указан	1	Сдаётся уютная 2-комнатная квартира с современным ремонтом! Это идеальное место для комфортной жизни. В квартире всё новое и первоклассное: стильная мебель, качественная отделка и евроремонт. Просторные комнаты наполняются светом и теплом, создавая атмосферу домашнего уюта. Открытая кухня объединяет пространство, идеально подходит для кулинарных экспериментов и встреч с друзьями. Удачное расположение: рядом продукты магазины, кафе и транспорт. Отличный вариант для тех, кто ценит качество и комфорт. Не упустите возможность стать первым хозяином этой замечательной квартиры!	2025-11-29 15:45:29.668	2025-11-29 15:45:29.668	136
6	Комната 3-комн., 52 м2, 3 / 9 этаж	г Казань, ул Маршала Чуйкова, д 69	52	12000	3	55.836282	49.144781	3	9	Казань	не указан	1	Сдается комната в удобной 3-комнатной квартире Ищем соседку — девушку или женщину на длительный срок. В квартире уже живут приятные и порядочные девушки, что создаёт уютную атмосферу. Преимущества: - Все необходимое для комфортного проживания - Хорошее расположение: рядом магазины, транспорт - Доступные коммунальные услуги, что позволяет экономить Комната светлая и уютная, есть возможность связаться для просмотра. Если вы ищете спокойное место для жизни с добрыми соседями, эта комната для вас. Ждем ваши сообщения!	2025-11-29 15:54:48.41	2025-11-29 15:54:48.41	145
7	Квартира 2-комн., 54 м2, 3 / 9 этаж	г Казань, ул Галимджана Баруди, д 13	54	38000	2	55.823257	49.067041	3	9	Казань	не указан	1	Сдаю уютную двухкомнатную квартиру по адресу Баруди 13 на долгий срок! В квартире есть всё необходимое для комфортного проживания: мебель, бытовая техника и уютные детали, которые создают атмосферу домашнего тепла. Идеально подходит для семьи или пары, а также можно с маленьким питомцем. Прекрасное расположение — рядом магазины, школы и детские сады, что делает жизнь здесь удобной и комфортной. Удобная транспортная развязка позволит вам быстро добраться в любую точку города. Не упустите возможность жить в этом уютном уголке! Звоните и записывайтесь на просмотр.	2025-11-29 15:57:48.098	2025-11-29 15:57:48.098	151
8	Квартира 1-комн., 50 м2, 21 / 23	г Казань, ул Братьев Батталовых, д 20 к 1	50	35000	1	55.7216	49.187631	21	23	Казань	не указан	1	Сдается 1-комнатная квартира с отличным ремонтом на долгий срок. Уютное и светлое пространство, идеально подходящее для комфортного проживания. В квартире есть всё необходимое: современная мебель, техника, посуда. Развита инфраструктура: магазины, кафе, транспорт в шаговой доступности. Вы сможете наслаждаться всеми удобствами городской жизни. Рядом парки для прогулок и отдыха. Идеальный вариант как для одиночек, так и для пар. Звоните, будем рады ответить на ваши вопросы и организовать просмотр!	2025-11-29 16:00:19.25	2025-11-29 16:00:19.25	152
9	Квартира 3-комн., 60 м2, 9 / 9 этаж	г Казань, ул Академика Завойского, д 22А	60	50000	3	55.75745	49.235448	9	9	Казань	не указан	1	Сдаю евро трешку с шикарным ремонтом на долгий срок! Эта квартира идеально подойдет для комфортного проживания. Здесь есть все необходимое для вашего уютного образа жизни: стильная мебель, современная техника и богатая инфраструктура вокруг. Просторная кухня, где готовить будет приятно, уютная гостиная для вечеров с друзьями и светлые спальни для качественного отдыха. Возможен договор с организацией, что делает это предложение интересным для бизнеса. Иностранные граждане тоже могут присоединиться! Максимум до 3 человек - мы поможем с регистрацией. Не упустите шанс стать жильцом этой прекрасной квартиры! Свяжитесь со мной для подробностей и организации просмотра.	2025-11-29 16:02:54.955	2025-11-29 16:02:54.955	153
10	Квартира 2-комн., 62 м2, 5 / 9 этаж	г Казань, ул Вишневского, д 61	62	42000	2	55.780492	49.147889	5	9	Казань	не указан	1	Сдаю двухкомнатную квартиру в центре города! Эта квартира станет идеальным местом для комфортной жизни. Здесь вы найдете всё необходимое: современная мебель, полностью укомплектованная кухня и уютные спальни, где можно расслабиться после насыщенного дня. Окружение радует развитой инфраструктурой: магазины, кафе и транспорт в шаговой доступности. Вы сможете наслаждаться всеми прелестями городской жизни! Идеально подойдет как для семьи, так и для работающих специалистов. Не упустите возможность, в самом сердце города! Свяжитесь со мной для подробностей и организации просмотра.	2025-11-29 16:06:02.1	2025-11-29 16:06:02.1	154
11	Квартира 1-комн., 52 м2, 5 / 17 этаж	г Казань, ул Минская, д 12	52	30000	1	55.772208	49.22094	5	17	Казань	не указан	1	Сдаю уютную однушку в рассвете уюта! Эта просторная квартира расположена в хорошем доме напротив ТЦ Южный, что обеспечивает вам удобный доступ ко всем необходимым магазинам и услугам. В квартире есть все для комфортного проживания: современная мебель, кухонная утварь и высокоскоростной интернет! Наслаждайтесь уютными вечерами и приятными моментами в этом прекрасном пространстве! Также в вашем распоряжении светлые комнаты и балкон, где можно насладиться свежим воздухом. Не упустите возможность сделать этот уголок своим домом! Звоните и приходите на просмотр!	2025-11-29 16:09:05.278	2025-11-29 16:09:05.278	156
12	Квартира 1-комн., 50 м2, 6 / 16 этаж	г Казань, ул Хусаина Мавлютова, д 42	50	29000	1	55.748376	49.188691	6	16	Казань	не указан	1	Сдаётся шикарная однушка в отличном районе! Эта уютная квартира станет вашим идеальным домом. Просторная кухня оснащена всем необходимым для комфортного проживания. Светлая и стильная гостиная идеально подходит для отдыха и встреч с друзьями. Расположение радует — рядом магазины, кафе, парки и остановки общественного транспорта. В квартире уже есть вся необходимая мебель и бытовая техника, чтобы вы могли сразу же переехать и почувствовать себя как дома. Не упустите возможность жить в комфортабельной обстановке! Звоните и записывайтесь на просмотр уже сегодня!	2025-11-29 16:12:01.273	2025-11-29 16:12:01.273	169
13	Квартира 1-комн., 36 м2, 2 / 10 этаж	Респ Татарстан, Зеленодольский р-н, село Осиново, ул М.Ф.Гайсина, д 7	36	23000	1	55.870284	48.879239	2	10	Казань	не указан	1	Сдаётся уютная однокомнатная квартира на улице Гайсина, дом 7.  Квартира полностью готова к проживанию: свежий, качественный ремонт создаёт атмосферу комфорта и уюта.  Расположение идеально для семьи с ребенком – тихий и спокойный район, рядом детская площадка, торговый центр и остановка общественного транспорта.  Всё необходимое для комфортной жизни в шаговой доступности!  Рассмотрим кандидатов – семьи с детьми, без животных.	2025-11-29 16:14:29.318	2025-11-29 16:14:29.318	179
14	Квартира 1-комн., 38 м2, 3 / 9 этаж	г Казань, ул Кулахметова, д 25 к 1	38	35000	1	55.830457	49.060232	3	9	Казань	не указан	1	✨Сдаётся уютная 1-комнатная квартира на ул. Кулахметова, 25 (Московский район, Казань).✨  Отличное расположение – рядом остановки общественного транспорта, магазины, всё необходимое для комфортной жизни.  В квартире есть вся необходимая мебель и бытовая техника:  (перечислите основные - холодильник, стиральная машина, плита и т.д.).  Свежий ремонт, чисто и аккуратно.  Идеальный вариант для семейной пары без детей и животных.  Звоните, показ в любое удобное время!	2025-11-29 16:16:45.653	2025-11-29 16:16:45.653	180
15	Квартира 1-комн., 35 м2, 6 / 10 этаж	Республика Татарстан (Татарстан), Казань, улица Адоратского, 5	35	35000	1	55.824784	49.144323	6	10	Казань	не указан	1	Сдается уютная 1-комнатная квартира на ул. Адоратского, д. 5.✨  В квартире есть вся необходимая мебель и бытовая техника.  Отличное состояние, свежий ремонт. Удобное расположение , близость к транспорту, магазинам.  Идеально подходит для одного человека или пары.  Звоните, организуем показ!	2025-11-29 16:19:37.703	2025-11-29 16:19:37.703	181\n
16	Квартира 1-комн., 38 м2, 5 / 10 этаж	г Казань, ул Разведчика Ахмерова, д 5	38	45000	1	55.797356	49.180687	5	10	Казань	не указан	1	Ищете уютную квартиру в современном ЖК? Тогда это предложение для Вас!\n\nСдается прекрасная 1-комнатная квартира (38 кв.м) в ЖК ART CITY. Полностью меблирована и оборудована всем необходимым для комфортного проживания.\n\nВ квартире:\n* Удобная мебель\n* Современная бытовая техника\n* Просторная планировка\n\nРассмотрим аккуратных и платежеспособных арендаторов: семейную пару или одного человека.\nЗвоните и записывайтесь на просмотр!	2025-11-29 16:32:03.25	2025-11-29 16:32:03.25	184
17	Квартира Студия 18 м2, 5 / 5 этаж	г Казань, ул Роторная, д 11	18	22000	1	55.764729	49.154438	5	5	Казань	не указан	1	Сдаётся уютная гостинка с косметическим ремонтом в самом сердце города! Это отличное предложение для тех, кто ценит комфорт и удобство городской жизни. В вашем распоряжении всё необходимое для приятного проживания: современная мебель, бытовая техника и стильный интерьер.	2025-11-29 16:35:08.061	2025-11-29 16:35:08.061	186
24	Квартира 1-комн., 35 м2, 4 / 5 этаж	г Казань, ул Блюхера, д 81	35	30000	1	55.828096	49.065801	4	5	Казань	не указан	1	Сдам уютную 1-комнатную квартиру на Блюхера 81 в Кировском районе!\n\nПросторное и светлое жилье подойдёт для тихого проживания.\n\nЖивотные не допускаются, приветствуются только ответственные арендаторы без вредных привычек.\n\nРассматриваем только граждан РФ.\n\nУдобное месторасположение: рядом магазины, остановки и всё необходимое для комфортной жизни.\n\nЗвоните, будем рады ответить на все вопросы и организовать просмотр!	2025-11-29 17:49:31.66	2025-11-29 17:49:31.66	457
18	Квартира 1-комн., 32 м2, 4 / 5 этаж	г Казань, ул Болотникова, д 1	32	27000	1	55.818245	49.0568	4	5	Казань	не указан	1	Сдаётся 1-комнатная квартира на долгий срок! Эта квартира с косметическим ремонтом готова стать вашим новым уютным гнёздышком. Просторное пространство позволяет легко реализовать ваши идеи и улучшить его по своему вкусу. Вы можете внести изменения собственными ресурсами и создать идеальную атмосферу для жизни. Здесь также рады вашим четвероногим друзьям! Квартира отлично подходит для владельцев питомцев, так что не переживайте &mdash; ваши любимцы будут чувствовать себя как дома. Удобное расположение обеспечит вам доступ ко всем необходимым магазинам, паркам и транспорту. Не упустите возможность создать свой идеальный уголок! Звоните, чтобы узнать больше и записаться на просмотр!	2025-11-29 16:38:43.437	2025-11-29 16:38:43.437	212
19	Квартира Студия 25 м2, 2 / 2 этаж	Республика Татарстан (Татарстан), Казань, улица Бахетле, 31	25	20000	0	55.821851	49.229438	2	2	Казань	не указан	1	Уютная студия в пристройке к частному дому\n\nИдеальное место для комфортного проживания!\n\nРасположение: Тихий и спокойный район, вдали от городской суеты.\n\nО студии:\n- Полностью оборудована всем необходимым для жизни\n- Уютная атмосфера, готовая к вашему заселению\n\nДополнительные преимущества:\n- Имеется баня – отличный способ расслабиться после долгого дня!\n\nПочему стоит выбрать эту студию:\n- Уединение и спокойствие в своем собственном уголке\n- Доступность всех привычных удобств\n\nНе упустите возможность арендовать эту замечательную студию! Звоните для получения дополнительной информации и организации просмотра!	2025-11-29 16:59:09.099	2025-11-29 16:59:09.099	314
20	Квартира 3-комн., 90 м2, 3 / 14 этаж	г Казань, ул Дубравная, д 28а	90	60000	3	55.736802	49.204052	3	14	Казань	не указан	1	🏡 Квартира в ЖК Зимний Дворец\nКВАРТИРА РЕАЛЬНАЯ!\nПОКАЖУ В ЛЮБОЕ ВРЕМЯ!\n\n✨ Предлагаем вашему вниманию великолепную 3-х комнатную квартиру площадью 90 кв.м по адресу: улица Дубравная 28 А.\n\n🛋 Описание: Уютное и стильное жилье, в котором есть все для комфортной жизни. Просторная кухня, светлая гостиная и две уютные спальни создадут атмосферу уюта и спокойствия.\n\n🌳 Природа рядом: Вокруг – живописные леса и парки, где вы сможете наслаждаться прогулками и свежим воздухом.\n\n🌆 Идеальное место для тех, кто ценит комфорт и близость к природе. Не упустите возможность найти свой новый дом!\n\n📞 Звоните прямо сейчас, чтобы записаться на просмотр!	2025-11-29 17:13:27.218	2025-11-29 17:13:27.218	314
21	Квартира Студия 40 м2, 18 / 20 этаж	г Казань, ул Аделя Кутуя, д 100	40	37000	0	55.781666	49.187729	18	20	Казань	не указан	1	🏙 Студия в ЖК Открытие\n\n🌟 Ищете идеальное место для жизни? Представляем вам стильную студию площадью 40 кв.м в новом ЖК Открытие!\n\n✨ Описание: Просторная и светлая студия полностью укомплектована всем необходимым для вашего комфорта. Современный дизайн интерьера создает атмосферу уюта и спокойствия, где вы сможете расслабиться после насыщенного дня.\n\n👌 Преимущества: Вам не нужно будет ни о чем беспокоиться – все готово к вашему комфортному проживанию.\n\n💰 Цена аренды: 37 000 руб.\n\n📞 Не упустите уникальную возможность! Свяжитесь с нами для просмотра и ощутите все преимущества жизни в ЖК Открытие!	2025-11-29 17:17:50.944	2025-11-29 17:17:50.944	361
22	Квартира 2-комн., 50 м2, 11 / 20 этаж	г Казань, ул Алексея Козина, д 2	50	65000	2	55.813364	49.136364	11	18	Казань	не указан	1	Сдаётся евродвушка в новом ЖК бизнес-класса!\n\nНовый дизайнерский ремонт\nКвартира полностью готова к сдаче\nУдобное расположение: напротив аквапарка и других развлекательных комплексов!\n\nИдеально для комфортной жизни!\nНе упустите шанс стать первым жильцом!\n\nСвяжитесь со мной для просмотра и подробностей!	2025-11-29 17:42:45.548	2025-11-29 17:42:45.548	416
23	Квартира 1-комн., 38 м2, 10 / 17 этаж	г Казань, ул Петра Полушкина, д 4	38	35000	1	55.785007	49.21661	10	17	Казань	не указан	1	Аренда 1 комнатной квартиры Ул. Петра Полушкина, д. 4 Предлагается в длительную аренду уютная 1-комнатная квартира. Просторная комната с новой мебелью, светлые тона, удобная планировка. Современная кухня, оборудована всем необходимым: холодильник, плита, микроволновка. Сантехника в хорошем состоянии, ванная комната с душевой кабиной. Развитая инфраструктура: рядом магазины, остановки общественного транспорта, парки. Идеально для одиночек или пары. Условия аренды: разумная цена, залог, оплата коммунальных услуг отдельно. Готовы к просмотрам, звоните!Аренда 1 комнатной квартиры Ул. Петра Полушкина, д. 4 Предлагается в длительную аренду уютная 1-комнатная квартира. Просторная комната с новой мебелью, светлые тона, удобная планировка. Современная кухня, оборудована всем необходимым: холодильник, плита, микроволновка. Сантехника в хорошем состоянии, ванная комната с душевой кабиной. Развитая инфраструктура: рядом магазины, остановки общественного транспорта, парки. Идеально для одиночек или пары. Условия аренды: разумная цена, залог, оплата коммунальных услуг отдельно. Готовы к просмотрам, звоните!	2025-11-29 17:46:24.555	2025-11-29 17:46:24.555	418
31	Квартира 1-комн., 28 м2, 2 / 5 этаж	Респ Татарстан, Зеленодольский р-н, село Осиново, ул Ленина, д 4	28	22000	1	55.876703	48.897116	2	5	Казань	не указан	1	Сдается однокомнатная квартира в Осиново.\nКирпичный, очень теплый дом.\nВсе просто и уютно.\nПросторная комната.\nУдобная кухня.\nСовмещенный санузел.\nИдеально подойдет для одного человека или молодой пары.	2025-11-30 09:18:02.717	2025-11-30 09:18:02.717	573
25	Квартира Студия 17.5 м2, 1 / 10 этаж	г Казань, ул Юлиуса Фучика, д 102	17	23000	1	55.769692	49.235053	1	10	Казань	не указан	1	Уютная студия на первом этаже ждет своих жильцов!\n\nМестоположение: улица Фучика - идеальное место для комфортной жизни.\n\nОписание: Просторная и светлая гостинка с современным ремонтом. Оборудована всем необходимым для комфортного проживания: удобная кухня, уютная зона для отдыха и свежий санузел.\n\nКто подойдет: Рассмотрим одиночек, студентов и студенток, которые ищут уют и спокойствие.\n\nИнфраструктура: Рядом магазины, кафе, остановки общественного транспорта - всё, что нужно для комфортной жизни в шаговой доступности!\n\nНе упустите шанс найти свое идеальное жилье! Звоните и записывайтесь на просмотр!\n\nЖдём вас в нашей уютной студии!	2025-11-29 17:52:20.099	2025-11-29 17:52:20.099	494
26	Квартира 2-комн., 55 м2, 16 / 22 этаж	г Казань, ул Чистопольская, д 88	55	80000	2	55.81871	49.146461	16	22	Казань	не указан	1	КВАРТИРА РЕАЛЬНАЯ!\n✨ Сдам шикарную квартиру в бизнес-классе Столичный! ✨\n\n🏡 Евро 2-х комнатная квартира с новым ремонтом — идеальное решение для комфортной жизни!\n\n🛋️ Квартира находится на этапе сборки мебели, что позволяет вам стать первым её обладателем и создать пространство по своему вкусу!\n\n📹 Заинтересованы? У меня есть видео, которое я с удовольствием отправлю по запросу!\n\n🏋️‍♂️ Также в ЖК предусмотрен современный спортзал для активного образа жизни!\n\nНе упустите возможность жить в комфортном и стильном доме! Свяжитесь для получения дополнительной информации! 🗝️	2025-11-30 08:58:16.048	2025-11-30 08:58:16.048	507
27	Квартира 2-комн., 42 м2, 2 / 5 этаж	г Казань, ул Аделя Кутуя, д 3А	42	35000	2	55.787801	49.167131	2	5	Казань	не указан	1	Ищете 2-комнатную квартиру в Казани? Предлагается уютная квартира на улице Аделя Кутуя, 3а.\n\n- Центр города\n- Светлые тона в интерьере\n- После свежего ремонта\n- Вторая сдача, готова к заселению\n- Рассмотрим иностранцев, но цена будет дороже\n\nПреимущества: удобное расположение, развитая инфраструктура, близость к общественному транспорту.\n\nЗа подробностями обращайтесь в личные сообщения!	2025-11-30 09:03:16.163	2025-11-30 09:03:16.163	533
28	Квартира 1-комн., 41 м2, 13 / 18 этаж	г Казань, ул Айрата Арсланова, д 8	41	23000	1	55.865556	48.881611	13	18	Казань	не указан	1	Сдам уютную 1-комнатную квартиру (42 кв.м) на первой сдаче!\n\nАдрес: Салават Купере, Айрата Арысланова 8\nИдеальный вариант для:\n- Семейных пар\n- Одиночек\n- Возможен вариант с ребенком школьного возраста\n\nУсловия:\n- Без вредных привычек\n- Без домашних животных\n- Ждем только граждан РФ\n\nКвартира светлая, просторная и готова к заселению. Отличная инфраструктура и транспортная доступность.\n\nВозможен торг. Заинтересовались? Пишите в личные сообщения!	2025-11-30 09:06:33.576	2025-11-30 09:06:33.576	541
29	Квартира 2-комн., 42 м2, 18 / 20 этаж	г Казань, ул Николая Ершова, д 66Б	42	40000	2	55.799052	49.18136	18	20	Казань	не указан	1	квартипа реальная есть видео!!!!!\nУютная дизайнерская евро двушка на 18 этаже на Ершова 66в\nОткройте для себя уникальную квартиру с великолепным видом на мост Миллениум и Кремль!\nПросторная планировка и стильный декор создают атмосферу уюта и гармонии.\n\nОсобенности квартиры:\n- Большая светлая гостиная, идеально подходящая для отдыха и встреч с друзьями\n- Современная кухня с качественной техникой и всем необходимым для готовки\n- Удобные спальни с невероятным видом и продуманным освещением\n- Стильный санузел с современными удобствами\n\nЖивите в центре событий, наслаждайтесь архитектурными шедеврами и комфортом.\nЭта квартира - идеальный выбор для тех, кто ценит стиль и высокое качество жизни!\n\nЗвоните, чтобы узнать больше и записаться на просмотр!	2025-11-30 09:10:16.58	2025-11-30 09:10:16.58	543
30	Квартира 2-комн., 65 м2, 5 / 18 этаж	г Казань, пр-кт Победы, д 78	65	45000	2	55.763807	49.220608	5	18	Казань	не указан	1	🏠 Квартира в аренду в Казани\n\nБольшая светлая двухкомнатная квартира, 65 м² метро Проспект Победы. Идеальный вариант для комфортной жизни!\n\n✨ Современный евроремонт\n🛋 Просторная гостиная с удобным диваном\n🛏 Уютная спальня с двуспальной кроватью\n❄️ Кондиционер для вашего комфорта\n📺 Вся необходимая техника и мебель\n\nОтличная транспортная развязка предлагает лёгкий доступ ко всем основным точкам города. Здесь вы сможете наслаждаться жизнью в уютной и стильной обстановке.\n\nНе упустите возможность арендовать эту прекрасную квартиру!	2025-11-30 09:13:29.227	2025-11-30 09:13:29.227	559
32	ККвартира Студия 32 м2, 11 / 19 этаж	г Казань, пр-д Юнуса Ахметзянова, д 10	32	40000	0	55.797367	49.186696	11	19	Казань	не указан	1	Арт Сити — это стильная студия в центре Казани, которая идеально подходит для комфортной жизни.\n\nПрекрасное месторасположение обеспечивает отличную транспортную развязку, что делает передвижение по городу простым и удобным.\n\nСовременный дизайн и уютная обстановка создают атмосферу уюта и спокойствия.\n\nРядом находятся магазины, кафе и культурные достопримечательности, что позволяет насладиться всеми преимуществами городской жизни.\n\nЗдесь вы сможете быстро погрузиться в ритм города и насладиться его энергией!	2025-11-30 09:20:26.593	2025-11-30 09:20:26.593	602
48	Квартира 1-комн., 39 м2, 3 / 10 этаж	Республика Татарстан (Татарстан), Казань, проспект Ямашева, 101	39	36000	1	55.824329	49.152542	3	10	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом;\n- Вся необходимая мебель и техника;\n- Возможна частичная или полная укомплектованность (по договоренности).\n\nУсловия:\n- Для порядочных, платежеспособных жильцов;\n- Без животных (или рассмотрим вариант);\n- Долгосрочная аренда, с заключением договора;	2025-12-02 10:54:05.975	2025-12-02 10:54:05.975	785
33	Квартира 2-комн., 45 м2, 4 / 5 этаж	г Казань, ул Гагарина, д 73А	45	40000	2	55.838299	49.094215	4	5	Казань	не указан	1	Сдаётся двухкомнатная квартира на гагарина 73а на длительный срок. Эта уютная квартира идеально подойдёт для порядочных людей, ценящих комфорт и удобство. В пешей доступности расположены магазины, остановки общественного транспорта, что делает её отличным вариантом для жизни. Функциональная планировка позволяет максимально использовать пространство, а светлые комнаты создают атмосферу уюта и тепла. Развита инфраструктура района обеспечит вам лёгкий доступ ко всем необходимым услугам. Не упустите возможность жить в комфортной и уютной квартире! Свяжитесь для просмотра и получения дополнительной информации.	2025-11-30 09:23:50.609	2025-11-30 09:23:50.609	615
34	Квартира 2-комн., 45 м2, 7 / 9 этаж	г Казань, ул Маршала Чуйкова, д 31	45	40000	2	55.836782	49.127318	7	9	Казань	не указан	1	Сдаётся двухкомнатная квартира на Чуйкова 31 на длительный срок. Эта уютная квартира идеально подойдёт для порядочных людей, ценящих комфорт и удобство. В пешей доступности расположены магазины, остановки общественного транспорта, что делает её отличным вариантом для жизни. Функциональная планировка позволяет максимально использовать пространство, а светлые комнаты создают атмосферу уюта и тепла. Развита инфраструктура района обеспечит вам лёгкий доступ ко всем необходимым услугам. Не упустите возможность жить в комфортной и уютной квартире! Свяжитесь для просмотра и получения дополнительной информации.	2025-11-30 09:31:06.29	2025-11-30 09:31:06.29	614
47	Квартира 1-комн., 42 м2, 3 / 9 этаж	Республика Татарстан (Татарстан), Казань, Минская улица, 18	42	36000	1	55.772137	49.224857	3	9	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом\n- Вся необходимая мебель и техника\n- Возможна частичная или полная укомплектованность (по договоренности)\n\nУсловия:\n- Для порядочных, платежеспособных жильцов\n- Без животных (или рассмотрим вариант)\n- Долгосрочная аренда, с заключением договора	2025-11-30 10:56:56.458	2025-11-30 10:56:56.458	783
49	Квартира 1-комн., 40 м2, 5 / 11 этаж	Республика Татарстан (Татарстан), Казань, улица Лейтенанта Шмидта, 29	40	37000	1	55.789305	49.157798	5	11	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом;\n- Вся необходимая мебель и техника;\n- Возможна частичная или полная укомплектованность (по договоренности).\n\nУсловия:\n- Для порядочных, платежеспособных жильцов;\n- Без животных (или рассмотрим вариант);\n- Долгосрочная аренда, с заключением договора;	2025-12-02 10:56:50.839	2025-12-02 10:56:50.839	786
124	Квартира Студия 33 м2, 17 / 19 этаж	г Казань, ул Ярышлар, д 2А	33	23000	0	55.68091	49.200036	17	19	Казань	не указан	1	Сдается студия с хорошим ремонтом . В квартире имеется все для комфортного проживания . Диван раскладывается , вся техника в рабочем состоянии . Рассматриваем все варианты , возможно иностранцев . Регистрацию тоже делаем 	2025-12-04 12:16:29.727	2025-12-04 12:16:29.727	1097
35	Квартира 1-комн., 52 м2, 16 / 20 этаж	Республика Татарстан (Татарстан), Казань, проспект Победы, 46	52	40000	1	55.747211	49.206289	16	20	Казань	не указан	1	Сдам светлую 2-комнатную евро-квартиру возле метро!\nЖК ФЛАГМАН ЕВРО2ШКА\nОтличное предложение для тех, кто ценит комфорт и удобство! Просторная квартира расположена рядом с проспектом Победы, что обеспечивает легкий доступ к основным транспортным артериям.\n\nПреимущества квартиры:\n- Большие светлые комнаты с современным ремонтом\n- Полностью оборудованная кухня с новой техникой\n- Уютная ванная комната с качественной сантехникой\n- Балкон для отдыха и наслаждения видом\n\nИнфраструктура:\n- В шаговой доступности магазины, кафе и парк\n- Удобный общественный транспорт рядом\n\nЭта квартира идеально подходит для семей или работающих профессионалов. Не упустите возможность, звоните для просмотров!	2025-11-30 09:54:13.972	2025-11-30 09:54:13.972	636
36	Квартира 1-комн., 37 м2, 6 / 19 этаж	Республика Татарстан (Татарстан), Казань, ЖК Легенда	37	36000	1	55.766764	49.17235	6	19	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом\n- Вся необходимая мебель и техника\n- Возможна частичная или полная укомплектованность (по договоренности)\n\nУсловия:\n- Для порядочных, платежеспособных жильцов\n- Без животных (или рассмотрим вариант)\n- Долгосрочная аренда, с заключением договора\n- Предоплата + залог	2025-11-30 09:59:29.403	2025-11-30 09:59:29.403	659
37	Квартира Студия 23 м2, 1 / 9 этаж	г Казань, ул Космонавтов, д 55	23	30000	0	55.798576	49.195518	1	9	Казань	не указан	1	КАЗАНЬ СТУДИЯ — ул. Космонавтов 55 (рядом Советская площадь)\n\nСдается светлая и тёплая студия с качественным евро ремонтом. Готова к въезду, аккуратно оформлена, функциональная кухня и удобная жилая зона. Отличная транспортная развязка и вся инфраструктура в шаговой доступности: магазины, аптеки, остановки общественного транспорта. Идеально для одного человека или пары, кто ценит комфорт и расположение.\n\nСДАЕТСЯ С 1 СЕНТЯБРЯ ПО 1 МАЯ!\nГотов показать в удобное время, пишите или звоните для организации просмотра.	2025-11-30 10:01:49.724	2025-11-30 10:01:49.724	692
38	Квартира Студия 24 м2, 1 / 9 этаж	г Казань, ул Космонавтов, д 55	24	30000	0	55.798576	49.195518	1	9	Казань	не указан	1	Уютная студия — ул. Космонавтов 55 (рядом Советская площадь)\n\nСдается светлая и тёплая студия с качественным евро ремонтом. Готова, аккуратно оформлена, функциональная кухня и удобная жилая зона. Отличная транспортная развязка и вся инфраструктура в шаговой доступности: магазины, аптеки, остановки общественного транспорта. Идеально для одного человека или пары, кто ценит комфорт и расположение.\n\nГотов показать в удобное время, пишите или звоните для организации просмотра.	2025-11-30 10:04:14.918	2025-11-30 10:04:14.918	701
39	Квартира 1-комн., 44 м2, 3 / 24 этаж	Республика Татарстан (Татарстан), Казань, Краснококшайская улица, 60	44	38000	1	55.810536	49.074209	3	24	Казань	не указан	1	Сдаётся светлая, просторная 1‑комнатная квартира 44 м² на 3‑м этаже в новом жилом комплексе (постройка 2025). Выполнен новый дизайнерский ремонт, квартира никогда не сдавалась.\nОтличное расположение — развитая инфраструктура и удобная транспортная доступность.\n\n• Полностью укомплектована новой техникой\n• Посудомоечная машина\n• Кондиционер\n• Холодильник, плита, духовой шкаф, стиральная машина (всё новое)\n• Новый дизайнерский ремонт — никто не жил\n• Комфортная планировка, 44 м² — просторная кухня‑гостиная и комната\n• 3‑й этаж — удобный уровень, без верхнего шума\n• Новый ЖК 2025 года — современная инфраструктура и благоустройство	2025-11-30 10:06:01.946	2025-11-30 10:06:01.946	753
40	Квартира 1-комн., 40 м2, 11 / 21 этаж	Ресг Казань, ул Алексея Козина, д 9	40	40000	1	55.814396	49.138816	11	21	Казань	не указан	1	Сдаю квартиру — Козина 9, ЖК «Свобода»\n\nОписание:\n* Просторная квартира с дизайнерским ремонтом, выполненным в современном стиле. В отделке используются качественные материалы и продуманная цветовая гамма.\n* Светлые комнаты, большие окна, много естественного света.\n* Эргономичная планировка: отдельная спальня, гостиная с зоной для отдыха и рабочим местом, кухонная зона открытой планировки.\n* Полы — ламинат/керамогранит, встроенные шкафы, дизайнерские светильники.\n* Современная кухонная техника и встроенная мебель: холодильник, варочная панель, духовой шкаф, вытяжка.\n* В санузле стильная плитка, душевая кабина/ванна, стиральная машина.\n* Качественные инженерные системы: кондиционер, тёплые полы (если есть), быстрый интернет по запросу.\n\nПреимущества локации:\n* ЖК «Свобода» — комфортный район с развитой инфраструктурой.\n* Рядом магазины, кафе, аптеки, детские и спортивные площадки.\n* Удобная транспортная доступность, близость к основным городским магистралям.\n\nУсловия аренды:\n* Длительная аренда предпочтительна.\n* Коммунальные платежи: отдельно/включены (уточнить).\n* Залог: стандартный депозит (обсуждается).\n* Можно с мебелью/частично меблированная (уточнить).\n\nКонтакты:\n* Для просмотра и уточнения условий пишите или звоните ваш телефон/телеграм.\n* Готов(а) оперативно показать объект в удобное для вас время.	2025-11-30 10:35:02.339	2025-11-30 10:35:02.339	757
41	Квартира 1-комн., 33 м2, 1 / 10 этаж	Республика Татарстан (Татарстан), Казань, улица Четаева, 51	33	38000	1	55.824991	49.111705	1	10	Казань	не указан	1	Просторная однокомнатная квартира ждет новых жильцов!\nУдобная транспортная доступность.\nУютный район с развитой инфраструктурой.\nОбщая площадь: просторная комната + удобная кухня.\nСанузел оборудован всей необходимой сантехникой.\nКвартира готова к проживанию сразу после заключения договора аренды.\n\nПреимущества проживания:\n- Рядом остановки общественного транспорта\n- Инфраструктура района включает магазины, аптеки, кафе и рестораны\n- Отличное расположение для комфортной жизни и быстрого перемещения по городу\n\nЗвоните прямо сейчас и приезжайте посмотреть квартиру вашей мечты!\nНе упустите шанс стать частью уютного района Казани!	2025-11-30 10:39:22.217	2025-11-30 10:39:22.217	763
42	Квартира 2-комн., 60 м2, 4 / 19 этаж	г Казань, ул Бондаренко, д 28	60	40000	2	55.81864	49.105525	4	9	Казань	не указан	1	Просторная 2‑комнатная квартира на Бондаренко, 28, сдаётся на длительный срок. Светлые, изолированные комнаты, полностью меблирована и оснащена бытовой техникой. Удобная транспортная доступность, развитая инфраструктура	2025-11-30 10:42:06.505	2025-11-30 10:42:06.505	769
43	Квартира Студия 23 м2, 2 / 9 этаж	г Казань, ул Космонавтов, д 55	23	30000	0	55.798576	49.195518	2	9	Казань	не указан	1	Уютная студия — ул. Космонавтов 55 (рядом Советская площадь)\n\nСдается светлая и тёплая студия с качественным евро ремонтом. Готова к въезду, аккуратно оформлена, функциональная кухня и удобная жилая зона. Отличная транспортная развязка и вся инфраструктура в шаговой доступности: магазины, аптеки, остановки общественного транспорта. Идеально для одного человека или пары, кто ценит комфорт и расположение.\n\nГотов показать в удобное время, пишите или звоните для организации просмотра.	2025-11-30 10:45:04.788	2025-11-30 10:45:04.788	777
44	Квартира 3-комн., 100 м2, 18 / 21 этаж	Республика Татарстан (Татарстан), Казань, Кировский район, Шоссейная улица, 57	100	80000	3	55.807754	49.089607	18	21	Казань	не указан	1	Сдаётся элегантная бизнес‑класс квартира — EURO‑3\n\n* Класс и концепция\nДизайнерский ремонт в современном стиле, продуманная планировка EURO‑3: просторная гостиная с кухней‑студией и две отдельные спальни. Идеально для семьи или деловых гостей.\n\n* Интерьер и оснащение\nСтильная мебель и качественная бытовая техника, встроенная кухня, посудомоечная машина, стиральная машина, кондиционеры, современная система освещения, теплые полы в ванной/кухне. Отделка из дорогих материалов, аккуратный кухонный гарнитур, встроенные шкафы.\n\n* Комфорт и инфраструктура\nТихий, безопасный район с развитой инфраструктурой: рядом магазины, кафе, фитнес, аптеки и школы. Удобная транспортная доступность — до метро/остановок 5–10 минут (уточнить район при звонке).\n\n* Безопасность и дополнительные удобства\nДом с консьержем/видеонаблюдением (если есть), парковочное место во дворе/подземном паркинге (уточните). Высокоскоростной интернет готов к подключению.\n\n* Условия аренды\nразумные коммунальные платежи, залог по договорённости. Рассматриваем аккуратных квартирантов, возможны дети, по согласованию — животные.\n\n* Показ и контакты\nКвартира готова к просмотру по предварительной записи. Для быстрого согласования просмотров и уточнения деталей оставьте номер телефона или напишите удобное время.	2025-11-30 10:47:38.509	2025-11-30 10:47:38.509	778
45	Квартира Студия 17 м2, 4 / 5 этаж	г Казань, ул Нурсултана Назарбаева, д 31	17	32000	0	55.774112	49.141125	4	5	Казань	не указан	1	Уютная студия в центре Казани на Назарбаева 31 — долгосрочная аренда, всё включено\n\nСдаётся в долгосрочную аренду светлая и уютная студия в самом центре Казани на ул. Назарбаева, дом 31. Площадь 17 м² — комфортная для одного-двух человек, открытая планировка, современный ремонт и полностью укомплектованная мебелью и техникой — заезжай и живи.\n\nАдрес:\nНазарбаева 31, центральный район Казани — пешая доступность до Казанского Кремля, магазинов, кафе и остановок транспорта.\n\nСтоимость и условия:\n- Арендная плата 35 000 ₽ в месяц — ВСЁ ВКЛЮЧЕНО (коммунальные услуги, интернет, электричество по среднему потреблению)\n- Залог 10 000 ₽ (возвращается при выезде при отсутствии повреждений)\n- Минимальный срок аренды — от 1 месяца (предпочтение долгосрочным арендаторам)\n- Заезд после согласования; предпочтительно длительная аренда\n\nОснащение и мебель:\n- Полностью оборудованная кухня (плита, холодильник, микроволновка, необходимая посуда)\n- Спальное место (кровать 160×200 или 140×200 по договорённости), шкаф для одежды\n- Зона отдыха с диваном и столом для работы\n- Стиральная машина, утюг, фен\n- Быстрый Wi‑Fi, Smart‑TV\n- Кондиционер, отопление центральное\n\nПреимущества локации:\n- Центр города: рядом деловые и культурные объекты, рестораны, супермаркеты\n- Удобная транспортная доступность: метро, автобусные и трамвайные остановки в шаговой доступности\n- Безопасный район и развитая инфраструктура\n\nПравила проживания:\n- Курение в квартире запрещено\n- Домашние животные обсуждаются отдельно\n- Поддержание чистоты и бережное отношение к имуществу обязательны\n- Внесение депозита и первый платёж при подписании договора\n\nКонтакты:\nДля просмотра, записи на просмотр или дополнительных вопросов — пишите в мессенджер или звоните (укажите, пожалуйста, удобный канал связи и время). Возможен видеопросмотр.	2025-11-30 10:51:35.697	2025-11-30 10:51:35.697	781
46	Квартира 1-комн., 40 м2, 7 / 9 этаж	Республика Татарстан (Татарстан), Казань, улица Галимджана Баруди, 18	40	35000	1	55.822645	49.06864	7	9	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом\n- Вся необходимая мебель и техника\n- Возможна частичная или полная укомплектованность (по договоренности)\n\nУсловия:\n- Для порядочных, платежеспособных жильцов\n- Без животных (или рассмотрим вариант)\n- Долгосрочная аренда, с заключением договора	2025-11-30 10:54:05.249	2025-11-30 10:54:05.249	782
50	Квартира 1-комн., 40 м2, 3 / 12 этаж	г Казань, ул Адоратского, д 1	40	36000	1	55.821153	49.146739	3	12	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом;\n- Вся необходимая мебель и техника;\n- Возможна частичная или полная укомплектованность (по договоренности).\n\nУсловия:\n- Для порядочных, платежеспособных жильцов;\n- Без животных (или рассмотрим вариант);\n- Долгосрочная аренда, с заключением договора;	2025-12-02 11:00:29.398	2025-12-02 11:00:29.398	787
51	Квартира 2-комн., 43 м2, 6 / 24 этаж	г Казань, пр-кт Альберта Камалеева, д 34	43	39000	2	55.783737	49.195536	6	24	Казань	не указан	1	Сдается 2-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом;\n- Вся необходимая мебель и техника;\n- Возможна частичная или полная укомплектованность (по договоренности).\n\nУсловия:\n- Для порядочных, платежеспособных жильцов;\n- Без животных (или рассмотрим вариант);\n- Долгосрочная аренда, с заключением договора;	2025-12-02 11:02:27.295	2025-12-02 11:02:27.295	788
52	Квартира 1-комн., 37 м2, 9 / 19 этаж	Республика Татарстан (Татарстан), Казань, улица Новаторов, 8Б	37	40000	1	55.806039	49.177174	9	19	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом;\n- Вся необходимая мебель и техника;\n- Возможна частичная или полная укомплектованность (по договоренности).\n\nУсловия:\n- Для порядочных, платежеспособных жильцов;\n- Без животных (или рассмотрим вариант);\n- Долгосрочная аренда, с заключением договора;	2025-12-02 11:05:22.184	2025-12-02 11:05:22.184	789
53	Квартира 1-комн., 37 м2, 8 / 19 этаж	Республика Татарстан (Татарстан), Казань, улица Бари Галеева, 8Ак3	37	38000	1	55.804319	49.175108	8	19	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом;\n- Вся необходимая мебель и техника;\n- Возможна частичная или полная укомплектованность (по договоренности).\n\nУсловия:\n- Для порядочных, платежеспособных жильцов;\n- Без животных (или рассмотрим вариант);\n- Долгосрочная аренда, с заключением договора;	2025-12-02 11:07:48.552	2025-12-02 11:07:48.552	790
54	Квартира 2-комн., 45 м2, 3 / 9 этаж	Республика Татарстан (Татарстан), Казань, улица Гарифьянова, 38В	45	40000	2	55.748878	49.202624	3	9	Казань	не указан	1	Сдается 2-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом;\n- Вся необходимая мебель и техника;\n- Возможна частичная или полная укомплектованность (по договоренности).\n\nУсловия:\n- Для порядочных, платежеспособных жильцов;\n- Без животных (или рассмотрим вариант);\n- Долгосрочная аренда, с заключением договора;	2025-12-02 11:10:26.743	2025-12-02 11:10:26.743	791
55	Квартира 1-комн., 39 м2, 7 / 18 этаж	Республика Татарстан (Татарстан), Казань, улица Восход, 16	39	37000	1	55.832303	49.073904	7	18	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом;\n- Вся необходимая мебель и техника;\n- Возможна частичная или полная укомплектованность (по договоренности).\n\nУсловия:\n- Для порядочных, платежеспособных жильцов;\n- Без животных (или рассмотрим вариант);\n- Долгосрочная аренда, с заключением договора;	2025-12-02 11:12:52.085	2025-12-02 11:12:52.085	792
56	Квартира Студия 27 м2, 10 / 24 этаж	Республика Татарстан (Татарстан), Казань, улица Рихарда Зорге, 66В	27	35000	0	55.747378	49.209478	10	24	Казань	не указан	1	Студия оснащена:\n1. Мебель:\n- диван раскладной;\n- стулья;\n- 2 вместительных шкафа;\n- комод;\n- стол;\n- гардеробная.\n2. Новая бытовая техника:\n- стиральная машинка;\n- микроволновая печь;\n- варочная панель;\n- двухкамерный холодильник;\n- кондиционер;\n- чайник;\n- телевизор;\n- духовой шкаф;\n- вытяжка.\n3. Дополнительно:\n- фильтры для очистки воды;\n- wi-fi.	2025-12-02 11:15:19.685	2025-12-02 11:15:19.685	793
57	Квартира 1-комн., 41 м2, 8 / 19 этаж	Республика Татарстан (Татарстан), Казань, улица Николая Ершова, 62Вк1	41	40000	1	55.796309	49.178782	8	19	Казань	не указан	1	Сдается Евро 2 комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом;\n- Вся необходимая мебель и техника;\n- Возможна частичная или полная укомплектованность (по договоренности).\n\nУсловия:\n- Для порядочных, платежеспособных жильцов;\n- Без животных (или рассмотрим вариант);\n- Долгосрочная аренда, с заключением договора;	2025-12-02 11:17:40.998	2025-12-02 11:17:40.998	794
58	Квартира 1-комн., 40 м2, 3 / 19 этаж	г Казань, ул Роторная, д 27б	40	36000	1	55.765539	49.143829	3	19	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом;\n- Вся необходимая мебель и техника;\n- Возможна частичная или полная укомплектованность (по договоренности).\n\nУсловия:\n- Для порядочных, платежеспособных жильцов;\n- Без животных (или рассмотрим вариант);\n- Долгосрочная аренда, с заключением договора;	2025-12-02 11:19:56.132	2025-12-02 11:19:56.132	796
59	Квартира 1-комн., 39 м2, 13 / 16 этаж	г Казань, ул Чистопольская, д 23	39	39000	1	55.819914	49.117733	13	16	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом;\n- Вся необходимая мебель и техника;\n- Возможна частичная или полная укомплектованность (по договоренности).\n\nУсловия:\n- Для порядочных, платежеспособных жильцов;\n- Без животных (или рассмотрим вариант);\n- Долгосрочная аренда, с заключением договора;	2025-12-02 11:22:28.889	2025-12-02 11:22:28.889	798
60	Квартира 1-комн., 43 м2, 4 / 19 этаж	г Казань, ул Николая Ершова, д 65Б к 1	43	38000	1	55.802922	49.181217	4	19	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом;\n- Вся необходимая мебель и техника;\n- Возможна частичная или полная укомплектованность (по договоренности).\n\nУсловия:\n- Для порядочных, платежеспособных жильцов;\n- Без животных (или рассмотрим вариант);\n- Долгосрочная аренда, с заключением договора;	2025-12-02 11:24:36.341	2025-12-02 11:24:36.341	799
61	Квартира 1-комн., 38 м2, 6 / 19 этаж	г Казань, ул Разведчика Ахмерова, д 7	38	39000	1	55.796977	49.182178	6	19	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом;\n- Вся необходимая мебель и техника;\n- Возможна частичная или полная укомплектованность (по договоренности).\n\nУсловия:\n- Для порядочных, платежеспособных жильцов;\n- Без животных (или рассмотрим вариант);\n- Долгосрочная аренда, с заключением договора;	2025-12-02 11:39:09.084	2025-12-02 11:39:09.084	804
62	Квартира 1-комн., 43 м2, 10 / 26 этаж	г Казань, ул Аделя Кутуя, д 110Д к 2	43	40000	1	55.780775	49.194125	10	26	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом;\n- Вся необходимая мебель и техника;\n- Возможна частичная или полная укомплектованность (по договоренности).\n\nУсловия:\n- Для порядочных, платежеспособных жильцов;\n- Без животных (или рассмотрим вариант);\n- Долгосрочная аренда, с заключением договора;	2025-12-02 11:41:42.831	2025-12-02 11:41:42.831	805
63	Квартира 1-комн., 50 м2, 2 / 3 этаж	г Казань, ул Лобачевского, д 12/32	50	40000	1	55.796294	49.12244	2	3	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом;\n- Вся необходимая мебель и техника;\n- Возможна частичная или полная укомплектованность (по договоренности).\n\nУсловия:\n- Для порядочных, платежеспособных жильцов;\n- Без животных (или рассмотрим вариант);\n- Долгосрочная аренда, с заключением договора;	2025-12-02 11:48:29.583	2025-12-02 11:48:29.583	806
64	Квартира 1-комн., 40 м2, 6 / 18 этаж	г Казань, пр-кт Победы, д 139А к 1	40	33000	1	55.777089	49.213978	6	18	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом;\n- Вся необходимая мебель и техника;\n- Возможна частичная или полная укомплектованность (по договоренности).\n\nУсловия:\n- Для порядочных, платежеспособных жильцов;\n- Без животных (или рассмотрим вариант);\n- Долгосрочная аренда, с заключением договора;	2025-12-02 11:51:59.888	2025-12-02 11:51:59.888	817
65	Квартира 1-комн., 54 м2, 4 / 5 этаж	г Казань, ул Столярова, д 5	54	40000	1	55.798986	49.065568	4	5	Казань	не указан	1	Сдаю квартиру бизнес‑класса — идеальный вариант для тех, кто ценит комфорт и стиль\n\nОб объекте\n* Тип — однокомнатная квартира\n* Площадь — 54 м²\n* Ремонт — хороший\n\nЧто внутри\n* Просторная гостиная-спальня с зоной отдыха и рабочим местом\n* Эргономичная кухня с современной бытовой техникой и встроенной мебелью\n* Стильный санузел с качественной плиткой и сантехникой\n* Достаточно мест для хранения: встроенные шкафы/гардеробная\n* Продуманное освещение, дизайнерские элементы интерьера и текстиль\n\nКомфорт и безопасность\n* Высококачественные отделочные материалы\n* Кондиционирование и эффективная вентиляция\n* Современные коммуникации и надежная электрика\n* Подъезд с контролем доступа/видеонаблюдение (если есть — укажите)\n\nРасположение и инфраструктура\n* Удобная транспортная доступность, рядом остановки/станции\n* Магазины, кафе, фитнес и парки в шаговой доступности\n* Близость деловых и развлекательных зон\n\nУсловия аренды\n* Долгосрочная аренда предпочтительна\n* Коммунальные платежи оплачиваются отдельно/включены (укажите)\n* Залог/предоплата по договоренности\n\nПросмотр и контакты\nКвартира готова к показу по предварительной записи. Пишите или звоните для уточнения деталей и записи на просмотр.	2025-12-02 11:57:20.427	2025-12-02 11:57:20.427	819
66	Квартира 1-комн., 33 м2, 1 / 5 этаж	г Казань, ул Нурсултана Назарбаева, д 66а	33	35000	1	55.771069	49.134927	1	5	Казань	не указан	1	Уютная 1‑комнатная квартира в сердце Казани — готова к заселению\n\nОписание\nПредлагаю в аренду светлую и ухоженную 1‑комнатную квартиру на ул. Назарбаева, площадь 32 м², 4 этаж из 6. Чистый подъезд, исправный лифт. Идеально для одного человека или пары, кто ценит комфорт и спокойствие.\n\nКомфорт и мебель\n- Полностью меблирована: удобная кровать, раскладной диван, обеденный стол, вместительный шкаф\n- Современная кухня с холодильником, электрической плитой и микроволновкой\n- Стиральная машина в ванной\n- Кабельный интернет — подходит для удалённой работы\n\nПланировка и освещение\n- Окна во двор — тишина и приватность\n- Хорошая естественная освещённость, солнечная сторона\n\nУсловия аренды\n- Цена 33 000 ₽/мес\n- Коммунальные услуги оплачиваются отдельно по счетчикам\n- Залог 33 000 ₽\n- Срок аренды с 28 сентября по 30 апреля\n- Рассматриваю порядочных арендаторов; животных можно по согласованию\n\nПросмотры и контакты\n- Просмотры по договорённости в вечернее время и в выходные\n\nДополнительно\nКвартира находится в шаговой доступности от магазинов, остановок общественного транспорта и парков — удобный вариант для комфортной городской жизни.	2025-12-02 12:00:55.944	2025-12-02 12:00:55.944	833
67	Квартира Студия 22 м2, 5 / 9 этаж	г Казань, ул Кул Гали, д 10	22	23000	0	55.750231	49.22854	5	9	Казань	не указан	1	Сдам гостинку в Казани, Кул Гали 10\n\n✨ Комфорт и удобство в одном месте!\n🚇 До метро 12 минут пешком\n\nЦена\n\n💰 23 000 рублей — всё включено!\n💵 Залог 10 000 рублей (возможна разбивка)\n\nОписание\n\n- Свой санузел и ванна\n- Новый диван и шкаф для хранения\n- Свежий ремонт, уютная атмосфера\n- Комиссия агентства 100%\n\nТребования\n\n👩 Строго одна девушка!\n\nДополнительно\n\n📅 Свободна с 1 октября\n🕒 Долгосрочная аренда\n\nИдеальный вариант для тех, кто ищет комфортное и спокойное жильё рядом с метро. Звоните, с удовольствием отвечу на все вопросы!	2025-12-02 12:04:45.712	2025-12-02 12:04:45.712	836
68	Квартира 3-комн., 100 м2, 4 / 20 этаж	Республика Татарстан (Татарстан), Казань, улица Сибгата Хакима, 62	100	170000	3	55.815079	49.143865	4	20	Казань	не указан	1	Сдаётся квартира в ЖК UNO – идеальный вариант для жизни и комфорта!\n\n🔹 Евро 3-комнатная квартира с дизайнерским ремонтом\n🔹 Совмещённая ванна и душевая зона для вашего удобства\n🔹 Оснащена посудомоечной машиной – экономия времени на уборке\n🔹 Установлен бойлер для горячей воды в любое время\n🔹 Просторная гардеробная для хранения всех вещей\n🔹 Квартира после капитального ремонта – полностью готова к заселению\n\nЖК UNO – современный жилой комплекс с развитой инфраструктурой. Отличный выбор для тех, кто ценит комфорт и стиль.\n\nЗвоните, чтобы узнать подробности и записаться на просмотр!	2025-12-02 12:10:52.028	2025-12-02 12:10:52.028	837
69	Квартира 3-комн., 80 м2, 4 / 20 этаж	Республика Татарстан (Татарстан), Казань, улица Алексея Козина, 2	80	120000	3	55.813364	49.136364	4	20	Казань	не указан	1	Сдаётся стильная квартира в ЖК Савин Хаус\n\n✨ Евро 3-комнатная квартира с дизайнерским ремонтом\n🏢 Дом бизнес-класса с высокой ценой на комфорт и безопасность\n🌟 Современные планировки и качественные материалы отделки\n🚪 Просторные и светлые комнаты, продуманный функционал для жизни и работы\n🌳 Уютный жилой комплекс с развитой инфраструктурой и благоустроенной территорией\n\nИдеальный вариант для тех, кто ценит комфорт, стиль и престиж.\n\n📞 Свяжитесь для подробной информации и организации просмотра!	2025-12-02 12:26:30.851	2025-12-02 12:26:30.851	838
70	Квартира 2-комн., 42 м2, 9 / 20 этаж	г Казань, ул Николая Ершова, д 66Б	42	55000	2	55.799052	49.18136	9	20	Казань	не указан	1	Сдаётся 2-комнатная квартира Евро формата, Казань\n\n🏢 ЖК «АРТ СИТИ»\n📍 Ул. Ершова, 66б\n\n💰 Стоимость аренды: 55 000₽ + коммунальные услуги\n🔒 Залог 40 000₽ (возможно разделение)\n\n✨ Особенности:\n\n- Современный дизайнерский ремонт\n- Свежий, стильный интерьер\n- Квартира в идеальном состоянии\n\n👥 Предпочтения по арендаторам:\n\n- Строго граждане РФ 🇷🇺\n- Молодая пара либо две девушки\n- Можно одиночек\n\n📅 Срок аренды: до мая\n\n📸 Фото прилагаются ниже для наглядности\n\nЕсли заинтересовались – пишите для уточнения деталей и просмотра!	2025-12-02 12:33:23.65	2025-12-02 12:33:23.65	839
71	Квартира 2-комн., 42 м2, 9 / 20 этаж	г Казань, ул Минская, д 12	54	35000	2	55.772208	49.22094	10	17	Казань	не указан	1	Сдается уютная квартира со всей необходимой мебелью и техникой . Высокие потолки , хорошая шумоизоляция . Отличное местоположение 	2025-12-02 12:38:44.652	2025-12-02 12:38:44.652	842
72	Квартира 2-комн., 42 м2, 4 / 17 этаж	г Казань, ул Сибгата Хакима, д 7	42	40000	2	55.815969	49.108049	4	17	Казань	не указан	1	Даётся евро 2-комнатная квартира в Казани, ул. Сибгата Хакима\n\n- Адрес: ул. Сибгата Хакима, Казань\n- Тип квартиры: евро 2-комнатная (совмещённая кухня и гостиная + отдельная спальня)\n- Площадь: уточните при необходимости у собственника\n- Состояние: хорошее, готова к заселению\n- Стоимость аренды: 40 000 руб + коммунальные услуги\n- Особенности: долгосрочная аренда; квартира уютная, светлая, есть вся необходимая мебель и техника для комфортного проживания\n- Инфраструктура: удобное расположение, рядом общественный транспорт, магазины, учебные заведения и парки\n\nЕсли вас интересует долгосрочная аренда евро 2-комнатной квартиры на ул. Сибгата Хакима в Казани за 40 000 руб + коммунальные платежи, рекомендуем оперативно связаться с владельцем для уточнения деталей и просмотра.	2025-12-02 12:41:40.268	2025-12-02 12:41:40.268	854
73	Квартира 1-комн., 40 м2, 8 / 19 этаж	Респ Татарстан, Лаишевский р-н, село Усады, ул Теплых встреч, д 5	40	28000	1	55.689192	49.207995	8	19	Казань	не указан	1	Сдается уютная квартира с новым ремонтом Предлагается в аренду чистая и светлая квартира с качественным свежим ремонтом. В квартире есть все для комфортного проживания: - 2 удобных дивана - Большой шкаф для хранения вещей - Просторный балкон для отдыха - Телевизор для вашего досуга - Бойлер для горячей воды В доме открытая парковка с большим количеством свободных мест, даже в часы пик вы легко найдете место для авто. Квартира полностью готова к проживанию, ключи на руках! Приходите на просмотр уже сегодня и убедитесь в её удобстве и уюте сами. Звоните прямо сейчас, не упустите свой комфорт!	2025-12-02 12:47:29.022	2025-12-02 12:47:29.022	862
74	Квартира 1-комн., 40 м2, 5 / 10 этаж	Республика Татарстан (Татарстан), село Высокая Гора, Рождественская улица, 6Б	40	19000	1	55.898992	49.32634	5	10	Казань	не указан	1	Сдаётся 1-комнатная квартира с хорошим ремонтом - В квартире есть телевизор и удобный диван - Имеется вместительный шкаф для хранения вещей - Приятный вид из окна добавляет уюта и света Квартира готова к проживанию, отличное решение для одного или пары. Звоните для подробностей и организации просмотра!	2025-12-02 12:50:07.822	2025-12-02 12:50:07.822	863
75	Квартира 2-комн., 50 м2, 3 / 16 этаж	г Казань, пр-кт Альберта Камалеева, д 18	50	39000	2	55.788237	49.184514	3	16	Казань	не указан	1	Сдается 2-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом;\n- Вся необходимая мебель и техника;\n- Возможна частичная или полная укомплектованность (по договоренности).\n\nУсловия:\n- Для порядочных, платежеспособных жильцов;\n- Без животных (или рассмотрим вариант);\n- Долгосрочная аренда, с заключением договора.	2025-12-02 12:53:37.824	2025-12-02 12:53:37.824	864
76	Квартира 1-комн., 35 м2, 5 / 10 этаж	Республика Татарстан (Татарстан), Казань, улица Рашида Нежметдинова, 2А	35	30000	1	55.799138	49.24506	5	10	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом;\n- Вся необходимая мебель и техника;\n- Возможна частичная или полная укомплектованность (по договоренности).\n\nУсловия:\n- Для порядочных, платежеспособных жильцов;\n- Без животных (или рассмотрим вариант);\n- Долгосрочная аренда, с заключением договора.	2025-12-02 12:56:24.888	2025-12-02 12:56:24.888	867
77	Квартира 1-комн., 40 м2, 5 / 19 этаж	г Казань, ул Новаторов, д 8А	40	40000	1	55.805224	49.178414	5	19	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом;\n- Вся необходимая мебель и техника;\n- Возможна частичная или полная укомплектованность (по договоренности).\n\nУсловия:\n- Для порядочных, платежеспособных жильцов;\n- Без животных (или рассмотрим вариант);\n- Долгосрочная аренда, с заключением договора.	2025-12-02 12:59:02.986	2025-12-02 12:59:02.986	880
78	Квартира Студия 35 м2, 9 / 21 этаж	Короленко д 28Б	35	36000	0	55.833572	49.101851	9	21	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом;\n- Вся необходимая мебель и техника;\n- Возможна частичная или полная укомплектованность (по договоренности).\n\nУсловия:\n- Для порядочных, платежеспособных жильцов;\n- Без животных (или рассмотрим вариант);\n- Долгосрочная аренда, с заключением договора.	2025-12-02 13:03:13.983	2025-12-02 13:03:13.983	881
79	Квартира Студия 35 м2, 5 / 10 этаж	г Казань, ул Спартаковская, д 165	35	35000	0	55.768922	49.153117	5	10	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом;\n- Вся необходимая мебель и техника;\n- Возможна частичная или полная укомплектованность (по договоренности).\n\nУсловия:\n- Для порядочных, платежеспособных жильцов;\n- Без животных (или рассмотрим вариант);\n- Долгосрочная аренда, с заключением договора.	2025-12-02 13:05:59.302	2025-12-02 13:05:59.302	882
80	Квартира 1-комн., 40 м2, 4 / 10 этаж	г Казань, ул Рашида Нежметдинова, д 11 к 5	40	38000	1	55.802796	49.236247	4	10	Казань	не указан	1	Сдам новую уютную однокомнатную квартиру в современном жилом комплексе "Светлая Долина", расположенном по адресу: Республика Татарстан, Казань, улица Рашида Нежметдинова, 11. Квартира сдается впервые и находится в новом доме 2023 года.\n\nВ квартире выполнен отличный ремонт, и она полностью укомплектована всей необходимой мебелью и техникой для комфортного проживания. В спальной зоне расположены диван и шкаф. Кухня оборудована холодильником, плитой и микроволновой печью.\n\nСанузел совмещенный, в нем есть ванна, зеркало и стиральная машина. Для вашего удобства установлены кондиционер и телевизор. Также имеется угловой диван и посуда.\n\nРазвитая инфраструктура: в шаговой доступности магазины, аптеки, кафе, салоны красоты и парк с зоной для барбекю. Вблизи находятся школа и детские садики.\n\nСтоимость аренды составляет 38,000 рублей в месяц плюс коммунальные платежи.\n\nЕсли вас заинтересовало предложение или есть вопросы, пожалуйста, свяжитесь со мной для получения дополнительной информации или записи на просмотр!	2025-12-02 13:08:23.352	2025-12-02 13:08:23.352	890
81	Квартира 1-комн., 37 м2, 5 / 23 этаж	г Казань, ул Аметьевская магистраль, д 16 к 3	37	34000	1	55.76763	49.173347	5	23	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом;\n- Вся необходимая мебель и техника;\n- Возможна частичная или полная укомплектованность (по договоренности).\n\nУсловия:\n- Для порядочных, платежеспособных жильцов;\n- Без животных (или рассмотрим вариант);\n- Долгосрочная аренда, с заключением договора;	2025-12-02 13:18:20.226	2025-12-02 13:18:20.226	894
82	Квартира Студия 33 м2, 4 / 23	Республика Татарстан (Татарстан), Казань, улица Аметьевская Магистраль, 16к4	33	30000	0	55.767433	49.172629	4	23	Казань	не указан	1	Представляем вашему вниманию уютную студию премиум-класса в одном из престижнейших жилых комплексов города Казани — ЖК Голливуд. Идеально расположившись всего в пяти минутах пешком от станции метро Аметьево, эта квартира позволит вам наслаждаться всеми преимуществами городского комфорта и удобства перемещения по городу.\n\nИнтерьер квартиры выполнен в стильном современном дизайне, украшен качественными материалами и продуман до мельчайших деталей. Здесь вас ожидает просторная студия с грамотно зонированным пространством, позволяющим комфортно разместиться как одному человеку, так и паре друзей или молодоженов.\n\nГлавным украшением интерьера является красивая двуспальная кровать, гарантирующая крепкий сон и комфорт отдыха. Для гостей предусмотрен удобный раскладной диван, превращающийся в дополнительное спальное место. Современный ремонт создает атмосферу домашнего тепла и уюта, идеально подходящую для длительного проживания или временного пребывания.\n\nЭта студия станет идеальным выбором для тех, кто ценит красоту пространства, удобство расположения и высокий уровень сервиса. Она прекрасно подойдет как молодым специалистам, желающим жить в центре городской активности, так и гостям столицы Татарстана, стремящимся ощутить дух современного мегаполиса, оставаясь рядом с историческими достопримечательностями и природными красотами Казани.\n\nПриглашаем оценить преимущества аренды этой прекрасной студии в ЖК Голливуд, подарив себе ощущение гармонии и счастья каждый день своего пребывания здесь.	2025-12-02 13:26:01.707	2025-12-02 13:26:01.707	895
125	Квартира 2-комн., 49 м2, 4 / 5 этаж	г Казань, ул Хади Такташа, д 93	49	37000	2	55.773373	49.130669	4	5	Казань	не указан	1	Сдается чистая ухоженная двухкомнатная квартира со всей мебелью и техникой . Сдается впервые после собственника, ищем порядочных адекватных жильцов , рассмотрим многих . Удобное местоположение , развитая инфраструктура.	2025-12-04 12:18:47.982	2025-12-04 12:18:47.982	1098
83	Квартира Студия 35 м2, 13 / 24 этаж	г Казань, ул Аделя Кутуя, д 110Д к 3	33	30000	0	55.780299	49.195419	13	24	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом;\n- Вся необходимая мебель и техника;\n- Возможна частичная или полная укомплектованность (по договоренности).\n\nУсловия:\n- Для порядочных, платежеспособных жильцов;\n- Без животных (или рассмотрим вариант);\n- Долгосрочная аренда, с заключением договора;	2025-12-02 13:28:32.243	2025-12-02 13:28:32.243	898
84	Квартира 1-комн., 38 м2, 12 / 22 этаж	г Казань, ул Новаторов, д 8Б	38	37000	1	55.806039	49.177174	12	22	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом;\n- Вся необходимая мебель и техника;\n- Возможна частичная или полная укомплектованность (по договоренности).\n\nУсловия:\n- Для порядочных, платежеспособных жильцов;\n- Без животных (или рассмотрим вариант);\n- Долгосрочная аренда, с заключением договора;	2025-12-02 13:30:44.73	2025-12-02 13:30:44.73	900
85	Квартира 1-комн., 35 м2, 4 / 5 этаж	г Казань, ул Энергетиков, д 8	35	30000	1	55.826893	49.076302	4	5	Казань	не указан	1	Сдаётся квартира на Энергетиков 8\n\n- Удобное расположение — всего 6 минут пешком до метро\n- Отличная локация с развитой инфраструктурой\n- В квартире есть кондиционер для комфортного климата\n- Предоставляется кровать с матрасом — можно сразу заезжать и жить\n\nИдеальный вариант для тех, кто ценит удобство и комфорт! Звоните для подробностей и просмотра.	2025-12-02 13:33:14.009	2025-12-02 13:33:14.009	907
86	Квартира 2-комн., 90 м2, 10 / 21 этаж	Республика Татарстан (Татарстан), Казань, улица Алексея Козина, 9	90	70000	2	55.814396	49.138816	10	21	Казань	не указан	1	Сдаётся большая 2-комнатная квартира в ЖК Свобода\n\n- Просторные комнаты, идеальные для комфортного проживания\n- Качественный и свежий ремонт — заходи и живи\n- Современный жилой комплекс с развитой инфраструктурой\n- Удобное расположение, все необходимое рядом\n\nОтличный вариант для тех, кто ценит простор и комфорт! Для подробностей и организации просмотра — пишите или звоните.	2025-12-02 13:35:41.473	2025-12-02 13:35:41.473	908
87	Квартира 2-комн., 60 м2, 6 / 22 этаж	г Казань, ул Чистопольская, д 88	60	50000	2	55.81871	49.146461	6	22	Казань	не указан	1	Сдается дизайнерская евро двушка в Жилом комплексе бизнес класса. удобное местоположениеб сдается впервые 	2025-12-02 13:38:14.85	2025-12-02 13:38:14.85	920
88	Квартира 2-комн., 47 м2, 4 / 12 этаж	г Казань, ул Мусина, д 1	47	45000	2	55.817355	49.120239	4	12	Казань	не указан	1	Сдается 1-комнатная квартира в ЖК «Берег», Казань\n\n🏢 Жилой комплекс Берег – современный, комфортный район с развитой инфраструктурой и удобной транспортной доступностью.\n\n📍 Расположение\nКвартира находится в ЖК «Берег» в Казани – престижном районе с видом на реку, рядом парки, магазины, школы и детские сады.\n\n🏠 Характеристики квартиры\n- Тип: 1-комнатная\n- Площадь: оптимальная для комфортного проживания\n- Этаж: комфортный (уточняется)\n- Состояние: современный ремонт, готова к заселению\n- Оборудование: встроенная кухня, санузел в современном стиле, тепло и светло\n\n💰 Стоимость и коммунальные услуги\nЦена аренды: 45 000 руб. в месяц\nКоммунальные услуги оплачиваются отдельно (примерно КУ по счетчикам, точная сумма зависит от сезона и потребления).\n\n🚗 Преимущества\n- Удобная транспортная доступность\n- Безопасный двор, охрана\n- Рядом остановки общественного транспорта\n- Развитая инфраструктура: спортплощадки, магазины, кафе	2025-12-02 13:40:58.073	2025-12-02 13:40:58.073	939
89	Квартира 2-комн., 72 м2, 11 / 22 этаж	г Казань, ул Чистопольская, д 86/10	72	55000	2	55.818736	49.143218	11	12	Казань	не указан	1	Продаётся просторная 3-комнатная квартира в престижном Ново-Савиновском районе города Казани, ул. Чистопольская, д. 86/10, ЖК СТОЛИЧНЫЙ.\n\n💰 Цена: 55 000 000 ₽ + коммунальные услуги\n📍 Город: Казань\n\nОписание:\n- Общая площадь: большая, с удобной планировкой комнат\n- Расположение: район с развитой инфраструктурой — рядом школы, магазины, медицинские учреждения и транспортные узлы\n- Удобства: квартира оборудована необходимыми коммуникациями, чистая, светлая и уютная, с современным ремонтом\n- Транспортная доступность: удобный выезд на основные дороги города, близость общественного транспорта\n- Коммунальные платежи оплачиваются отдельно\n\nИдеальный вариант для семьи или тех, кто ищет качественное жильё в Казани со всеми условиями для комфортной жизни.	2025-12-02 13:43:38.891	2025-12-02 13:43:38.891	941
90	Квартира 1-комн., 41 м2, 4 / 9 этаж	г Казань, ул Академика Сахарова, д 13	41	34000	1	55.779352	49.229357	4	9	Казань	не указан	1	Сдам 1-комнатную квартиру по улице Сахарова 13, Казань.\n\n- Расположение: Улица Сахарова, дом 13, удобный район с развитой инфраструктурой — рядом магазины, остановки общественного транспорта, школы и детские сады.\n- Квартира: 1-комнатная, после свежего евро ремонта, впервые сдается. Никто не жил, ремонт выполнен современными материалами высокого качества.\n- Состояние: Полностью готова к проживанию — чистая, светлая, просторная комната, новая сантехника и электропроводка.\n- Кухня: Современная, оборудована новой мебелью и техникой.\n- Дополнительно: Интернет и кабельное ТВ подключены.\n- Условия аренды: Долгосрочная аренда, без домашних животных (по договоренности), залог и аренда обсуждаются индивидуально.\n\nИдеальный вариант для одного человека или пары, кто ценит комфорт и свежий ремонт!\n\nДля дополнительной информации и просмотра звоните в любое удобное время.	2025-12-02 13:46:22.686	2025-12-02 13:46:22.686	946
91	Квартира 1-комн., 38 м2, 2 / 5 этаж	г Казань, ул Красной Позиции, д 33	38	33000	1	55.781737	49.16688	2	5	Казань	не указан	1	Сдам 1-комнатную квартиру в центре Казани, ул. Красной Позиции\n\n- Адрес: Центр города, рядом с КОРСТОН и ул. Карла Маркса — отличная транспортная доступность и полностью развитая инфраструктура.\n\n- Стоимость: 33 000 руб./месяц + коммунальные услуги.\n\n- Квартира: Уютная, светлая 1-комнатная квартира в хорошем состоянии, полностью готова к заселению.\n\n- Локация: В шаговой доступности — кафе, магазины, офисные центры, парк, остановки общественного транспорта.\n\n- Условия аренды: Долгосрочная аренда. Возможны различные варианты по залогу. Рассмотрим аккуратных и платежеспособных арендаторов.\n\nОтличный вариант для тех, кто ищет комфортное жильё в самом сердце Казани!\n\nДля записи на просмотр и получения подробной информации — звоните в любое время.	2025-12-03 11:29:40.55	2025-12-03 11:29:40.55	947
92	Квартира 3-комн., 73 м2, 12 / 13 этаж	г Казань, пр-кт Ямашева, д 69	72	45000	3	55.824769	49.13525	12	13	Казань	не указан	1	Сдам 3-комнатную квартиру 73 кв.м в Ново-Савиновском районе, ул. Ямашева\n\nПросторная и светлая квартира с современным ремонтом, идеально подходит для комфортного проживания.\n\nО квартире:\n- Общая площадь – 73 кв.м\n- 3 комнаты: большая двуспальная кровать, две односпальных кровати\n- Большой раскладной угловой диван\n- Кондиционеры в каждой комнате\n- Полностью оборудована для жизни: стиральная машина, посудомоечная машина, микроволновка, варочная панель, духовой шкаф, телевизор\n\nУсловия аренды:\n- Сдаётся на долгий срок\n- Рассмотрим россиян, можно с детьми\n- Возможен вариант с животными (по договоренности)\n\nРасположение:\n- Удобный район с развитой инфраструктурой\n- Отличная транспортная доступность\n\nДля записи на просмотр и получения подробной информации — пишите или звоните!	2025-12-03 11:32:50.128	2025-12-03 11:32:50.128	958
93	Квартира 1-комн., 45 м2, 15 / 23 этаж	г Казань, ул Новаторов, д 8Б	45	40000	1	55.806039	49.177174	15	23	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: Шаговая доступность до метро, рядом вся необходимая инфраструктура — аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом\n- Оснащена всей необходимой мебелью и техникой\n- Возможна частичная или полная укомплектованность (по договоренности)\n\nУсловия:\n- Для порядочных и платежеспособных жильцов\n- Без животных (или рассмотрим вариант)\n- Долгосрочная аренда, с заключением официального договора\n\nОтличный вариант для комфортного проживания! Пишите или звоните для уточнения деталей и записи на просмотр.	2025-12-03 11:38:48.697	2025-12-03 11:38:48.697	963
94	Квартира 1-комн., 38 м2, 10 / 25 этаж	г Казань, ул Новаторов, д 8Б	38	38000	1	55.806039	49.177174	10	25	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: Шаговая доступность до метро, рядом аптеки, магазины, кафе, школа и детский сад — всё необходимое в пешей доступности.\n\nКвартира:\n- Чистая и светлая, с современным ремонтом\n- Оснащена всей необходимой мебелью и бытовой техникой\n- Возможна частичная или полная укомплектованность по договоренности\n\nУсловия:\n- Предпочтение порядочным и платежеспособным жильцам\n- Без животных (или рассмотрим вариант индивидуально)\n- Долгосрочная аренда, с заключением официального договора\n\nОтличный вариант для комфортного проживания! Обращайтесь для уточнения деталей и записи на просмотр.	2025-12-03 11:41:28.991	2025-12-03 11:41:28.991	964
95	Квартира 1-комн., 45 м2, 15 / 19 этаж	г Казань, ул Роторная, д 27Д	45	39000	1	55.76521	49.145536	15	19	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: Квартира находится в шаговой доступности от метро. Рядом расположены аптеки, магазины, кафе, школа и детский сад — вся необходимая инфраструктура рядом.\n\nКвартира:\n- Чистая, светлая, после современного ремонта\n- Оснащена всей необходимой мебелью и техникой\n- Возможна частичная или полная укомплектованность по договоренности\n\nУсловия:\n- Для порядочных и платежеспособных жильцов\n- Без животных (или рассмотрим вариант индивидуально)\n- Долгосрочная аренда с заключением договора\n\nОтличный вариант для комфортного проживания в развитом районе!	2025-12-03 11:43:49.029	2025-12-03 11:43:49.029	966
96	Квартира 1-комн., 50 м2, 6 / 10 этаж	Республика Татарстан (Татарстан), Казань, улица Рауиса Гареева, 78А	50	35000	1	55.719252	49.165029	6	10	Казань	не указан	1	Сдаётся уютная однокомнатная квартира по адресу: Рауиса Гареева, 78а - Новый дом с огороженной территорией, обеспечивающей безопасность и комфорт. - Квартира полностью с новым дизайнерским ремонтом — современный стиль и качественные материалы. - Есть выделенное парковочное место, что очень удобно для владельцев автомобиля. - Большие окна, много света, продуманная планировка. - Отличное расположение — рядом вся необходимая инфраструктура, транспортная доступность. Идеальный вариант для тех, кто ценит комфорт и безопасность в новом жилом комплексе!	2025-12-03 11:45:43.143	2025-12-03 11:45:43.143	967
97	Квартира 1-комн., 40 м2, 15 / 19 этаж	г Казань, пр-кт Альберта Камалеева, д 32	40	36000	1	55.784501	49.193946	15	19	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: Квартира расположена в шаговой доступности от метро. Рядом находятся аптеки, магазины, кафе, школа и детский сад — все необходимое для комфортной жизни.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом\n- Оснащена всей необходимой мебелью и техникой\n- Возможна частичная или полная укомплектованность по договоренности\n\nУсловия:\n- Для порядочных и платежеспособных жильцов\n- Без животных (или рассмотрим вариант)\n- Долгосрочная аренда с заключением договора\n\nОтличное жилье для тех, кто ищет комфорт и удобство в развитом районе!	2025-12-03 11:48:43.469	2025-12-03 11:48:43.469	968
98	Квартира 1-комн., 38 м2, 5 / 10 этаж	г Казань, ул Магистральная, д 14а	38	30000	1	55.788925	49.23269	5	10	Казань	не указан	1	Сдам 1-комнатную квартиру на улице Магистральной в Казани!\n\nУютная и светлая квартира ждет своего нового жильца. Отличное расположение — рядом парки, а также вся необходимая инфраструктура: школы, детские сады, магазины и остановки общественного транспорта в шаговой доступности.\n\nКвартира оснащена всем необходимым:\n- Просторная комната\n- Современная мебель\n- Полностью оборудованная кухня (холодильник, плита, микроволновка)\n- Современный санузел\n- Чистый подъезд и лифт\n\nЦена аренды — разумная и конкурентная. Залог делимый.\n\nЗвоните прямо сейчас, чтобы узнать подробности и договориться о просмотре!	2025-12-03 11:51:27.284	2025-12-03 11:51:27.284	980
99	Квартира 2-комн., 70 м2, 12 / 19 этаж	г Казань, ул Роторная, д 27в	70	29000	2	55.766309	49.144736	12	19	Казань	не указан	1	Уютная и светлая квартира с удобной планировкой в современном районе города — ЖК "Возрождение".\n\n- Общая площадь — комфортная для проживания\n- Полностью меблирована и оснащена всей необходимой техникой\n- Отличное состояние и свежий ремонт\n- Высокие потолки, большие окна с прекрасным видом\n- Развитая инфраструктура: рядом школы, магазины, парки, удобная транспортная доступность\n\nЦена и условия аренды — по договорённости, возможен торг при долгосрочной аренде. Залог делимый на 2–3 месяца.\n\nКомфорт, уют и удобство в одном месте — ваш новый дом на Роторной!	2025-12-03 11:53:56.72	2025-12-03 11:53:56.72	981
100	Дом 4-комн., 80 м2, 1 этаж	г Казань, ул Школьная (Константиновка), д 68	80	50000	4	55.802735	49.25389	1	1	Казань	не указан	1	Ваш личный уголок спокойствия. Сдается уютный дом.\n\nУстали от городского шума? Это ваш шанс.\n\nСдается дом, в котором пахнет свежим кофе и уютом. Утро здесь начинается с пения птиц за окном, а вечер — с разговоров на просторной террасе или у камина.\n\nЭто не просто аренда — это ваше личное пространство для жизни, творчества и отдыха. Идеально подойдет для молодой семьи, фрилансера или пары, ценящих тишину и уединение.\n\nЧто вас ждет:\n\n· Простор: Собственный участок, где можно разбить сад или установить гамак.\n· Тишина: Никаких танцующих соседей сверху и лифтеров в подъезде.\n· Комфорт: Всё необходимое для заезда уже есть. Просто берите чемоданы.\n\nГотовы сменить ритм? Ваш новый дом ждет.\n\n---\n\nВариант 3: Для продажи (солидно и с перспективой)\n\nЗаголовок: Не просто недвижимость. Это — наследие. Продается дом вашей мечты.\n\nЭтот дом построен не просто по проекту, а с мыслью о будущем. Он стал надежным пристанищем для нашей семьи, и теперь мы ищем новых хозяев, которые оценят его характер и потенциал.\n\nПрочные стены, качественные материалы, продуманная планировка — здесь есть всё для комфортной жизни на годы вперед. Этот дом — не расход, а выгодная инвестиция в благополучие вашей семьи и ваше спокойствие.\n\nКлючевые преимущества:\n\n· Фундаментальность: Капитальное строительство, современные коммуникации.\n· Локация: Престижный и тихий район с развитой инфраструктурой.\n· Свобода творчества: Готовый дом, в который можно привнести свои идеи.\n\nПриходите на просмотр. Почувствуйте себя как дома. С первого шага.	2025-12-03 11:56:52.706	2025-12-03 11:56:52.706	989
101	Дом 2-комн., 80 м2, 2 этаж	г Казань, ул Мамадышский Тракт, д 43б	80	49000	2	55.802573	49.264796	2	2	Казань	не указан	1	Ваш личный уголок спокойствия. Сдается уютный дом.\n\nУстали от городского шума? Это ваш шанс.\n\nСдается дом, в котором пахнет свежим кофе и уютом. Утро здесь начинается с пения птиц за окном, а вечер — с разговоров на просторной террасе или у камина.\n\nЭто не просто аренда — это ваше личное пространство для жизни, творчества и отдыха. Идеально подойдет для молодой семьи, фрилансера или пары, ценящих тишину и уединение.\n\nЧто вас ждет:\n\n· Простор: Собственный участок, где можно разбить сад или установить гамак.\n· Тишина: Никаких танцующих соседей сверху и лифтеров в подъезде.\n· Комфорт: Всё необходимое для заезда уже есть. Просто берите чемоданы.\n\nГотовы сменить ритм? Ваш новый дом ждет.\n\n---\n\nВариант 3: Для продажи (солидно и с перспективой)\n\nЗаголовок: Не просто недвижимость. Это — наследие. Продается дом вашей мечты.\n\nЭтот дом построен не просто по проекту, а с мыслью о будущем. Он стал надежным пристанищем для нашей семьи, и теперь мы ищем новых хозяев, которые оценят его характер и потенциал.\n\nПрочные стены, качественные материалы, продуманная планировка — здесь есть всё для комфортной жизни на годы вперед. Этот дом — не расход, а выгодная инвестиция в благополучие вашей семьи и ваше спокойствие.\n\nКлючевые преимущества:\n\n· Фундаментальность: Капитальное строительство, современные коммуникации.\n· Локация: Престижный и тихий район с развитой инфраструктурой.\n· Свобода творчества: Готовый дом, в который можно привнести свои идеи.\n\nПриходите на просмотр. Почувствуйте себя как дома. С первого шага.	2025-12-03 12:09:38.317	2025-12-03 12:09:38.317	991
104	Квартира 2-комн., 54 м2, 4 / 9 этаж	г Казань, ул Ноксинский Спуск, д 1	54	40000	2	55.767398	49.233696	4	9	Казань	не указан	1	Сдам двухкомнатную квартиру в Казани, Ноксинский спуск 1/n/Тип квартиры: две комнаты/n/Ремонт: Новый, качественные материалы, первая сдача/n/Комплектация: полностью укомплектована мебелью и техникой/n/Оснащение: кондиционер/n/Условия аренды: рассмотрим молодых пар, можно с детьми школьного возраста, без животных/n/Преимущества: квартира свежая, уютная, сделана с любовью и вниманием к деталям/n/📍 Отличный вариант для тех, кто ценит комфорт и современный ремонт./n/💬 Звоните для просмотра и уточнения деталей! 	2025-12-03 12:16:56.669	2025-12-03 12:16:56.669	1006
103	Квартира Студия 20 м2, 3 / 5 этаж	г Казань, ул Рихарда Зорге, д 32 к 1	20	20000	0	55.754314	49.195347	3	5	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом;/n/- Вся необходимая мебель и техника;/n/- Возможна частичная или полная укомплектованность (по договоренности)./n/Условия:/n/- Для порядочных, платежеспособных жильцов;/n/- Без животных (или рассмотрим вариант);/n/- Долгосрочная аренда, с заключением договора. 	2025-12-03 12:14:27.248	2025-12-03 12:14:27.248	1004
102	Квартира 2-комн., 45 м2, 19 / 25 этаж	г Казань, ул Аметьевская магистраль, д 18 к 2	45	38000	2	55.766921	49.171461	19	25	Казань	не указан	1	Сдается 2-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом;/n/- Вся необходимая мебель и техника;/n/- Возможна частичная или полная укомплектованность (по договоренности)./n/Условия:/n/- Для порядочных, платежеспособных жильцов;/n/- Без животных (или рассмотрим вариант);/n/- Долгосрочная аренда, с заключением договора. 	2025-12-03 12:12:24.739	2025-12-03 12:12:24.739	992
108	Квартира 1-комн., 34 м2, 5 / 5 этаж	г Казань, ул Хади Такташа, д 91	34	35000	1	55.77276	49.130749	5	5	Казань	не указан	1	Предлагается в аренду уютная однокомнатная квартира, расположенная в живописном районе Казани по адресу: улица Хади Такташа, дом 91. Отличное решение для студентов, молодых специалистов или пар, ищущих комфортное жилье в центре города./n/Расположение и инфраструктура/n/· Расположение: Улица Хади Такташа — один из популярных районов Казани с развитой инфраструктурой./n/· Транспорт: Хорошая транспортная доступность — рядом остановки общественного транспорта, удобные маршруты до центра города и других районов./n/· Близость к объектам инфраструктуры: В шаговой доступности магазины, аптеки, кафе, банки, школы и детские сады. 	2025-12-03 12:27:33.068	2025-12-03 12:27:33.068	1027
107	Квартира 1-комн., 36 м2, 12 / 25 этаж	Республика Татарстан (Татарстан), Казань, улица Братьев Батталовых, 27	36	30000	1	55.716646	49.1834	12	25	Казань	не указан	1	Предлагается уютная и светлая квартира для сдачи в аренду в живописном районе Казани, по адресу ул. Братьев Батталовых, 27. Отличный вариант для тех, кто ищет комфортное жилье в спокойной и развитой части города./n/Расположение/n/Квартира расположена в удобном районе с развитой инфраструктурой:/n/· В шаговой доступности магазины, аптеки, кафе и рестораны/n/· Хорошая транспортная доступность: рядом остановки общественного транспорта, удобный выезд на основные магистрали города/n/· Близость к паркам и зонам отдыха для прогулок и активного отдыха/n/Квартира новая! 	2025-12-03 12:25:14.635	2025-12-03 12:25:14.635	1026
105	Квартира 1-комн., 70 м2, 3 / 5 этаж	Республика Татарстан (Татарстан), Казань, улица Генерала Ерина, 13к1	70	80000	1	55.68027	49.190972	3	5	Казань	не указан	1	🌿 Приглашаем вас окунуться в атмосферу комфорта и стиля 🌿/n/Представляем вашему вниманию уникальную евродвушку в престижном жилом комплексе «Времена Года», расположенном в живописном уголке города Казань. Эта квартира станет идеальным выбором для тех, кто ценит изысканный дизайн интерьера, просторные помещения и комфортную жизнь в окружении природы./n/✨ Особенности жилья: ✨/n/Дизайнерский ремонт: Каждая деталь продуманна до мелочей, здесь царит гармония цвета и формы./n/Современная техника: Квартира оборудована необходимым набором бытовой техники, включая кондиционер и телевизор, обеспечивающие максимальный уют./n/Просторная планировка: Просторные комнаты приглашают насладиться каждым моментом отдыха и общения с близкими людьми./n/Приятный бонус: Новые жильцы смогут дополнить интерьер стильным диваном в гостиной, подчеркнув индивидуальность пространства./n/🌞 Преимущества проживания в ЖК «Времена Года»:/n/Удобное расположение рядом с парком позволяет наслаждаться свежим воздухом и красотой окружающей природы каждый день./n/Инфраструктура района включает всё необходимое для комфортной жизни: магазины, аптеки, кафе и рестораны находятся всего в нескольких минутах ходьбы./n/Безопасность обеспечена благодаря круглосуточному видеонаблюдению и профессиональной службе охраны комплекса./n/💫 Ваша новая жизнь начинается именно здесь! Создавайте воспоминания, наслаждайтесь теплом домашнего очага и открывайте новые горизонты комфорта вместе с нами!/n/Звоните прямо сейчас, чтобы стать частью удивительного мира комфорта и красоты в одном из лучших мест Казани. 	2025-12-03 12:19:39.634	2025-12-03 12:19:39.634	1023
117	Квартира Студия 15 м2, 3 / 5 этаж	г Казань, ул Аделя Кутуя, д 8	15	20000	0	55.786202	49.166332	3	5	Казань	не указан	1	Сдаю уютную квартиру - студию. Желательно для одного человека, так как площадь не большая. Для проживания есть все необходимое: вместительный шкаф купе, холодильник, стиральная машина, микроволновка, чайник, эл плита (2 конфорки), сан узел свой совмещённый ( туалет, раковина и ванная маленькая). Есть видео, отправлю по запросу. Пишите, звоните. Договоримся на просмотр.	2025-12-03 13:00:54.526	2025-12-03 13:00:54.526	1049
126	Квартира 1-комн., 35 м2, 1 / 9 этаж	г Казань, ул Адоратского, д 33	35	30000	1	55.840882	49.146811	1	9	Казань	не указан	1	Сдается уютная однокомнатная квартира , со всей мебелью и техникой . Удобная локация , автобусные остановки , магазины , в пешей доступности . Впервые после собственника , рассмотрим с животными , обращайтесь 	2025-12-04 12:20:58.044	2025-12-04 12:20:58.044	1103
115	Квартира 2-комн., 50 м2, 19 / 19 этаж	г Казань, ул Галеева, д 8а к 2	50	40000	2	55.803955	49.175881	19	19	Казань	не указан	1	Сдается 2-комнатная квартира на длительный срок/n/- Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/- Квартира: Чистая, светлая, с современным ремонтом. Вся необходимая мебель и техника. Возможна частичная или полная укомплектованность (по договоренности)./n/- Условия аренды: Для порядочных, платежеспособных жильцов. Без животных (или рассмотрим вариант). Долгосрочная аренда, с заключением договора. 	2025-12-03 12:56:17.607	2025-12-03 12:56:17.607	1047
112	Квартира 2-комн., 70 м2, 7 / 17 этаж	г Казань, ул Павлюхина, д 108Б	70	40000	2	55.769089	49.141466	7	17	Казань	не указан	1	Сдается 2-комнатная квартира на длительный срок/n/- Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/- Квартира: Чистая, светлая, с современным ремонтом. Вся необходимая мебель и техника. Возможна частичная или полная укомплектованность (по договоренности)./n/- Условия аренды: Для порядочных, платежеспособных жильцов. Без животных (или рассмотрим вариант). Долгосрочная аренда, с заключением договора. 	2025-12-03 12:47:11.128	2025-12-03 12:47:11.128	1039
122	Квартира Студия 40 м2, 7 / 10 этаж	г Казань, ул 2-я Ленинградская, д 4	40	40000	0	55.859549	49.086678	7	10	Казань	не указан	1	Сдаётся евро-двухкомнатная квартира в Авиастроительном районе по адресу 2-я Ленинградская./n/💰 Стоимость: 40 000 руб. + коммунальные услуги/n/Залог: 30 000 руб. (делимый)/n/🏠 О квартире:/n- Современный евро-ремонт/n/- Уютная, чистая, полностью готовая к проживанию/n/👥 Условия:/n/- Без детей/n/- Без животных/n/- Без вредных привычек/n/Отличный вариант для аккуратных и ответственных жильцов! Звоните, чтобы договориться о просмотре. 	2025-12-04 12:09:43.256	2025-12-04 12:09:43.256	1085
120	Квартира 1-комн., 42 м2, 13 / 19 этаж	Республика Татарстан (Татарстан), Казань, улица Павлюхина, 110Г	42	50000	1	55.767625	49.143712	13	19	Казань	не указан	1	Представляем вашему вниманию стильную и уютную однокомнатную квартиру в ЖК Возрождение, Казань, рядом с торговым центром Казан Молл/n/✨ Особенности интерьера:/n/- Просторная кухня с современной техникой и элегантным оформлением/n/- Гардеробная комната для комфортного хранения вещей/n/- Двуспальная кровать для полноценного отдыха/n/- Раскладной диван для гостей или зоны отдыха/n/- Кондиционер для комфортной температуры в любое время года/n/🌿 Комфорт проживания:/n/- Красота дизайна и функциональность пространства гармонично сочетаются/n/- Идеальный вариант для молодой пары, студентов или профессионалов, ценящих эстетику и качество жилья/n/Откройте для себя новую страницу комфорта и уюта в этой светлой и привлекательной квартире. 	2025-12-03 13:14:03.161	2025-12-03 13:14:03.161	1077
119	Квартира 1-комн., 32 м2, 10 / 10 этаж	г Казань, ул Рихарда Зорге, д 96А	32	35000	1	55.741632	49.218811	10	10	Казань	не указан	1	Сдается уютная однокомнатная квартира рядом с метро Дубравная/n/- Идеальный вариант для комфортной жизни в тихом и спокойном районе, в современном доме с благоустроенным двором./n/- Преимущества расположения:/n/  • Пешая доступность до станции метро Дубравная — быстрое и удобное транспортное сообщение./n/  • Рядом обширный парк и лесная зона — экологически чистое окружение для отдыха и активного образа жизни./n/  • Развитая инфраструктура: магазины, рынок одежды и торговые центры для всех нужд./n/  • Отличная транспортная развязка на автомобиле и общественном транспорте./n/Квартира подходит для тех, кто ценит комфорт, природу и удобство городской жизни. 	2025-12-03 13:10:03.224	2025-12-03 13:10:03.224	1067
144	Квартира 1-комн., 25 м2, 10 / 22 этаж	г Казань, ул Четаева, д 43А	25	31000	1	55.823909	49.113457	10	22	Казань	не указан	1	сдается новая студия в ж/к Sreda of life. Удобное расположение - рядом бульвар «Белые цветы», который плавно переходит к набережной Казанки. На первом этаже в доме- продуктовый магазин, кофейня, Wildberris. В шаговой доступности - автобусная остановка, метро, ТЦ Парк Хаус, многочисленные кафе и рестораны.	2025-12-04 13:28:17	2025-12-04 13:28:17	1161
151	Квартира 1-комн., 40 м2, 4 / 9 этаж	г Казань, пр-кт Ибрагимова, д 61	40	35000	1	55.825052	49.095778	4	9	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом;/n/- Вся необходимая мебель и техника;/n/- Возможна частичная или полная укомплектованность (по договоренности). 	2025-12-05 14:46:07.015	2025-12-05 14:46:07.015	1181
129	Квартира 2-комн., 58 м2, 23 / 26 этаж	г Казань, ул Аметьевская магистраль, д 18 к 2	58	41000	2	55.766921	49.171461	22	26	Казань	не указан	1	Сдается 2-комнатная квартира на длительный срок/n/📍 Расположение:/n/Шаговая доступность до метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/🏠 Квартира:/n/- Чистая, светлая, с современным ремонтом/n/- Вся необходимая мебель и техника/n/- Возможна частичная или полная укомплектованность (по договоренности)/n/📌 Условия:/n/- Для порядочных, платежеспособных жильцов/n/- Без животных (возможен разумный вариант)/n/- Долгосрочная аренда с заключением договора/n/Отличное жильё для комфортного проживания! 	2025-12-04 12:37:30.624	2025-12-04 12:37:30.624	1121
127	Квартира 3-комн., 85 м2, 10 / 22 этаж	г Казань, ул Павлюхина, д 110В	35	60000	1	55.767843	49.145581	10	22	Казань	не указан	1	Аренда квартиры в ЖК Золотая Подкова/n/Залог делим!/n/Если оплата за полгода — возможна скидка!/n/Предлагается светлая и уютная евро-трёхкомнатная квартира в ЖК «Золотая Подкова». Квартира просторная, с продуманной планировкой, включая гардеробную и бойлер для комфортного проживания./n/🏠 О квартире:/n/- Евро-планировка: кухня-гостиная и две отдельные спальни/n/- Светлые комнаты с отличным естественным освещением/n/- Удобная гардеробная для хранения/n/- Установлен бойлер — горячая вода всегда/n/- Большая площадь — идеально для семьи или тех, кто любит простор/n/n🌿 Инфраструктура района:/n/- Развитый жилой комплекс с удобствами/n/- Рядом магазины, аптеки, кафе/n/- Поблизости школа и детский сад/n/- Удобная транспортная доступность/n/Отличный вариант для долгосрочной и комфортной аренды!/n/Звоните для просмотра и по всем вопросам. 	2025-12-04 12:29:05.114	2025-12-04 12:29:05.114	1117
135	Квартира 3-комн., 60 м2, 1 / 9 этаж	г Казань, ул Фатыха Амирхана, д 93	60	39000	3	55.841129	49.130965	1	9	Казань	не указан	1	Сдается 3-комнатная квартира на длительный срок/n/🏠 О квартире:/n/- Чистая, светлая/n/- Вся необходимая мебель и техника/n/- Возможна частичная или полная укомплектованность (по договоренности)/n/🌿 Расположение:/n/- Рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад/n/Условия аренды:/n/- Для порядочных, платежеспособных жильцов/n/- С животными и детьми/n/- Долгосрочная аренда, с заключением договора 	2025-12-04 12:53:15.85	2025-12-04 12:53:15.85	1137
134	Квартира 2-комн., 68 м2, 7 / 18 этаж	г Казань, пр-кт Победы, д 78	68	43000	2	55.763807	49.220608	7	18	Казань	не указан	1	Сдам двухкомнатную квартиру на проспекте Победы, 78, Казань/n/🏠 О квартире:/n/- Уютная и светлая двухкомнатная квартира после капитального ремонта/n/- Современный евроремонт с использованием качественных материалов/n/- Квартира полностью укомплектована и соответствует фотографиям/n/- Удобная планировка и продуманный дизайн интерьера/n/- Чистый и ухоженный подъезд/n/🌿 Расположение и инфраструктура:/n/- Отлично развитая транспортная доступность/n/- Станция метро «Проспект Победы» — всего 15 минут пешком/n- В шаговой доступности крупные торговые центры, магазины, кафе и рестораны/n/- Рядом остановки общественного транспорта/n/Идеальный вариант как для комфортного проживания, так и для сдачи в аренду. Звоните прямо сейчас, чтобы записаться на просмотр! 	2025-12-04 12:50:15.908	2025-12-04 12:50:15.908	1136
133	Квартира 2-комн., 40 м2, 6 / 10 этаж	Республика Татарстан (Татарстан), Зеленодольский район, Осиновское сельское поселение, село Осиново, Спортивная улица, 5	40	35000	2	55.872804	48.875879	6	10	Казань	не указан	1	Сдаётся евро двушка на Спортивной 5 в посёлке Осиново/n/🏠 О квартире:/n/- Площадь: 40 м²/n/- Формат: евро двушка (кухня-гостиная + спальня)/n/- Современный ремонт, светлые и уютные комнаты/n/- Полностью меблирована и оснащена всей необходимой техникой/n/- Санузел совмещённый, новая сантехника/n/🌿 Инфраструктура и локация:/n/- Удобная транспортная доступность, рядом остановки общественного транспорта/n/- В шаговой доступности детский сад, школа, магазин, спорткомплекс/n/- Тихий зелёный район с развитой инфраструктурой/n/Не упустите шанс снять удобное жильё в отличном районе! Ждём ваших звонков! 	2025-12-04 12:47:02.609	2025-12-04 12:47:02.609	1130
132	Квартира Студия 35 м2, 13 / 19 этаж	г Казань, ул Петра Полушкина, д 4	35	34000	0	55.785007	49.21661	13	19	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/📍 Расположение:/n/Шаговая доступность до метро, рядом вся инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/🏠 Квартира:/n/- Чистая и светлая/n/- Современный ремонт/n/- Вся необходимая мебель и техника/n/- Возможна частичная или полная укомплектованность по договоренности/n/📌 Условия:/n/- Для порядочных и платежеспособных жильцов/n- Без животных (или рассмотрим)/n/- Долгосрочная аренда с заключением договора/n/Отличный вариант для комфортного проживания! 	2025-12-04 12:44:41.692	2025-12-04 12:44:41.692	1124
131	Квартира 1-комн., 40 м2, 5 / 24 этаж	г Казань, ул Чистопольская, д 61Д	40	35000	1	55.819975	49.134927	5	24	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/📍 Расположение:/n/Шаговая доступность до метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/🏠 Квартира:/n/- Чистая, светлая, с современным ремонтом/n/- Вся необходимая мебель и техника/n/- Возможна частичная или полная укомплектованность (по договоренности)/n/📌 Условия:/n/- Для порядочных, платежеспособных жильцов/n/- Без животных (или можем рассмотреть)/n/- Долгосрочная аренда с заключением договора/n/Отличное предложение для комфортного проживания! 	2025-12-04 12:42:32.187	2025-12-04 12:42:32.187	1123
142	Квартира 1-комн., 32 м2, 5 / 5 этаж	г Казань, ул Анаса Тазетдинова, д 4	32	42000	1	55.807643	49.230462	5	5	Казань	не указан	1	Сдаётся квартира в Казани, ул. Анаса Тазетдинова/n/Современный евро-ремонт/n/Полностью меблирована/n/Вся необходимая техника в наличии/n/Новый жилой комплекс с развитой инфраструктурой/n/Удобное расположение, всё рядом: магазины, транспорт, школы и детские сады/n/Цена аренды 42 000 руб. + коммунальные платежи/n/Рассматриваем платежеспособных, порядочных жильцов/n/Без животных/n/Идеальный вариант для комфортного проживания! Звоните для просмотра. 	2025-12-04 13:21:41.466	2025-12-04 13:21:41.466	1148
141	Квартира 1-комн., 40 м2, 4 / 9 этаж	г Казань, ул Чистопольская, д 74	40	33000	1	55.818948	49.138169	4	9	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира: Чистая, светлая, с современным ремонтом/n/Вся необходимая мебель и техника/n/Возможна частичная или полная укомплектованность (по договоренности)/n/Условия: Для порядочных, платежеспособных жильцов/n/Без животных (или рассмотрим вариант)/n/Долгосрочная аренда, с заключением договора 	2025-12-04 13:18:46.138	2025-12-04 13:18:46.138	1146
140	Квартира 1-комн., 42 м2, 4 / 8 этаж	г Казань, ул Гагарина, д 77В к 1	42	36000	1	55.837914	49.092454	4	8	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира: Чистая, светлая, с современным ремонтом/n/Вся необходимая мебель и техника/n/Возможна частичная или полная укомплектованность (по договоренности)/n/Условия: Для порядочных, платежеспособных жильцов/n/Без животных (или рассмотрим вариант)/n/Долгосрочная аренда, с заключением договора 	2025-12-04 13:12:13.248	2025-12-04 13:12:13.248	1145
139	Квартира 1-комн., 39 м2, 12 / 19 этаж	г Казань, ул Альфии Авзаловой, д 9	39	24000	1	55.857326	48.903035	12	19	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира: Чистая, светлая, с современным ремонтом/n/Вся необходимая мебель и техника/n/Возможна частичная или полная укомплектованность (по договоренности)/n/Условия: Для порядочных, платежеспособных жильцов/n/Без животных (или рассмотрим вариант)/n/Долгосрочная аренда, с заключением договора 	2025-12-04 13:09:49.387	2025-12-04 13:09:49.387	1144
138	Квартира 1-комн., 39 м2, 13 / 15 этаж	г Казань, ул Соловецких юнг, д 7	39	34000	1	55.823469	49.078809	13	15	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира: Чистая, светлая, с современным ремонтом/n/Вся необходимая мебель и техника/n/Возможна частичная или полная укомплектованность (по договоренности)/n/Условия: Для порядочных, платежеспособных жильцов/n/Без животных (или рассмотрим вариант)/n/Долгосрочная аренда, с заключением договора 	2025-12-04 13:06:35.882	2025-12-04 13:06:35.882	1143
137	Квартира 2-комн., 50 м2, 9 / 19 этаж	г Казань, ул Космонавтов, д 61в	50	37000	2	55.79557	49.207061	9	19	Казань	не указан	1	Сдается 2-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира: Чистая, светлая, с современным ремонтом/n/Вся необходимая мебель и техника/n/Возможна частичная или полная укомплектованность (по договоренности)/n/Условия: Для порядочных, платежеспособных жильцов/n/Без животных (или рассмотрим вариант)/n/Долгосрочная аренда, с заключением договора \n\n 	2025-12-04 12:59:51.476	2025-12-04 12:59:51.476	1142
149	Квартира 1-комн., 30 м2, 3 / 5 этаж	Республика Татарстан (Татарстан), Зеленодольский район, Осиновское сельское поселение, село Новая Тура, Дорожная улица, 5	30	25000	1	55.866561	48.834215	3	5	Казань	не указан	1	Сдаётся новая уютная 1-комнатная квартира с дизайнерским ремонтом/n/Предлагается современная квартира, полностью подготовленная для комфортного проживания. В интерьере использованы высококачественные материалы и стильные решения, создающие атмосферу уюта и гармонии./n/Основные преимущества:/n/- Полностью меблирована и оборудована всей необходимой бытовой техникой/n- Продуманная планировка и функциональная мебель/n/- Отличная шумоизоляция и эргономичное освещение/n/- Развитая инфраструктура района: рядом магазины, кафе, остановки общественного транспорта, парки и школы/n/Эта квартира станет идеальным выбором для тех, кто ценит комфорт и современный стиль жизни! 	2025-12-05 14:39:41.783	2025-12-05 14:39:41.783	1179
148	Квартира 2-комн., 53 м2, 25 / 26 этаж	г Казань, Щербаковский пер, д 7	53	75000	2	55.785655	49.130785	25	26	Казань	не указан	1	Предлагается уютная и современная квартира в центре Казани, расположенная по адресу Щербаковский переулок, дом 7. Идеальный вариант для тех, кто ценит комфорт, удобство и развитую инфраструктуру города./n/Расположение/n/Адрес: Казань, Щербаковский переулок, дом 7/n/Рядом находятся: магазины, аптеки, кафе и рестораны/n/Транспорт: развитая транспортная сеть, остановки общественного транспорта в шаговой доступности, удобный выезд на основные магистрали города/n/Очень хороший ремонт, сделан для себя. 	2025-12-05 14:35:43.805	2025-12-05 14:35:43.805	1178
147	Квартира 2-комн., 50 м2, 1 / 2 этаж	Респ Татарстан, Зеленодольский р-н, село Осиново, ул Гагарина, д 1	50	25500	2	55.875233	48.888959	1	2	Казань	не указан	1	Сдаётся 2-комнатная квартира в Осиново/n/Адрес: Гагарина, 1/n/- Комфортная квартира площадью 50 кв.м/- Уютный район, удобная транспортная доступность/n/- Залог всего 10 тысяч рублей, который возвращается при съезде/n- Можно проживать круглогодично/n/Идеальный вариант для тех, кто ищет доступное и спокойное жильё с гарантиями возврата залога. Звоните для подробностей и просмотра! 	2025-12-05 14:31:51.189	2025-12-05 14:31:51.189	1177
146	Квартира Студия 35 м2, 13 / 18 этаж	г Казань, ул Ярышлар, д 2	35	27500	0	55.68124	49.200746	13	18	Казань	не указан	1	Сдаётся уютная студия в ЖК «Станция Спортивная»/n/Предлагается комфортная и светлая студия в современном жилом комплексе с удобной локацией./n/* Отличный дом с продуманной инфраструктурой/n/* Просторное и функциональное пространство/n/* Всё необходимое для комфортного проживания: мебель, техника, бытовые приборы/n/* Развитая транспортная доступность и близость к ключевым объектам города/n/Идеально подойдёт для одного человека или пары, кто ценит качество и удобство./n/Звоните, чтобы узнать подробности и записаться на просмотр! \n\n 	2025-12-05 14:27:06.053	2025-12-05 14:27:06.053	1173
145	Квартира Студия 27 м2, 6 / 9 этаж	г Казань, ул Татарстан, д 51	27	23000	0	55.77634	49.10848	6	9	Казань	не указан	1	Предлагается в аренду светлая и уютная студия общей площадью 27 квадратных метров, расположенная в городе Казань, на улице Татарстан, дом 51./n/Основные характеристики:/n/- Площадь: 27 м²/n/- Тип жилья: студия/n/- Адрес: г. Казань, ул. Татарстан, дом 51/n- Компактное, функциональное пространство, подходит для одного человека или пары/n/Преимущества:/n/- Удобное расположение с хорошей транспортной доступностью/n- Развитая инфраструктура: рядом магазины, остановки общественного транспорта, кафе и парки/n/- Возможность быстрого заселения/n/Такая студия отлично подойдет для тех, кто ищет комфортное и экономичное жилье в центре города или рядом с основными городскими маршрутами. 	2025-12-04 13:31:13.718	2025-12-04 13:31:13.718	1171
153	Квартира 1-комн., 40 м2, 9 / 10 этаж	г Казань, ул Молодежная, д 3А	40	30000	1	55.862484	49.102938	9	10	Казань	не указан	1	Предлагается уютная однокомнатная квартира в тихом районе города. Общая площадь составляет 40 кв. м. Квартира полностью меблирована и оснащена современной техникой: холодильником, телевизором, стиральной машиной и необходимой кухонной техникой. В комнате есть удобная кровать, шкаф и рабочий стол. Санузел совмещенный, чистый и ухоженный. Расположение квартиры обеспечивает хорошую транспортную доступность и основным инфраструктурным объектам: магазинам, аптекам, паркам и школам. Идеально подходит для одного человека или пары, ценящих комфорт и уют.	2025-12-05 14:52:27.697	2025-12-05 14:52:27.697	1183
156	Квартира 1-комн., 35 м2, 10 / 15 этаж	г Казань, ул Генерала Махмута Гареева, д 15А	35	20000	1	55.861919	48.90087	10	15	Казань	не указан	1	Сдаю 1-комнатную квартиру на генерала Махмуда Гареева 15а Сдаются в аренду светлая и новая 1-комнатная квартира в удобном и спокойном районе. - Адрес: Генерала Махмуда Гареева, дом 15а - Состояние: квартира новая, свежий ремонт - Мебель и техника: частично меблирована — два шкафа, тумбочка, стол, стул, матрас, стиральная машина - Условия: уютное жильё, подходит для одного или двух человек - Инфраструктура: рядом магазины, остановки, удобная транспортная доступность Идеальное предложение для тех, кто ищет комфортное и готовое к проживанию жильё. Возможен показ по договорённости.	2025-12-05 15:00:39.152	2025-12-05 15:00:39.152	1187
155	Квартира 1-комн., 35 м2, 17 / 18 этаж	г Казань, ул Тыныч, д 1	35	32000	1	55.780846	49.238251	17	18	Казань	не указан	1	Светлая 1-комнатная квартира сдается на долгий срок./n/Основные характеристики:/n/- Расположение рядом с ТЦ Мега, что обеспечивает удобный доступ к магазинам и развлечениям./n/- Новый кирпичный дом — тепло, надёжно и без сильного шума./n/- Отличная транспортная развязка, что удобно для поездок по городу./n/- В квартире есть вся необходимая мебель и техника для комфортного проживания./n/- Заселиться можно уже сегодня, что идеально при срочном поиске жилья. 	2025-12-05 14:58:45.867	2025-12-05 14:58:45.867	1185
154	Квартира 1-комн., 42 м2, 8 / 9 этаж	Респ Татарстан, Зеленодольский р-н, село Осиново, ул Гагарина, д 11Г	42	20000	1	55.871668	48.895957	8	9	Казань	не указан	1	Сдаётся уютная 1-комнатная квартира в Осиново!/n/Адрес: Гагарина, 11г/n/Этаж: 8 из 9/n/В квартире светло и просторно, идеальное состояние для комфортного проживания. Отличный район с развитой инфраструктурой: рядом магазины, остановки общественного транспорта, школа и парк./n/Преимущества:/n/- Тёплый этаж и приятный вид из окна/n/- Чистый подъезд и спокойные соседи/n/- Удобная транспортная доступность/n/Идеально подойдёт для одного или двух человек, можно с детьми./n/Звоните, чтобы узнать подробности и договориться о просмотре! 	2025-12-05 14:55:24.293	2025-12-05 14:55:24.293	1184
152	Квартира 2-комн., 68 м2, 10 / 19 этаж	г Казань, ул Николая Ершова, д 65Б к 1	68	35000	2	55.802922	49.181217	10	19	Казань	не указан	1	Сдам двухкомнатную квартиру в ЖК Нобелевский, ул. Ершова 65 Б/n/Предлагается просторная, светлая 2-комнатная квартира с евро ремонтом, полностью укомплектованная всем необходимым для комфортного проживания./n/Описание квартиры:/n/- Просторная спальня с удобной кроватью/n/- Большой раскладной диван в гостиной/n- Кондиционер для комфортной температуры/n/- Современная ванна для расслабляющих процедур/n/- Два балкона с отличным видом и дополнительным пространством/n- Посудомоечная машина для вашего удобства/n/- Чистый, светлый европейский ремонт/n/Дом находится в ЖК Нобелевский по адресу Ершова 65 Б – отличный район с развитой инфраструктурой. Идеальный вариант для комфортного проживания семьи или пары./n/Звоните и приезжайте смотреть! 	2025-12-05 14:49:16.534	2025-12-05 14:49:16.534	1182
162	Квартира 1-комн., 40 м2, 6 / 20 этаж	г Казань, ул Маршала Чуйкова, д 62	40	37000	1	55.835144	49.152057	6	20	Казань	не указан	1	Просторная и светлая квартира с современным ремонтом. Интерьер выполнен в спокойных пастельных тонах, создающих ощущение уюта и гармонии. Большие панорамные окна открывают вид на тихий зеленый двор и наполняют пространство естественным светом. В квартире предусмотрено несколько изолированных комнат, каждая из которых обладает индивидуальным характером и тщательно продумана до мелочей. Кухня-гостиная станет идеальным местом для отдыха и приема гостей, а удобная планировка и высокие потолки добавляют ощущение простора и свободы.	2025-12-06 09:48:04.069	2025-12-06 09:48:04.069	1210
165	Квартира 4-комн., 110 м2, 4 / 16 этаж	г Казань, ул Чистопольская, д 36	110	50000	4	55.818114	49.121622	4	16	Казань	не указан	1	СДАЕТСЯ 4-к квартира на 1-ой береговой линии/n/- Развитая инфраструктура/n/- Квартира с ремонтом/n/- Полностью меблированная/n/Идеально подойдет семейной паре/n/Звоните! Оперативный показ в удобное для вас время! 	2025-12-06 09:59:34.72	2025-12-06 09:59:34.72	1219
164	Квартира 3-комн., 77 м2, 7 / 19 этаж	Республика Татарстан (Татарстан), Казань, Уютная улица, 4	77	45000	3	55.73333	49.191125	7	19	Казань	не указан	1	Сдаётся трёхкомнатная квартира с евро ремонтом/n/Улица Уютная, дом 4/n/Современный красивый интерьер, выполнен качественный евро ремонт/n/Описание квартиры:/n/- 3 комнаты/n/- Посудомоечная машина/n/- 2 балкона/n/- Гардеробная/n/- Кондиционер/n/- Две двухспальные кровати/n/- Удобный и стильный диван/n/Квартира полностью готова к проживанию, идеальна для комфортной жизни. Отличное расположение в спокойном районе./n/Цена и условия по телефону. Звоните! 	2025-12-06 09:53:00.55	2025-12-06 09:53:00.55	1214
161	Квартира 1-комн., 40 м2, 5 / 9 этаж	г Казань, ул Калинина, д 32	40	42000	1	55.782268	49.144925	5	9	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом/n- Вся необходимая мебель и техника/n/- Возможна частичная или полная укомплектованность (по договоренности) 	2025-12-06 09:45:34.04	2025-12-06 09:45:34.04	1207
160	Квартира 1-комн., 39 м2, 15 / 19 этаж	г Казань, ул Рихарда Зорге, д 16	39	36000	1	55.760834	49.18189	15	19	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом/n- Вся необходимая мебель и техника/n/- Возможна частичная или полная укомплектованность (по договоренности) 	2025-12-05 15:34:48.243	2025-12-05 15:34:48.243	1204
159	Квартира 2-комн., 40 м2, 4 / 5 этаж	г Казань, ул Рихарда Зорге, д 16	40	36000	2	55.760834	49.18189	4	5	Казань	не указан	1	Сдается 2-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом/n/- Вся необходимая мебель и техника/n/- Возможна частичная или полная укомплектованность (по договоренности) 	2025-12-05 15:30:39.242	2025-12-05 15:30:39.242	1203
170	Квартира 2-комн., 58 м2, 5 / 6 этаж	Республика Татарстан (Татарстан), Казань, улица Анаса Тазетдинова, 5/6	58	50000	2	55.806241	49.228127	5	6	Казань	не указан	1	Предлагаем вашему вниманию просторную трёхкомнатную квартиру премиум-класса, расположенную по адресу: город Казань, улица Анаса Тазетдинова, дом №5/6./n/Эта квартира идеально подойдёт тем, кто ценит комфорт, уют и стиль европейского уровня проживания./n/Преимущества аренды:/n/Расположение: удобное местоположение в одном из престижных районов города, рядом магазины, кафе, рестораны, фитнес-клубы и медицинские учреждения./n/Просторная площадь: квартира с удобной планировкой — две спальни, гостиная, оборудованная кухня и санузел. Всё продумано до мелочей для домашнего уюта./n/Современный ремонт: европейский стиль, качественные материалы, современная мебель. Элегантность дизайна сочетается с функциональностью./n/Комфорт и удобства: есть бытовая техника, высокоскоростной интернет, кондиционирование воздуха, качественная сантехника и многое другое./n/Безопасность: дом оснащён системой охраны и видеонаблюдения./n/Идеальный вариант для тех, кто хочет жить в атмосфере гармонии, стиля и спокойствия в самом комфортном районе Казани. 	2025-12-06 10:15:06.354	2025-12-06 10:15:06.354	1227
168	Квартира 1-комн., 40 м2, 2 / 10 этаж	Республика Татарстан (Татарстан), Казань, улица Кул Гали, 27	40	27000	1	55.751173	49.244853	2	10	Казань	не указан	1	Сдается уютная 1-комнатная квартира в прекрасной локации!/n/Предлагаем в аренду светлую и теплую квартиру с современным ремонтом для комфортного проживания./n/Что в квартире:/n/· Общее: Чистовый ремонт, новые металлопластиковые окна, балкон/лоджия./n/· Кухня: Просторная кухня с новой мебелью и всей необходимой техникой (холодильник, газовая/электрическая плита, вытяжка)./n/· Санузел: Раздельный/совмещенный санузел, стиральная машина./n/· Техника: В наличии кондиционер, водонагреватель (бойлер), интернет./n/Локация и инфраструктура:/n/· Район отличается развитой инфраструктурой: в шаговой доступности детские сады, школы, супермаркеты, аптеки и кафе./n/· Отличная транспортная доступность: рядом остановки общественного транспорта, удобный выезд на основные магистрали./n/· В пешей доступности парк/сквер для прогулок и отдыха./n/Квартира полностью готова к заселению! На длительный срок. Рассмотрим адекватных, аккуратных съемщиков./n/Звоните, чтобы договориться о просмотре! 	2025-12-06 10:08:39.352	2025-12-06 10:08:39.352	1225
169	Квартира 1-комн., 40 м2, 15 / 17 этаж	Республика Татарстан (Татарстан), Казань, улица Четаева, 43А	40	37000	1	55.823909	49.113457	15	17	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом;/n/- Вся необходимая мебель и техника;/n/- Возможна частичная или полная укомплектованность (по договоренности). 	2025-12-06 10:11:47.108	2025-12-06 10:11:47.108	1226
166	Квартира 1-комн., 42 м2, 5 / 5 этаж	г Казань, ул Красной Позиции, д 33	42	30000	1	55.781737	49.16688	5	5	Казань	не указан	1	Сдаётся уютная 1-комнатная квартира в центре Казани/n/Адрес: улица Красной Позиции, дом 33/n/Район: центр города, всего в 2 остановках транспорта от основных достопримечательностей/n/Ремонт: классический, косметический — квартира в отличном состоянии, готова к проживанию/n/Мебель и техника: два удобных дивана, телевизор — всё для комфортного проживания/n/Стоимость аренды: 30 000 ₽ в месяц/n/Залог: оплачивается при заселении/n/Отличное местоположение, развитая инфраструктура, удобная транспортная доступность. Идеально подойдёт для одного человека или пары./n/Звоните и приходите на просмотр! 	2025-12-06 10:02:11.104	2025-12-06 10:02:11.104	1221
172	Квартира 1-комн., 34.4 м2, 3 / 5 этаж	Республика Татарстан (Татарстан), Зеленодольский район, Осиновское сельское поселение, село Осиново, Дорожная улица, 35	34	28000	1	55.875188	48.86748	3	5	Казань	не указан	1	Сдам 1-комнатную квартиру в ЖК Достояние, Дорожная 35/n/nУютная квартира на втором этаже в современном жилом комплексе "Достояние"./n/Удобное расположение, развитая инфраструктура, отличная транспортная доступность./n/nХарактеристики:/n- 1 комната/n- 2 этаж/n- Чистый и ухоженный подъезд/n- Безопасный район/n/nТребования к арендаторам:/n- Платежеспособные и порядочные люди/n- Без вредных привычек/n- Без домашних животных (возможен вариант с детьми школьного возраста)/n/nГотовы рассмотреть адекватных нанимателей для долгосрочной аренды./n/nДля подробностей и организации просмотра пишите или звоните в любое время!	2025-12-06 10:20:47.605	2025-12-06 10:20:47.605	1235
173	Квартира Студия 20 м2, 2 / 19 этаж	Республика Татарстан (Татарстан), Казань, улица Мансура Хасанова, 13	20	33000	0	55.779378	49.183696	2	19	Казань	не указан	1	Предлагаем вашему вниманию уютную студию площадью 20 квадратных метров в ЖК «Мечта», расположенном в живописном районе Казани. Пространство идеально подойдет для тех, кто ценит комфорт и стиль в повседневной жизни./n/nЭта студия оборудована всеми необходимыми удобствами для приятного проживания:/n- Дизайнерский ремонт – квартира выполнена в современном стиле, подчеркивающем элегантность и гармонию пространства./n- Просторная двуспальная кровать – обеспечит вам глубокий сон и отдых после насыщенного дня./n- Кондиционер – позволит поддерживать оптимальный микроклимат круглый год./n- Современная бытовая техника – холодильник, стиральная машина и другое оборудование сделают ваше проживание удобным и беззаботным./n- Санузел с качественной сантехникой – подарит ощущение свежести и комфорта каждое утро./n- Высокоскоростной интернет – гарантирует стабильное соединение для работы и развлечений онлайн./n/nОкруженная зелеными зонами и удобной инфраструктурой, эта студия станет идеальным выбором для спокойной и комфортной жизни в сердце города./n/nДобро пожаловать в свою мечту в городе Казань!	2025-12-06 10:35:18.425	2025-12-06 10:35:18.425	1236
174	Квартира 1-комн., 38.7 м2, 17 / 19 этаж	г Казань, ул Профессора Камая, д 10 к 2	38	33000	1	55.749167	49.183903	17	19	Казань	не указан	1	Сдаётся 1-комнатная квартира — Камая 10к2/n/n- Удобное расположение: рядом метро Горки/n- Есть всё необходимое для комфортного проживания/n- В квартире предусмотрено место для рабочего стола/n- Рассматриваем арендаторов с воспитанными питомцами маленьких пород/n/nЗвоните и записывайтесь на просмотр	2025-12-06 10:39:01.572	2025-12-06 10:39:01.572	1237
177	Квартира 1-комн., 42 м2, 6 / 10 этаж	г Казань, ул Юлиуса Фучика, д 62А	42	34000	1	55.754061	49.233813	6	10	Казань	не указан	1	Сдаю светлую и просторную квартиру. Свежий ремонт. Есть всё необходимое для проживания: двуспальная кровать, диван, тв, бойлер, микроволновая печь, посудомоечная машина, бойлер, просторный облагороженный балкон. есть видео, пришлю по запросу. Пишите, звоните, записывайтесь на просмотр.	2025-12-06 10:50:31.222	2025-12-06 10:50:31.222	1248
176	Квартира 1-комн., 30 м2, 5 / 5 этаж	г Казань, ул Рихарда Зорге, д 12а	30	40000	1	55.760641	49.182681	5	5	Казань	не указан	1	Сдается однокомнатная квартира с евро ремонтом/n/Качественный евро ремонт – современно и стильно/n/Вся необходимая техника и мебель уже есть, заезжай и живи!/n/Удобное расположение – метро Горки всего в 7 минутах пешком/n/Рядом остановки общественного транспорта – комфортные поездки по городу/n/Рядом ТЦ Горки Парк – все для шопинга и досуга в шаговой доступности 	2025-12-06 10:46:57.815	2025-12-06 10:46:57.815	1245
182	Квартира 1-комн., 50 м2, 1 / 9 этаж	Республика Татарстан (Татарстан), Казань, проспект Ямашева, 104к2	50	45000	1	55.827636	49.156935	1	9	Казань	не указан	1	Сдается стильная однокомнатная квартира с дизайнерским ремонтом/n/Уютное гнездышко для комфортной жизни! Предлагаем в аренду светлую 'однушку' с свежим ремонтом и всей необходимой техникой. Идеально подойдет для двух человек./n/Что есть в квартире:/n/- Современный ремонт: стильное и практичное оформление, приятные материалы, ничего лишнего/n/- Продуманная меблировка: две удобные кровати, что идеально для друзей, коллег или пары/n/- Вся базовая техника: новый холодильник, газовая/электрическая плита, микроволновка — готовьте с первого дня/n/- Чистота и порядок: квартира полностью готова к вашему заезду. 	2025-12-06 11:26:06.93	2025-12-06 11:26:06.93	1277
181	Квартира 2-комн., 50 м2, 11 / 25 этаж	Республика Татарстан (Татарстан), Казань, Кировский район, Шоссейная улица, 57	50	65000	2	55.807754	49.089607	11	25	Казань	не указан	1	Найдете не просто квартиру, а место силы. «Атлантис» — это дизайнерский ремонт, где каждая деталь создана для вашего комфорта и эстетического наслаждения./n/Погрузитесь в атмосферу, где:/n/- Дизайн, в котором хочется жить: продуманная отделка, качественные материалы, стильная мебель и продуманное освещение/n/- Лучшая локация: всё самое важное — в шаговой доступности. Рядом метро [Название станции], парки, супермаркеты и уютные кофейни/n/- Полная готовность к жизни: всё новое и исправное. Вас ждёт вся необходимая техника и уют/n/Идеально для тех, кто ценит чувство стиля, удобство и безупречный вкус. 	2025-12-06 11:21:54.487	2025-12-06 11:21:54.487	1271
180	Квартира 1-комн., 46.2 м2, 9 / 9 этаж	г Казань, ул Дружинная, д 4	46	40000	1	55.817092	49.084136	9	9	Казань	не указан	1	1-комнатная квартира 46 м² в аренду/n/Отличное расположение — в шаговой доступности ТЦ Тандем/n/nКирпичный дом/n/Свободна с конца ноября, просмотры — по предварительной договорённости/n/Рассматриваем адекватных и платежеспособных граждан/n/Возможна регистрация за дополнительную плату/n/За подробностями и для записи на просмотр пишите Виктории в личные сообщения/n/Ваш комфорт и удобство в центре города! 	2025-12-06 11:17:53.817	2025-12-06 11:17:53.817	1260
179	Квартира 1-комн., 32 м2, 12 / 19 этаж	г Казань, ул Натана Рахлина, д 15 к 1	32	33000	1	55.804395	49.238107	12	19	Казань	не указан	1	Сдаётся 1-комнатная квартира в ЖК Светлая Долина/n/Свежий, светлый ремонт — квартира готова для комфортного проживания!/n/Расположение — хороший, тихий район с развитой инфраструктурой./n/Всё необходимое рядом: магазины, аптеки, школы, детские площадки./n/Остановка общественного транспорта в пешей доступности. 	2025-12-06 10:57:26.894	2025-12-06 10:57:26.894	1258
188	Квартира Студия 25 м2, 16 / 19 этаж	Республика Татарстан (Татарстан), Казань, улица Азата Аббасова, 5	25	29000	0	55.79349	49.24824	16	19	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом/n/- Вся необходимая мебель и техника/n- Возможна частичная или полная укомплектованность (по договоренности) 	2025-12-06 11:54:19.771	2025-12-06 11:54:19.771	1288
187	Квартира 1-комн., 45 м2, 12 / 13 этаж	Республика Татарстан (Татарстан), Казань, Краснококшайская улица, 84А	45	45000	1	55.81347	49.0697	12	13	Казань	не указан	1	Сдается стильная однокомнатная квартира с дизайнерским ремонтом/n/Уютная и полностью готовая к проживанию квартира с свежим дизайнерским ремонтом. Всё продумано для вашего комфорта!/n/nОсобенности квартиры:/n/- Свежий дизайнерский ремонт/n/- Вся необходимая мебель/n/- Полный комплект техники/n/- Чистая и ухоженная/n/- Готова к заселению/n/Что включено:/n/- Удобная кровать/диван/n/- Шкаф для одежды/n/- Обеденный стол/n/- Холодильник/n/- Плита/n/- Микроволновка 	2025-12-06 11:51:44.661	2025-12-06 11:51:44.661	1283
185	Квартира 1-комн., 50 м2, 7 / 10 этаж	г Казань, ул Меридианная, д 13	50	45000	1	55.824572	49.115343	7	10	Казань	не указан	1	1-комнатная квартира с дизайнерским ремонтом и всей техникой/n/Описание:/n/Сдаётся очень уютная и современная однокомнатная квартира с свежим дизайнерским ремонтом. Вас ждёт не просто жильё, а полностью готовое к комфортной жизни пространство, где есть всё необходимое./n/Плюсы квартиры:/n/- Вся необходимая техника:/n/  - Кухня: варочная панель, духовой шкаф, вытяжка, холодильник, стиральная машина, микроволновка/n/ - Комфорт: телевизор/n/- Чистота и порядок: Кухня и санузел выглядят как новые. Установлена современная сантехника и мебель./n/- Полная готовность: В квартире есть всё для проживания: мебель, техника, шторы. Переезжайте и живите! 	2025-12-06 11:33:57.204	2025-12-06 11:33:57.204	1281
184	Квартира 1-комн., 50 м2, 1 / 9 этаж	Республика Татарстан (Татарстан), Казань, улица Серова, 28Б	50	50000	1	55.823019	49.072323	1	9	Казань	не указан	1	Сдается стильная однокомнатная квартира с дизайнерским ремонтом/n/Уютное гнездышко для комфортной жизни! Предлагаем в аренду светлую "однушку" с свежим ремонтом и всей необходимой техникой. Идеально подойдет для двух человек, также и для одного./n/Что есть в квартире:/n/- Современный ремонт: Стильное и практичное оформление, приятные материалы, ничего лишнего/n/- Продуманная меблировка: Две удобные кровати, идеально для друзей, коллег или пары/n/- Вся базовая техника: Новый холодильник, газовая/электрическая плита, микроволновка — готовьте с первого дня/n- Чистота и порядок: Квартира полностью готова к вашему заезду 	2025-12-06 11:31:39.434	2025-12-06 11:31:39.434	1279
197	Квартира 1-комн., 41 м2, 5 / 9 этаж	г Казань, ул Чистопольская, д 41	41	37000	1	55.819863	49.123518	5	9	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад/n/nКвартира:/n- Чистая, светлая, с современным ремонтом/n- Вся необходимая мебель и техника/n- Возможна частичная или полная укомплектованность (по договоренности)	2025-12-06 12:25:47.696	2025-12-06 12:25:47.696	1341
198	Квартира 1-комн., 39 м2, 14 / 14 этаж	г Казань, ул Серова, д 13	39	34000	1	55.828986	49.062989	14	14	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад/n/nКвартира:/n- Чистая, светлая, с современным ремонтом/n- Вся необходимая мебель и техника/n- Возможна частичная или полная укомплектованность (по договоренности)	2025-12-06 12:29:21.875	2025-12-06 12:29:21.875	1342
196	Квартира 1-комн., 33 м2, 2 / 5 этаж	Республика Татарстан (Татарстан), Казань, улица Мусина, 59	33	30000	1	55.833486	49.122943	2	5	Казань	не указан	1	Сдается уютная однокомнатная квартира/n/Просторная и светлая комната, удобная кухня, комфортная ванная комната/n/Удобная транспортная доступность: рядом остановки общественного транспорта, легко добраться до любого района города/n/Близость к магазинам, аптекам и другим важным объектам инфраструктуры обеспечит вам комфортное проживание/n/Идеально подойдет как для долгосрочного проживания, так и для временного пребывания/n/Не упустите шанс стать счастливым арендатором нашей уютной квартирки! 	2025-12-06 12:23:10.626	2025-12-06 12:23:10.626	1333
195	Квартира 1-комн., 50 м2, 3 / 14 этаж	г Казань, ул Чистопольская, д 85А	50	36000	1	55.823849	49.15521	3	14	Казань	не указан	1	Сдаю 1-комнатную квартиру на длительный срок/n/Адрес: Чистопольская, 85а/nКирпичный дом/n/Площадь: 50 кв.м/n/В квартире есть двуспальная кровать и диван/n/Удобная локация в сердце Ново-Савиновского района/n/Полностью укомплектована всем необходимым для комфортного проживания/n/Идеально для одного или пары! Цена и условия по телефону./n/Звоните и договаривайтесь о просмотре! 	2025-12-06 12:12:49.815	2025-12-06 12:12:49.815	1314
194	Квартира 1-комн., 35 м2, 2 / 5 этаж	Республика Татарстан (Татарстан), село Высокая Гора, Рождественская улица, 6	35	24000	1	55.899638	49.32545	2	5	Казань	не указан	1	Сдаётся 1-комнатная квартира в ЖК Белая Аллея, Высокая Гора/n/Адрес: ул. Рождественская, д. 6/n/Фотографии реальные, можно бронировать заранее/n/Условия аренды:/n/- Только для граждан РФ/n/- Без животных/n/- Без вредных привычек/n/Идеальный вариант для тех, кто ищет комфортное и спокойное жильё в современном жилом комплексе. Звоните и записывайтесь на просмотр! 	2025-12-06 12:10:00.946	2025-12-06 12:10:00.946	1305
193	Квартира 1-комн., 39 м2, 20 / 24 этаж	Республика Татарстан (Татарстан), Казань, 2-я Юго-Западная улица, 39	39	36000	1	55.821583	49.079581	20	24	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом/n/- Вся необходимая мебель и техника/n/- Возможна частичная или полная укомплектованность (по договоренности) 	2025-12-06 12:06:56.791	2025-12-06 12:06:56.791	1302
192	Квартира Студия 29 м2, 7 / 7 этаж	Республика Татарстан (Татарстан), Казань, Краснококшайская улица, 69/12	29	35000	0	55.812135	49.069987	7	7	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом/n/- Вся необходимая мебель и техника/n/- Возможна частичная или полная укомплектованность (по договоренности) 	2025-12-06 12:04:36.262	2025-12-06 12:04:36.262	1299
206	Квартира 2-комн., 85 м2, 9 / 17 этаж	г Казань, ул Чистопольская, д 88	85	75000	2	55.81871	49.146461	9	17	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом/n/- Вся необходимая мебель и техника/n/- Возможна частичная или полная укомплектованность (по договоренности) 	2025-12-06 13:01:17.842	2025-12-06 13:01:17.842	1359
205	Квартира 2-комн., 52 м2, 8 / 10 этаж	Республика Татарстан (Татарстан), Казань, улица Азата Аббасова, 10, подъезд 10	52	40000	2	55.792053	49.24771	8	10	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом/n/- Вся необходимая мебель и техника/n/- Возможна частичная или полная укомплектованность (по договоренности) 	2025-12-06 12:58:22.039	2025-12-06 12:58:22.039	1357
204	Квартира Студия 37 м2, 18 / 20 этаж	Республика Татарстан (Татарстан), Казань, улица Аделя Кутуя, 100	37	36000	0	55.781666	49.187729	18	20	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом/n/- Вся необходимая мебель и техника/n/- Возможна частичная или полная укомплектованность (по договоренности) 	2025-12-06 12:55:59.435	2025-12-06 12:55:59.435	1356
203	Квартира 1-комн., 36 м2, 15 / 18 этаж	г Казань, ул Виктора Сажинова, д 6/9	15	25000	1	55.866667	48.875798	15	18	Казань	не указан	1	Сдаётся квартира в Салават Купере по улице Виктора Сажинова, 6/9/n/Предлагается уютная и комфортная квартира с отличным расположением в спокойном районе с благоустроенным двором./n/- Удобное местоположение с развитой инфраструктурой/n/- Вся необходимая мебель и техника для комфортного проживания уже есть/n/- Спокойный и зелёный двор — идеальное место для проживания 	2025-12-06 12:52:51.92	2025-12-06 12:52:51.92	1355
202	Квартира Студия 18 м2, 2 / 5 этаж	г Казань, ул Академика Кирпичникова, д 23	18	30000	0	55.812929	49.184199	2	5	Казань	не указан	1	Уютная студия в аренду на улице Кирпичникова, 23/n/Предлагаю в аренду комфортную и светлую студию с отличным расположением. Квартира полностью готова для проживания — есть всё необходимое для удобства и комфорта./n/Преимущества:/n/- Удобное месторасположение в районе с развитой инфраструктурой/n- Рядом находятся рынки, магазины и торговые центры для повседневных покупок/n/- Отличная транспортная доступность/n/Идеальный вариант для тех, кто ценит удобство и комфорт в сочетании с выгодным местоположением!/n/Свяжитесь для просмотра и дополнительных вопросов. 	2025-12-06 12:50:27.505	2025-12-06 12:50:27.505	1354
201	Квартира 1-комн., 53 м2, 16 / 17 этаж	Республика Татарстан (Татарстан), Казань, улица Рашида Нежметдинова, 11к2	53	38000	1	55.803823	49.23384	16	17	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом/n/- Вся необходимая мебель и техника/n/- Возможна частичная или полная укомплектованность (по договоренности) 	2025-12-06 12:46:14.587	2025-12-06 12:46:14.587	1348
200	Квартира 2-комн., 66 м2, 1 / 18 этаж	г Казань, ул Чистопольская, д 76	66	45000	2	55.8182	49.138789	1	18	Казань	не указан	1	Сдается 2-комнатная квартира на Чистопольской 76/n/- Площадь: 66 кв.м + лоджия 11,8 кв.м/n/- Стоимость аренды: 45 000 руб. + коммунальные услуги/n- Залог: 30 000 руб./n/- Коммуналка зимой примерно 9 000 руб./n/- В квартире есть всё необходимое для комфортного проживания/n/📍 Удобное расположение, хорошие соседи, тихий район/n🛋️ Квартира полностью готова к заселению/n/Звоните для просмотра! 	2025-12-06 12:34:55.509	2025-12-06 12:34:55.509	1347
212	Квартира 1-комн., 55 м2, 5 / 16 этаж	г Казань, ул Чистопольская, д 36	55	45000	1	55.818114	49.121622	5	16	Казань	не указан	1	Сдаю евро 2 комнатную квартиру с Евро ремонтов. Из балкона вид на реку Казанку. Полностью укомплектована всем необходимым. Звоните, пишите, записывайтесь на просмотр.	2025-12-06 13:19:12.515	2025-12-06 13:19:12.515	1382
214	Квартира Студия 35 м2, 2 / 5 этаж	Республика Татарстан (Татарстан), Казань, улица Космонавтов, 55	35	30000	0	55.798576	49.195518	2	5	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом/n/- Вся необходимая мебель и техника/n/- Возможна частичная или полная укомплектованность (по договоренности) 	2025-12-06 13:23:54.354	2025-12-06 13:23:54.354	1384
213	Квартира 1-комн., 37 м2, 6 / 8 этаж	Республика Татарстан (Татарстан), Казань, Тэцевская улица, 4Д	37	29000	1	55.851	49.062513	6	8	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом/n/- Вся необходимая мебель и техника/n/- Возможна частичная или полная укомплектованность (по договоренности) 	2025-12-06 13:21:44.948	2025-12-06 13:21:44.948	1383
210	Квартира 1-комн., 42 м2, 4 / 14 этаж	Республика Татарстан (Татарстан), Казань, Танковая улица, 2	42	39000	1	55.752242	49.167059	4	14	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом/n/- Вся необходимая мебель и техника/n/- Возможна частичная или полная укомплектованность (по договоренности) 	2025-12-06 13:12:28.371	2025-12-06 13:12:28.371	1365
209	Квартира Студия 39 м2, 8 / 14 этаж	г Казань, ул Вишневского, д 55	39	42000	0	55.783013	49.150036	8	14	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом/n/- Вся необходимая мебель и техника/n/- Возможна частичная или полная укомплектованность (по договоренности) 	2025-12-06 13:09:27.648	2025-12-06 13:09:27.648	1364
208	Квартира 1-комн., 38 м2, 9 / 9 этаж	Республика Татарстан (Татарстан), Казань, улица Маршала Чуйкова, 69	38	36000	1	55.836282	49.144781	9	9	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом/n/- Вся необходимая мебель и техника/n/- Возможна частичная или полная укомплектованность (по договоренности) 	2025-12-06 13:07:07.532	2025-12-06 13:07:07.532	1363
218	Квартира 1-комн., 40 м2, 5 / 7 этаж	г Казань, ул Баки Урманче, д 9	40	30000	1	55.729965	49.176096	5	7	Казань	не указан	1	Просторная 1-комнатная квартира/n/Отличный жилой комплекс «Солнечный город»/n/В квартире имеется всё необходимое для комфортного проживания/n/Возможна аренда с небольшим питомцем/n/Транспортная доступность:/n/- Хорошая транспортная развязка/n/- Рядом проходят трамвай, троллейбус и множество автобусных маршрутов/n/Рядом находится больница РКБ, что добавляет удобств для жизни 	2025-12-06 13:43:49.37	2025-12-06 13:43:49.37	1389
217	Квартира 1-комн., 37 м2, 4 / 9 этаж	г Казань, ул Ярдем, д 25	37	35000	1	55.738708	49.150261	4	9	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом/n/- Вся необходимая мебель и техника/n/- Возможна частичная или полная укомплектованность (по договоренности). 	2025-12-06 13:40:49.954	2025-12-06 13:40:49.954	1387
216	Квартира 1-комн., 46.2 м2, 9 / 10 этаж	Рег Казань, ул Дружинная, д 4	46	38000	1	55.817092	49.084136	9	10	Казань	не указан	1	Сдаётся просторная 1-комнатная квартира 46,2кв.м/n/Отличная локация: метро Козья слобода и метро Яшьлек в шаговой доступности./n/Рядом ТРК Тандем и Энергоинститут./n/В квартире есть всё необходимое для комфортного проживания./n/Рассмотрим всех платежеспособных и адекватных жильцов./n/Звоните и приезжайте на просмотр! 	2025-12-06 13:37:07.195	2025-12-06 13:37:07.195	1386
215	Квартира 2-комн., 56 м2, 9 / 14 этаж	Республика Татарстан (Татарстан), Казань, Дубравная улица, 42	56	41000	2	55.737046	49.199237	9	14	Казань	не указан	1	Сдается 2-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом/n/- Вся необходимая мебель и техника/n- Возможна частичная или полная укомплектованность (по договоренности) 	2025-12-06 13:26:06.411	2025-12-06 13:26:06.411	1385
211	Квартира 3-комн., 65 м2, 7 / 24 этаж	Республика Татарстан (Татарстан), Казань, улица Алексея Козина, 8	65	130000	3	55.813415	49.141161	7	24	Казань	не указан	1	Дизайнерский ремонт: Продуманный до мелочей интерьер в современном европейском стиле. Качественные материалы, гармоничная цветовая гамма, стильное освещение и декоративные элементы./n/Полная комплектация: Вся необходимая мебель и техника премиум- и среднего класса (холодильник, стиральная и посудомоечная машины, кондиционеры, телевизор, микроволновка, духовой шкаф, варочная панель). Встроенные системы хранения./n/Планировка: Удобное зонирование. Просторная гостиная, изолированные спальни, большая кухня или кухня-гостиная./n/Комфорт: В квартире создана атмосфера уюта и спокойствия. Отличная звукоизоляция, новые инженерные коммуникации. 	2025-12-06 13:15:01.968	2025-12-06 13:15:01.968	1373
207	Квартира 1-комн., 39 м2, 4 / 4 этаж	г Казань, ул Волкова, д 19	39	38000	1	55.784228	49.135708	4	4	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом/n/- Вся необходимая мебель и техника/n/- Возможна частичная или полная укомплектованность (по договоренности) 	2025-12-06 13:04:18.543	2025-12-06 13:04:18.543	1360
199	Квартира 2-комн., 65.7 м2, 9 / 20 этаж	г Казань, ул Кул Гали, д 7б к 1	65	48000	2	55.755231	49.226645	9	20	Казань	не указан	1	Сдается уютная большая 2-комнатная квартира/n/Идеальное предложение для тех, кто ценит комфорт и качество жилья!/n/Почему именно эта квартира?/n/- Просторная и светлая двухкомнатная квартира с удобной планировкой/n/- Качественный ремонт, все необходимое для комфортного проживания/n/- Удобное расположение жилого комплекса с развитой инфраструктурой/n/- Безопасный двор с детскими площадками и зонами отдыха/n- Отличная транспортная доступность и близость к основным магистралям города/n/Для просмотра и бронирования звоните прямо сейчас! 	2025-12-06 12:31:47.537	2025-12-06 12:31:47.537	1346
191	Квартира 1-комн., 47 м2, 8 / 10 этаж	Республика Татарстан (Татарстан), Казань, улица Рауиса Гареева, 78А	47	40000	1	55.719252	49.165029	8	10	Казань	не указан	1	Сдаётся 1-комнатная квартира в Приволжском районе/n/Адрес: ул. Рауиса Гареева/n/Новый кирпичный дом, 8 этаж/n/Площадь: 47 кв.м/n/Отличное состояние: новый ремонт, все абсолютно новое/n/Условия:/n/- Рассмотрим адекватных, платёжеспособных и ответственных арендаторов/n/- Без животных/n/- Без маленьких детей/n/Идеальный вариант для тех, кто ценит комфорт и порядок! Звоните и записывайтесь на просмотр! 	2025-12-06 12:01:59.506	2025-12-06 12:01:59.506	1298
190	Квартира 1-комн., 39 м2, 4 / 9 этаж	Республика Татарстан (Татарстан), Казань, улица Горьковское Шоссе, 2Ак3	39	34000	1	55.826311	49.042247	4	9	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом/n/- Вся необходимая мебель и техника/n/- Возможна частичная или полная укомплектованность (по договоренности) 	2025-12-06 11:59:44.34	2025-12-06 11:59:44.34	1290
189	Квартира 1-комн., 37 м2, 2 / 9 этаж	г Казань, ул Маршала Чуйкова, д 62	37	34000	1	55.835144	49.152057	2	9	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом/n/- Вся необходимая мебель и техника/n- Возможна частичная или полная укомплектованность (по договоренности) 	2025-12-06 11:57:03.561	2025-12-06 11:57:03.561	1289
186	Квартира 1-комн., 48 м2, 8 / 9 этаж	Республика Татарстан (Татарстан), Казань, улица Павлюхина, 99Б	48	50000	1	55.767398	49.150961	8	9	Казань	не указан	1	1-к квартира с дизайн-ремонтом и ДВУМЯ кроватями/n/Идеальное предложение для друзей, коллег или семьи с одним ребенком! Сдаётся стильная однокомнатная квартира с дизайнерским ремонтом, где продумана каждая деталь для комфортного проживания двух человек./n/Главные преимущества:/n/- Две полноценные кровати: Удобное раздельное спальное место для двух взрослых. Больше не нужно спать на раскладном диване!/n/- Полный комплект техники: Всё для жизни уже включено:/n/  - Кухня: холодильник, варочная панель, духовой шкаф, вытяжка, стиральная машина, микроволновка./n  - Для комфорта: кондиционер (сплит-система), телевизор./n/- Авторский дизайн-ремонт: Свежий, современный ремонт с качественными материалами, продуманной системой освещения и модной отделкой./n/- Готова к заселению: Вам нужно только приехать с вещами. 	2025-12-06 11:37:50.646	2025-12-06 11:37:50.646	1282
183	Квартира 1-комн., 50 м2, 9 / 9 этаж	Республика Татарстан (Татарстан), Казань, Чистопольская улица, 85	50	50000	1	55.823707	49.154204	9	9	Казань	не указан	1	Сдается стильная однокомнатная квартира с дизайнерским ремонтом/n/Уютная и полностью готовая к проживанию квартира с свежим дизайнерским ремонтом. Всё продумано для вашего комфорта!/n/Особенности квартиры:/n/- Свежий дизайнерский ремонт/n/- Вся необходимая мебель/n/- Полный комплект техники/n/- Чистая и ухоженная/n/- Готова к заселению/n/Что включено:/n/- Удобная кровать/диван/n/- Шкаф для одежды/n/- Обеденный стол/n/- Холодильник/n/- Плита/n/- Микроволновка 	2025-12-06 11:28:44.476	2025-12-06 11:28:44.476	1278
178	Квартира 1-комн., 50 м2, 7 / 9 этаж	г Казань, ул Чистопольская, д 85	50	43000	1	55.823707	49.154204	7	9	Казань	не указан	1	Красивая и большая однокомнатная квартира/n/Просторная светлая квартира: современный ремонт, продуманная планировка, функциональная зона отдыха и готовая кухня — всё создано для вашего комфорта!/n/Идеальное расположение: рядом парки, зоны отдыха, развитая инфраструктура, удобная транспортная доступность — живите легко и наслаждайтесь каждым днём!/n/Преимущество дома: тихий дворик, ухоженная территория, парковочные места, приятная атмосфера соседства — жизнь здесь вдохновляет каждый день!/n/Идеально подойдёт молодой семье, студентам, одиночке или паре, ищущим идеальное сочетание удобства и красоты жилья./n/Хотите поселиться в идеальной квартире вашей мечты? Звоните прямо сейчас и узнайте подробности аренды — ваша комфортная жизнь начинается именно здесь! 	2025-12-06 10:53:45.445	2025-12-06 10:53:45.445	1255
175	Квартира 2-комн., 58.8 м2, 5 / 19 этаж	Республика Татарстан (Татарстан), Казань, Комсомольская улица, 1	58	52000	2	55.81083	49.096568	5	19	Казань	не указан	1	Сдается уютная 2-комнатная квартира в ЖК Казан Су!/n/Адрес: Комсомольская 1/n/Этаж: 5/10/n/Площадь: 59 кв.м/n/Ищете идеальное место для комфортного проживания? Эта квартира — именно то, что вам нужно!/n/Особенности квартиры:/n/- Просторные светлые комнаты, создающие атмосферу уюта и тепла/n/- Полностью меблирована и оснащена всем необходимым для комфортной жизни: современная кухня, бытовая техника, уютная мебель/n/- Отличное расположение в новом жилом комплексе с развитой инфраструктурой/n/Инфраструктура:/n/- Рядом магазины, кафе и рестораны/n/- Удобный доступ к общественному транспорту/n- Зеленые зоны и детские площадки для семейного отдыха/n/Не упустите возможность арендовать эту замечательную квартиру! Звоните прямо сейчас, чтобы записаться на просмотр. 	2025-12-06 10:43:47.199	2025-12-06 10:43:47.199	1240
171	Квартира 1-комн., 37 м2, 6 / 9 этаж	Республика Татарстан (Татарстан), Казань, улица Комиссара Габишева, 19Б	37	32000	1	55.749425	49.236463	6	9	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/nКвартира:/n/- Чистая, светлая, с современным ремонтом;/n/- Вся необходимая мебель и техника;/n/- Возможна частичная или полная укомплектованность (по договоренности). 	2025-12-06 10:18:32.517	2025-12-06 10:18:32.517	1231
167	Квартира 3-комн., 100 м2, 6 / 10 этаж	г Казань, ул Фатыха Амирхана, д 103	100	50000	3	55.842529	49.131737	6	10	Казань	не указан	1	Сдается просторная 3-комнатная квартира в отличном районе/n/Предлагается в аренду большая квартира площадью 100 кв. м, расположенная в удобной и престижной локации. Жилье отличается качественным ремонтом — современный и ухоженный интерьер позволит вам с комфортом чувствовать себя с первых дней проживания./n/Основные преимущества:/n/- Просторные комнаты, идеально подходящие для семьи или для тех, кто ценит комфорт и пространство./n/- Хорошее техническое состояние и свежий ремонт./n/- Развитая инфраструктура района: рядом магазины, школы, общественный транспорт./n/Эта квартира — идеальный вариант для тех, кто ищет комфортное и стильное жилье в удобном месте./n/Для дополнительной информации и организации просмотра звоните в любое время! 	2025-12-06 10:04:36.916	2025-12-06 10:04:36.916	1223
163	Квартира 1-комн., 40 м2, 1 / 5 этаж	г Казань, ул Хайдара Бигичева, д 23	40	24000	1	55.789826	49.223644	1	5	Казань	не указан	1	Сдам однокомнатную квартиру на Бегичева 23, Казань/n/- Просторная и светлая квартира с современным дизайном/n/- Полностью укомплектована всей необходимой мебелью и техникой/n/- Современный интерьер, стильная отделка/n/- Удобная транспортная развязка: рядом остановки общественного транспорта, быстрый доступ к основным районам города/n/- Развитая инфраструктура: магазины, аптеки, школы и парки в шаговой доступности/n- Чистый и ухоженный двор с парковкой/n- Отличный вариант для комфортного проживания или съемщиков, ценящих удобство и стиль/n/Звоните для просмотра и дополнительной информации! 	2025-12-06 09:50:21.285	2025-12-06 09:50:21.285	1211
158	Квартира 1-комн., 42 м2, 10 / 27 этаж	г Казань, ул Бухарская, д 32 к 1	42	37000	1	55.773272	49.206567	10	27	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом/n- Вся необходимая мебель и техника/n/- Возможна частичная или полная укомплектованность (по договоренности) 	2025-12-05 15:27:30.5	2025-12-05 15:27:30.5	1202
157	Квартира 1-комн., 32 м2, 5 / 9 этаж	г Казань, ул Зур Урам, д 7а	32	25000	1	55.805558	49.196964	5	9	Казань	не указан	1	Сдается уютная квартира премиум-класса/n/Однокомнатная квартира со светлым евро ремонтом./n/Особенности жилья:/n/- Просторная комната с пластиковыми окнами и современным интерьером/n- Кухня оборудована всей необходимой техникой/n/- Санузел отделан высококачественными материалами и укомплектован сантехникой премиального уровня/n/- Высокоскоростной интернет/n/- Удобная транспортная доступность, близость к паркам и зонам отдыха/n/Идеальный вариант для тех, кто ценит комфорт и красоту своего жилища! 	2025-12-05 15:04:56.7	2025-12-05 15:04:56.7	1188
150	Квартира 1-комн., 41 м2, 3 / 19 этаж	г Казань, ул Академика Завойского, д 21Б	41	36000	1	55.75861	49.243129	3	19	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом;/n/- Вся необходимая мебель и техника;/n/- Возможна частичная или полная укомплектованность (по договоренности). 	2025-12-05 14:43:05.56	2025-12-05 14:43:05.56	1180
143	Квартира 2-комн., 49 м2, 11 / 20 этаж	г Казань, ул Кул Гали, д 7б	49	35000	1	55.755338	49.225647	11	20	Казань	не указан	1	Сдается 2-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад/n/Квартира:/n/- Чистая, светлая, с современным ремонтом/n/- Вся необходимая мебель и техника/n/- Возможна частичная или полная укомплектованность (по договоренности)/n/Условия:/n/- Для порядочных, платежеспособных жильцов 	2025-12-04 13:25:34.412	2025-12-04 13:25:34.412	1160
136	Квартира 2-комн., 52 м2, 7 / 19 этаж	г Казань, ул Аделя Кутуя, д 110	52	37000	2	55.779565	49.193604	7	19	Казань	не указан	1	Сдается 2-комнатная квартира на длительный срок/n/n🏠 О квартире:/n/- Чистая, светлая, с современным ремонтом/n- Вся необходимая мебель и техника/n/- Возможна частичная или полная укомплектованность (по договоренности)/n/🌿 Расположение:/n/- Шаговая доступность к метро/n/- Рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад/n/Условия аренды:/n/- Для порядочных, платежеспособных жильцов/n/- Без животных (или рассмотрим вариант)/n/- Долгосрочная аренда, с заключением договора 	2025-12-04 12:56:50.573	2025-12-04 12:56:50.573	1141
130	Квартира 1-комн., 39 м2, 8 / 10 этаж	г Казань, ул Сафиуллина, д 26А	39	31000	1	55.750322	49.221084	8	10	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/📍 Расположение:/n/Шаговая доступность до метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/n🏠 Квартира:/n/- Чистая, светлая, с современным ремонтом/n/- Есть вся необходимая мебель и техника/n/- Возможна частичная или полная укомплектованность (по договоренности)/n/📌 Условия:/n/- Для порядочных, платежеспособных жильцов/n/- Без животных (возможно рассмотрение)/n/- Долгосрочная аренда с заключением договора/n/Отличный вариант для комфортного проживания! 	2025-12-04 12:40:07.8	2025-12-04 12:40:07.8	1122
128	Квартира 1-комн., 46 м2, 2 / 17 этаж	г Казань, ул Абубекира Терегулова, д 22	46	36000	1	55.735915	49.204339	2	17	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/📍 Расположение:/n/Шаговая доступность до метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/n🏠 Квартира:/n/- Чистая, светлая, с современным ремонтом/n/- Есть вся необходимая мебель и техника/n/- Возможна частичная или полная укомплектованность (по договоренности)/n/📌 Условия:/n/- Для порядочных, платежеспособных жильцов/n/- Без животных (возможно рассмотрение)/n/- Долгосрочная аренда с заключением договора/n/Отличный вариант для комфортного проживания! 	2025-12-04 12:33:35.083	2025-12-04 12:33:35.083	1120
123	Квартира 2-комн., 78 м2, 2 / 6 этаж	г Казань, ул Гумера Баширова, д 5	78	55000	2	55.800747	48.96218	2	6	Казань	не указан	1	Сдаю огромную евро-трёхкомнатную квартиру в ЖК «Волжская Гавань»/n/Квартира идеальна для комфортного проживания — ремонт делали для себя, использовали только качественные материалы./n/🏠 О квартире:/n/- Полностью укомплектована всем необходимым/n- Посудомоечная машина/n/- Два кондиционера/n/- Большая двуспальная кровать/n/- В детской — два мягких раскладных дивана/n/- В зале — большой раскладной диван/n/- Просторная кухня/n- Камин, ТВ/n/🌿 Инфраструктура района:/n/- Рядом парк и набережная Волги — идеальное место для прогулок и отдыха/n/- В шаговой доступности школа и детский сад/n/- Магазины, фитнес-клуб, аптека/n/- Удобная транспортная развязка, остановка рядом/n/Квартира просторная, уютная и полностью готова к заселению! Звоните, чтобы договориться о просмотре. 	2025-12-04 12:13:08.679	2025-12-04 12:13:08.679	1087
121	Квартира 1-комн., 42 м2, 12 / 19 этаж	Республика Татарстан (Татарстан), Казань, улица Павлюхина, 110Г	42	50000	1	55.767625	49.143712	12	19	Казань	не указан	1	Предлагаем вашему вниманию прекрасную однокомнатную квартиру в жилом комплексе «Возрождение» в живописном районе Казани, рядом с популярным торговым центром «Казан Молл»./n/🏠 Особенности интерьера:/n/- Стильная и просторная кухня с качественной бытовой техникой в современном исполнении/n/- Удобная гардеробная, обеспечивающая порядок и дополнительное пространство/n/- Красивая двуспальная кровать для глубокого сна и полноценного отдыха/n/- Функциональный раскладной диван — идеально для гостей или дневной зоны отдыха/n/- Современный кондиционер, поддерживающий комфортный микроклимат круглый год/n/💎 Преимущества:/n/- Грамотное сочетание эстетики и удобства/n/- Качественный ремонт и уютная атмосфера/n/- Отличный вариант для молодых пар, студентов и деловых людей, ценящих гармонию и комфорт/n/Приглашаем вас ощутить преимущества комфортного проживания в этой уютной квартире! 	2025-12-04 12:06:29.275	2025-12-04 12:06:29.275	1079
118	Квартира 1-комн., 42 м2, 2 / 4 этаж	г Казань, ул Качалова, д 77	42	25000	1	55.774598	49.144556	2	4	Казань	не указан	1	Сдаётся уютная квартира рядом с метро!/n/- Месторасположение: всё в пешей доступности — магазины, аптеки, кафе./n/- Квартира: полностью оборудована всей необходимой техникой для комфортного проживания./n/- Условия аренды: цена 25 000 рублей + коммунальные услуги. Залог 15 000 рублей (возможна рассрочка)./n/Квартира готова к заселению, не упустите шанс! Записывайтесь на просмотр прямо сейчас. 	2025-12-03 13:07:45.621	2025-12-03 13:07:45.621	1054
114	Квартира 3-комн., 100 м2, 5 / 20 этаж	Республика Татарстан (Татарстан), Казань, улица Сибгата Хакима, 62	100	230000	3	55.815079	49.143865	5	20	Казань	не указан	1	Аренда стильной евро 3-комнатной квартиры в ЖК УНО/n/ТОРГ ОБСУДИМ!/nЗалог можно поделить!/n/Предлагается просторная дизайнерская квартира площадью 100 кв.м с продуманной планировкой и качественной отделкой. Большая кухня-гостиная создаёт комфортное пространство для жизни и отдыха. В каждой комнате установлен кондиционер для поддержания оптимального микроклимата./n/Для вашего удобства предусмотрена посудомоечная машина, бойлер и гардеробная. В квартире два туалета, что особенно удобно для семьи или гостей. В ванной комнате есть ванна с подсветкой и отдельный душ — идеальное место для релаксации./n/Эта квартира сочетает в себе стиль, комфорт и функциональность — отличный выбор для современного городского жителя./n/📍 ЖК УНО/n/📐 100 кв.м/n/🛏️ Евро 3-комнаты/n/❄️ Кондиционер в каждой комнате/n/🍽️ Посудомоечная машина/n/🚿 Ванна с подсветкой и душ/n/🛁 2 туалета/n/👗 Гардеробная/n/Звоните и бронируйте! 	2025-12-03 12:52:42.895	2025-12-03 12:52:42.895	1043
116	Квартира Студия 32 м2, 6 / 22 этаж	г Казань, ул Галеева, д 8а к 1	32	34000	0	55.803332	49.176456	6	22	Казань	не указан	1	Аренда стильной евро 3-комнатной квартиры в ЖК УНО/n/ТОРГ ОБСУДИМ!/n/Залог можно поделить!/n/Предлагается просторная дизайнерская квартира площадью 100 кв.м с продуманной планировкой и качественной отделкой. Большая кухня-гостиная создаёт комфортное пространство для жизни и отдыха. В каждой комнате установлен кондиционер для поддержания оптимального микроклимата./n/Для вашего удобства предусмотрена посудомоечная машина, бойлер и гардеробная. В квартире два туалета, что особенно удобно для семьи или гостей. В ванной комнате есть ванна с подсветкой и отдельный душ — идеальное место для релаксации./n/Эта квартира сочетает в себе стиль, комфорт и функциональность — отличный выбор для современного городского жителя./n/📍 ЖК УНО/n/📐 100 кв.м/n/🛏️ Евро 3-комнаты/n/❄️ Кондиционер в каждой комнате/n/🍽️ Посудомоечная машина/n/🚿 Ванна с подсветкой и душ/n/🛁 2 туалета/n/👗 Гардеробная/n/Звоните и бронируйте! 	2025-12-03 12:58:38.097	2025-12-03 12:58:38.097	1048
113	Квартира 1-комн., 40 м2, 5 / 18 этаж	г Казань, ул Чистопольская, д 14	40	33000	1	55.81864	49.10822	5	18	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/- Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/- Квартира: Чистая, светлая, с современным ремонтом. Вся необходимая мебель и техника. Возможна частичная или полная укомплектованность (по договоренности)./n/- Условия аренды: Для порядочных, платежеспособных жильцов. Без животных (или рассмотрим вариант). Долгосрочная аренда, с заключением договора. 	2025-12-03 12:50:03.211	2025-12-03 12:50:03.211	1040
111	Квартира 1-комн., 30 м2, 4 / 10 этаж	Республика Татарстан (Татарстан), Казань, Рождественская улица, 6	30	25000	1	55.762556	49.285242	4	10	Казань	не указан	1	Сдается квартира в ЖК Белая аллея/n/Рассмотрим всех! СНГ! С животными и с детьми!/n/По аренде: 25.000 все включено!/n/Квартира свободна и готова к проживанию, скорее запишись на просмотр! 	2025-12-03 12:44:08.866	2025-12-03 12:44:08.866	1037
110	Квартира Студия 35 м2, 3 / 10 этаж	г Казань, ул Петра Полушкина, д 4	35	36000	0	55.763169	49.191296	3	10	Казань	не указан	1	Сдается студия на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом;/n/- Вся необходимая мебель и техника;/n/- Возможна частичная или полная укомплектованность (по договоренности)./n/Условия:/n/- Для порядочных, платежеспособных жильцов;/n/- Без животных (или рассмотрим вариант);/n/- Долгосрочная аренда, с заключением договора. 	2025-12-03 12:32:25.231	2025-12-03 12:32:25.231	1036
109	Квартира 1-комн., 40 м2, 1 / 24 этаж	г Казань, ул Родины, д 26Е	40	35000	1	55.763169	49.191296	1	24	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок/n/Расположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад./n/Квартира:/n/- Чистая, светлая, с современным ремонтом;/n/- Вся необходимая мебель и техника;/n/- Возможна частичная или полная укомплектованность (по договоренности)./n/Условия:/n/- Для порядочных, платежеспособных жильцов;/n/- Без животных (или рассмотрим вариант);/n/- Долгосрочная аренда, с заключением договора. 	2025-12-03 12:29:57.684	2025-12-03 12:29:57.684	1034
106	Квартира Студия 15 м2, 3 / 5 этаж	г Казань, ул Рихарда Зорге, д 32 к 2	15	17000	0	55.754269	49.194422	3	5	Казань	не указан	1	Сдаётся уютная комната в современной квартире для приличных жильцов/n/Предлагаем вам уютную и полностью обустроенную комнату в чистой, светлой квартире. Всё создано для комфортного проживания: есть вся необходимая мебель и техника./n/Преимущества квартиры:/n/· Удобная планировка: Комната изолированная, а туалет и ванная — раздельные./n/· Приятное соседство: Вы будете жить рядом с спокойными, адекватными и уважающими друг друга соседями./n/· Идеальная транспортная доступность: В шаговой доступности остановки общественного транспорта, а также станции метро «Проспект Победы» и «Горки». Добраться до любого конца города не составит труда./n/· Вся инфраструктура рядом: Под рукой всё необходимое:/n/  · Продуктовый рынок «Мавлютова»/n/ · Медицинский колледж/n/  · Магазины, кафе и аптеки/n/Кому сдаём:/n/Мы ищем ответственных и аккуратных жильцов — студентам или семейным парам, которые ценят чистоту, порядок и своевременно вносят арендную плату. 	2025-12-03 12:22:43.35	2025-12-03 12:22:43.35	1025
\.


--
-- Data for Name: Review; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."Review" (id, "authorName", rating, comment, "createdAt") FROM stdin;
\.


--
-- Name: Application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."Application_id_seq"', 1, true);


--
-- Name: CommercialProperty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."CommercialProperty_id_seq"', 8, true);


--
-- Name: CountryProperty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."CountryProperty_id_seq"', 23, true);


--
-- Name: Image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."Image_id_seq"', 3243, true);


--
-- Name: NearbyPlace_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."NearbyPlace_id_seq"', 1, false);


--
-- Name: NewBuildingApartment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."NewBuildingApartment_id_seq"', 362, true);


--
-- Name: NewBuildingComplex_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."NewBuildingComplex_id_seq"', 17, true);


--
-- Name: ReadyApartment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."ReadyApartment_id_seq"', 13, true);


--
-- Name: Realtor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."Realtor_id_seq"', 1, false);


--
-- Name: RentalApartment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."RentalApartment_id_seq"', 220, true);


--
-- Name: Review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."Review_id_seq"', 1, false);


--
-- Name: Application Application_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Application"
    ADD CONSTRAINT "Application_pkey" PRIMARY KEY (id);


--
-- Name: CommercialProperty CommercialProperty_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."CommercialProperty"
    ADD CONSTRAINT "CommercialProperty_pkey" PRIMARY KEY (id);


--
-- Name: CountryProperty CountryProperty_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."CountryProperty"
    ADD CONSTRAINT "CountryProperty_pkey" PRIMARY KEY (id);


--
-- Name: Image Image_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Image"
    ADD CONSTRAINT "Image_pkey" PRIMARY KEY (id);


--
-- Name: NearbyPlace NearbyPlace_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."NearbyPlace"
    ADD CONSTRAINT "NearbyPlace_pkey" PRIMARY KEY (id);


--
-- Name: NewBuildingApartment NewBuildingApartment_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."NewBuildingApartment"
    ADD CONSTRAINT "NewBuildingApartment_pkey" PRIMARY KEY (id);


--
-- Name: NewBuildingComplex NewBuildingComplex_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."NewBuildingComplex"
    ADD CONSTRAINT "NewBuildingComplex_pkey" PRIMARY KEY (id);


--
-- Name: ReadyApartment ReadyApartment_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."ReadyApartment"
    ADD CONSTRAINT "ReadyApartment_pkey" PRIMARY KEY (id);


--
-- Name: Realtor Realtor_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Realtor"
    ADD CONSTRAINT "Realtor_pkey" PRIMARY KEY (id);


--
-- Name: RentalApartment RentalApartment_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."RentalApartment"
    ADD CONSTRAINT "RentalApartment_pkey" PRIMARY KEY (id);


--
-- Name: Review Review_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Review"
    ADD CONSTRAINT "Review_pkey" PRIMARY KEY (id);


--
-- Name: Image Image_commercialPropertyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Image"
    ADD CONSTRAINT "Image_commercialPropertyId_fkey" FOREIGN KEY ("commercialPropertyId") REFERENCES public."CommercialProperty"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Image Image_countryPropertyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Image"
    ADD CONSTRAINT "Image_countryPropertyId_fkey" FOREIGN KEY ("countryPropertyId") REFERENCES public."CountryProperty"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Image Image_newBuildingApartmentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Image"
    ADD CONSTRAINT "Image_newBuildingApartmentId_fkey" FOREIGN KEY ("newBuildingApartmentId") REFERENCES public."NewBuildingApartment"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Image Image_newBuildingComplexId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Image"
    ADD CONSTRAINT "Image_newBuildingComplexId_fkey" FOREIGN KEY ("newBuildingComplexId") REFERENCES public."NewBuildingComplex"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Image Image_readyApartmentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Image"
    ADD CONSTRAINT "Image_readyApartmentId_fkey" FOREIGN KEY ("readyApartmentId") REFERENCES public."ReadyApartment"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Image Image_rentalApartmentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Image"
    ADD CONSTRAINT "Image_rentalApartmentId_fkey" FOREIGN KEY ("rentalApartmentId") REFERENCES public."RentalApartment"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: NearbyPlace NearbyPlace_complexId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."NearbyPlace"
    ADD CONSTRAINT "NearbyPlace_complexId_fkey" FOREIGN KEY ("complexId") REFERENCES public."NewBuildingComplex"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: NewBuildingApartment NewBuildingApartment_complexId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."NewBuildingApartment"
    ADD CONSTRAINT "NewBuildingApartment_complexId_fkey" FOREIGN KEY ("complexId") REFERENCES public."NewBuildingComplex"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: root
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

\unrestrict E3cv0FIPxJYNIR3MOwAN4xrYH1QjDovZkbk7uLSG6NK9PZWL7Shd5k7zceYqdfO

