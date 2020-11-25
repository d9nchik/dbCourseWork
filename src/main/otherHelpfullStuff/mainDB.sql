CREATE DATABASE "courseWork";

CREATE SCHEMA "public";

-- creating employee
create table "Employees"
(
    "EmployeeID"  serial      not null,
    "LastName"    varchar(20) not null,
    "FirstName"   varchar(10) not null,
--     if we can not determine sex it should be null
    "IsMale"      boolean default true,
    "Title"       varchar(30),
--     TODO: maybe should be not null
    "BirthDate"   date,
    "HireDate"    date,
    "FireDate"    date,
    "Address"     varchar(60),
    "City"        varchar(15),
    "Region"      varchar(15),
    "PostalCode"  varchar(10),
    "Country"     varchar(15),
    "MobilePhone" varchar(24),
    "Notes"       text,
    "ReportsTo"   int
        constraint employees_employees_employeerid_fk references "Employees" ("EmployeeID") on update cascade on delete restrict,
    "PhotoPath"   varchar(255),
    PRIMARY KEY ("EmployeeID")
);

ALTER TABLE "Employees"
    ADD CHECK (extract(YEAR from age("BirthDate")) > 18 );

INSERT INTO "Employees" ("LastName", "FirstName", "Title", "BirthDate", "HireDate", "FireDate", "Address", "City",
                         "Region", "PostalCode", "Country", "MobilePhone", "Notes", "ReportsTo", "IsMale")
VALUES ('Олег', 'Медведєв', 'Охоронець', '1984-01-10', '2004-09-07', null, 'вул. Володимирська, 6', 'м. Луцьк', '-',
        '43007', 'Ukraine', '0975962965', 'Проблеми з ігроманією', 2, true),
       ('Роман', 'Буценко', 'Директор Охорони', '1965-09-07', '1994-03-27', null, 'вул. Конякіна, 5', 'м. Луцьк', '-',
        '43017', 'Ukraine', '0965932965', 'Досить тяжко звикає до нових речей', 3, true),
       ('Максим ', 'Вірченко', 'Директор Санаторію', '1968-04-05', '2002-08-15', null, 'вул. Арцеулова, 15', 'м. Луцьк',
        '-', '43005', 'Ukraine', '0966666666',
        'Після довготривалого правління спромігся підвищити рівень зарплат у 10 разів', null, true),
       ('Максим', 'Хомич', 'Охоронець', '1984-07-28', '2003-06-27', null, 'вул. Мазепи, 13', 'м. Луцьк', '-',
        '43037', 'Ukraine', '0995364965', null, 2, true),
--        Reception
       ('Юлія', 'Снігур', 'Рецепціоніст', '1982-05-16', '2001-11-12', null, 'вул. Театральна, 1', 'м. Луцьк', '-',
        '43021', 'Ukraine', '0967363555', 'Може переконати клієнта', 3, false),
       ('Ангеліна', 'Пазій', 'Рецепціоніст', '1985-05-16', '2002-03-01', null, 'просп. Відродження, 3', 'м. Луцьк', '-',
        '43071', 'Ukraine', '0962961772', 'Найкраще розбирається в косметиці', 3, false),
--        Housekeeper
       ('Яна', 'Майданик', 'Головна покоївка', '1969-07-07', '2001-09-17', null, 'вул. Чорновола, 17', 'м. Луцьк', '-',
        '43023', 'Ukraine', '0969390966', null, 3, false),
       ('Софія', 'Лобов', 'Покоївка', '1971-11-08', '2003-07-14', null, 'просп. Перемоги, 4', 'м. Луцьк', '-',
        '43005', 'Ukraine', '0961246610', 'Мати багатодітної сім''ї', 7, false),
       ('Марія', 'Цілуйко', 'Покоївка', '1969-04-03', '2002-06-20', null, 'вул. Мазепи, 8', 'м. Луцьк', '-',
        '43007', 'Ukraine', '0969624021', 'Клаустрофобія', 7, false),
       ('Соломія', 'Кашпур', 'Головна Покоївка', '1962-02-23', '2002-06-20', '2010-04-16', 'вул. Мазепи, 8', 'м. Луцьк',
        '-', '43007', 'Ukraine', '0966540075', 'Пішла на пенсію', 3, false),
