USE A_MyBase;

-- 1
SELECT max(????) [????????????? ????],
	   min(????) [??????????? ????],
	   avg(????) [??????? ????],
	   sum(????) [????????? ????],
	   count(????) [?????????? ???]
FROM ??????

-- 2
SELECT ??????.????????????_?????? [?????],
	   max(????) [????????????? ????],
	   min(????) [??????????? ????],
	   avg(????) [??????? ????],
	   sum(????) [????????? ????],
	   count(????) [?????????? ???]
FROM ??????
	 INNER JOIN ??????
	 ON ??????.????????????_?????? = ??????.????????????_??????
GROUP BY ??????.????????????_??????

-- 3
SELECT *
FROM (SELECT
			CASE
				WHEN ??????.???? = 1000 then '1000'
				WHEN ??????.???? = 2000 then '2000'
				WHEN ??????.???? = 3000 then '3000'
			END [??????], count(*) [??????????]
FROM ?????? GROUP BY 
			CASE
				WHEN ??????.???? = 1000 then '1000'
				WHEN ??????.???? = 2000 then '2000'
				WHEN ??????.???? = 3000 then '3000'
			END 
) as T1
ORDER BY CASE [??????]
	WHEN '1000' then 1
	WHEN '2000' then 2
	WHEN '3000' then 3
	ELSE 0
END

-- 4