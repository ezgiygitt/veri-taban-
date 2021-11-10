CREATE TABLE notlistesi(
id int PRIMARY KEY,
vize int,
final int,
butunleme int,
);
INSERT INTO notlistesi VALUES (1,100,100,0),(2,80,90,0),(3,70,60,0),
                                   (4,40,50,0),(5,10,20,35),(6,60,20,80),(7,60,60,0),(9,90,30,70);

CREATE TABLE urunler(
id int PRIMARY KEY,
urunadi varchar(50),
urunmarkasý varchar(50),
fiyat numeric (6,2),
stoksayisi int
);
INSERT INTO urunler VALUES (1,'MASA','iKEA',236,25),
(2,'PC','HP',236,25),
(3,'Monitör','HP',236,25),
(4,'Klavye','HP',236,25),
(5,'Kalem ','Adel',236,25),
(6,'Fare','Ýkea',236,25);


CREATE PROCEDURE pr_urunlerigir
AS
BEGIN
SELECT id,urunadi,fiyat FROM urunler
END;
EXEC pr_urunlerigir
pr_urunlerigir


CREATE PROC p_listele @deger1 varchar(20),@deger2 int 
AS
BEGIN
SELECT * FROM urunler
WHERE urunadi=@deger1 OR id=@deger2
End;
EXEC p_listele @deger1='fare', @deger2=4;
   
CREATE PROC pasta @ck1 int, @ck2 varchar (30), @ck3 varchar (30),@ck4 int ,@ck5 int 
AS
BEGIN
INSERT INTO urunler(id,urunadi,urunmarkasý,fiyat,stoksayisi)
VALUES (@ck1,@ck2,@ck3,@ck4,@ck5)
END;
EXEC pasta 18,'Fare','Hp',5000,90;


DECLARE @yukseknot numeric(5,2)
SELECT @yukseknot=AVG (final)
FROM notlistesi
SELECT @yukseknot AS Enyuksekfinal;

CREATE PROCEDURE ýslem @degisken int 
AS
BEGIN
IF(@degisken %2!=2)
BEGIN
print 'tek'
END
ELSE IF (@degisken % 2 !=1)
BEGIN
print 'çift'
END
END


DECLARE @ortalama numeric (5,2)
DECLARE @vize int 
DECLARE @final int
DECLARE @butunleme int
SELECT @vize=vize, @final=final,@butunleme=butunleme FROM notlistesi WHERE id=4
IF(@vize*0.4+@final*0.6>=60)
BEGIN
SELECT @vize *0.4+@final*0.6
END
ELSE IF (@vize*0.4+@butunleme*0.6<60)
BEGIN
SELECT @vize*0.4+@butunleme*0.6
END

CREATE PROCEDURE sayi @deger int OUTPUT
AS
BEGIN
SELECT @deger=COUNT(*) FROM urunler
SELECT @deger
END

EXEC sayi 9

CREATE PROCEDURE pr2
AS
	BEGIN
		print 'hello'
	END;

EXEC pr2;

sp_helptext pr2


ALTER PROCEDURE pr2
WITH ENCRYPTION
AS
	BEGIN
		print 'hello'
	END;

use spor;

CREATE FUNCTION buyukharf(@ad varchar(20), @soyad varchar(20))
RETURNS varchar(40)
BEGIN
	RETURN (UPPER(@ad)+' '+UPPER(@soyad))
END;

SELECT dbo.buyukharf(ad,soyad) FROM oyuncular;


CREATE TABLE maas(
	personelid int identity(1,1),
	maas numeric(6,2))
INSERT INTO maas VALUES (1000.50),(500),(200),(5000),(5200),(2400.67);

CREATE FUNCTION gunlukmaas(@maas numeric(6,2))
RETURNS numeric(6,2)
BEGIN
		RETURN (@maas/30)
END

SELECT personelid, maas, dbo.gunlukmaas(maas) AS gunlukucret FROM maas;

CREATE FUNCTION yillikmaas(@maas numeric(6,2))
RETURNS int
BEGIN
		RETURN (@maas*12)
END

SELECT dbo.yillikmaas(maas) AS yillik FROM maas;

CREATE FUNCTION cinsiyet (@cins char(1))
RETURNS TABLE
AS
RETURN SELECT * FROM oyuncular WHERE cinsiyet=@cins;

SELECT * FROM cinsiyet('K')