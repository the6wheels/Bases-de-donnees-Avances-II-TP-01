DROP TABLE Locale_de_Sport;

CREATE TABLE Employe(
					numEmploye int not null PRIMARY KEY, 
					nom char(30), 
                    prenom char(30), 
					age int, 
                    adresse varchar(100));
       
       
CREATE TABLE Locale_de_Sport(numLocal varchar(100) not null PRIMARY KEY, 
							 nomLocal varchar(200));  
        
        
CREATE TABLE Sport(numSport varchar (100) not null PRIMARY KEY, 
				   nomSport char(30), 
				   numLocal varchar(100), 
				   salle varchar(100), 
				   FOREIGN KEY(numLocal) REFERENCES Locale_de_Sport(numLocal));
        
        
CREATE TABLE Inscription (numSport varchar (100), 
						  numEmploye int, 
						  Inscription_date date, 
						  nbreHeures int, 
						  FOREIGN KEY(numSport) REFERENCES Sport(numSport), 
						  FOREIGN KEY(numEmploye) REFERENCES Employe(numEmploye));



INSERT INTO Employe VALUES(1,'Hadjazi','Hisham',20,'SBA');
INSERT INTO Employe VALUES(2,'Amuer','Wasim',20,'Tindouf');
INSERT INTO Employe VALUES(3,'Sahraoui','Amine',31,'SBA');
INSERT INTO Employe VALUES(4,'Merioua','Adel',31,'Oran');
INSERT INTO Employe VALUES(5,'Rais','Akram',35,'Biskra');
INSERT INTO Employe VALUES(6,'Chanbi','Maroua',25,'Oran');
INSERT INTO Employe VALUES(7,'Azzi','Sara',20,'Saida');
INSERT INTO Employe VALUES(8,'Mlata','Moncif',50,'Mascara');




INSERT INTO Employe VALUES(100, 'ABID', 'Mohamed', 35, 'SBA');
INSERT INTO Employe VALUES(101, 'BEY', 'Amina', 41, 'SBA');
INSERT INTO Employe VALUES(102, ' MIR', 'Ilyas', 29, 'Oran');
INSERT INTO Employe VALUES(103, 'DIAFI', 'Adel', 25, 'Oran');
INSERT INTO Employe VALUES(104, 'AMAR', 'Ali', 38, 'Oran');
INSERT INTO Employe VALUES(105, 'BENSAID', 'Salima', 39, 'Alger');
INSERT INTO Employe VALUES(106, 'NOUR', 'Khadija', 49, 'Alger');
INSERT INTO Employe VALUES(107, 'NACER', 'Fatima', 29, 'Oran');











INSERT INTO Locale_de_Sport VALUES('L4', 'MiraSport');
INSERT INTO Locale_de_Sport VALUES('L5', 'Victoire');
INSERT INTO Locale_de_Sport VALUES('L6', 'SBAGYM');


INSERT INTO Sport VALUES('S1', 'Swim', 'L4', '1');
INSERT INTO Sport VALUES('S2', 'Football', 'L5', '2');
INSERT INTO Sport VALUES('S3', 'Running', 'L6', '2');
INSERT INTO Sport VALUES('S4', 'Swim', 'L4', '3');
INSERT INTO Sport VALUES('S5', 'VollyBall', 'L5', '1');
INSERT INTO Sport VALUES('S6', 'Soccer', 'L6', '1');
INSERT INTO Sport VALUES('S7', 'Tennis', 'L4', '2');
INSERT INTO Sport VALUES('S8', 'Rugby', 'L5', '2');

UPDATE
    Sport
SET
    nomSport = 'Aerobic',
    column2 = 'L1',
    column3 = '3',
WHERE
    numSport = 1;


INSERT INTO Sport VALUES(1, ' Aérobic ', 'L1', 3);
INSERT INTO Sport VALUES(2, ' Athlétisme ', 'L1', 1);
INSERT INTO Sport VALUES(3, ' Basket-ball ', 'L2', 1);
INSERT INTO Sport VALUES(4, ' Hand-ball ', 'L3', 2);




INSERT INTO Inscription VALUES('S1', 1, '15-01-2019', 20);
INSERT INTO Inscription VALUES('S2', 2, '05-01-2020', 20);
INSERT INTO Inscription VALUES('S3', 6, '15-01-2020', 20);
INSERT INTO Inscription VALUES('S4', 7, '25-01-2021', 20);
INSERT INTO Inscription VALUES('S2', 2, '05-01-2020', 20);
INSERT INTO Inscription VALUES('S2', 2, '05-01-2020', 20);
INSERT INTO Inscription VALUES('S1', 1, '15-01-2019', 20);
INSERT INTO Inscription VALUES('S3', 6, '15-01-2020', 20);
INSERT INTO Inscription VALUES('S3', 6, '15-01-2020', 20);
INSERT INTO Inscription VALUES('S1', 1, '15-01-2019', 20);
INSERT INTO Inscription VALUES('S4', 7, '25-01-2021', 20);
INSERT INTO Inscription VALUES('S4', 7, '25-01-2021', 20);
INSERT INTO Inscription VALUES('S4', 7, '25-01-2021', 20);
INSERT INTO Inscription VALUES('S4', 7, '25-01-2021', 20);
INSERT INTO Inscription VALUES('S1', 1, '15-01-2019', 20);
INSERT INTO Inscription VALUES('S4', 7, '25-01-2021', 20);
INSERT INTO Inscription VALUES('S4', 7, '25-01-2021', 20);
INSERT INTO Inscription VALUES('S4', 7, '30-01-2021', 20);







select to_char(to_date(Inscription_date,'DD-MM-YYYY'), 'DD-MM-YY') from Inscription;
ALTER SESSION SET nls_date_format='dd-mm-yy';
select to_date(to_char(Inscription_date,'DD-MM-YY')) 
from Inscription;


SELECT e.numEmploye, e.nom, e.prenom 
FROM Employe e 
INNER JOIN Inscription i 
ON e.numEmploye = i.numEmploye 
INNER JOIN Sport s 
ON i.numSport = s.numSport 
INNER JOIN Locale_de_Sport l 
ON s.numLocal = l.numLocal 
WHERE l.nomLocal = 'Victoire';




SELECT DISTINCT e.numEmploye
FROM Employe e 
INNER JOIN Inscription i 
ON e.numEmploye = i.numEmploye 
INNER JOIN Sport s 
ON i.numSport = s.numSport 
INNER JOIN Locale_de_Sport l 
ON s.numLocal = l.numLocal 
WHERE l.numLocal <> 1
ORDER BY e.numEmploye;






SELECT numSport FROM Sport WHERE Salle = '1' OR Salle = '2';







select numSport from Inscription i ,
where s.numSport = r.numSport
group by numSport
having count(*) = (select count(*) from Inscription)



select i.numSport from Inscription i
where s.numSport = r.numSport
group by numSport
having count(*) = (select count(*) from Inscription)









SELECT s.numSport
FROM Sport s
WHERE s.numSport IN ( 
             SELECT i.numSport
             FROM Inscription i
           )
GROUP BY s.numSport
HAVING COUNT(*) = ( 
                    SELECT COUNT (*)
                    FROM Inscription
                  );







SELECT i.numSport FROM Inscription i INNER JOIN Employe e ON i.numEmploye = e.numEmploye GROUP BY i.numSport HAVING COUNT(*) = (SELECT COUN(*) FROM Inscription);
