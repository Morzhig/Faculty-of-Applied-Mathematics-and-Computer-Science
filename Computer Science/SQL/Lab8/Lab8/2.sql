/* 1 */
select	
	F.Nfak as Fakultet,
	K.Nkaf as Kafedra from
	Fakultet F, Kafedra K
where
	F.ABFak = K.AbFak_Kaf
order by
	Fakultet, Kafedra

/* 2 */
select	
	F.Nfak as Fakultet,
	K.Nkaf as Kafedra from
	Fakultet F
	inner join Kafedra K on
	F.ABFak = K.AbFak_Kaf
order by
	Fakultet, Kafedra

/* 3 */
select	
	F.Nfak as Fakultet,
	K.Nkaf as Kafedra from
	Fakultet F
	left outer join Kafedra K on
	F.ABFak = K.AbFak_Kaf
order by
	Fakultet, Kafedra

/* 4 */
select	
	S.Fio_stud, P.NaprSpez, K.NKaf as Kafedra
	from Student S
		inner join Spezialn P on S.nom_Spez_St = P.NSpez
		inner join Kafedra K on P.Shifr_Spez = K.ShifrKaf
/* 5 */
select
	S.FIO, S.Dolgn, S.Zarplata, P.FIO as Руководитель
from 
	Sotrudnik S
		inner join Sotrudnik P on S.TablNom = P.TabNom_ruk

/* 6 */
select
	S.Fio_Stud
From 
	Student S
	inner join Ozenka O on S.Reg_Nom = O.RegNom
group by
	S.Fio_stud

/* 7 */
select 
	S.Fio_stud,
	count(O.Ozenk_a) as [Количество экзаменов],
	avg(O.Ozenk_a) as [Средний балл]
from 
	Student S
	inner join Ozenka O on S.Reg_Nom = O.RegNom
group by
	S.Fio_stud

/* 8 */
Select 
	S.FIO, S.Zarplata, Z.St_K
from
	Sotrudnik S
		inner join ZavKaf Z on S.TablNom = Z.TabNom_K

/* 9 */
Select
	S.FIO, P.Stepen
from
	Sotrudnik S
		inner join Prepodavatel P on S.TablNom = P.TabNom_Pr
	where 
		P.Stepen in ('к.ф.-м.н.', 'д.ф.-м.н.')

/* 10 */
Select distinct
	PR.Predmet As Дисциплина,
	S.FIO, S.Dolgn, P.Stepen, O.data, O.Auditoria
from
	Ozenka O
		inner join Predmet PR on O.Kod = PR.kod_pred
		inner join Sotrudnik S on O.Tab_Nom = S.TablNom
		inner join Prepodavatel P on O.Tab_Nom = P.TabNom_Pr
	order by
		O.data

/* 11 */
select
	S.fio, 
	count(O.data) as [Количество экзаменов]
from
	Ozenka O
	inner join sotrudnik S on O.Tab_Nom = S.TablNom
	group by 
		S.fio

/* 12 */
select
	S.Fio_Stud
from
	Student S
	left outer join Ozenka O on S.Reg_Nom = O.RegNom
where
	O.RegNom is null