/*drop table tranzactie;
drop table plata;
drop table factura;
drop table rezervare;
drop table angajati;
drop table contract;
drop table activitate;
drop table parteneri;
drop table feedback;
drop table clienti;
drop table camera;
drop table hotel;
drop table locatie;
drop table tara;
commit;

drop sequence seq_client;
drop sequence ang;*/

create table Tara(
id_tara number(2) constraint pk_tara primary key,
nume_tara varchar2(20));

create table Locatie(
id_locatie number(2) constraint pk_loc primary key,
strada varchar2(20),
id_tara number(3),
CONSTRAINT FK_ID_TARA FOREIGN KEY(ID_TARA) REFERENCES TARA(ID_TARA));

create table Hotel(
id_hotel number(4),
id_locatie number(2),
nume_hotel varchar2(30),
constraint pk_hotel primary key(id_hotel),
constraint fk_id_loc foreign key(id_locatie) references locatie(id_locatie));

create table Camera(
id_camera number(2) constraint pk_camera primary key,
id_hotel number(4),
etaj number(2),
tip_camera varchar2(20),
pret number (4),
dotare varchar2(40),
constraint fk_hotel foreign key(id_hotel) references hotel(id_hotel));

create table Clienti(
id_client number(4) constraint pk_client primary key,
cnp_c number(13),
nume_c  varchar2(20) constraint null_name NOT NULL,
prenume_c  varchar2(20),
nr_telefon number(10),
constraint unq_nume_pren unique(nume_c, prenume_c));

create table Feedback(
id_feedback number(4) constraint pk_fb primary key,
id_client number(4),
subiect varchar2(20),
observatie varchar2(100),
data_fb date default sysdate,
constraint fk_fb foreign key(id_client) references clienti(id_client));

create table Parteneri(
id_partener number(2) constraint pk_partener primary key,
nume_firma varchar2(20),
nume_reprezentant varchar2(20),
nr_telefon_partener number(10),
feedback varchar(40));

create table Activitate(
id_activitate number(2) constraint pk_activitate primary key,
pret number(4));

create table Contract(
id_partener number(2) not null,
id_activitate number(2) not null,
id_client number(4) not null,
constraint fk_p foreign key(id_partener) references parteneri(id_partener),
constraint fk_a foreign key(id_activitate) references activitate(id_activitate),
constraint fk_c foreign key(id_client) references clienti(id_client));

create table Angajati(
id_ang number(4) ,
id_hotel number(4),
cnp number(13),
nume  varchar2(20) constraint null_name__tnt NOT NULL,
prenume  varchar2(20),
job varchar2(30),
telefon  number(10),
salariu  number(8,  2) not null,
data_ang  date default sysdate,
varsta number(2) default null,
certificare_lingvistica varchar2(20) default null,
studii varchar2(20) default null,
functie varchar(20) default null,
CONSTRAINT pk_ang_tnt PRIMARY KEY(id_ang),
CONSTRAINT fk_id_hotel foreign key(id_hotel) references hotel(id_hotel));

create table Rezervare(
id_rezervare number(5) constraint pk_rez primary key,
id_camera number(2) constraint null_camera not null,
id_client number(4) not null,
id_ang number(4) not null,
data_inceput date not null,
nr_zile number(3),
constraint fk_cam foreign key(id_camera) references Camera(id_camera),
constraint fk_cl foreign key(id_client) references Clienti(id_client),
constraint fk_ang foreign key(id_ang) references Angajati(id_ang));


create table Factura(
id_factura number(5) constraint pk_factura primary key,
id_client number(4) not null,
id_ang number(4) not null,
data_plata date not null,
valoare number(5),
constraint fk_cl1 foreign key(id_client) references Clienti(id_client),
constraint fk_ang1 foreign key(id_ang) references Angajati(id_ang));

create table Plata(
id_tip_plata number(1) constraint pk_plata primary key,
modalitate varchar2(20));


create table Tranzactie(
id_factura number(5),
id_tip_plata number(1),
constraint fk_factura foreign key(id_factura) references factura(id_factura),
constraint fk_plata foreign key(id_tip_plata) references plata(id_tip_plata));




INSERT INTO Tara
VALUES (1, 'Romania');