--        Cashier
       ('Дмитро', 'Грицаюк', 'Продавець', '1985-05-20', '2009-01-15', null, 'вул. Богдана-Хмельницького, 8а',
        'м. Луцьк',
        '-',
        '43007', 'Ukraine', '0963807886', 'Манхетен - це до нього', 3, true),
       ('Марта', 'Парамонова', 'Продавець', '1990-03-27', '2010-04-16', null, 'вул. Героїв Крут, 9', 'м. Луцьк', '-',
        '43007', 'Ukraine', '0960650318', 'Класно пародує сердючку', 3, false),
--        Massage
       ('Анастасія', 'Кравцова', 'Масажист', '1985-02-21', '2005-03-26', null, 'вул. Бенделіані, 7', 'м. Луцьк', '-',
        '43007', 'Ukraine', '0967606096', 'Закінчила Віницький університет з червоним дипломом', 7, false),
       ('Максим', 'Циганков', 'Масажист', '1984-01-10', '2003-12-06', null, 'вул. Гулака-Артемовського, 16', 'м. Луцьк',
        '-',
        '43007', 'Ukraine', '09676772215', 'Раніше був ортопедом але після перенавчання опинився у нас', 7, true),
--        Electric
       ('Максим', 'Горобченко', 'Електрик', '1979-06-29', '2007-11-07', null, 'вул. Шопена, 10', 'м. Луцьк', '-',
        '43007', 'Ukraine', '0968894305', 'Електрик не доречно, осільки займається налаштуванням всілякої електроніки',
        7, true),
--        Plumber
       ('Олександр', 'Лазоренко', 'Сантехнік', '1986-07-01', '2009-09-23', null, 'вул. Кривий вал, 26', 'м. Луцьк', '-',
        '43007', 'Ukraine', '0968505885', 'Найбільший шмат його роботи це басейн саме там ви його й можете зустріти', 7,
        true);

-- creating eliteSystemStatus

create table "EliteStatus"
(
    "EliteStatusID" serial      not null,
    "Name"          varchar(25) not null,
    "Description"   text
);

create unique index elite_status_elitestatusid_uindex
    on "EliteStatus" ("EliteStatusID");

create unique index elite_status_name_uindex
    on "EliteStatus" ("Name");

alter table "EliteStatus"
    add constraint elite_status_pk
        primary key ("EliteStatusID");

INSERT INTO "EliteStatus" ("Name", "Description")
VALUES ('Classic', 'Тренажерна зала та групові заняття'),
       ('Classic + Басейн', 'Тренажерна зала та групові заняття + Басейн'),
       ('Premium', 'Тренажерна зала та групові заняття + Басейн + Бані і SPA + Premium-сервіси');

-- creating customers
create table "Customers"
(
    "CustomerID"           serial                not null,
    "LastName"             varchar(20)           not null,
    "FirstName"            varchar(10)           not null,
    "MoneyBalance"         int     default 0     not null,
    "BirthDate"            date,
    "PassportRecordNumber" varchar(9)            not null,
    "IsBanned"             boolean default false not null,
    "Notes"                text
);

create unique index customers_customerid_uindex
    on "Customers" ("CustomerID");

create unique index customers_passportrecordnumber_uindex
    on "Customers" ("PassportRecordNumber");

alter table "Customers"
    add constraint customers_pk
        primary key ("CustomerID");

ALTER TABLE "Customers"
    ADD CHECK ("MoneyBalance" > -500 AND (length("PassportRecordNumber") = 9 or length("PassportRecordNumber") = 8));

INSERT INTO "Customers" ("LastName", "FirstName", "BirthDate", "PassportRecordNumber", "IsBanned", "Notes",
                         "MoneyBalance")
VALUES ('Мельник', 'Максим', '1948-12-08', 'AC234506', false, 'Любить пісні жанру ретро', 100),
       ('Поліщук', 'Марта', '1960-05-29', '001527464', false, 'Гарно малює', 50),
       ('Шевченко', 'Матвій', '1952-02-19', 'BKC148087', false, 'Не любить, коли відсутнє прибирання в номері', 0),
       ('Бойко', 'Артем', '1963-08-30', '002824240', false, 'Забуває випивати таблетки для серця', 67),
       ('Ковальчук', 'Анна', '1955-03-04', 'AM234316', false, 'Любить пробіжки зранку', 34),
       ('Коваленко', 'Андрій', '1937-09-19', 'AC138506', false, 'Має не допуск від лікаря до басейну', 0),
       ('Бондаренко', 'Олександр', null, '001825230', true, 'Вчинив пʼяний дебош', -100),
       ('Ткаченко', 'Софія', null, '001725630', false, null, 200),
       ('Шевчук', 'Вікторія', '1963-07-02', 'BM234316', false, null, 10);

