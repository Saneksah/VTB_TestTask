-- Создание таблицы client_table
CREATE TABLE client_table (
    client_id INT,
    call_id INT PRIMARY KEY,
    call_date DATE
);

-- Заполнение таблицы client_table данными
INSERT INTO client_table (client_id, call_id, call_date)
VALUES
    (8, 935, '2021-11-31'),
    (8, 190, '2021-11-10'),
    (7, 312, '2021-11-03'),
    (10, 28, '2022-01-05'),
    (8, 91, '2021-03-22'),
    (9, 1292, '2022-02-28'),
    (5, 544, '2022-02-21'),
    (2, 1575, '2021-05-09');
    
-- Запрос для подсчета уникальных клиентов по месяцам
SELECT
    strftime('%m', call_date) AS month,
    strftime('%Y', call_date) AS year,
    COUNT(DISTINCT client_id) AS unique_clients_count
FROM
    client_table
GROUP BY
    strftime('%m', call_date), strftime('%Y', call_date)
ORDER BY
    year, month;