INSERT INTO Tara
VALUES (2, 'Italia');

INSERT INTO Tara
VALUES (3, 'Germania');

INSERT INTO Tara
VALUES (4, 'Anglia');

INSERT INTO Tara
VALUES (5, 'Elvetia');


INSERT INTO Locatie
VALUES (1, 'Stefan cel Mare',1);

INSERT INTO Locatie
VALUES (2, 'Via Margutta',2);

INSERT INTO Locatie
VALUES (3, 'Herr Smidt',3);

INSERT INTO Locatie
VALUES (4, 'Calea Victoriei',1);

INSERT INTO Locatie
VALUES (5, 'Strada Pandurului',1);


INSERT INTO Hotel
VALUES (1, 1, 'Hotel Royal');

INSERT INTO Hotel
VALUES (2, 2, 'Holiday Inn');

INSERT INTO Hotel
VALUES (3, 3, 'Holiday Inn');

INSERT INTO Hotel
VALUES (4, 1, 'Hotel Royal');

INSERT INTO Hotel
VALUES (5, 1, 'Hotel Royal');

INSERT INTO Hotel
VALUES (6, 5, 'Plazza Hotel');


INSERT INTO Camera
VALUES (1, 1, 1, 'Standard', 70,'Smart Tv mediu');

INSERT INTO Camera
VALUES (2, 1, 2, 'Twin', 80,'Smart Tv mare');

INSERT INTO Camera
VALUES (3, 1, 3, 'Studio', 100,'Home Cinema, Aragaz, Frigider, Seif');

INSERT INTO Camera
VALUES (4, 2, 3, 'Twin', 90,'Smart Tv mare');

INSERT INTO Camera
VALUES (5, 2, 4, 'Studio', 120,'Home Cinema, Aragaz, Frigider, Seif');

INSERT INTO Camera
VALUES (6, 6, 4, 'King-Room', 200,'Home Cinema, Aragaz, Frigider, Seif');


INSERT INTO Plata
VALUES (1,'Mastercard');

INSERT INTO Plata
VALUES (2,'Visa');

INSERT INTO Plata
VALUES (3,'Bitcoin');

INSERT INTO Plata
VALUES (4,'Ethereum');


INSERT INTO Activitate
VALUES (1, 50);

INSERT INTO Activitate
VALUES (2, 100);

INSERT INTO Activitate
VALUES (3, 80);

INSERT INTO Activitate
VALUES (4, 250);

INSERT INTO Activitate
VALUES (5, 100);


INSERT INTO Parteneri
VALUES (1, 'Moutain-ATV', 'Rusescu Marian', 0766321723, null);

INSERT INTO Parteneri
VALUES (2, 'Atv and Moutainbikes', 'Petrea Constantin',0723789621 , null);

INSERT INTO Parteneri
VALUES (3, 'Skipass-Ski Rentall', 'Anghel Victor', 075211743, null);

INSERT INTO Parteneri
VALUES (4, 'Ski and Snowboards', 'Marinas Catalina', 0721456732, null);

INSERT INTO Parteneri
VALUES (5, 'Transport Aeroport', 'Florea Antonio', 0771987321, null);



create sequence seq_client
start with 100
increment by 1
maxvalue 10000
nocycle nocache;

INSERT INTO Clienti
VALUES (seq_client.nextval, 5020323134122, 'Titiriga', 'Tiberiu', 0771987361);

INSERT INTO Clienti
VALUES (seq_client.nextval, 4010323134122, 'Bordeianu', 'Mirel', 0779876453);

INSERT INTO Clienti
VALUES (seq_client.nextval, 1020323412122, 'Vizitiu', 'Andreas', 0765123321);

INSERT INTO Clienti
VALUES (seq_client.nextval, 2020328230122, 'Ocheana', 'Nicoleta', 0722566378);

INSERT INTO Clienti
VALUES (seq_client.nextval, 1020914341221, 'Miclaus', 'Traian', 0723349870);

INSERT INTO Clienti
VALUES (seq_client.nextval, 5000102139122, 'Manea', 'Stefan', 0773328679);

INSERT INTO Clienti
VALUES (seq_client.nextval, 1021223142122, 'Chichirim', 'Nelu', 0721234980);

