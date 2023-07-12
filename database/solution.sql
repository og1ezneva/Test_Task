
--- 1) Планируется отослать поздравительные сообщения по электронной почте всем клиентам Компании
-- на 23 Февраля и 8 Марта. Требуется одним запросом определить количество сообщений, которые
-- нужно будет отправить отдельно 23 Февраля и 8 Марта.

SELECT CASE
         WHEN c.gender = 'F' THEN '8 march'
         ELSE '23 february'
       END         AS holiday,
       Count(c.id) AS message_count
FROM   client c
WHERE  c.email IS NOT NULL
GROUP  BY c.gender

-- 2) Вывести список заказов клиентов: [Фамилия + имя, название фирмы, дата заказа, сумма заказа],
---отсортированный по фамилии, имени, дате заказа.

SELECT Concat(c.surname, ' ', c.NAME) "Полное имя",
       f.NAME                         "Название фирмы",
       o.ord_time                     "Дата заказа",
       o.amount                       "Сумма заказа"
FROM   orders o
       LEFT JOIN client c
              ON o.client_id = c.id
       LEFT JOIN firm f
              ON f.id = c.firm_id
ORDER  BY c.surname,
          c.NAME,
          o.ord_time

--3) Компания намеревается ввести скидку в размере 10% от суммы заказа, если заказ выполнен в день
--рождения клиента. Требуется определить общую сумму скидки по всем клиентам за 2022 год, как
--если бы скидка действовала.

SELECT Sum(o.amount * 0.1) "Общая сумма скидки за 2022 г"
FROM   orders o
       LEFT JOIN client c
              ON c.id = o.client_id
WHERE  Extract(day FROM c.birthday) = Extract (day FROM o.ord_time)
       AND Extract(month FROM c.birthday) = Extract (month FROM o.ord_time)
       AND o.ord_time BETWEEN '2022-01-01' AND '2022-12-31'

--4) Перед Новым 2023-м Годом решено отправить ценные подарки руководителям фирм, сотрудники
--которых за год в общей сложности сделали заказов более чем на 1 000 000 руб. Необходимо
--подготовить такой список: [Название фирмы, адрес, сумма заказов].

SELECT sums.*
FROM   (SELECT f.NAME,
               f.address,
               Sum(o.amount) AS amount
        FROM   orders o
               LEFT JOIN client c
                      ON o.client_id = c.id
               RIGHT JOIN firm f
                       ON f.id = c.firm_id
        GROUP  BY f.NAME,
                  f.address) AS sums
WHERE  sums.amount > 1000000

--5) С помощью одного SQL запроса подготовить список мужчин - потенциальных близнецов среди
--клиентов (с совпадением фамилии и даты рождения): [ID клиента, фамилия, имя, день рождения].

SELECT doppler.*
FROM   client c
       RIGHT JOIN (SELECT c2.id,
                          c2.surname,
                          c2.NAME,
                          c2.birthday
                   FROM   client c2) AS doppler
               ON ( c.id != doppler.id
                    AND c.surname = doppler.surname
                    AND c.birthday = doppler.birthday )
WHERE  c.gender = 'M'

  --6) Выбрать топ-3 покупателей среди фирм (просуммировав заказы всех представителей фирмы) и
--клиентов-физических лиц (у которых Firm_ID не указан) с самым большим объемом заказов за
--декабрь 2022 года: [Фамилия+имя или название фирмы, сумма заказов].

SELECT *
FROM   (SELECT f.name,
               Sum(o.amount) AS sum
        FROM   orders o
               LEFT JOIN client c
                      ON o.client_id = c.id
               RIGHT JOIN firm f
                       ON f.id = c.firm_id
        WHERE  o.ord_time BETWEEN '2022-12-01' AND '2022-12-31'
        GROUP  BY f.id
        UNION ALL
        SELECT c.name,
               Sum(o.amount) AS sum
        FROM   orders o
               LEFT JOIN client c
                      ON o.client_id = c.id
        WHERE  o.ord_time BETWEEN '2022-12-01' AND '2022-12-31'
               AND c.firm_id IS NULL
        GROUP  BY c.id) AS result
ORDER  BY result.sum DESC
LIMIT  3