-- creating rooms
create table "Rooms"
(
    "RoomNumber"     int                    not null,
    "IsInRepair"     boolean  default false not null,
    "EliteStatusID"  serial                 not null
        constraint rooms_elite_status_elitestatusid_fk
            references "EliteStatus"
            on update cascade on delete restrict,
    "PricePerNight"  int,
    "NumberOfPeople" smallint default 2     not null,
    "Notes"          text
);

create unique index rooms_roomnumber_uindex
    on "Rooms" ("RoomNumber");

alter table "Rooms"
    add constraint rooms_pk
        primary key ("RoomNumber");

ALTER TABLE "Rooms"
    ADD check ( "PricePerNight" > 0 AND "NumberOfPeople" > 0);

INSERT INTO "Rooms" ("RoomNumber", "IsInRepair", "EliteStatusID", "PricePerNight", "NumberOfPeople", "Notes")
VALUES (1, false, 2, 785, 2,
        'Двомісний номер “СІМЕЙНИЙ” (двоспальне ліжко + додаткові місця) В кімнаті двоспальне ліжко , приліжкові тумби, стіл, торшер, стілець, диван, телевізор, холодильник, ванна-душ, туалет, балкон.'),
       (2, false, 2, 785, 2,
        'Двомісний номер “СІМЕЙНИЙ” (двоспальне ліжко + додаткові місця) В кімнаті двоспальне ліжко , приліжкові тумби, стіл, торшер, стілець, диван, телевізор, холодильник, ванна-душ, туалет, балкон.'),
       (3, false, 3, 900, 2,
        'Двомісний номер “СІМЕЙНИЙ” (двоспальне ліжко + додаткові місця) В кімнаті двоспальне ліжко , приліжкові тумби, стіл, торшер, стілець, диван, телевізор, холодильник, ванна-душ, туалет, балкон.'),
       (4, false, 2, 785, 3,
        'Трьомісний номер “СІМЕЙНИЙ” (двоспальне ліжко + односпальне місце) В кімнаті двоспальне ліжко , приліжкові тумби, стіл, торшер, стілець, диван, телевізор, холодильник, ванна-душ, туалет, балкон.'),
       (5, false, 3, 1105, 2,
        'Трьомісний номер “СІМЕЙНИЙ” (двоспальне ліжко + місце для дитини) В кімнаті двоспальне ліжко , приліжкові тумби, стіл, торшер, стілець, диван, телевізор, холодильник, ванна-душ, туалет, балкон.'),
       (6, false, 3, 1300, 2,
        'Номер Люкс “СІМЕЙНИЙ” (з додатковими місцями) В кімнаті двоспальне ліжко , приліжкові тумби, стіл, торшер, стілець, диван, телевізор, холодильник, душ, фен, туалет, балкон. Покращений ремонт'),
       (7, false, 3, 1300, 2,
        'Номер Люкс “СІМЕЙНИЙ” (з додатковими місцями) В кімнаті двоспальне ліжко , приліжкові тумби, стіл, торшер, стілець, диван, телевізор, холодильник, душ, фен, туалет, балкон. Покращений ремонт'),
       (8, false, 3, 1300, 2,
        'Двоповерховий дерев’яний будинок (з додатковими місцями) В котеджі на першому поверсі диван, стіл, стілець, телевізор, холодильник, душ, туалет. На другому поверсі двоспальне ліжко, комод, балкон.'),
       (9, false, 2, 1130, 2,
        'Двоповерховий дерев’яний будинок (з додатковими місцями) В котеджі на першому поверсі диван, стіл, стілець, телевізор, холодильник, душ, туалет. На другому поверсі двоспальне ліжко, комод, балкон.'),
       (10, false, 2, 1130, 2,
        'Двоповерховий дерев’яний будинок (з додатковими місцями) В котеджі на першому поверсі диван, стіл, стілець, телевізор, холодильник, душ, туалет. На другому поверсі двоспальне ліжко, комод, балкон.'),
       (11, false, 3, 1300, 2,
        'Двоповерховий дерев’яний будинок (з додатковими місцями) В котеджі на першому поверсі диван, стіл, стілець, телевізор, холодильник, душ, туалет. На другому поверсі двоспальне ліжко, комод, балкон.'),
       (12, false, 1, 995, 2,
        'Двоповерховий дерев’яний будинок (з додатковими місцями) В котеджі на першому поверсі диван, стіл, стілець, телевізор, холодильник, душ, туалет. На другому поверсі двоспальне ліжко, комод, балкон.'),

       (13, false, 1, 695, 2,
        'Двомісний котедж (дерев’яні будиночки) В котеджі двоспальне ліжко, приліжкова тумба, торшер, стілець, телевізор, душ, туалет, веранда.'),
       (14, false, 1, 695, 2,
        'Двомісний котедж (дерев’яні будиночки) В котеджі двоспальне ліжко, приліжкова тумба, торшер, стілець, телевізор, душ, туалет, веранда.'),
       (15, false, 1, 695, 2,
        'Двомісний котедж (дерев’яні будиночки) В котеджі двоспальне ліжко, приліжкова тумба, торшер, стілець, телевізор, душ, туалет, веранда.'),
       (16, false, 2, 745, 2,
        'Двомісний котедж (дерев’яні будиночки) В котеджі двоспальне ліжко, приліжкова тумба, торшер, стілець, телевізор, душ, туалет, веранда.'),
       (17, false, 1, 695, 2,
        'Двомісний котедж (дерев’яні будиночки) В котеджі двоспальне ліжко, приліжкова тумба, торшер, стілець, телевізор, душ, туалет, веранда.'),

       (18, false, 1, 395, 1,
        'Одномісний котедж (дерев’яні будиночки) В котеджі 1 ліжко, приліжкова тумба, торшер, стілець, телевізор, душ, туалет.'),
       (19, true, 2, 495, 1,
        'Одномісний котедж (дерев’яні будиночки) В котеджі 1 ліжко, приліжкова тумба, торшер, стілець, телевізор, душ, туалет.'),
       (20, false, 1, 395, 1,
        'Одномісний котедж (дерев’яні будиночки) В котеджі 1 ліжко, приліжкова тумба, торшер, стілець, телевізор, душ, туалет.'),
       (21, false, 1, 395, 1,
        'Одномісний котедж (дерев’яні будиночки) В котеджі 1 ліжко, приліжкова тумба, торшер, стілець, телевізор, душ, туалет.'),

       (22, false, 2, 835, 2,
        'Двокімнатний номер “СІМЕЙНИЙ” (двоспальне ліжко + додаткові місця) В одній кімнаті двоспальне ліжко, приліжкові тумби. В другій кімнаті стіл, торшер, стілець, диван, телевізор, холодильник, душ, туалет. Покращений ремонт.'),
       (23, false, 2, 835, 2,
        'Двокімнатний номер “СІМЕЙНИЙ” (двоспальне ліжко + додаткові місця) В одній кімнаті двоспальне ліжко, приліжкові тумби. В другій кімнаті стіл, торшер, стілець, диван, телевізор, холодильник, душ, туалет. Покращений ремонт.'),
       (24, false, 3, 1035, 2,
        'Двокімнатний номер “СІМЕЙНИЙ” (двоспальне ліжко + додаткові місця) В одній кімнаті двоспальне ліжко, приліжкові тумби. В другій кімнаті стіл, торшер, стілець, диван, телевізор, холодильник, душ, туалет. Покращений ремонт.'),
       (25, false, 2, 835, 2,
        'Двокімнатний номер “СІМЕЙНИЙ” (двоспальне ліжко + додаткові місця) В одній кімнаті двоспальне ліжко, приліжкові тумби. В другій кімнаті стіл, торшер, стілець, диван, телевізор, холодильник, душ, туалет. Покращений ремонт.'),
       (26, false, 2, 835, 2,
        'Двокімнатний номер “СІМЕЙНИЙ” (двоспальне ліжко + додаткові місця) В одній кімнаті двоспальне ліжко, приліжкові тумби. В другій кімнаті стіл, торшер, стілець, диван, телевізор, холодильник, душ, туалет. Покращений ремонт.'),
       (27, false, 1, 635, 2,
        'Двокімнатний номер “СІМЕЙНИЙ” (двоспальне ліжко + додаткові місця) В одній кімнаті двоспальне ліжко, приліжкові тумби. В другій кімнаті стіл, торшер, стілець, диван, телевізор, холодильник, душ, туалет. Покращений ремонт.'),

       (28, false, 2, 810, 2,
        'Двомісний номер “СІМЕЙНИЙ” (з додатковими місцями, душова кабіна з гідробоксом) В кімнаті двоспальне ліжко , приліжкові тумби, стіл, торшер, стілець, диван, телевізор, холодильник, душ, туалет. Покращений ремонт.'),
       (29, false, 2, 810, 2,
        'Двомісний номер “СІМЕЙНИЙ” (з додатковими місцями, душова кабіна з гідробоксом) В кімнаті двоспальне ліжко , приліжкові тумби, стіл, торшер, стілець, диван, телевізор, холодильник, душ, туалет. Покращений ремонт.'),
       (30, false, 2, 810, 2,
        'Двомісний номер “СІМЕЙНИЙ” (з додатковими місцями, душова кабіна з гідробоксом) В кімнаті двоспальне ліжко , приліжкові тумби, стіл, торшер, стілець, диван, телевізор, холодильник, душ, туалет. Покращений ремонт.'),
       (31, false, 2, 810, 2,
        'Двомісний номер “СІМЕЙНИЙ” (з додатковими місцями, душова кабіна з гідробоксом) В кімнаті двоспальне ліжко , приліжкові тумби, стіл, торшер, стілець, диван, телевізор, холодильник, душ, туалет. Покращений ремонт.'),
       (32, false, 2, 810, 2,
        'Двомісний номер “СІМЕЙНИЙ” (з додатковими місцями, душова кабіна з гідробоксом) В кімнаті двоспальне ліжко , приліжкові тумби, стіл, торшер, стілець, диван, телевізор, холодильник, душ, туалет. Покращений ремонт.'),
       (33, false, 1, 610, 2,
        'Двомісний номер “СІМЕЙНИЙ” (з додатковими місцями, душова кабіна з гідробоксом) В кімнаті двоспальне ліжко , приліжкові тумби, стіл, торшер, стілець, диван, телевізор, холодильник, душ, туалет. Покращений ремонт.'),
       (34, false, 1, 610, 2,
        'Двомісний номер “СІМЕЙНИЙ” (з додатковими місцями, душова кабіна з гідробоксом) В кімнаті двоспальне ліжко , приліжкові тумби, стіл, торшер, стілець, диван, телевізор, холодильник, душ, туалет. Покращений ремонт.'),

       (35, false, 2, 785, 2,
        'Двомісний номер “TWIN” (з двома окремими ліжками + додаткові місця) В кімнаті два окремих ліжка , приліжкові тумби, стіл, торшер, стілець, диван, телевізор, холодильник, ванна-душ, туалет, балкон.'),
       (36, false, 3, 985, 2,
        'Двомісний номер “TWIN” (з двома окремими ліжками + додаткові місця) В кімнаті два окремих ліжка , приліжкові тумби, стіл, торшер, стілець, диван, телевізор, холодильник, ванна-душ, туалет, балкон.'),
       (37, false, 3, 985, 2,
        'Двомісний номер “TWIN” (з двома окремими ліжками + додаткові місця) В кімнаті два окремих ліжка , приліжкові тумби, стіл, торшер, стілець, диван, телевізор, холодильник, ванна-душ, туалет, балкон.'),
       (38, false, 2, 785, 2,
        'Двомісний номер “TWIN” (з двома окремими ліжками + додаткові місця) В кімнаті два окремих ліжка , приліжкові тумби, стіл, торшер, стілець, диван, телевізор, холодильник, ванна-душ, туалет, балкон.'),
       (39, false, 1, 685, 2,
        'Двомісний номер “TWIN” (з двома окремими ліжками + додаткові місця) В кімнаті два окремих ліжка , приліжкові тумби, стіл, торшер, стілець, диван, телевізор, холодильник, ванна-душ, туалет, балкон.'),

       (40, false, 2, 785, 1, 'Одномісний номер стандарт'),
       (41, false, 2, 785, 1, 'Одномісний номер стандарт'),
       (42, false, 3, 985, 1, 'Одномісний номер стандарт'),
       (43, true, 2, 785, 1, 'Одномісний номер стандарт'),
       (44, false, 1, 685, 1, 'Одномісний номер стандарт');