INSERT INTO Clienti
VALUES (seq_client.nextval, 5090327434122, 'Oprea', 'Andrei', 0725678361);

INSERT INTO Clienti
VALUES (seq_client.nextval, 1020323324122, 'Vintila', 'Sebastian', 0737702208);

INSERT INTO Clienti
VALUES (seq_client.nextval, 5020326782122, 'Stoicescu', 'Bogdan', 0726123378);

INSERT INTO Clienti
VALUES (seq_client.nextval, 4020323194122, 'Antonela', 'Maria', 0727707831);



INSERT INTO Contract
VALUES (1,1,100);

INSERT INTO Contract
VALUES (2,1,100);

INSERT INTO Contract
VALUES (2,1,101);

INSERT INTO Contract
VALUES (3,2,108);

INSERT INTO Contract
VALUES (3,3,109);

INSERT INTO Contract
VALUES (4,3,109);

INSERT INTO Contract
VALUES (5,4,109);

INSERT INTO Contract
VALUES (5,4,107);

INSERT INTO Contract
VALUES (5,4,105);

INSERT INTO Contract
VALUES (5,4,106);

INSERT INTO Contract
VALUES (3,2,110);


INSERT INTO Feedback
VALUES (1,100, 'Plangere', 'Ospatar nepoliticos',to_date('05-06-2021','dd-mm-yyyy'));

INSERT INTO Feedback
VALUES (2,101, 'Multumire', 'Servicii de inalta calitate', to_date('25-08-2021','dd-mm-yyyy'));

INSERT INTO Feedback
VALUES (3,107, 'Plangere', 'Frig in camera', to_date('25-11-2021','dd-mm-yyyy'));

INSERT INTO Feedback
VALUES (4,109, 'Plangere', 'Fara apa calda', to_date('05-10-2021','dd-mm-yyyy'));

INSERT INTO Feedback
VALUES (5,110, 'Lauda', 'Mancare excelenta', to_date('11-04-2021','dd-mm-yyyy') );


create sequence ang
start with 100
increment by 1
maxvalue 10000
nocycle nocache;

INSERT INTO Angajati
VALUES (ang.nextval, 1, 5020427893322, 'Lacatus' , 'Anghel', 'Receptie',0727378212, 2500, to_date('11-04-2011','dd-mm-yyyy'), null, 'Engleza C2', null, null );

INSERT INTO Angajati
VALUES (ang.nextval, 1, 4020410895422, 'Pavel' , 'Simona', 'Receptie',0756321122, 5500, to_date('02-07-2008','dd-mm-yyyy'), null, 'Engleza C1', null, null );

INSERT INTO Angajati
VALUES (ang.nextval, 1, 4020414873322, 'Mihaila' , 'Maria', 'Receptie',0764532673, 2500, to_date('21-11-2010','dd-mm-yyyy'), null, 'Engleza B2', null, null );

INSERT INTO Angajati
VALUES (ang.nextval, 1, 5010427893322, 'Spoitoru' , 'Stefan', 'Receptie',0724563876, 3000, to_date('11-02-2015','dd-mm-yyyy'), null, 'Engleza C1', null, null );

INSERT INTO Angajati
VALUES (ang.nextval, 2, 5101127893232, 'Serban' , 'Razvan', 'Receptie',0722346748, 2000, to_date('11-04-2018','dd-mm-yyyy'), null, 'Engleza B1', null, null );

INSERT INTO Angajati
VALUES (ang.nextval, 1, 1750427893987, 'Agapie' , 'Iulian', 'Receptie',0723568123, 15000, to_date('11-04-2005','dd-mm-yyyy'), null, null, 'Bussiness&Management', null );

INSERT INTO Angajati
VALUES (ang.nextval, 2, 1900427893363, 'Retezatu' , 'Andrei', 'Receptie',0768983212, 3000, to_date('11-04-2018','dd-mm-yyyy'), 32, null, null, null );

INSERT INTO Angajati
VALUES (ang.nextval, 3, 1870427893622, 'Anghel' , 'Constantin', 'Receptie',0728789093, 2500, to_date('20-05-2019','dd-mm-yyyy'), 35, null, null, null );

