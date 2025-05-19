select * from tur
insert into tur(ad) values ('Biyografi')
select * from yazar
insert into yazar (ad,soyad) values ('Nurettin','Belek')

select * from ogrenci
update ogrenci set sinif = '10C' where sinif = '10B'

select * from kitap
update kitap set puan = puan + 5

insert into tur(ad) values ('Kişisel Gelişim')
update kitap set turno = (select turno from tur where ad = 'Kişisel Gelişim') where ad = 'Benim Üniversitelerim'

delete from yazar where ad='Mehmet'

create or replace function 
public.ogrencilistesi()
returns setof ogrenci
language 'sql'
as $BODY$
	select * from ogrenci
$BODY$

select * from ogrencilistesi()

Create or replace procedure
public.ekle(
in ad character varying,
in puan integer,
in yazarno bigint,
in turno bigint
)
language 'sql' 
as $BODY$
 insert into public.kitap(ad,puan,yazarno,turno)
values(ad, puan, yazarno,turno)
$BODY$;

call ekle('test',20,3,3);


Create or replace procedure
public.sil(
in ogr_no bigint
)
language 'sql' 
as $BODY$
 delete from public.ogrenci
where ogrno = ogr_no
$BODY$;

call sil(3);