--  create history of rooms
create table "ReservationRecords"
(
    "ReservationRecordID" serial                              not null,
    "RoomNumber"          int                                 not null
        constraint reservation_records_rooms_roomnumber_fk
            references "Rooms"
            on update cascade on delete restrict,
    "CustomerID"          int                                 not null
        constraint reservation_records_customers_customerid_fk
            references "Customers"
            on update cascade on delete restrict,
    "StaffID"             int                                 not null
        constraint reservation_records_employees_employeeid_fk
            references "Employees"
            on update cascade on delete restrict,
    "Price"               int,
    "FromDateInclusive"   timestamp default current_timestamp not null,
    "ToDateExclusive"     timestamp                           not null
);

comment on column "ReservationRecords"."FromDateInclusive" is 'Inclusive';

comment on column "ReservationRecords"."ToDateExclusive" is 'exclusive';

create unique index reservation_records_roomhistoryid_uindex
    on "ReservationRecords" ("ReservationRecordID");

alter table "ReservationRecords"
    add constraint reservation_records_pk
        primary key ("ReservationRecordID");

ALTER TABLE "ReservationRecords"
    ADD check ( "ToDateExclusive" > "FromDateInclusive" AND "Price" > 0 );

CREATE OR REPLACE FUNCTION "calculateNumberTotalPrice"(fromDate timestamp without time zone,
                                                       toDate timestamp without time zone, roomNumber int) returns int
    LANGUAGE plpgsql AS
