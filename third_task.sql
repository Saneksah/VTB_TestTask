-- Создание таблицы client_calls_table
CREATE TABLE client_calls_table (
    date DATE PRIMARY KEY,
    chats_cnt INT
);

-- Заполнение таблицы client_calls_table данными
INSERT INTO client_calls_table (date, chats_cnt)
VALUES
    ('2021-11-17', 265172),
    ('2021-08-28', 282069),
    ('2021-10-13', 161920),
    ('2021-11-03', 122993),
    ('2021-04-28', 150040),
    ('2021-12-08', 188091),
    ('2021-07-23', 293902),
    ('2021-01-17', 186374),
    ('2021-11-10', 114104),
    ('2021-10-04', 135472);
    
-- Запрос для вывода количества сообщений с нарастающим итогом по дням
SELECT
    date,
    chats_cnt,
    SUM(chats_cnt) OVER (ORDER BY date) AS cumulative_chats_cnt
FROM
    client_calls_table
ORDER BY
    date;
