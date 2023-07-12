CREATE TABLE Client (ID INTEGER NOT NULL PRIMARY KEY, Name varchar(50), Surname Varchar(50), Firm_ID INTEGER NULL,
Gender Varchar(1), Birthday Date, EMail Varchar(100) NULL);
INSERT INTO Client (ID, Name, Surname, Firm_ID, Gender, Birthday, EMail) VALUES (1,'Елена', 'Сидорова', NULL, 'F',
TIMESTAMP '1993-04-05 00:00:00', 'E.Sidorova@mail.ru');
INSERT INTO Client (ID, Name, Surname, Firm_ID, Gender, Birthday, EMail) VALUES (2,'Петр', 'Иванов', 1, 'M',
TIMESTAMP '1990-12-02 00:00:00', 'P.Ivanov@mail.ru');
INSERT INTO Client (ID, Name, Surname, Firm_ID, Gender, Birthday, EMail) VALUES (3,'Aннa', 'Петрова', 1, 'F',
TIMESTAMP '1993-05-13 00:00:00', 'A.Petrova@mail.ru');
INSERT INTO Client (ID, Name, Surname, Firm_ID, Gender, Birthday, EMail) VALUES (4,'Иван', 'Иванов', 1, 'M',
TIMESTAMP '1990-12-02 00:00:00', NULL);
INSERT INTO Client (ID, Name, Surname, Firm_ID, Gender, Birthday, EMail) VALUES (5,'Даниил','Пупкин', 2, 'M',
TIMESTAMP '1991-12-05 00:00:00', NULL);
INSERT INTO Client (ID, Name, Surname, Firm_ID, Gender, Birthday, EMail) VALUES (6,'Янина', 'Котикова', NULL, 'F',
TIMESTAMP '1991-10-20 00:00:00', 'Koteiko@mail.ru');
INSERT INTO Client (ID, Name, Surname, Firm_ID, Gender, Birthday, EMail) VALUES (7,'Ян', 'Шнайдмиллер', 2, 'M',
TIMESTAMP '1990-12-02 00:00:00', 'ya.shnaid@mail.ru');
INSERT INTO Client (ID, Name, Surname, Firm_ID, Gender, Birthday, EMail) VALUES (8,'Георг', 'Иванов', NULL, 'M',
TIMESTAMP '1995-11-02 00:00:00', NULL);
CREATE TABLE Firm (ID INTEGER NOT NULL PRIMARY KEY, Name varchar(100), Address Varchar(100));
INSERT INTO Firm (ID, Name, Address) VALUES(1, 'ООО "Рога & Копыта"', 'Барнаул, ул. Кривая, 2');
INSERT INTO Firm (ID, Name, Address) VALUES(2, 'ПАО "Копыта & Рога"', 'Барнаул, ул. Ровная, 5');
CREATE TABLE Orders (ID INTEGER NOT NULL PRIMARY KEY, Ord_Time Date NOT NULL, Amount INTEGER NOT NULL, Client_ID
INTEGER NOT NULL);
INSERT INTO Orders (ID, Ord_Time, Amount, Client_ID) VALUES (1, TIMESTAMP '2022-12-01 11:35:45', 115000, 1);
INSERT INTO Orders (ID, Ord_Time, Amount, Client_ID) VALUES (2, TIMESTAMP '2022-12-02 12:25:56', 307000, 1);
INSERT INTO Orders (ID, Ord_Time, Amount, Client_ID) VALUES (3, TIMESTAMP '2022-12-02 13:15:07', 350000, 2);
INSERT INTO Orders (ID, Ord_Time, Amount, Client_ID) VALUES (4, TIMESTAMP '2022-12-03 14:05:18', 670000, 1);
INSERT INTO Orders (ID, Ord_Time, Amount, Client_ID) VALUES (5, TIMESTAMP '2022-12-04 15:55:29', 70000, 3);
INSERT INTO Orders (ID, Ord_Time, Amount, Client_ID) VALUES (6, TIMESTAMP '2022-12-04 16:45:30', 150000, 4);
INSERT INTO Orders (ID, Ord_Time, Amount, Client_ID) VALUES (7, TIMESTAMP '2022-12-05 17:35:41', 250000, 5);
INSERT INTO Orders (ID, Ord_Time, Amount, Client_ID) VALUES (8, TIMESTAMP '2022-12-06 18:25:52', 650000, 2);
INSERT INTO Orders (ID, Ord_Time, Amount, Client_ID) VALUES (9, TIMESTAMP '2022-12-06 19:15:03', 450000, 6);
INSERT INTO Orders (ID, Ord_Time, Amount, Client_ID) VALUES (10, TIMESTAMP '2023-01-10 19:15:03', 37000, 6);
INSERT INTO Orders (ID, Ord_Time, Amount, Client_ID) VALUES (11, TIMESTAMP '2023-01-11 10:15:03', 29000, 7);
COMMIT;