$$
begin
    return extract(DAYS from toDate - fromDate) * (SELECT "PricePerNight" FROM "Rooms" WHERE "RoomNumber" = roomNumber);
end;
$$;

CREATE OR REPLACE PROCEDURE "insertIntoReservationRecords"(roomNumber int, customerID int, staffID int,
                                                           fromDate timestamp without time zone,
                                                           toDate timestamp without time zone)
    LANGUAGE plpgsql AS
$$
declare
    price                  int := "calculateNumberTotalPrice"(fromDate, toDate, roomNumber);
    previousMoneyOnAccount int := (SELECT "MoneyBalance"
                                   FROM "Customers"
                                   WHERE "CustomerID" = customerID);
    newBalance             int := previousMoneyOnAccount - price;
begin
    if newBalance > 0 THEN
        UPDATE "Customers" SET "MoneyBalance"= newBalance WHERE "CustomerID" = customerID;
        INSERT INTO "ReservationRecords" ("RoomNumber", "CustomerID", "StaffID", "Price", "FromDateInclusive",
                                          "ToDateExclusive")
        VALUES (roomNumber, customerID, staffID, price, fromDate, toDate);
    end if;
end;
$$;

Insert INTO "ReservationRecords" ("RoomNumber", "CustomerID", "StaffID", "Price", "FromDateInclusive",
                                  "ToDateExclusive")
