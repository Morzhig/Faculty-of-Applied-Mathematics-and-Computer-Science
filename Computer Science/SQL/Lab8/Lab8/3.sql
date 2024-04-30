/* 1 */
select	
	F.Nfak as Fakultet,
	K.Nkaf as Kafedra,
	S.Fio_stud as Student from
	Fakultet F, Kafedra K, Student S
where
	F.ABFak = K.AbFak_Kaf and F.ABFak = 'ит'
order by
	Fakultet, Kafedra

/* 2 */
select	
	S.FIO as Сотрудник,
	S.TabNom_ruk as [Номер руководителя],
	S1.FIO as [Имя руководителя]
from
	Sotrudnik S, Sotrudnik S1
where
	S.TabNom_ruk = S1.TablNom

/* 3 */
select	
	S.Fio_stud as Студент,
	count(O.Regnom) as [Количество экзаменов]
from
	Student S
	inner join Ozenka O on O.RegNom = S.reg_nom
group by
	S.Fio_stud
having
	count(O.RegNom) >= 2

/* 4 */
select 
	FIO
from 
	Sotrudnik
where
	zarplata < 2000 and dolgn = 'инженер'

/* 5 */
select 
	s.Fio_stud,
	o.Auditoria
from
	Student S, Ozenka O
where 
	S.Reg_Nom = O.RegNom AND O.Auditoria = 'т506'

/* 6 */
select
	S.Reg_Nom,
	S.Fio_stud,
	count(O.Regnom) as [Количество экзаменов],
	cast(avg(O.Ozenk_a) as float) as [Средний балл]
from 
	Student S
	inner join Ozenka O on O.RegNom = S.reg_nom
group by
	S.Fio_stud, S.Reg_Nom
having 
	avg(O.Ozenk_a) >= 4

/* 7 */
select 
	S.FIO,
	S.zarplata,
	P.Stepen
from	
	Sotrudnik S
	inner join Prepodavatel P on P.TabNom_Pr = S.TablNom
where
	S.Dolgn = 'зав.кафедрой'

/* 8 */
select 
	S.FIO
from	
	Sotrudnik S
	inner join Prepodavatel P on P.TabNom_Pr = S.TablNom
where
	P.Zvanie = 'профессор'

/* 9 */
Select distinct
	PR.Predmet As Дисциплина,
	S.FIO, S.Dolgn, P.Stepen, O.data, O.Auditoria
from
	Ozenka O
		inner join Predmet PR on O.Kod = PR.kod_pred
		inner join Sotrudnik S on O.Tab_Nom = S.TablNom
		inner join Prepodavatel P on O.Tab_Nom = P.TabNom_Pr	
where
	O.data between '2022-06-01' and '2022-06-08'
order by
	O.data

/* 10 */
select 
	S.FIO,
	count(O.Tab_Nom) as [Количество экзаменов]
from	
	Sotrudnik S
	inner join Ozenka O on O.Tab_Nom = S.TablNom
group by
	S.FIO
having
	count(O.Tab_Nom) >= 3

/* 11 */
Select distinct
	S.Fio_stud,
	O.data
from
	Student S
		inner join Ozenka O on O.RegNom != S.Reg_Nom
where
	O.data between '2022-06-01' and '2022-06-06'
