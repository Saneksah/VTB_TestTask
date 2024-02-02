-- Создание таблицы calls_table
CREATE TABLE calls_table (
    call_id INT PRIMARY KEY,
    call_date DATE NOT NULL
);

-- Заполнение таблицы calls_table данными
INSERT INTO calls_table (call_id, call_date)
VALUES
    (241241, '2021-01-01'),
    (238829, '2021-01-02'),
    (236441, '2021-03-01'),
    (234077, '2021-05-09'),
    (231736, '2021-02-23'),
    (229419, '2021-06-11'),
    (241251, '2021-06-11'),
    (224854, '2021-01-20');

-- Создание таблицы eval_table
CREATE TABLE eval_table (
    call_id INT PRIMARY KEY,
    call_eval INT
);

-- заполнение таблицы eval_table данными
INSERT INTO eval_table (call_id, call_eval)
VALUES
    (241241, 3),
    (241251, 4),
    (238829, 2),
    (236441, 2),
    (234077, 1),
    (231736, NULL),
    (229419, 1),
    (224854, 3);
    
    
-- Запрос для расчета процента плохих оценок по каждому дню
SELECT
    c.call_date,
    COUNT(e.call_eval) AS total_evaluations,
    (COUNT(CASE WHEN e.call_eval IS NOT NULL AND e.call_eval <= 3 THEN 1 END) * 100.0 / COUNT(e.call_eval)) AS percentage_bad_evaluations
FROM
    calls_table c
LEFT JOIN
    eval_table e ON c.call_id = e.call_id
GROUP BY
    c.call_date
ORDER BY
    c.call_date;