VALUES (1, 1, 8, 785 * 5, '2020-10-24', '2020-10-29'),
       (5, 4, 9, 1105 * 2, '2020-10-24', '2020-10-26'),
       (16, 2, 7, 745 * 19, '2020-10-24', '2020-11-13'),

       (32, 3, 9, "calculateNumberTotalPrice"(timestamp '2020-10-25', (date '2020-10-25' + interval '10 day'), 32),
        '2020-10-25', date '2020-10-25' + interval '10 day'),

       (18, 5, 8, (SELECT "PricePerNight" FROM "Rooms" WHERE "RoomNumber" = 18) * 7, '2020-10-25',
        date '2020-10-25' + interval '7 day'),
       (19, 7, 9, (SELECT "PricePerNight" FROM "Rooms" WHERE "RoomNumber" = 19) * 8, '2020-10-27',
        date '2020-10-27' + interval '8 day'),
       (17, 8, 9, (SELECT "PricePerNight" FROM "Rooms" WHERE "RoomNumber" = 17) * 21, '2020-10-28',
        date '2020-10-28' + interval '21 day'),
       (10, 6, 8, (SELECT "PricePerNight" FROM "Rooms" WHERE "RoomNumber" = 10) * 13, '2020-10-29',
        date '2020-10-29' + interval '13 day'),
       (3, 5, 8, (SELECT "PricePerNight" FROM "Rooms" WHERE "RoomNumber" = 3) * 17, '2020-10-30',
        date '2020-10-30' + interval '17 day'),
       (8, 2, 9, (SELECT "PricePerNight" FROM "Rooms" WHERE "RoomNumber" = 8) * 7, current_timestamp,
        current_timestamp + interval '7 day');