INSERT INTO Angajati
VALUES (ang.nextval, 2, 1780427823322, 'Bacovia' , 'George', 'Receptie',0722313678, 2000, to_date('01-04-2021','dd-mm-yyyy'), null, 'Engleza C1', null, null );

INSERT INTO Angajati
VALUES (ang.nextval, 2, 1990427865322, 'Matache' , 'Raul', 'Receptie',0722661439, 4000, to_date('18-09-2020','dd-mm-yyyy'), null, 'Engleza C1', null, null );



INSERT INTO Rezervare
VALUES (10, 1, 101, 103, to_date('18-09-2021','dd-mm-yyyy'),3);

INSERT INTO Rezervare
VALUES (11, 1, 105, 103, to_date('11-06-2021','dd-mm-yyyy'),4);

INSERT INTO Rezervare
VALUES (12, 2, 107, 109, to_date('08-11-2021','dd-mm-yyyy'),5);

INSERT INTO Rezervare
VALUES (13, 2, 108, 109, to_date('26-12-2020','dd-mm-yyyy'),2);

INSERT INTO Rezervare
VALUES (14, 1, 109, 104, to_date('22-01-2020','dd-mm-yyyy'),5);

INSERT INTO Rezervare
VALUES (15, 2, 102, 108, to_date('13-07-2020','dd-mm-yyyy'),5);

INSERT INTO Rezervare
VALUES (16, 4, 102, 102, to_date('18-01-2020','dd-mm-yyyy'),7);

INSERT INTO Rezervare
VALUES (17, 6, 104, 105, to_date('10-01-2021','dd-mm-yyyy'),6);
select * from camera;


INSERT INTO Factura
VALUES (1800, 101, 103, to_date('18-09-2021','dd-mm-yyyy'), 210);

INSERT INTO Factura
VALUES (1801, 105, 103, to_date('11-06-2021','dd-mm-yyyy'),280);

INSERT INTO Factura
VALUES (1802, 107, 109, to_date('08-11-2021','dd-mm-yyyy'),400);

INSERT INTO Factura
VALUES (1803, 108, 109, to_date('26-12-2020','dd-mm-yyyy'),160);

INSERT INTO Factura
VALUES (1804, 109, 104, to_date('22-01-2020','dd-mm-yyyy'),350);

INSERT INTO Factura
VALUES (1805, 102, 108, to_date('13-07-2020','dd-mm-yyyy'),400);


INSERT INTO Tranzactie
VALUES (1800, 1);

INSERT INTO Tranzactie
VALUES (1801, 1);

INSERT INTO Tranzactie
VALUES (1802, 2);

INSERT INTO Tranzactie
VALUES (1803, 1);

INSERT INTO Tranzactie
VALUES (1804, 3);

INSERT INTO Tranzactie
VALUES (1805, 3);

commit;


select * from tranzactie;

--6) Formulați în  limbaj  natural o problemă pe care să o rezolvați folosind un subprogram  
--   stocat independent care să utilizeze două tipuri diferite de colecții studiate. Apelați subprogramul.

-- Afisati toti clientii care nu au lasat feedback in urma sederii lor la hotel.

create or replace procedure feed_clienti as
    type tip_cod_client is varray(20) of number;
    type tip_cod_client2 is table of number(4) index by pls_integer;
    vector1 tip_cod_client := tip_cod_client();
    vector2 tip_cod_client2;
    ok number(1):=0;
begin

    select id_client bulk collect into vector1 from clienti;
    select id_client bulk collect into vector2 from feedback;
    
    for i in 1..vector1.count loop
        ok :=0;
        for j in 1..vector2.count loop
            if vector1(i) = vector2(j) then
                ok:=1;
            end if;
        end loop;
        if ok = 0 then
            dbms_output.put_line('Codul clientului este: ' || vector1(i));
        end if;
    end loop;
    
end;
/
execute feed_clienti;

--7) Formulați în  limbaj  natural o problemă pe care să o rezolvați folosind 
--   un subprogram  stocat independent care să utilizeze 2tipuri diferite de cursoare studiate,  
--   unul  dintre  acestea  fiind  cursor parametrizat. Apelați subprogramul.

