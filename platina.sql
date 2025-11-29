--
-- PostgreSQL database dump
--

\restrict NdRw5mbm6YbbZoYXfHbiyH78g0jHsYjzXKYzzjpUfM8fXQIKspeWsVMVYXdyVio

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
    "updatedAt" timestamp(3) without time zone NOT NULL
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
    "updatedAt" timestamp(3) without time zone NOT NULL
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
    "updatedAt" timestamp(3) without time zone NOT NULL
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
    "updatedAt" timestamp(3) without time zone NOT NULL
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

COPY public."CommercialProperty" (id, title, address, price, "pricePerM2", area, city, lat, lng, "hasFinishing", purpose, metro, "metroDistance", description, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: CountryProperty; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."CountryProperty" (id, title, address, metro, "metroDistance", city, price, lat, lng, "landArea", bedrooms, "totalFloors", "pricePerM2", description, "createdAt", "updatedAt") FROM stdin;
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

COPY public."ReadyApartment" (id, title, "complexName", address, city, area, price, "pricePerM2", bedrooms, floor, "totalFloors", lat, lng, metro, "metroDistance", description, developer, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Realtor; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."Realtor" (id, "fullName", phone, email, "avatarUrl", "position", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: RentalApartment; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."RentalApartment" (id, title, address, area, "pricePerMonth", bedrooms, lat, lng, floor, "totalFloors", city, metro, "metroDistance", description, "createdAt", "updatedAt") FROM stdin;
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

SELECT pg_catalog.setval('public."CommercialProperty_id_seq"', 1, false);


--
-- Name: CountryProperty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."CountryProperty_id_seq"', 1, false);


--
-- Name: Image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."Image_id_seq"', 396, true);


--
-- Name: NearbyPlace_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."NearbyPlace_id_seq"', 1, false);


--
-- Name: NewBuildingApartment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."NewBuildingApartment_id_seq"', 273, true);


--
-- Name: NewBuildingComplex_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."NewBuildingComplex_id_seq"', 14, true);


--
-- Name: ReadyApartment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."ReadyApartment_id_seq"', 1, false);


--
-- Name: Realtor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."Realtor_id_seq"', 1, false);


--
-- Name: RentalApartment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."RentalApartment_id_seq"', 1, false);


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

\unrestrict NdRw5mbm6YbbZoYXfHbiyH78g0jHsYjzXKYzzjpUfM8fXQIKspeWsVMVYXdyVio