CREATE VIEW "AvailableEmployees" AS
SELECT "EmployeeID",
       "LastName",
       "FirstName",
       "IsMale",
       "Title",
       "BirthDate",
       "HireDate",
       "FireDate",
       "Address",
       "City",
       "Region",
       "PostalCode",
       "Country",
       "MobilePhone",
       "Notes",
       "ReportsTo"
FROM "Employees"
WHERE "FireDate" IS NULL;
-- create categories
create table "Categories"
(
    "CategoryID"   smallserial not null,
    "CategoryName" varchar(25) not null,
    "Description"  text,
    "Picture"      bytea
);

create unique index categories_categoryid_uindex
    on "Categories" ("CategoryID");

create unique index categories_categoryname_uindex
    on "Categories" ("CategoryName");

alter table "Categories"
    add constraint categories_pk
        primary key ("CategoryID");
INSERT INTO "Categories" ("CategoryName", "Description")
VALUES ('Овочі, Фрукти, Гриби', 'Овочі, Фрукти, Гриби, Зелень, Сухофрукти, Овочі в маринадах'),
       ('Солодощі, чіпси, снеки',
        'Бесквітна група, Шоколад, Цукерки шоколадні, Вафлі та вафельні торти, Крекер, Печиво і Пряники, Карамель, Батончики, Чіпси'),
       ('Фаст Фуд, піца', null),
       ('Напої', 'Вода солодка, Вода мінеральна, Сокові напої, Чай холодний, Енергетики, Квас, Шампанське дитяче'),
       ('Риба, морепродукти', 'Морепродукти, приготовлена риба'),
       ('Морозиво', null);

-- create products
create table "Products"
(
    "ProductID"    serial                 not null,
    "ProductName"  varchar(40)            not null,
    "CategoryID"   smallint
        constraint products_categories_categoryid_fk
            references "Categories"
            on update cascade on delete restrict,
    "UnitPrice"    int                    not null,
    "UnitsInStock" smallint default 0     not null,
    "Discontinued" boolean  default false not null,
    "Description"  text
);

create unique index products_productid_uindex
    on "Products" ("ProductID");

create unique index products_productname_uindex
    on "Products" ("ProductName");

alter table "Products"
    add constraint products_pk
        primary key ("ProductID");

ALTER TABLE "Products"
    ADD CHECK ( "UnitPrice" > 0);

INSERT INTO "Products" ("ProductName", "CategoryID", "UnitPrice", "UnitsInStock", "Description")
VALUES ('Горіх Мигдаль', 1, 40, 1000, 'В одній упаковці 100г'),
       ('Сухофрукти Курага', 1, 82, 500, 'В одні упаковці 300г'),
       ('Цукати Ананас асорті', 1, 17, 561, 'В одні упаковці 100г'),
       ('Сухофрукти Журавлина Сушена', 1, 21, 423, 'В одні упаковці 100г'),
       ('Крекер Yarych 180г Ніжний', 2, 14, 41, null),
       ('Крекер Yarych 180г Вершковий', 2, 14, 31, null),
       ('Крекер Yarych 180г Цибуля', 2, 14, 32, null),
       ('Крекер Yarych 180г Какао', 2, 16, 35, null),
       ('Крекер Yarych 80г Класичний', 2, 11, 65, null),
       ('Крекер Yarych 80г Базилік та часник', 2, 11, 48, null),
       ('Крекер Yarych 80г Сир Чеддер', 2, 11, 39, null),
       ('Крекер Yarych 80г З цибулею та сметаною', 2, 11, 21, null),

       ('Піца Маргарита 320г', 3, 49, 2, null),
       ('Мін вода Боржомі 0,5л скло', 4, 25, 24, null),
       ('Мін вода Боржомі 1л ПЕТ', 4, 34, 36, null),
       ('Мін вода Моршинська 1,5л н/г ПЕТ', 4, 16, 27, null),
       ('Мін вода УМВ 1,5л Поляна квасова', 4, 24, 13, null),
       ('Сік Садочок 1,93л Томатний', 4, 48, 37, null),
       ('Сік Садочок 0,95л Томатний', 4, 23, 35, null),
       ('Сік Sandora 0,95л Апельсин', 4, 44, 65, null),
       ('Сік Садочок 0,5л Мультивітамін', 4, 19, 12, null),
       ('Нектар Джаффа 0,95л Гранатовий', 4, 36, 13, null),
       ('Сік НашСік 0,2л Яблуко-полуниця', 4, 9, 27, null),
       ('М''ясо мідії Океан в олії', 5, 29, 100, 'За 100 грамів'),
       ('Морепрод Norven 170г Морський коктейль', 5, 41, 20, null),
       ('Морепродукти Norven 170г Мідії пряно-пік', 5, 42, 16, null),
       ('Морозиво Рудь в/с 70г 100%', 6, 14, 14, null),
       ('Морозиво Лімо 80г Ескімо плом1965 шок гл', 6, 23, 10, null),
       ('Морозиво Лімо 70г Каштан Львів шок смак', 6, 19, 15, null),
       ('Морозиво Рудь с/в 70г Дитяче', 6, 14, 5, null);


