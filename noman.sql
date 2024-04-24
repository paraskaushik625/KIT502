----
-- phpLiteAdmin database dump (https://www.phpliteadmin.org/)
-- phpLiteAdmin version: 1.9.9-dev
-- Exported: 10:16am on April 24, 2024 (UTC)
-- database file: ./db/WWC2024.db
----
BEGIN TRANSACTION;

----
-- Table structure for papers
----
CREATE TABLE papers(
 paperID INTEGER PRIMARY KEY,
 userID INTEGER REFERENCES users(userID),
 paper_type INTEGER REFERENCES "locations"(paper_type),
 accepted BOOLEAN NOT NULL,
   title TEXT NOT NULL,
 abstract TEXT NOT NULL
 );

----
-- Data dump for papers, a total of 3 rows
----
INSERT INTO "papers" ("paperID","userID","paper_type","accepted","title","abstract") VALUES ('1','6','1','False','Responsive','The paper investigates how to make responsive webpage with modern technology.');
INSERT INTO "papers" ("paperID","userID","paper_type","accepted","title","abstract") VALUES ('2','7','4','True','The paper analyses the possible cyberattacks and proposes the solutions.','Analyses the possible cyberattacks and proposes the solutions. And the variety of solutions.');
INSERT INTO "papers" ("paperID","userID","paper_type","accepted","title","abstract") VALUES ('3','8','2','True',' Investigation on user experience','The purpose of the paper is to understand how to improve the design of the web page for better user experience.');

----
-- Table structure for review
----
CREATE TABLE review(
 reviewID INTEGER PRIMARY KEY AUTOINCREMENT,
 userID INTEGER REFERENCES users(userID),
 paperID INTEGER REFERENCES papers(paperID),
 result INTEGER NOT NULL 
 );

----
-- Data dump for review, a total of 4 rows
----
INSERT INTO "review" ("reviewID","userID","paperID","result") VALUES ('1','4','2','4');
INSERT INTO "review" ("reviewID","userID","paperID","result") VALUES ('2','5','1','2');
INSERT INTO "review" ("reviewID","userID","paperID","result") VALUES ('3','5','3','3');
INSERT INTO "review" ("reviewID","userID","paperID","result") VALUES ('4','4','1','1');

----
-- Table structure for role
----
CREATE TABLE role(
 roleID INTEGER PRIMARY KEY AUTOINCREMENT,
 description TEXT NOT NULL
 );

----
-- Data dump for role, a total of 4 rows
----
INSERT INTO "role" ("roleID","description") VALUES ('1','Chair');
INSERT INTO "role" ("roleID","description") VALUES ('2','Organiser');
INSERT INTO "role" ("roleID","description") VALUES ('3','Reviewer');
INSERT INTO "role" ("roleID","description") VALUES ('4','Author');

----
-- Table structure for locations
----
CREATE TABLE "locations"(
    paper_type INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
   description TEXT NOT NULL,
     location TEXT NOT NULL);

----
-- Data dump for locations, a total of 5 rows
----
INSERT INTO "locations" ("paper_type","description","location") VALUES ('1','paper','Sandy Bay');
INSERT INTO "locations" ("paper_type","description","location") VALUES ('2','working group','City');
INSERT INTO "locations" ("paper_type","description","location") VALUES ('3','poster','Sandy Bay');
INSERT INTO "locations" ("paper_type","description","location") VALUES ('4','doctoral consortium','Sandy Bay');
INSERT INTO "locations" ("paper_type","description","location") VALUES ('5','tips, techniques and courseware','City');

----
-- Table structure for users
----
CREATE TABLE users(
 userID INTEGER PRIMARY KEY AUTOINCREMENT,
 name TEXT NOT NULL,
 email_address TEXT NOT NULL,
 affiliation TEXT NOT NULL,
 role NUMERIC NOT NULL
 , contact  VARCHAR);

----
-- Data dump for users, a total of 25 rows
----
INSERT INTO "users" ("userID","name","email_address","affiliation","role","contact") VALUES ('1','Katharine Silva','ks@test.com','UTAS','1','34587677');
INSERT INTO "users" ("userID","name","email_address","affiliation","role","contact") VALUES ('2','Sue Benitez','sb@test.com','UNSW','2','87564566');
INSERT INTO "users" ("userID","name","email_address","affiliation","role","contact") VALUES ('3','Ladonna Gregory','lg@test.com','RMIT','2','45653789');
INSERT INTO "users" ("userID","name","email_address","affiliation","role","contact") VALUES ('4','Virginia Butler','vb@test.com','UQ','3','56734567');
INSERT INTO "users" ("userID","name","email_address","affiliation","role","contact") VALUES ('5','Ronda Hull','rh@test.com','UTS','3','67865435');
INSERT INTO "users" ("userID","name","email_address","affiliation","role","contact") VALUES ('6','Collin Cook','col@test.com','UTAS','4','98686685');
INSERT INTO "users" ("userID","name","email_address","affiliation","role","contact") VALUES ('7','Roma Mitchell','rm@test.com','UQ','4','95467822');
INSERT INTO "users" ("userID","name","email_address","affiliation","role","contact") VALUES ('8','Alexa Town','at@test.com','ANU','4','56745678');
INSERT INTO "users" ("userID","name","email_address","affiliation","role","contact") VALUES ('15','dsa','paraskaushik552@gmail.com','ds','4',NULL);
INSERT INTO "users" ("userID","name","email_address","affiliation","role","contact") VALUES ('16','dsa','paraskaushik552@gmail.com','ds','4',NULL);
INSERT INTO "users" ("userID","name","email_address","affiliation","role","contact") VALUES ('17','dsa','paraskaushik552@gmail.com','ds','4',NULL);
INSERT INTO "users" ("userID","name","email_address","affiliation","role","contact") VALUES ('18','dsa','paraskaushik552@gmail.com','ds','4',NULL);
INSERT INTO "users" ("userID","name","email_address","affiliation","role","contact") VALUES ('19','dsa','paraskaushik552@gmail.com','ds','4',NULL);
INSERT INTO "users" ("userID","name","email_address","affiliation","role","contact") VALUES ('20','dsa','paraskaushik552@gmail.com','ds','4',NULL);
INSERT INTO "users" ("userID","name","email_address","affiliation","role","contact") VALUES ('21','dsa','paraskaushik552@gmail.com','ds','4',NULL);
INSERT INTO "users" ("userID","name","email_address","affiliation","role","contact") VALUES ('22','dsa','paraskaushik552@gmail.com','ds','4',NULL);
INSERT INTO "users" ("userID","name","email_address","affiliation","role","contact") VALUES ('23','dsa','paraskaushik552@gmail.com','ds','4',NULL);
INSERT INTO "users" ("userID","name","email_address","affiliation","role","contact") VALUES ('24','dsa','paraskaushik552@gmail.com','ds','4',NULL);
INSERT INTO "users" ("userID","name","email_address","affiliation","role","contact") VALUES ('25','dsa','dsa@121.com','ds','4',NULL);
INSERT INTO "users" ("userID","name","email_address","affiliation","role","contact") VALUES ('26','dsa','dsa@121.com','ds','4',NULL);
INSERT INTO "users" ("userID","name","email_address","affiliation","role","contact") VALUES ('27','dsa','dsa@121.com','ds','4',NULL);
INSERT INTO "users" ("userID","name","email_address","affiliation","role","contact") VALUES ('28','dsa','rm@test.com','dasd','4',NULL);
INSERT INTO "users" ("userID","name","email_address","affiliation","role","contact") VALUES ('29','dsa','rm@test.com','dasd','4',NULL);
INSERT INTO "users" ("userID","name","email_address","affiliation","role","contact") VALUES ('30','dsa','rm@test.com','dasd','4',NULL);
INSERT INTO "users" ("userID","name","email_address","affiliation","role","contact") VALUES ('31','dsa','rm@test.com','dasd','4',NULL);
COMMIT;
