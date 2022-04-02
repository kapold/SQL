USE UNIVER;

SELECT FACULTY.FACULTY_NAME [���������],
	   PULPIT.PULPIT_NAME [�������], 
	   PROFESSION.PROFESSION_NAME [�������������],
	   SUBJECT.SUBJECT_NAME [����������],
	   STUDENT.NAME [��� ��������],
	   PROGRESS.NOTE [������],
	   CASE 
			WHEN (PROGRESS.NOTE = 6) THEN '�����'
			WHEN (PROGRESS.NOTE = 7) THEN '����'
			WHEN (PROGRESS.NOTE = 8) THEN '������'
			ELSE '��� ���������(6-8)'
	   END [������]
FROM 
	 ((((((FACULTY
	 inner join GROUPS on FACULTY.FACULTY = GROUPS.FACULTY) 
	 inner join PROFESSION on FACULTY.FACULTY = PROFESSION.FACULTY)
	 inner join PULPIT on FACULTY.FACULTY = PULPIT.FACULTY)
	 inner join SUBJECT on PULPIT.PULPIT = SUBJECT.PULPIT)
	 inner join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP)
	 inner join PROGRESS on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT) 
WHERE PROGRESS.NOTE between 6 and 8
ORDER BY FACULTY.FACULTY_NAME,
		 PULPIT.PULPIT_NAME,
		 PROFESSION.PROFESSION_NAME,
		 STUDENT.NAME,
		 PROGRESS.NOTE DESC