--Afisati pentru fiecare hotel angajatii care lucreaza in incinta acestuia.
/
create or replace procedure evidenta_angajati as
    cursor c_hotel is select id_hotel from hotel;
    v_nume_hotel hotel.nume_hotel%TYPE;
    v_id_locatie hotel.id_locatie%TYPE;
    id_hot hotel.id_hotel%TYPE;
    v_id_hot hotel.id_hotel%TYPE;
    id_angg angajati.id_ang%TYPE;
begin
    for i in c_hotel loop
    exit when c_hotel%NOTFOUND;
    
    id_hot := i.id_hotel;
    
    select nume_hotel, id_locatie into v_nume_hotel, v_id_locatie
    from hotel 
    where id_hotel = id_hot;
    
    dbms_output.put_line('La hotelul ' || v_nume_hotel || ' din locatia ' || v_id_locatie || ' lucreaza angajatii: ');
    
        for j in (select id_ang, id_hotel from angajati) loop
            id_angg := j.id_ang;
            v_id_hot := j.id_hotel;
        
            if v_id_hot = id_hot then
                dbms_output.put_line('Angajatul cu codul ' || id_angg);
            end if;
        end loop;
    end loop;
end;
/

execute evidenta_angajati;


-- 8) Formulați în limbaj natural o problemă pe care să o rezolvați folosind un subprogram  stocat independent
--    de tip funcție care să utilizeze într-o singură comandă SQL 3 dintre tabelele definite. 
--    Definiți minim 2 excepții. Apelați subprogramulastfel încât să evidențiați toate cazurile tratate

-- Afisati numele si numarul de clienti care au avut rezervare la angajatul al carui nume se termina cu ultimele doua litere date.

create or replace function lista_clienti (secventa_nume angajati.prenume%TYPE)
return number as
    contor number(3) :=0;
    v_id_ang angajati.id_ang%TYPE;
    v_nume_c clienti.nume_c%TYPE;
    v_prenume_c clienti.prenume_c%TYPE;
    type vect is varray(20) of number;
    v vect := vect();
begin

    select id_ang into v_id_ang
    from angajati
    where lower(prenume) like '%'||secventa_nume;
    
    
    for client in (select c.id_client cod, a.id_ang
                   from clienti c, rezervare r, angajati a
                   where c.id_client = r.id_client
                   and r.id_ang = a.id_ang
                   and lower(a.prenume) like '%'||secventa_nume) loop
        contor:=contor+1;
        v.extend;
        v(contor) := client.cod;
    end loop;
     
    if contor = 0 then
        RAISE_APPLICATION_ERROR(-20002,'Angajatul nu a efectuat nicio rezervare');
    end if;
    dbms_output.put_line('Angajatul a avut ' || contor || ' rezervari, iar clientii sunt:');
    
    for i in 1..v.count loop
        select nume_c, prenume_c into v_nume_c, v_prenume_c
        from clienti
        where id_client = v(i);
        
        dbms_output.put_line(v_nume_c || ' ' || v_prenume_c);
    end loop;
  
  
    return contor;
exception
    when NO_DATA_FOUND then 
        RAISE_APPLICATION_ERROR(-20000,'Nu exista niciun angajat cu secventa data in nume');
    when TOO_MANY_ROWS then
        RAISE_APPLICATION_ERROR(-20001,'Exista mai multi angajati cu secventa data in nume');
end lista_clienti;
/

select lista_clienti('fan') from dual;


--9) Formulați în  limbaj  natural o problemă pe care să o rezolvați folosind un subprogram  stocat independent de tip procedură
--   care să utilizeze într-o singură comandă SQL 5  dintre  tabelele definite.  Tratați  toate  excepțiile  care  pot  apărea,  incluzând  excepțiile  NO_DATA_FOUND  și TOO_MANY_ROWS. Apelați subprogramulastfel încât să evidențiați toate cazurile tratate.

-- Cati bani au cheltuit pe activitati persoanele cazate in camere al caror pret este in intervalul dat?

select * from camera;
select * from rezervare;
select * from clienti;
select * from contract;
select * from activitate;

create or replace procedure evidenta_activitati (v_pret camera.pret%TYPE, v_pret2 camera.pret%TYPE) as
    suma camera.pret%TYPE := 0;
    v_id_camera camera.id_camera%TYPE;