-- ordersHistory
create table "Orders"
(
    "OrderID"       serial not null,
    "CustomerID"    int    not null
        constraint orders_customers_customerid_fk
            references "Customers" ("CustomerID")
            on update cascade on delete restrict,
    "EmployeeID"    int    not null
        constraint orders_employees_employeeid_fk
            references "Employees" ("EmployeeID")
            on update cascade on delete restrict,
    "OrderTimeDate" timestamp default current_timestamp
);

create unique index orders_orderid_uindex
    on "Orders" ("OrderID");

alter table "Orders"
    add constraint orders_pk
        primary key ("OrderID");

INSERT INTO "Orders" ("CustomerID", "EmployeeID", "OrderTimeDate")
VALUES (1, 11, '2020-10-26 13:00'),
       (1, 11, '2020-10-28 16:56'),
       (5, 12, '2020-10-30 12:31'),
       (7, 12, '2020-11-01 9:10'),
       (7, 11, '2020-11-02 9:10');

-- orders_details
create table "OrdersDetails"
(
    "OrderID"                   int            not null
        constraint orders_details_orders_orderid_fk
            references "Orders",
    "ProductID"                 int            not null
        constraint orders_details_products_productid_fk
            references "Products"
            on update cascade on delete restrict,
    "Quantity"                  int  default 1 not null,
    "Discount"                  real default 0 not null,
    "PricePerUnitOnDayOfBuying" int            not null,
    constraint orders_details_pk
        primary key ("ProductID", "OrderID")
);

ALTER TABLE "OrdersDetails"
    ADD CHECK ( "Quantity" > 0 AND "Discount" < 0.4 AND "PricePerUnitOnDayOfBuying" > 0);

INSERT INTO "OrdersDetails" ("OrderID", "ProductID", "Quantity", "Discount", "PricePerUnitOnDayOfBuying")
VALUES (1, 13, 1, 0.1, (SELECT "UnitPrice" FROM "Products" WHERE "ProductID" = 13)),
       (2, 13, 1, 0.1, (SELECT "UnitPrice" FROM "Products" WHERE "ProductID" = 13)),
       (3, 14, 2, 0, (SELECT "UnitPrice" FROM "Products" WHERE "ProductID" = 14)),
       (3, 22, 1, 0, (SELECT "UnitPrice" FROM "Products" WHERE "ProductID" = 22)),
       (3, 28, 1, 0, (SELECT "UnitPrice" FROM "Products" WHERE "ProductID" = 28)),
       (3, 6, 3, 0, (SELECT "UnitPrice" FROM "Products" WHERE "ProductID" = 6)),
       (4, 17, 2, 0, (SELECT "UnitPrice" FROM "Products" WHERE "ProductID" = 17)),
       (5, 2, 1, 0, (SELECT "UnitPrice" FROM "Products" WHERE "ProductID" = 2));

-- Views
-- ---------------------------
CREATE VIEW "AvailableHousekeeper" AS
SELECT *
FROM "courseWork".public."Employees"
WHERE "Title" LIKE '%_окоївка'
  AND "FireDate" IS NULL;