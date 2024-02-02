-- Создание таблицы chats_table
CREATE TABLE chats_table (
    message_id INT PRIMARY KEY,
    sent_by VARCHAR(10),
    chat_id INT,
    date_time DATETIME
);

-- Заполнение таблицы chats_table данными
INSERT INTO chats_table (message_id, sent_by, chat_id, date_time)
VALUES
    (403, 'Оператор', 1, '2022-03-16 10:40'),
    (650, 'Клиент', 1, '2022-03-16 10:24'),
    (189, 'Оператор', 1, '2022-03-16 10:55'),
    (192, 'Клиент', 1, '2022-03-16 11:40'),
    (336, 'Клиент', 2, '2022-03-17 23:38'),
    (1100, 'Оператор', 2, '2022-03-18 01:45'),
    (333, 'Клиент', 2, '2022-03-18 15:00'),
    (270, 'Клиент', 3, '2022-03-19 09:28'),
    (592, 'Клиент', 4, '2022-03-20 15:14'),
    (1025, 'Оператор', 4, '2022-03-20 15:48'),
    (640, 'Оператор', 4, '2022-03-20 16:28'),
    (37, 'Клиент', 5, '2022-03-21 23:52');
    
-- Запрос для вывода скорости ответа (в секундах) оператора для каждого чата
SELECT
    c.chat_id,
    MIN(CASE WHEN c.sent_by = 'Клиент' THEN c.date_time END) AS client_message_time,
    MIN(CASE WHEN c.sent_by = 'Оператор' THEN c.date_time END) AS operator_response_time,
    CASE
        WHEN MIN(CASE WHEN c.sent_by = 'Оператор' THEN c.date_time END) IS NOT NULL
        THEN STRFTIME('%s', MIN(CASE WHEN c.sent_by = 'Оператор' THEN c.date_time END)) -
             STRFTIME('%s', MIN(CASE WHEN c.sent_by = 'Клиент' THEN c.date_time END))
        ELSE 'Оператор не ответил'
    END AS response_time_seconds
FROM
    chats_table c
GROUP BY
    c.chat_id
ORDER BY
    c.chat_id;
