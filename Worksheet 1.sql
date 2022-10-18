CREATE SCHEMA handin1;

CREATE DOMAIN hotelNo AS char(4) CONSTRAINT con_hotelNo CHECK (value > 'H000' AND value < 'H999');
CREATE DOMAIN hotelName AS varchar(25);
CREATE DOMAIN city AS varchar(15);
CREATE DOMAIN roomNo AS smallint CONSTRAINT con_roomNo CHECK(value > 0 AND value < 101);
CREATE DOMAIN type AS varchar(10) DEFAULT 'Single' CHECK(value IN ('Single','Double','Family'));
CREATE DOMAIN price AS decimal (5,2) CONSTRAINT con_price CHECK(value BETWEEN 10.00 AND 100.00);
CREATE DOMAIN guestNo AS varchar(4);
CREATE DOMAIN dateFrom AS date CONSTRAINT con_dateFrom CHECK(value > now());
CREATE DOMAIN dateTo AS date CONSTRAINT con_dateTo CHECK(value > now());
CREATE DOMAIN guestName AS varchar(50);
CREATE DOMAIN guestAddress AS varchar(100);


CREATE TABLE hotel
(
   hotelno     hotelno NOT NULL UNIQUE PRIMARY KEY,
   hotelname   hotelname,
   city        city
);

CREATE TABLE room
(
   roomno    roomno,
   hotelno   hotelno,
   type      type,
   price     price,
   PRIMARY KEY (roomno, hotelno)
);



CREATE TABLE booking
(
   hotelno    hotelno,
   guestno    guestno,
   datefrom   datefrom,
   dateto     dateto,
   roomno     roomno,
   PRIMARY KEY (hotelno, guestno, datefrom)
);

CREATE TABLE guest
(
   guestno        guestno NOT NULL UNIQUE PRIMARY KEY,
   guestname      guestname,
   guestaddress   guestaddress
);

CREATE TABLE booking_history
(
   hotelno    hotelno,
   guestno    guestno,
   datefrom   datefrom NOT NULL PRIMARY KEY,
   dateto     dateto,
   roomno     roomno
);

ALTER TABLE booking
   ADD CONSTRAINT FK_roomno FOREIGN KEY (roomno,hotelno)
       REFERENCES room (roomno,hotelno) ON UPDATE CASCADE ON DELETE SET NULL;
	   
ALTER TABLE room
   ADD CONSTRAINT FK_hotelno FOREIGN KEY (hotelno)
       REFERENCES hotel (hotelno) ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE booking
   ADD CONSTRAINT FK_guestno FOREIGN KEY (guestno)
       REFERENCES guest (guestno) ON UPDATE CASCADE ON DELETE SET NULL;



INSERT INTO hotel
     VALUES ('H001', 'HolidayIn', 'Berlin');

INSERT INTO hotel
     VALUES ('H002', 'Lunas Hotel', 'Alvor');

INSERT INTO hotel
     VALUES ('H003', 'Kalina Garden', 'Sunny Beach');

INSERT INTO hotel
     VALUES ('H004', 'Cosmos', 'Chisinau');

INSERT INTO hotel
     VALUES ('H005', 'Floral', 'Creta');

INSERT INTO hotel
     VALUES ('H006', 'Opus', 'Horsens');

INSERT INTO room
     VALUES ('1',
             'H001',
             'Single',
             '50');

INSERT INTO room
     VALUES ('2',
             'H001',
             'Single',
             '50');

INSERT INTO room
     VALUES ('3',
             'H001',
             'Single',
             '50');

INSERT INTO room
     VALUES ('4',
             'H001',
             'Double',
             '80');

INSERT INTO room
     VALUES ('5',
             'H001',
             'Family',
             '100');


INSERT INTO room
     VALUES ('1',
             'H002',
             'Single',
             '50');

INSERT INTO room
     VALUES ('2',
             'H002',
             'Single',
             '50');

INSERT INTO room
     VALUES ('3',
             'H002',
             'Single',
             '50');

INSERT INTO room
     VALUES ('4',
             'H002',
             'Double',
             '80');

INSERT INTO room
     VALUES ('5',
             'H002',
             'Family',
             '100');


INSERT INTO room
     VALUES ('1',
             'H003',
             'Single',
             '50');

INSERT INTO room
     VALUES ('2',
             'H003',
             'Single',
             '50');

INSERT INTO room
     VALUES ('3',
             'H003',
             'Single',
             '50');

