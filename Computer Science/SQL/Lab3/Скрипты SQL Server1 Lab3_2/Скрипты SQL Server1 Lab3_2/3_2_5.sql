use Ucheb_6_Karpovich

SELECT FIO, date, Specialization, Year
From Student

Where (Year > 2016) AND (Specialization = 'Mathematics')
		OR
	  (Year > 2018) AND (Specialization = 'Physics')