begin
    select id_camera into v_id_camera
    from camera
    where pret > v_pret
    and pret < v_pret2;
    
    for activitate in (
            select a.pret cost
            from activitate a, contract c, clienti cl, rezervare r, camera ca
            where a.id_activitate = c.id_activitate
            and c.id_client = cl.id_client
            and r.id_client = cl.id_client
            and r.id_camera = ca.id_camera
            and ca.pret > v_pret
            and ca.pret < v_pret2) loop
        suma := suma + activitate.cost;
    end loop;
    dbms_output.put_line(suma);
exception
    when NO_DATA_FOUND then 
        RAISE_APPLICATION_ERROR(-20000,'Nu sunt camere la pretul acesta');
    when TOO_MANY_ROWS then
        RAISE_APPLICATION_ERROR(-20001,'Exista mai multe camera cu pretul sub cel dat');
end evidenta_activitati;
/

execute evidenta_activitati(0,100);


--10) Definiți un trigger de tip LMD la nivel de comandă. Declanșați trigger-ul.

-- Creati un declansator care nu permite efectuarea unei facturi intre orele 23:00-01:00 avand in vedere inchiderea fiscala pentru ziua respectiva

-- note: sysdate-ul dintr-un oarecare motiv este cu doua ore inapoi..
create or replace trigger emitere_facturi
BEFORE 
INSERT
on factura
begin
    if((to_char(sysdate,'HH24') >= 23 and to_char(sysdate,'HH24') <= 24) or (to_char(sysdate,'HH24') >= 0 and to_char(sysdate,'HH24') <= 1 )) then
        raise_application_error(-20004,'Nu se poate factura. Inchidere fiscala!');
    end if;
end;
/
select * from factura;

insert into factura
values(1806, 103, 109, to_date(sysdate),300);
rollback;

drop trigger emitere_facturi;

delete from factura where id_factura = 1806;


--11) Definiți un triggerde tip LMD la nivel de linie. Declanșați trigger-ul.

-- Avem nevoie de un declansator pentru momentul in care se cere modificarea pretului unei activitati
-- In anumite cazuri aceasta modificare nu este convenabila fie pentru clienti, fie pentru parteneri
-- Fara acordul managerului, nu se poate efectua aceasta modificare

create or replace trigger modificare_pret
    before update of pret on activitate
    for each row
begin
    if(:OLD.pret + :OLD.pret/2 < :NEW.pret) then
        RAISE_APPLICATION_ERROR(-20005,'Pretul nou nu e convenabil pentru clienti! Contactati managerul!');
    elsif (:OLD.pret - :OLD.pret/2 >:NEW.pret) then
        RAISE_APPLICATION_ERROR(-20006,'Pretul e prea mic, nu acopera comisioanele! Contactati managerul!');
    end if;
end;
/

update activitate
set pret = 200
where id_activitate = 1;

--12) Definiți un triggerde tip LDD. Declanșați trigger-ul.

-- Nu permiteti stergerea tabelelor din baza de date.

CREATE OR REPLACE TRIGGER stergere_tabele
BEFORE DROP ON SCHEMA 
BEGIN
    RAISE_APPLICATION_ERROR(-20006,'Nu poti sterge tabele in cadrul acestei baze de date');
END;
/
drop trigger stergere_tabele;
create table test_tnt(id_col number(2));
drop table test_tnt;



--13) Definiți un pachet care să conțină toate obiectele definite în cadrul proiectului.

create or replace package pachet1 as
    procedure feed_clienti;
    procedure evidenta_angajati;
    function lista_clienti (secventa_nume angajati.prenume%TYPE) return number;
    procedure evidenta_activitati (v_pret camera.pret%TYPE, v_pret2 camera.pret%TYPE);
end pachet1;
/


create or replace package body pachet1 as 

procedure feed_clienti as
    type tip_cod_client is varray(20) of number;
    type tip_cod_client2 is table of number(4) index by pls_integer;
    vector1 tip_cod_client := tip_cod_client();
    vector2 tip_cod_client2;
    ok number(1):=0;
