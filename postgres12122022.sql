--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2022-12-12 02:59:37

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 16470)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16469)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.category ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 212 (class 1259 OID 16476)
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16475)
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.image ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 214 (class 1259 OID 16482)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp without time zone,
    number character varying(255),
    price real NOT NULL,
    status integer,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16481)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 16488)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(50),
    password character varying(255),
    role character varying(255)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16487)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.person ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 16496)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    date_time_of_created timestamp without time zone,
    description text NOT NULL,
    price real NOT NULL,
    title text NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16505)
-- Name: product_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);


ALTER TABLE public.product_cart OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16504)
-- Name: product_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product_cart ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 16495)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3350 (class 0 OID 16470)
-- Dependencies: 210
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, name) VALUES (1, 'Рефракторы');
INSERT INTO public.category (id, name) VALUES (2, 'Рефлекторы');
INSERT INTO public.category (id, name) VALUES (3, 'Линзы');


--
-- TOC entry 3352 (class 0 OID 16476)
-- Dependencies: 212
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image (id, file_name, product_id) VALUES (1, 'f6456251-15d5-4217-8a33-f8a219de9b0a.telescope-synta-sky-watcher-bk-707az2_1.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (2, '626b5bba-f13e-4826-b5b8-b1fbb60be096.telescope-synta-sky-watcher-bk-707az2_2.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (3, 'a36362f9-4904-467c-b8a2-ea186f6210b7.telescope-synta-sky-watcher-bk-707az2-d1.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (4, '8469fa98-fe7c-49fa-a5b1-e501461fb07f.', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (5, '2bc559f1-5696-4a17-b48b-6a5a1ec08613.', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (6, '26907c0c-1bcd-4080-92e4-afc347da9508.sky-watcher-telescope-evostar-909-az-pronto.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (7, '7449761a-b4d9-446d-aa53-38eb3bb3924f.', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (8, '257851f9-a351-4171-b115-a27833ecad7d.', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (9, '3d5fa48a-a49b-49f3-9863-c2ad1dfd1337.', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (10, 'ea15de9a-6446-4736-b1f6-8e6f9a05e6bf.', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (11, '1e125d97-4a52-4c28-8a2e-39433526ccce.sky-watcher-telescope-dob-100-heritage.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (12, '451ca295-7c6f-4985-9fe4-84d54ee035c4.sky_watcher_telescope_dob_100_heritage_2.jpeg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (13, '85d8a0ab-dd9c-41a1-8169-897062275ddd.', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (14, '876c869b-dc9f-49ad-bd18-04762a6612cc.', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (15, 'd20bac48-1d9c-4214-a609-a53caa19ce67.', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (16, '585e9ac5-4a2c-4420-b80e-46a89cfcc35f.telescope-sky-watcher-dob-8in_1.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (17, 'c152710c-77cd-4ceb-ba8a-059730f2d816.telescope-sky-watcher-dob-8in_2.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (18, '83ed57e7-a12f-431d-bb83-3b7f89bd8689.', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (19, '9defa2da-232e-4d70-8094-7618f1cb9646.', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (20, '50a2bb77-3f3f-4e1c-8b15-e621baafaca1.', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (21, '75eac24e-9ba0-4966-98a4-8aa0e03fc876.synta-sky-watcher-3x-1-25in-barlow-lens.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (22, '91c596ac-0e73-4f3d-bd2c-636331442a4f.synta-sky-watcher-3x-1-25in-barlow-lens_2.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (23, '26fd2218-e3c1-4c15-93c9-5e8206b86ca8.', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (24, '76ade9cb-63f9-4685-9077-a0b3d9649175.', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (25, '93b96d2e-359b-4c33-b6f2-6a459ef5d067.', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (26, 'b1ce2e47-dd3f-4209-bd1f-195c479f7043.synta-sky-watcher-6-3mm-1-25in-plossl.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (27, 'e0e55b2e-726d-4bef-9d8c-325572b3cbcc.', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (28, '34f44a7d-2e55-400a-bfeb-742aaee4cabd.', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (29, '2f85c052-607b-417e-b36e-b83a3384dee6.', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (30, 'c71a9cb6-95e5-4999-8255-3c8b3b0b6690.', 6);


--
-- TOC entry 3354 (class 0 OID 16482)
-- Dependencies: 214
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (1, 1, '2022-12-12 01:52:12.437506', 'f7e9786c-627b-425a-8dd8-3ab9ef161419', 28000, 1, 2, 1);


--
-- TOC entry 3356 (class 0 OID 16488)
-- Dependencies: 216
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, login, password, role) VALUES (1, 'admin', '$2a$10$SM.YgPlOtBXUVPm5xDv24eOxb0vDYDqz53xL7.uOR86SZwkLTZAlu', 'ROLE_ADMIN');
INSERT INTO public.person (id, login, password, role) VALUES (2, 'user_1', '$2a$10$xepi1GPK6vlKgTixA26XLucmBqi/X.IuRgKyM8SCGaYiCIE20aYe2', 'ROLE_USER');


--
-- TOC entry 3358 (class 0 OID 16496)
-- Dependencies: 218
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, date_time_of_created, description, price, title, category_id) VALUES (1, '2022-12-12 01:40:37.722608', 'Линзовый телескоп Sky-Watcher BK 707AZ2 станет прекрасным подарком для начинающего астронома. Эта модель отличается качественной оптикой и надежной сборкой. С помощью этого телескопа можно изучать объекты Солнечной системы и вести ландшафтные наблюдения. Благодаря небольшим размерам и малому весу рефрактор удобно транспортировать.
Оптика Sky-Watcher BK707AZ2
70-миллиметровый ахроматический объектив позволяет увидеть кратеры на поверхности Луны, фазы Венеры, пояса Юпитера, кольца Сатурна, Уран и Нептун в виде звезд и множество других небесных тел. На линзы нанесено многослойное просветляющее покрытие, так что картинка получается четкой, резкой и хорошо детализированной. Хроматические аберрации при этом минимальны.
Для поиска объектов используется 5-кратный оптический искатель с полем зрения 24°.
Реечный фокусер обеспечивает плавную настройку резкости. Sky-Watcher BK 707AZ2 комплектуется двумя окулярами: 25 мм и 10 мм. Начинать наблюдения лучше с окуляра с большим фокусным расстоянием.
Защитная бленда предотвращает появление засветок и выпадение росы на линзу объектива.
Монтировка Sky-Watcher BK707AZ2
Оптическая труба устанавливается на азимутальную монтировку AZ2. Монтировка отличается понятным управлением. Тренога поставляется в собранном виде, что позволяет сэкономить время на подготовку телескопа к работе. Тренога снабжена удобным лотком для дополнительных аксессуаров.
Sky-Watcher BK707AZ2 купить можно прямо на этой странице. Телескоп станет прекрасным выбором для начинающего и опытного астронома.
Характеристики:
Тип телескопа	рефрактор
Оптическая схема	ахромат
Покрытие оптики	полное многослойное
Диаметр объектива (апертура), мм	70
Фокусное расстояние, мм	700
Максимальное полезное увеличение, крат	140
Светосила (относительное отверстие)	f/10
Окуляры в комплекте	25 мм, 10 мм
Посадочный диаметр окуляров, дюймов	1,25
Линза Барлоу в комплекте	2x
Искатель	оптический, 6x24
Фокусер	реечный
Тренога	алюминиевая
Тип управления телескопом	ручной
Тип монтировки	азимутальная, AZ2
Дополнительно	есть стандартная Т-резьба (М42) для монтажа зеркальной фотокамеры
Материал трубы	алюминий
Вес трубы, кг	1,45
Уровень пользователя	для начинающих
', 28000, 'Телескоп Sky-Watcher BK 707AZ2 ', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, title, category_id) VALUES (2, '2022-12-12 01:43:35.566768', 'Sky-Watcher Evostar 909 – рефрактор-ахромат для изучения ближнего космоса и наземных объектов. Лучше всего он проявляет себя при наблюдениях Луны, планет Солнечной системы и их спутников. Ландшафтные наблюдения ведутся с применением диагональной призмы, включенной в комплект поставки. Телескоп прост в управлении, эффективен в наблюдениях и способен стать верным помощником в изучении космоса.
В телескопе используется двухэлементная оптическая конструкция с воздушным зазором. Благодаря этому передаваемое изображение свободно от хроматических искажений, а все детали видно четко и ясно. Оптика хорошо собирает свет, что помогает при изучении тусклых объектов космоса. Наблюдения можно вести на разных увеличениях – в комплект поставки уже включены два разнофокусных окуляра.
Монтировка AZ PRONTO интересна тем, что в отличие от обычной азимутальной монтировки у нее есть ручки тонких движений. Используя их, можно регулировать положение оптической трубы по азимуту и высоте. Ход монтировки плавный и ровный, во время наведения и слежения не ощущается рывков или качания.
Телескоп установлен на алюминиевую треногу с лотком для аксессуаров. Высоту ножек треноги можно регулировать.
Характеристики:
Тип телескопа	рефрактор
Оптическая схема	ахромат
Диаметр объектива (апертура), мм	90
Фокусное расстояние, мм	900
Максимальное полезное увеличение, крат	180
Светосила (относительное отверстие)	f/10
Окуляры в комплекте	10 мм (90х), 25 мм (36х)
Посадочный диаметр окуляров, дюймов	1,25
Искатель	оптический, 6x30
Тренога	алюминиевая
Высота треноги, мм	785–1500
Лоток для аксессуаров	есть
Тип управления телескопом	ручной
Тип монтировки	азимутальная
Дополнительно	диагональная призма 90°, 1,25";
диапазон регулировки положения монтировки: по азимуту: 360°, по высоте: от –70° до +80°
Уровень пользователя	для начинающих
Уровень сложности сборки и настройки	просто
Предмет наблюдения	планеты Солнечной системы, наземные объекты
', 57000, 'Телескоп Sky-Watcher Evostar 909 AZ PRONTO на треноге Star Adventurer', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, title, category_id) VALUES (3, '2022-12-12 01:45:02.128866', 'Sky-Watcher Dob 100/400 Heritage – небольшой и легкий телескоп на настольной монтировке, который станет отличным подарком начинающему астроному или увлеченному наукой ребенку. Телескопом легко управлять, а наблюдения можно вести даже не покидая квартиры. Благодаря компактной конструкции телескоп можно поставить на подоконник или стол и изучать космос прямо из своей комнаты.
Sky-Watcher Dob 100/400 Heritage – это рефлектор Ньютона, который лучше всего показывает объекты дальнего космоса. Для их изучения в комплект поставки включены два окуляра и линза Барлоу. Благодаря им можно легко подобрать оптимальное для наблюдений увеличение – дополнительные аксессуары не понадобятся. Оптика телескопа также весьма эффективна при изучении Луны. Параболическое главное зеркало очищает передаваемую картинку от сферических искажений и позволяет видеть космос детально и четко.
Телескоп установлен на деревянную монтировку Добсона с ручным управлением. Наведение на объекты несложное, ход монтировки плавный и надежный.
Характеристики:
Тип телескопа	рефлектор
Оптическая схема	Ньютона
Покрытие оптики	диоксид кремния
Диаметр главного зеркала (апертура), мм	100
Форма линзы (зеркала)	парабола
Фокусное расстояние, мм	400
Максимальное полезное увеличение, крат	200
Светосила (относительное отверстие)	f/4
Разрешающая способность, угл. секунд	1,15
Проницающая способность (звездная величина, приблизительно)	11,8
Окуляры в комплекте	10 мм (40х), 25 мм (16х)
Посадочный диаметр окуляров, дюймов	1,25
Линза Барлоу в комплекте	2x
Искатель	с красной точкой
Фокусер	реечный
Тип управления телескопом	ручной
Тип монтировки	Добсона
Уровень пользователя	для начинающих
Уровень сложности сборки и настройки	крайне просто
Предмет наблюдения	объекты дальнего космоса
', 23000, 'Телескоп Sky-Watcher Dob 100/400 Heritage, настольный', 2);
INSERT INTO public.product (id, date_time_of_created, description, price, title, category_id) VALUES (5, '2022-12-12 01:47:16.287352', 'Качественная трехкратная линза Барлоу Sky-Watcher 3x позволит расширить диапазон увеличений телескопа без приобретения дополнительных окуляров. Используя данную модель, вы сможете увеличить кратность телескопа с каждым окуляром в три раза.
Линза представляет собой двухэлементный ахромат. Оптика изготовлена из высококачественного стекла, на оптические поверхности нанесено полное многослойное просветление. Картинка получается четкой и контрастной, без хроматизма.
Линза Барлоу комплектуется защитной крышкой окуляра.
Технические характеристики
Оптическая схема	2-элементный ахромат
Просветление	полное многослойное просветляющее
Увеличение, крат	3
Посадочный диаметр, дюймов	1,25
', 4500, 'Линза Барлоу Sky-Watcher 3x, 1,25"', 3);
INSERT INTO public.product (id, date_time_of_created, description, price, title, category_id) VALUES (6, '2022-12-12 01:48:19.772772', 'С помощью окуляра Sky-Watcher Plössl 6,3 мм удобно вести наблюдения за Луной и планетами Солнечной системы. Эта модель позволяет получить высокое увеличение, так что вы сможете разглядеть множество интересных деталей. Окуляр состоит из четырех оптических элементов, благодаря чему изображение получается максимально резким и контрастным. Кроме того, линзы покрыты специальным просветляющим составом, который значительно повышает светопропускание оптики.
Окуляр подходит к телескопам любых производителей – благодаря стандартному посадочному диаметру его можно использовать с большинством моделей.
Окуляр комплектуется двумя защитными крышками.
Технические характеристики
Оптическая схема	4 элемента
Просветление	полное просветляющее
Фокусное расстояние, мм	6,3
Посадочный диаметр, дюймов	1,25

', 7400, 'Окуляр Sky-Watcher Plossl 6,3 мм, 1,25"', 3);
INSERT INTO public.product (id, date_time_of_created, description, price, title, category_id) VALUES (4, NULL, 'Телескоп Sky-Watcher Dob 8" 200/1200 – это рефлектор, установленный на азимутальную монтировку Добсона. Эта модель идеальна для изучения объектов дальнего космоса: туманностей, галактик, звездных скоплений, комет, астероидов и других небесных тел. Телескоп обеспечивает передачу картинки высокого качества, особенно при загородных наблюдениях.
Оптика Sky-Watcher Dob 8"
Главное зеркало изготовлено из боросиликатного стекла марки Pyrex. Благодаря низкому коэффициенту теплового расширения зеркало сохраняет свою форму даже при резких перепадах температур. Вторичное зеркало Sky-Watcher Dob 8" 200/1200 крепится при помощи сверхтонких растяжек, не вносящих искажений в изображение.
Для настройки резкости используется высокоточный фокусер Крейфорда с посадочным диаметром 2". В комплект входит переходник на 1,25", а также два окуляра системы Кельнера.
Монтировка телескопа Sky-Watcher Dob 8"
Монтировка Добсона ставится на землю и обеспечивает максимально устойчивое положение телескопа. Монтировка очень проста в сборке и управлении, поэтому с ней легко справится даже начинающий астроном.
Sky-Watcher Dob 8" купить стоит в том случае, если у вас есть возможность вести наблюдения за городом. Рефлекторы не любят городской засветки и лучший результат показывают вне городской черты. К тому же из-за монтировки Добсона телескоп достаточно габаритный, использовать его для наблюдений с балкона или лоджии сильно затруднительно.
Характеристики:
Тип телескопа	рефлектор
Оптическая схема	Ньютона
Покрытие оптики	полное многослойное
Диаметр главного зеркала (апертура), мм	203
Форма линзы (зеркала)	парабола
Фокусное расстояние, мм	1200
Светосила (относительное отверстие)	f/5,9
Окуляры в комплекте	Super 25 мм, Super 10 мм
Посадочный диаметр окуляров, дюймов	1,25/2
Искатель	оптический, 8x50
Фокусер	Крейфорда, 2
Тип управления телескопом	ручной
Тип монтировки	Добсона
Платформа установки телескопа	азимутальная
Дополнительно	есть стандартная Т-резьба (М42) для монтажа зеркальной фотокамеры
Материал трубы	алюминий
Уровень пользователя	для начинающих, для опытных
', 108000, ' Телескоп Sky-Watcher Dob 8" (200/1200)', 2);


--
-- TOC entry 3360 (class 0 OID 16505)
-- Dependencies: 220
-- Data for Name: product_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 209
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 1, false);


--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 211
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 30, true);


--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 213
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, true);


--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 215
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 2, true);


--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 219
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 1, true);


--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 217
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 6, true);


--
-- TOC entry 3191 (class 2606 OID 16474)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3193 (class 2606 OID 16480)
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- TOC entry 3195 (class 2606 OID 16486)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3197 (class 2606 OID 16494)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3203 (class 2606 OID 16509)
-- Name: product_cart product_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3199 (class 2606 OID 16503)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3201 (class 2606 OID 16511)
-- Name: product uk_qka6vxqdy1dprtqnx9trdd47c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);


--
-- TOC entry 3205 (class 2606 OID 16517)
-- Name: orders fk1b0m4muwx1t377w9if3w6wwqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3207 (class 2606 OID 16527)
-- Name: product fk1mtsbur82frn64de7balymq9s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3206 (class 2606 OID 16522)
-- Name: orders fk787ibr3guwp6xobrpbofnv7le; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3204 (class 2606 OID 16512)
-- Name: image fkgpextbyee3uk9u6o2381m7ft1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3209 (class 2606 OID 16537)
-- Name: product_cart fkhpnrxdy3jhujameyod08ilvvw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3208 (class 2606 OID 16532)
-- Name: product_cart fksgnkc1ko2i1o9yr2p63ysq3rn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);


-- Completed on 2022-12-12 02:59:40

--
-- PostgreSQL database dump complete
--

