/* These enhancements use MySQL guidelines, which you can find here: https://dev.mysql.com/doc/internals/en/coding-style.html */

/* These are the new enhancements and the creation of the Arkham Horror Database */


CREATE DATABASE arkhamDB;

USE arkhamDB;

/* These are the new Arkham Horror tables */


/* Table for Enemies */

CREATE TABLE arkham_enemies (
EnemyID int,
EnemyName varchar(255),
EnemyExpansion varchar(255),
EnemyAttributes varchar(255)
);




/* Table for Consumables */

CREATE TABLE arkham_consumables (
ConsumID int NOT NULL UNIQUE,
CardType varchar(255) NOT NULL,
CardName varchar(255)
);



/* Table for Investigators */

CREATE TABLE arkham_investigators (
InvestiID int NOT NULL UNIQUE,
InvestiType varchar(255) NOT NULL,
InvestiName varchar(255),
InvestiItems varchar(255) NOT NULL,
InvestiHealth varchar(255),
InvestiSanity varchar(255),
InvestiAge int,
CHECK (InvestiAge<=100)  /*This implements input validation */
);




/* New Person Table */

CREATE TABLE player_person (
PersonID int NOT NULL UNIQUE,
PersonHairColor int NOT NULL,
PersonAge int,
CHECK (PersonAge<=90)
);



/* New Image Table */

CREATE TABLE image (
ImageName varchar(50)
);



/* New Message-Image Table */

CREATE TABLE message_image (
ImageID int NOT NULL,
MessageID int NOT NULL,
SELECT IF(ImageID>MessageID, "Image First", "Message First")    
);



/* Timeouts */

SET SESSION TOTAL_EXECUTION_TIME=450500;




/* Join specific tables that relate to each other for ease */

SELECT arkham_investigators.InvestiItems, arkham_consumables.CardType
FROM arkham_investigators
INNER JOIN arkham_consumables ON arkham_investigators.InvestiType = arkham_consumables.InvestiType




/* SQL Injection Prevention */

SELECT * FROM Users WHERE Name="" or "value" = "value" AND Password="" or "value" = "value";




/* Input Validation for Investigator's Health and Sanity */

SELECT InvestiID, InvestiHealth, IF(InvestiHealth>9, "Healthy", "Injured")
FROM arkham_investigators;

SELECT InvestiID, InvestiSanity, IF(InvestiSanity>7, "Sane", "Insane")
FROM arkham_investigators;




/* These are the entries for the Arkham Horror Tables that contain different enemies, consumables, and investigators */

/* These entries are for the enemies table */

INSERT INTO arkham_enemies (EnemyID, EnemyName, EnemyExpansion, EnemyAttributes)
VALUES ('1100', 'Wolf-Man Drew', 'Main Game', 'Hunter'),
VALUES ('1101', 'Whippoorwill', 'Main Game', 'Hunter'),
VALUES ('1102', 'Shoreline Brute', 'Main Game', 'Hunter'),
VALUES ('1103', 'Sea Singer', 'Main Game', 'Lurker'),
VALUES ('1104', 'Rlyeh Guardian', 'Main Game', 'Massive, Patrol'),
VALUES ('1105', 'Ocean Scion', 'Main Game', 'Patrol'),
VALUES ('1106', 'Ghoul Priest', 'Main Game', 'Lurker'),
VALUES ('1107', 'Billy Cooper', 'Main Game', 'Lurker'),
VALUES ('1108', 'Undulating Mass', 'Dead of Night', 'Patrol'),
VALUES ('1109', 'Brawling Riot', 'Dead of Night', 'Lurker'),
VALUES ('1110', 'Capricious Stalker', 'Dead of Night', 'Hunter'),
VALUES ('1111', 'Cerebral Extractor', 'Dead of Night', 'Lurker'),
VALUES ('1112', 'Crawling One', 'Dead of Night', 'Hunter'),
VALUES ('1113', 'Terrified Wanderer', 'Under Dark Waves', 'Hunter'),
VALUES ('1114', 'Swooping Scavenger', 'Under Dark Waves', 'Patrol'),
VALUES ('1115', 'Icebound Captive', 'Under Dark Waves', 'Lurker'),
VALUES ('1116', 'Hovering Byakhee', 'Under Dark Waves', 'Pursuit, Lurker'),
VALUES ('1117', 'Guardian Beast', 'Under Dark Waves', 'Patrol'),
VALUES ('1118', 'Accursed Somnambulist', 'Under Dark Waves', 'Lurker');




/* These entries are for the consumables table */

INSERT INTO arkham_consumables (ConsumID, CardType, CardName)
VALUES ('1200', 'Talent', 'Astrolabe'),
VALUES ('1201', 'Item', 'Magnifying Glass'),
VALUES ('1202', 'Item', 'True Magick'),
VALUES ('1203', 'Item', 'Mystic Scroll'),
VALUES ('1204', 'Item', 'Token of Faith'),
VALUES ('1205', 'Item', 'Grotesque Statue'),
VALUES ('1206', 'Item', 'Pocket Watch'),
VALUES ('1207', 'Item', 'Elder Sign Amulet'),
VALUES ('1208', 'Spell', 'Mists of Rlyeh'),
VALUES ('1209', 'Spell', 'Binding'),
VALUES ('1210', 'Spell', 'Healing Words'),
VALUES ('1211', 'Spell', 'Shriveling'),
VALUES ('1212', 'Spell', 'Wither'),
VALUES ('1213', 'Ally', 'Gabriel Carillo'),
VALUES ('1214', 'Ally', 'Tetsuo Mori'),
VALUES ('1215', 'Ally', 'Amos Blythe'),
VALUES ('1216', 'Ally', 'Jenica Capra'),
VALUES ('1217', 'Ally', 'Chuck Fergus');



/* These entries are for the investigators table */

INSERT INTO arkham_investigators (InvestiID, InvestiType, InvestiName, InvestiItems, InvestiHealth, InvestiSanity, InvestiAge)
VALUES ('1300', 'Seeker', 'Rex Murphy', '$3', '7 Health', '7 Sanity', '35'),
VALUES ('1301', 'Seeker', 'Norman Withers', '$1', '5 Health', '7 Sanity', '72'),
VALUES ('1302', 'Guardian', 'Roland Banks', '$3', '7 Health', '5 Sanity', '43'),
VALUES ('1303', 'Rogue', 'Skids O Toole', '$2', '6 Health', '6 Sanity', '28'),
VALUES ('1304', 'Rogue', 'Michael McGlen', '$3', '8 Health', '4 Sanity', '32'),
VALUES ('1305', 'Mystic', 'Diana Stanley', '$2', '7 Health', '5 Sanity', '30'),
VALUES ('1306', 'Mystic', 'Agnes Baker', '$3', '6 Health', '6 Sanity', '34');
