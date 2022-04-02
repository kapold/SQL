USE UNIVER;

SELECT *
FROM (SELECT
			CASE
				WHEN PROGRESS.NOTE = 10 then '10'
				WHEN PROGRESS.NOTE between 8 and 9 then '8-9'
				WHEN PROGRESS.NOTE between 6 and 7 then '6-7'
				WHEN PROGRESS.NOTE between 4 and 5 then '4-5'
			END [Оценки], count(*) [Количество]
FROM PROGRESS GROUP BY 
			CASE
				WHEN PROGRESS.NOTE = 10 then '10'
				WHEN PROGRESS.NOTE between 8 and 9 then '8-9'
				WHEN PROGRESS.NOTE between 6 and 7 then '6-7'
				WHEN PROGRESS.NOTE between 4 and 5 then '4-5'
			END 
) as T1
ORDER BY CASE [Оценки]
	WHEN '10' then 1
	WHEN '8-9' then 2
	WHEN '6-7' then 3
	WHEN '4-5' then 4
	ELSE 0
END