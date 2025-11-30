--
-- PostgreSQL database dump
--

\restrict ziSXW3DoaNSHrxq3L1XvCb7wssxxdSCsBcN0SL7uWRMhy0Pcl7Pz5zt6hM6weUG

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
\.


--
-- Data for Name: ReadyApartment; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."ReadyApartment" (id, title, "complexName", address, city, area, price, "pricePerM2", bedrooms, floor, "totalFloors", lat, lng, metro, "metroDistance", description, developer, "createdAt", "updatedAt", "currentId") FROM stdin;
1	Квартира 2-комн., 54 м2, 6 / 6 этаж	Нет ифнормации	Москва, ул. Липовый парк, д. 7	Казань	54	4490000	1	2	6	6	55.830943	48.682176	Нет информации	10	🏡 Продаётся уютная двухкомнатная квартира в посёлке Васильево!\n\n✨ Отличное предложение для комфортной жизни! Квартира полностью меблирована, а вся техника остаётся новому владельцу. Вам не нужно тратить время и деньги на обустройство – просто заезжайте и наслаждайтесь своим новым домом!\n\n📍 Удобное расположение: рядом магазины, школы и остановки общественного транспорта.\n\n🌿 Просторные комнаты, светлые окна, свежий ремонт – всё это создаёт атмосферу уюта и комфорта.\n\n💰 Не упустите шанс стать владельцем этой замечательной квартиры! Звоните для записи на просмотр!	lpi	2025-11-29 15:28:10.963	2025-11-29 15:28:10.963	68
2	Квартира 3-комн., 57.10 м2, 1 / 5 этаж	Нет ифнормации	г Казань, ул Кулахметова, д 6	Казань	57	7000000	1	3	1	5	55.822948	49.052659	Нет информации	10	Квартира на продаже\n\nПродается квартира по адресу Куллахметова 6.\n\n- Первый этаж пятиэтажного дома\n- Косметический ремонт\n- Удобное месторасположение\n- Развитая инфраструктура: магазины, школы, детские сады в шаговой доступности\n- Возможен торг\n\nКвартира подходит как для проживания, так и для последующей аренды.\n\nЗвоните для подробностей и записи на просмотр!	lpi	2025-11-29 16:48:52.529	2025-11-29 16:48:52.529	300
3	Квартира 2-комн., 52 м2, 5 / 12 этаж	Нет ифнормации	г Казань, ул Тэцевская, д 4Б	Казань	52	10599000	1	2	5	12	55.850403	49.065963	Нет информации	10	🏢 Продается шикарная квартира!\n\n✨ Дизайнерский ремонт\n📏 Общая площадь 52 кв.м\n📍 Улица Тэцевская, 4Б\n\nКомфорт и уют в отличном районе с развитой инфраструктурой:\n- Закрытая территория\n- В пешей доступности школы, садики, магазины и аптеки\n- Метро рядом\n\n💼 Один взрослый собственник\n📄 Чистая продажа\n\nПоказ в любое удобное для Вас время!\nНе упустите шанс стать владельцем этой стильной квартиры!\n📞 Звоните для записи на просмотр!	lpi	2025-11-30 09:34:33.114	2025-11-30 09:34:33.114	587
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
33	Квартира 2-комн., 45 м2, 4 / 5 этаж	г Казань, ул Гагарина, д 73А	45	40000	2	55.838299	49.094215	4	5	Казань	не указан	1	Сдаётся двухкомнатная квартира на гагарина 73а на длительный срок. Эта уютная квартира идеально подойдёт для порядочных людей, ценящих комфорт и удобство. В пешей доступности расположены магазины, остановки общественного транспорта, что делает её отличным вариантом для жизни. Функциональная планировка позволяет максимально использовать пространство, а светлые комнаты создают атмосферу уюта и тепла. Развита инфраструктура района обеспечит вам лёгкий доступ ко всем необходимым услугам. Не упустите возможность жить в комфортной и уютной квартире! Свяжитесь для просмотра и получения дополнительной информации.	2025-11-30 09:23:50.609	2025-11-30 09:23:50.609	615
34	Квартира 2-комн., 45 м2, 7 / 9 этаж	г Казань, ул Маршала Чуйкова, д 31	45	40000	2	55.836782	49.127318	7	9	Казань	не указан	1	Сдаётся двухкомнатная квартира на Чуйкова 31 на длительный срок. Эта уютная квартира идеально подойдёт для порядочных людей, ценящих комфорт и удобство. В пешей доступности расположены магазины, остановки общественного транспорта, что делает её отличным вариантом для жизни. Функциональная планировка позволяет максимально использовать пространство, а светлые комнаты создают атмосферу уюта и тепла. Развита инфраструктура района обеспечит вам лёгкий доступ ко всем необходимым услугам. Не упустите возможность жить в комфортной и уютной квартире! Свяжитесь для просмотра и получения дополнительной информации.	2025-11-30 09:31:06.29	2025-11-30 09:31:06.29	614
35	Квартира 1-комн., 52 м2, 16 / 20 этаж	Республика Татарстан (Татарстан), Казань, проспект Победы, 46	52	40000	1	55.747211	49.206289	16	20	Казань	не указан	1	Сдам светлую 2-комнатную евро-квартиру возле метро!\nЖК ФЛАГМАН ЕВРО2ШКА\nОтличное предложение для тех, кто ценит комфорт и удобство! Просторная квартира расположена рядом с проспектом Победы, что обеспечивает легкий доступ к основным транспортным артериям.\n\nПреимущества квартиры:\n- Большие светлые комнаты с современным ремонтом\n- Полностью оборудованная кухня с новой техникой\n- Уютная ванная комната с качественной сантехникой\n- Балкон для отдыха и наслаждения видом\n\nИнфраструктура:\n- В шаговой доступности магазины, кафе и парк\n- Удобный общественный транспорт рядом\n\nЭта квартира идеально подходит для семей или работающих профессионалов. Не упустите возможность, звоните для просмотров!	2025-11-30 09:54:13.972	2025-11-30 09:54:13.972	636
36	Квартира 1-комн., 37 м2, 6 / 19 этаж	Республика Татарстан (Татарстан), Казань, ЖК Легенда	37	36000	1	55.766764	49.17235	6	19	Казань	не указан	1	Сдается 1-комнатная квартира на длительный срок\n\nРасположение: шаговая доступность к метро, рядом вся необходимая инфраструктура: аптеки, магазины, кафе, школа, детский сад.\n\nКвартира:\n- Чистая, светлая, с современным ремонтом\n- Вся необходимая мебель и техника\n- Возможна частичная или полная укомплектованность (по договоренности)\n\nУсловия:\n- Для порядочных, платежеспособных жильцов\n- Без животных (или рассмотрим вариант)\n- Долгосрочная аренда, с заключением договора\n- Предоплата + залог	2025-11-30 09:59:29.403	2025-11-30 09:59:29.403	659
37	Квартира Студия 23 м2, 1 / 9 этаж	г Казань, ул Космонавтов, д 55	23	30000	0	55.798576	49.195518	1	9	Казань	не указан	1	КАЗАНЬ СТУДИЯ — ул. Космонавтов 55 (рядом Советская площадь)\n\nСдается светлая и тёплая студия с качественным евро ремонтом. Готова к въезду, аккуратно оформлена, функциональная кухня и удобная жилая зона. Отличная транспортная развязка и вся инфраструктура в шаговой доступности: магазины, аптеки, остановки общественного транспорта. Идеально для одного человека или пары, кто ценит комфорт и расположение.\n\nСДАЕТСЯ С 1 СЕНТЯБРЯ ПО 1 МАЯ!\nГотов показать в удобное время, пишите или звоните для организации просмотра.	2025-11-30 10:01:49.724	2025-11-30 10:01:49.724	692
38	Квартира Студия 24 м2, 1 / 9 этаж	г Казань, ул Космонавтов, д 55	24	30000	0	55.798576	49.195518	1	9	Казань	не указан	1	Уютная студия — ул. Космонавтов 55 (рядом Советская площадь)\n\nСдается светлая и тёплая студия с качественным евро ремонтом. Готова, аккуратно оформлена, функциональная кухня и удобная жилая зона. Отличная транспортная развязка и вся инфраструктура в шаговой доступности: магазины, аптеки, остановки общественного транспорта. Идеально для одного человека или пары, кто ценит комфорт и расположение.\n\nГотов показать в удобное время, пишите или звоните для организации просмотра.	2025-11-30 10:04:14.918	2025-11-30 10:04:14.918	701
39	Квартира 1-комн., 44 м2, 3 / 24 этаж	Республика Татарстан (Татарстан), Казань, Краснококшайская улица, 60	44	38000	1	55.810536	49.074209	3	24	Казань	не указан	1	Сдаётся светлая, просторная 1‑комнатная квартира 44 м² на 3‑м этаже в новом жилом комплексе (постройка 2025). Выполнен новый дизайнерский ремонт, квартира никогда не сдавалась.\nОтличное расположение — развитая инфраструктура и удобная транспортная доступность.\n\n• Полностью укомплектована новой техникой\n• Посудомоечная машина\n• Кондиционер\n• Холодильник, плита, духовой шкаф, стиральная машина (всё новое)\n• Новый дизайнерский ремонт — никто не жил\n• Комфортная планировка, 44 м² — просторная кухня‑гостиная и комната\n• 3‑й этаж — удобный уровень, без верхнего шума\n• Новый ЖК 2025 года — современная инфраструктура и благоустройство	2025-11-30 10:06:01.946	2025-11-30 10:06:01.946	753
\.


--
-- Data for Name: Review; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."Review" (id, "authorName", rating, comment, "createdAt") FROM stdin;
\.


--
-- Name: Application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."Application_id_seq"', 1, false);


--
-- Name: CommercialProperty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."CommercialProperty_id_seq"', 5, true);


--
-- Name: CountryProperty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."CountryProperty_id_seq"', 19, true);


--
-- Name: Image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."Image_id_seq"', 1135, true);


--
-- Name: NearbyPlace_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."NearbyPlace_id_seq"', 1, false);


--
-- Name: NewBuildingApartment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."NewBuildingApartment_id_seq"', 311, true);


--
-- Name: NewBuildingComplex_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."NewBuildingComplex_id_seq"', 14, true);


--
-- Name: ReadyApartment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."ReadyApartment_id_seq"', 3, true);


--
-- Name: Realtor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."Realtor_id_seq"', 1, false);


--
-- Name: RentalApartment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."RentalApartment_id_seq"', 39, true);


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

\unrestrict ziSXW3DoaNSHrxq3L1XvCb7wssxxdSCsBcN0SL7uWRMhy0Pcl7Pz5zt6hM6weUG