INSERT INTO room
     VALUES ('4',
             'H003',
             'Double',
             '80');

INSERT INTO room
     VALUES ('5',
             'H003',
             'Family',
             '100');

INSERT INTO room
     VALUES ('1',
             'H004',
             'Single',
             '50');

INSERT INTO room
     VALUES ('2',
             'H004',
             'Single',
             '50');

INSERT INTO room
     VALUES ('3',
             'H004',
             'Single',
             '50');

INSERT INTO room
     VALUES ('4',
             'H004',
             'Double',
             '80');

INSERT INTO room
     VALUES ('5',
             'H004',
             'Family',
             '100');

INSERT INTO room
     VALUES ('1',
             'H005',
             'Single',
             '50');

INSERT INTO room
     VALUES ('2',
             'H005',
             'Single',
             '50');

INSERT INTO room
     VALUES ('3',
             'H005',
             'Single',
             '50');

INSERT INTO room
     VALUES ('4',
             'H005',
             'Double',
             '80');

INSERT INTO room
     VALUES ('5',
             'H005',
             'Family',
             '100');

INSERT INTO room
     VALUES ('6',
             'H006',
             'Single',
             '50');

INSERT INTO room
     VALUES ('7',
             'H006',
             'Single',
             '50');

INSERT INTO room
     VALUES ('8',
             'H006',
             'Single',
             '50');

INSERT INTO room
     VALUES ('9',
             'H006',
             'Double',
             '80');

INSERT INTO room
     VALUES ('10',
             'H006',
             'Family',
             '100');

INSERT INTO guest
        VALUES (
                  'G001',
                  'Marius Paps',
                  'Carolinelunsvej 41, 2 8700 Horsens, Danmark');

INSERT INTO guest
        VALUES (
                  'G002',
                  'Dumitru Muntean',
                  'Kollegievaenget 22, 1, 8700 Horsens, Danmark');

INSERT INTO guest
        VALUES (
                  'G003',
                  'Constatin Cornea',
                  'Kollegievaget 22, 1, 8700 Horsens, Danmark');

INSERT INTO guest
        VALUES (
                  'G004',
                  'Corneliu Cornea',
                  'Rua do Allecrim 15, Setubal, Portugal');

INSERT INTO guest
     VALUES ('G005', 'Lars Larsen', 'Marsalle 32 8609 Vejlre, Denmark');

INSERT INTO guest
        VALUES (
                  'G006',
                  'Jean-Claude Van-Damme',
                  'Bd. Stefan cel mare si Sfint 2204 Chisinau, Moldova');
				  
insert into booking values ('H001', 'G002',
to_date('15-9-2017', 'DD-MM-YYYY'),
to_date('20-09-2017', 'DD-MM-YYYY'),'5');  

insert into booking values ('H002', 'G003',
to_date('20-9-2017', 'DD-MM-YYYY'),
to_date('20-10-2017', 'DD-MM-YYYY'),'4');	

insert into booking values ('H003', 'G004',
to_date('15-11-2017', 'DD-MM-YYYY'),
to_date('28-10-2017', 'DD-MM-YYYY'),'3');	

insert into booking values ('H004', 'G005',
to_date('15-12-2017', 'DD-MM-YYYY'),
to_date('28-11-2017', 'DD-MM-YYYY'),'3');	


-- 6.7

select * from hotel;

--6.8

select * from hotel where city = 'Berlin';

-- 6.9 

 select guestname ,  guestaddress 
 
 from guest 
 where guestaddress like '%Horsens%' 
 order by guestname;
 
 --6.10
 
 select * from room
 where price < '101' and (type = 'Double' or type = 'Family')
 ORDER by price;
 
 --6.11
 
 select * from booking where dateto is null;
 
 --6.12
 
 select count(*) from hotel;
 
 --6.13
 
 select avg(price) from room;
 
 --6.14
 
 select sum(price) from room where type = 'Double';
 
 -- 6.15
 
 select * from booking where datefrom > to_date ('01.09.2017' , 'DD.MM.YYYY')
 
  and dateto < to_date ('30.09.2017','DD.MM.YYYY');
  
  
  -- 6.16
  
 select r.price , r.type from room r INNER JOIN hotel h on r.hotelno = h.hotelno
 where hotelname = 'Cosmos';
 
 
 
 
 
 
 
 
 
 
--6.19


--select Sum(price) from hotel where datefrom = now();





 
 
 




				  
				  

				  
				  
				  
				  