begin

    select id_client bulk collect into vector1 from clienti;
    select id_client bulk collect into vector2 from feedback;
    
    for i in 1..vector1.count loop
        ok :=0;
        for j in 1..vector2.count loop
            if vector1(i) = vector2(j) then
                ok:=1;
            end if;
        end loop;
        if ok = 0 then
            dbms_output.put_line('Codul clientului este: ' || vector1(i));
        end if;
    end loop;
    
end;


procedure evidenta_angajati as
    cursor c_hotel is select id_hotel from hotel;
    v_nume_hotel hotel.nume_hotel%TYPE;
    v_id_locatie hotel.id_locatie%TYPE;
    id_hot hotel.id_hotel%TYPE;
    v_id_hot hotel.id_hotel%TYPE;
    id_angg angajati.id_ang%TYPE;
begin
    for i in c_hotel loop
    exit when c_hotel%NOTFOUND;
    
    id_hot := i.id_hotel;
    
    select nume_hotel, id_locatie into v_nume_hotel, v_id_locatie
    from hotel 
    where id_hotel = id_hot;
    
    dbms_output.put_line('La hotelul ' || v_nume_hotel || ' din locatia ' || v_id_locatie || ' lucreaza angajatii: ');
    
        for j in (select id_ang, id_hotel from angajati) loop
            id_angg := j.id_ang;
            v_id_hot := j.id_hotel;
        
            if v_id_hot = id_hot then
                dbms_output.put_line('Angajatul cu codul ' || id_angg);
            end if;
        end loop;
    end loop;
end;


function lista_clienti (secventa_nume angajati.prenume%TYPE)
return number as
    contor number(3) :=0;
    v_id_ang angajati.id_ang%TYPE;
    v_nume_c clienti.nume_c%TYPE;
    v_prenume_c clienti.prenume_c%TYPE;
    type vect is varray(20) of number;
    v vect := vect();
begin

    select id_ang into v_id_ang
    from angajati
    where lower(prenume) like '%'||secventa_nume;
    
    
    for client in (select c.id_client cod, a.id_ang
                   from clienti c, rezervare r, angajati a
                   where c.id_client = r.id_client
                   and r.id_ang = a.id_ang
                   and lower(a.prenume) like '%'||secventa_nume) loop
        contor:=contor+1;
        v.extend;
        v(contor) := client.cod;
    end loop;
     
    if contor = 0 then
        RAISE_APPLICATION_ERROR(-20002,'Angajatul nu a efectuat nicio rezervare');
    end if;
    dbms_output.put_line('Angajatul a avut ' || contor || ' rezervari, iar clientii sunt:');
    
    for i in 1..v.count loop
        select nume_c, prenume_c into v_nume_c, v_prenume_c
        from clienti
        where id_client = v(i);
        
        dbms_output.put_line(v_nume_c || ' ' || v_prenume_c);
    end loop;
  
  
    return contor;
exception
    when NO_DATA_FOUND then 
        RAISE_APPLICATION_ERROR(-20000,'Nu exista niciun angajat cu secventa data in nume');
    when TOO_MANY_ROWS then
        RAISE_APPLICATION_ERROR(-20001,'Exista mai multi angajati cu secventa data in nume');
end lista_clienti;


procedure evidenta_activitati (v_pret camera.pret%TYPE, v_pret2 camera.pret%TYPE) as
    suma camera.pret%TYPE := 0;
    v_id_camera camera.id_camera%TYPE;
begin
    select id_camera into v_id_camera
    from camera
    where pret > v_pret
    and pret < v_pret2;
    
    for activitate in (
            select a.pret cost
            from activitate a, contract c, clienti cl, rezervare r, camera ca
            where a.id_activitate = c.id_activitate
            and c.id_client = cl.id_client
            and r.id_client = cl.id_client
            and r.id_camera = ca.id_camera
            and ca.pret > v_pret
            and ca.pret < v_pret2) loop
        suma := suma + activitate.cost;
    end loop;
    dbms_output.put_line(suma);
exception
    when NO_DATA_FOUND then 
        RAISE_APPLICATION_ERROR(-20000,'Nu sunt camere la pretul acesta');
    when TOO_MANY_ROWS then
        RAISE_APPLICATION_ERROR(-20001,'Exista mai multe camera cu pretul sub cel dat');
end evidenta_activitati;

end pachet1;
/







