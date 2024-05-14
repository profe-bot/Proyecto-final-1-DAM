-- cosas "pending": las INSERTS
-- como estamos trabajando con cartas que son reales, no podemos generar valores de los atributos aliatoriamente
-- asi hasta que las tenemos organizado no tenemos implementado las INSERTS para mantener la table coherente y legible
-- pronto lo tendremos arreglado



-- Required updates:

-- Cambios: added emails to usuarios, hemos cambiado la table de visitantes, y hecho que las nombres de los usuarios y sus emails son unicos. 

-- Set SQL mode and time zone
SET SQL_MODE= "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- Unlock tables if necessary
UNLOCK TABLES;

-- Drop the database if it exists
DROP DATABASE IF EXISTS `Coastline_DCT`;

-- Creamos base de datos
CREATE DATABASE IF NOT EXISTS `Coastline_DCT`;
-- Usamos la base de datos
USE Coastline_DCT;

-- Creamos usuarios

-- Creamos usuario administrador con todos los permisos, leer cualquier dato y ambos acciones
DROP USER IF EXISTS `root`@`%`;
CREATE USER `root`@`%` IDENTIFIED BY 'PaleMoonlight...';
GRANT ALL PRIVILEGES ON Coastline_DCT.* TO 'root'@'%';
FLUSH PRIVILEGES;

DROP USER IF EXISTS `bbdd-administrador`;
CREATE USER `bbdd-administrador` IDENTIFIED BY 'adm';
GRANT ALL PRIVILEGES ON *.* TO `bbdd-administrador`;

-- Creamos un usuario que puede imprimir, crear mazos, editar mazos, buscar cartas, iniciar sesion
DROP USER IF EXISTS `bbdd-usuario`;
CREATE USER `bbdd-usuario` IDENTIFIED BY 'usr';
-- modify to reflect user privelages
GRANT SELECT, DELETE, INSERT ON *.* TO `bbdd-usuario`;

-- Creamos usuario que solo puede buscar cartas datos y registrar
DROP USER IF EXISTS `bbdd-visitante`;
CREATE USER `bbdd-visitante` IDENTIFIED BY 'vis';
-- modify to reflect visitor privelages
GRANT SELECT ON *.* TO `bbdd-visitante`;

-- Creamos tablas

-- formato:

-- las entidades son plurales, y los attributos, especialmente los PK, son singulares 
-- si no logicamente plurales como `detalles buscada`.

-- PKs son INTs 

DROP TABLE IF EXISTS `busquedas`;
CREATE TABLE IF NOT EXISTS `busquedas` (
	`id_busqueda` INT NOT NULL AUTO_INCREMENT,
    `detalles_buscada` VARCHAR(100) DEFAULT 'Search:',
	`hora_buscada` TIME DEFAULT NULL,
    PRIMARY KEY (`id_busqueda`)
);
INSERT INTO `busquedas` (`detalles_buscada`, `hora_buscada`) 
VALUES
	('Search','12:00:00');
    
-- needs to be worked to reflect user inputs, search incrementation, and remote host time

-- the auto-generated 'id_busqueda' value
SET @last_id = LAST_INSERT_ID();

DROP TABLE IF EXISTS `historia_de_busquedas`;
CREATE TABLE IF NOT EXISTS `historia_de_busquedas` (
	`id_historia_busqueda` INT NOT NULL AUTO_INCREMENT,
    `id_busqueda` INT NOT NULL,
    `detalles_buscada` VARCHAR(100) DEFAULT NULL,
    PRIMARY KEY (`id_historia_busqueda`),
    FOREIGN KEY (`id_busqueda`) REFERENCES `busquedas`(`id_busqueda`)
);
INSERT INTO `historia_de_busquedas` (`id_busqueda`, `detalles_buscada`)
VALUES (@last_id, 'Balrog'),
	(@last_id, 'Mercenaries'),
	(@last_id, 'Archers'),
	(@last_id, 'coste 5'),
	(@last_id, 'phoenician'),
	(@last_id, 'Land');
-- corresponsive to `busqueda`

DROP TABLE IF EXISTS `visitantes`;
CREATE TABLE IF NOT EXISTS `visitantes`(
	`id_visitante` INT NOT NULL AUTO_INCREMENT,
	`fecha` DATE DEFAULT NULL,
    `pantalla_aspecto` FLOAT(5) DEFAULT NULL COMMENT 'javascript to read screen and apply the @ for moviles',
    `tiempo_locale` TIME DEFAULT NULL,
    PRIMARY KEY (`id_visitante`)
);
INSERT INTO `visitantes`(`id_visitante`,`fecha`,`pantalla_aspecto`,`tiempo_locale`)
VALUES
	(1,'2024-04-10','16:9','12:02:30'),
    (2,'2024-04-15', '16:9', '14:33:41'),
    (3,'2024-04-15', '18:9', '15:46:30'),
    (4,'2024-04-16', '19:9', '11:25:02'),
    (5,'2024-04-16', '16:9', '16:55:00'),
    (6,'2024-04-17', '16:9', '11:00:32');
    
DROP TABLE IF EXISTS `mazos`;
CREATE TABLE IF NOT EXISTS`mazos`(
	`id_mazo` INT NOT NULL AUTO_INCREMENT,
    -- `idh_cartas_en_mazos`INT NOT NULL AUTO_INCREMENT,
    -- not sure if the ^^ will work, ---------------------
    -- I have been informed that it is not necessary to pass the pk of the norm back to parent entities----------------------------------------------
    `nombre` VARCHAR(20) DEFAULT NULL,
    `cartas_totales` INT DEFAULT NULL,
    -- `id_mazo_en_partida` INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(`id_mazo`)
   --  FOREIGN KEY(`id_cartas_en_mazos`) REFERENCES `cartas_en_mazos`(`id_cartas_en_mazos`).
    -- FOREIGN KEY(`id_mazo_en_partida`) REFERENCES
);
INSERT INTO `mazos`(`id_mazo`,`nombre`,`cartas_totales`)
VALUES
	(1,'-', NULL),
    (2,'-', NULL);
            
-- Drop the table if it exists
DROP TABLE IF EXISTS `usuarios`;


-- NOTE: BORRE ID_MAZOS HASTA IMPLIMENTACION DE CREAR MAZOS
-- Create the consolidated users table
CREATE TABLE IF NOT EXISTS `usuarios` (
    `id_usuario` INT NOT NULL AUTO_INCREMENT,
    `nombre_usuario` VARCHAR(30) DEFAULT NULL,
    `email` VARCHAR(320) DEFAULT NULL COMMENT 'alex found something about how long emails can get',
    `contrasena` VARCHAR(20) DEFAULT NULL,
    `firstname` VARCHAR(30) DEFAULT NULL,
    `lastname` VARCHAR(30) DEFAULT NULL,
    `mazos_creados` INT DEFAULT NULL,
    `id_visitante` INT NOT NULL,
--    `id_mazo` INT NOT NULL,
    PRIMARY KEY (`id_usuario`),
    FOREIGN KEY (`id_visitante`) REFERENCES `visitantes` (`id_visitante`),
--    FOREIGN KEY (`id_mazo`) REFERENCES `mazos` (`id_mazo`),
    CONSTRAINT `distinto_usuario` UNIQUE (`nombre_usuario`, `email`)
);

-- Insert data into the consolidated users table
INSERT INTO `usuarios` (`nombre_usuario`, `email`, `contrasena`, `firstname`, `lastname`, `mazos_creados`, `id_visitante`)
VALUES
    ('mysterious_stranger', 'username1@host.extension', 'password', 'John', 'Doe', NULL, 1),
    ('username', 'username@2host.extension', 'password', NULL, NULL, 1, 2);
        
        
DROP TABLE IF EXISTS `registros_partidas`;
CREATE TABLE IF NOT EXISTS `registros_partidas`(
	`id_partida` INT NOT NULL AUTO_INCREMENT,
    `contador_jugador` INT DEFAULT NULL,
    `contador_turno` INT DEFAULT NULL,
    `id_usuario` INT NOT NULL,
    PRIMARY KEY (`id_partida`),
    FOREIGN KEY (`id_usuario`) REFERENCES `usuarios`(`id_usuario`)
);
INSERT INTO `registros_partidas`(`id_partida`,`contador_jugador`,`contador_turno`,`id_usuario`)
VALUES
	(1,1,1,1),
    (2,1,1,2);
    
DROP TABLE IF EXISTS `mazos_registrados`;
CREATE TABLE IF NOT EXISTS `mazos_registrados`(
	`id_mazo` INT NOT NULL,
    `id_partida` INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`id_mazo`, `id_partida`),
    FOREIGN KEY (`id_mazo`) REFERENCES `mazos`(`id_mazo`),
    FOREIGN KEY (`id_partida`) REFERENCES `registros_partidas`(`id_partida`)
);
INSERT INTO `mazos_registrados`(`id_mazo`,`id_partida`)
VALUES
	(1,1);
    
DROP TABLE IF EXISTS `cartas`;
CREATE TABLE IF NOT EXISTS `cartas` (
	`id_carta` INT NOT NULL,
    `coste` INT DEFAULT NULL,
    -- may need more specification to the parameter of decimal
    `coste_cultural` VARCHAR(20) DEFAULT NULL,
    `supertipo` VARCHAR(30) DEFAULT NULL,
    `texto_reglas` VARCHAR(500) DEFAULT NULL,
    -- this attribute is naturally quite large given that it contains card summaries
    `poder_resiliencia` VARCHAR(11) DEFAULT NULL,
    `set` VARCHAR(5) DEFAULT NULL,
    `id_busqueda` INT NOT NULL,
    `identidad_cultural` VARCHAR(30),
    -- antes este fue dont ibamos a poner la especializacion y fractural este entidad
    -- se lo puede evitar por unir un nuevo atributo "identidad_cultural"
    `nombre` VARCHAR(100) DEFAULT NULL, 
    PRIMARY KEY(`id_carta`),
    FOREIGN KEY(`id_busqueda`) REFERENCES `busquedas`(`id_busqueda`)
);
INSERT INTO `cartas`(`nombre`,`id_carta`,`identidad_cultural`,`coste`,`coste_cultural`,`supertipo`,`texto_reglas`,`poder_resiliencia`,`set`,`id_busqueda`)
VALUES
	('Runic wolf','016A','Celt',2,'C','Unit','While this unit is in a forest it gains +1/+1.','45324','ALP', @last_id),
('Celtic warrior','017A','Celt',3,'C','Unit','-','45385','ALP', @last_id),
('Runic boar','018A','Celt',3,'CC','Unit','While this unit is in a forest it gains +2/+1.','45354','ALP', @last_id),
('Mystical druid','019A','Celt',4,'CC','Unit','When this enters the board give +3/+3 divided as you want between any units you control.','45293','ALP', @last_id),
('Runic bear','020A','Celt',4,'CCC','Unit','While this unit is in a forest it gains +2/+2.','45386','ALP', @last_id),
('Menhir','021A','Celt',3,'CCC','Building','If a unit moves onto this building\'s hex, it can move to any unoccupied forest hex.','-', 'ALP', @last_id),
('Megaliths','022A','Celt',9,'CCCCC','Building','At the beginning of each turn each unit you control on a forest gains +3/+3 permanently.','-', 'ALP', @last_id),
('Nebra disk','023A','Celt',4,'CCCC','Artifact','At the beginning of your turn choose one:Gain (1).Draw and then discard a card.Sacrifice a forest.Sacrifice a Unit you control. When all 4 of these effects have been activated, sacrifice "Nebra disk" and take an additional turn after this one.','-', 'ALP', @last_id),
('Druidic elixir','024A','Celt',1,'C','Intervention','Give target unit +3/+3 until end of turn.','-', 'ALP', @last_id),
('Druidic ritual','025A','Celt',1,'C','Intervention','Choose one:  -Place one forest from your hand. -Return target artifact to its owner\'s hand. -Target unit gets +0/+3.','-', 'ALP', @last_id),
('Ritual Sacrifice','026A','Celt',2,'C','Ritual','Sacrifice a unit you control. gain gold equal to double its power.','-', 'ALP', @last_id),
('Bountiful harvest','027A','Celt',3,'CC','Ritual','Shuffle this card and all your grave into your deck, then for each card you returned gain one life.','-', 'ALP', @last_id),
('Rangers defense','028A','Celt',4,'CCC','Ritual','Place 2 1/2 units on unoccupied forest hexes, draw a card.','-', 'ALP', @last_id),
('Return to nature','029A','Celt',7,'CCC','Ritual','Return all permanents in target hex to its owner\'s deck.','-', 'ALP', @last_id),
('Druidic forest','030A','Celt',null,'C','Land','When this land is placed, target two adjacent non forest, non sea hexes, they become forests.','-', 'ALP', @last_id),
('Etruscan pikeman','031A','Etruscan',1,'E','Unit','-','2/1','ALP', @last_id),
('Standard bearer','032A','Etruscan',2,'EE','Unit','All friendly units in a one hex radius gain +0/1.','0/1','ALP', @last_id),
('Standard thrasher','033A','Etruscan',2,'EE','Unit','All friendly units in a one hex radius gain +1/0.','0/1','ALP', @last_id),
('Villanovan slinger','034A','Etruscan',2,'EE','Unit','Dash 2, Ranged 1. This unit can move and attack on the same turn.','2/1','ALP', @last_id),
('Two sided axe warrior','035A','Etruscan',4,'EE','Unit','Whenever this unit destroys another unit place a 1/1 token adjacent to it.','3/2','ALP', @last_id),
('Maris sanctuary','036A','Etruscan',3,'EEE','Building','All etruscan units gain +1/+1.','-', 'ALP', @last_id),
('Etruscan boar vessel','037A','Etruscan',2,'EE','Artifact','The first time an adjacent unit under your control would die each turn, it remains at 1 toughness instead.','-', 'ALP', @last_id),
('Fasces','038A','Etruscan',4,'EEEE','Artifact','Whenever you would produce a unit token/s, produce an additional one.','-', 'ALP', @last_id),
('Militia recruitment','039A','Etruscan',1,'E','Intervention','Place 3 1/1 tokens on empty hexes, remove them from play at the beginning of your next end phase.','-', 'ALP', @last_id),
('Humanize','040A','Etruscan',4,'EEE','Intervention','Turn a unit into a 1/1 with no abilities.','-', 'ALP', @last_id),
('Rapid development','041A','Etruscan',3,'EEE','Ritual','Gain one gold for each unit you control. Destroy all your gold at the end of this turn.','-', 'ALP', @last_id),
('laurel wreath','042A','Etruscan',4,'EE','Ritual','Give a unit +2/+2 and all adjacent units you control +1/+1 permanently.','-', 'ALP', @last_id),
('Refill the ranks','043A','Etruscan',6,'EEEE','Ritual','Draw one card for each unit you control.','-', 'ALP', @last_id),
('Harvest festival','044A','Etruscan',6,'EEEE','Ritual','Place a 1/1 token in any unoccupied hex you control.','-', 'ALP', @last_id),
('Palatine hill','045A','Etruscan',null,'E','Land','You can only have one copy of this card in your deck. At the start of your turn, you may pay (1), if you do, place a 1/1 token on this hex.','-', 'ALP', @last_id),
('Hittite footsoldier','076A','Hittites',2,'H','Unit','-','3/2','ALP', @last_id),
('Slave miners','077A','Hittites',2,'HH','Unit','Sacrifice this unit and the mine its adjacent to add (3), then you may discard a card, if you do draw a card.','0/1','ALP', @last_id),
('Hittite flame slingers','078A','Hittites',3,'HH','Unit','Ranged 1. When this unit is placed, deal 2 damage to an adjacent unit.','2/1','ALP', @last_id),
('Maryannu riders','079A','Hittites',3,'H','Unit','Ranged 2. Move 2.','2/1','ALP', @last_id),
('Overworked conscripts','080A','Hittites',3,'HH','Unit','At the end of each one of your turns this unit deals 1 damage to itself.','5/3','ALP', @last_id),
('Mesedi guard','081A','Hittites',5,'HHHH','Unit','All units adjacent to mesedi guard cannot be damaged. At the end of each of your turns this unit takes damage equal to half the damage prevented.','5/5','ALP', @last_id),
('War cart','082A','Hittites',2,'HH','Vehicle','Crew 2 Move 2. Whenever this unit destroys a unit, return it to full health. When this unit dies, discard a card.','4/3','ALP', @last_id),
('Open Conflict','083A','Hittites',1,'H','Intervention','Destroy 3 lands, you must control at least one of them that is a mountain.','-', 'ALP', @last_id),
('Sudden deployment','084A','Hittites',4,'HH','Intervention','Reveal the top 6 cards from your deck, place up to 2 Units that cost 3 or less onto unoccupied hexes without paying their cost, remove the rest from the game.','-', 'ALP', @last_id),
('Rushed plan','085A','Hittites',1,'HH','Ritual','Draw 2 cards, then discard 2 cards. Lose 2 life.','-', 'ALP', @last_id),
('By all means','086A','Hittites',2,'HHHH','Ritual','Remove from play half your deck, draw 4 cards, you can only play this card if its the last card in your hand.','-', 'ALP', @last_id),
('Scattershot','087A','Hittites',3,'HH','Ritual','Deal 2 damage to any unit on target hex. If you discard this card you may cast it paying (1) instead.','-', 'ALP', @last_id),
('Arrow rain.','088A','Hittites',4,'H','Ritual','Deal 2 damage to all units in a 3 hex wide area.','-', 'ALP', @last_id),
('Armaggedon','089A','Hittites',8,'HHHHH','Ritual','Deal 4 damage to all units, then destroy all unoccupied lands, shuffle all lands from the grave into the land deck, each player draws lands until they have 4 lands in hand.','-', 'ALP', @last_id),
('Encampment','090A','Hittites',null,'H','Land','Deal 3 damage to an adjacent unit, then this hex becomes a plains.','-', 'ALP', @last_id),
('Iberian vanilla','001A','Iberian',2,'I','Unit','-','4/1','ALP', @last_id),
('Iberian conjurer','002A','Iberian',2,'II','Unit','When this card is placed, you have to destroy two adjacent units, one must be under your control.','1/1','ALP', @last_id),
('Numancian swamp dweller','003A','Iberian',2,'III','Unit','Treats swamps as plains hexes, while this unit is in the swamp gains +1/+1.','2/2','ALP', @last_id),
('Lusitanian guerilla','004A','Iberian',3,'II','Unit','When this unit dies, place a 1/1 token where it died, if the hex is occupied it fights the unit on the hex. This unit Takes no damage from swamps.','2/2','ALP', @last_id),
('Balearic slingers','005A','Iberian',3,'III','Unit','Ranged 2. Takes no damage from swamps.','3/1','ALP', @last_id),
('Lusitanian bandits','006A','Iberian',4,'II','Unit','Whenever a unit dies adjacent to this unit gain (1). Takes no damage from swamps.','2/2','ALP', @last_id),
('Avatar of Airon','007A','Iberian',5,'IIIII','Unit','When this unit is placed, sacrifice 3 adjacent units or remove it from play, whenever a unit is sacrificed adjacent to this unit gains +1/+1 permanently. Pay (1): sacrifice an adjacent unit.','1/1','ALP', @last_id),
('Village burial grounds','008A','Iberian',2,'III','Building','Once per turn: return 3 cards from your grave to your deck, if you do add (1). Shuffle your deck.','-', 'ALP', @last_id),
('Vetton Sacrificial altar','009A','Iberian',3,'II','Building','During your turn, sacrifice an adjacent unit you control: add (1).','-', 'ALP', @last_id),
('Dama de Elche','010A','Iberian',5,'IIIII','Artifact','Whenever a unit you control dies you may pay (1) if you do, draw a card.','-', 'ALP', @last_id),
('Graven goods','011A','Iberian',1,'I','Intervention','If target Unit you control dies this turn add 3(G).','-', 'ALP', @last_id),
('Improvised defenses','012A','Iberian',3,'III','Intervention','Place 3 trap tokens on 3 unoccupied hexes you control, secretly mark one of them as the real trap. If a unit your opponents control moves to the hex with the real trap it is destroyed and you place a 2/2 token in its place under your control.','-', 'ALP', @last_id),
('Defense of the hearth','013A','Iberian',3,'III','Ritual','Place 3 1/1 tokens on unoccupied hexes.','-', 'ALP', @last_id),
('Inherited will','014A','Iberian',4,'III','Ritual','Target 3 cards in your grave, an opponent of your choice adds one to your hand, one to an unoccupied hex you control and one is removed from play.','-', 'ALP', @last_id),
('Cave village','015A','Iberian',null,'I','Land','Whenever an enemy unit enters an adjacent hex, place a 1/1 token on this unoccupied hex.','-', 'ALP', @last_id),
('Plains','101A',null,null,null,'Land',null,null,'ALP', @last_id),
('Forest','102A',null,null,null,'Land','Units heal 2 damage per turn while on forest instead of 1.',null,'ALP', @last_id),
('Mountain','103A',null,null,null,'Land','Non walkable, cannot be placed adjacent to another mountain.',null,'ALP', @last_id),
('River','104A',null,null,null,'Land','Walkable but can be crossed with boats.',null,'ALP', @last_id),
('Swamp','105A',null,null,null,'Land','Units lose one life instead of gaining one at the beginning of each turn.',null,'ALP', @last_id),
('Lone mercenary','091A',null,1,null,'Unit',null,'1/1','ALP', @last_id),
('Mercenary duo','092A',null,2,null,'Unit',null,'2/2','ALP', @last_id),
('Hired archers','093A',null,3,null,'Unit','Ranged 2','2/2','ALP', @last_id),
('Mercenary company','094A',null,3,null,'Unit',null,'3/3','ALP', @last_id),
('Supply squad','095A',null,3,null,'Unit','Other mercenaries you control receive +1/+1 and heal one additional damage per turn.','1/1','ALP', @last_id),
('Mercenary battalion','096A',null,4,null,'Unit',null,'4/4','ALP', @last_id),
('Mercenary warband','097A',null,5,null,'Unit',null,'5/5','ALP', @last_id),
('Rented boat','098A',null,2,null,'Vehicle','Crew 1. move 2. This vehicle can carry one unit across sea tiles.','2/2','ALP', @last_id),
('Battle plans','099A',null,3,null,'Intervention','Effect: Choose two: -Deal 1 damage to a unit. -Give a unit +1/1 permanently. -Draw then discard a card. -Move a unit one hex.',null,'ALP', @last_id),
('Explore','100A',null,3,null,'Ritual','Draw two cards from your land deck, then put one on the board and the other back in the deck, draw a card.',null,'ALP', @last_id),
('Oracle of Delphos','046A','Mycenaean',2,'GGGGG','Unit','Once per turn, during your turn, guess the type of the top card of your library, reveal it, if you were correct, remove it from play and cast it at the beginning of the next turn.','0/2','ALP', @last_id),
('Shield wall','047A','Mycenaean',2,'G','Unit','-','0/6','ALP', @last_id),
('Hoplite phalanx','048A','Mycenaean',4,'GGGG','Unit','Units cannot move out of the adjacent hexes to this unit.','2/6','ALP', @last_id),
('Minoan trireme','049A','Mycenaean',3,'G','Vehicle','Crew 2 Move 3, You may discard a Ritual or Intervention to crew this vehicle for the turn.','3/4','ALP', @last_id),
('Library','050A','Mycenaean',1,'G','Building','Once per turn: shuffle your library','-','ALP', @last_id),
('Acropolis','051A','Mycenaean',3,'GGGG','Building','All your Rituals and interventions cost 1 less gold and require one less culture.','-','ALP', @last_id),
('Mask of Agamemnon','052A','Mycenaean',4,'GGGG','Artifact','Play with the top card of your library revealed, you may play the revealed card.','-','ALP', @last_id),
('Zeus''s bolt','053A','Mycenaean',1,'G','Intervention','Deal 3 damage to any unit in target hex.','-','ALP', @last_id),
('Inspiration','054A','Mycenaean',1,'G','Intervention','Draw 3 cards then place 2 cards from your hand on the top of your deck.','-','ALP', @last_id),
('Marathon','055A','Mycenaean',2,'GG','Intervention','Move target unit you control 5 hexes, it dies at the end of turn.','-','ALP', @last_id),
('Poseidon''s gust','056A','Mycenaean',2,'GG','Intervention','Return target unit to its owners hand.','-','ALP', @last_id),
('Heated debate','057A','Mycenaean',2,'GG','Ritual','Draw 1 card for every card named "Heated debate" in all graveyards.','-','ALP', @last_id),
('Frantic scribing','058A','Mycenaean',3,'GG','Ritual','Select any number of cards from your grave and place them in any order at the top or bottom of your deck, take 1 damage for every card you place at the top of your deck.','-','ALP', @last_id),
('Greek fire','059A','Mycenaean',3,'GG','Ritual','Deal 3 damage in a 3 hex wide area, only affects units at sea.','-','ALP', @last_id),
('Coast of Knossos','060A','Mycenaean',null,'G','Land','You may place 2 buildings on this hex. Buildings on this hex cost (1) less.','-','ALP', @last_id),
('Expert mariner','061A','Phoenician',1,'P','Unit','Can crew any vehicle independent of its crew cost.','0/1','ALP', @last_id),
('Seafaring explorer','062A','Phoenician',2,'P','Unit','Gains +1/+1 for each permanent of another culture you control.','45323','ALP', @last_id),
('Ships captain','063A','Phoenician',4,'P','Unit','-','45416','ALP', @last_id),
('Phoenician raft','064A','Phoenician',1,'P','Vehicle','Crew 1. Move 3. This vehicle can carry 1 unit across water.','45324','ALP', @last_id),
('Gaulos','065A','Phoenician',4,'PPP','Vehicle','Crew 3. Move 4. This vehicle can carry up to 3 units across water.','45448','ALP', @last_id),
('Trade market','066A','Phoenician',3,'P','Building','During your turn discard a land card to generate one gold.','45416','ALP', @last_id),
('Carthaginian port','067A','Phoenician',3,'PP','Building','Place on a sea hex, hexes cannot be placed on this tile. If there is vehicle on this hex, draw a card at the beginning of your turn.','45448','ALP', @last_id),
('Trade seal','068A','Phoenician',1,'PP','Artifact','You may run any amount of copies of this card in your deck. Sacrifice this artifact, offer one face up card from your hand for auction, in turn order each player may offer face down cards or gold until a deal is made, if no bets are accepted gain (1) and draw one card at the beginning of your next turn. Cards obtained this way do not have a culture recruitment associated.','45416','ALP', @last_id),
('Favorable Winds','069A','Phoenician',1,'P','Intervention','Move target unit up to 3 hexes.','45385','ALP', @last_id),
('Drachma minting','070A','Phoenician',1,'PP','Intervention','Until the end of turn, all your gold costs are reduced by (1).','45354','ALP', @last_id),
('Barter','071A','Phoenician',3,'PP','Intervention','Reveal the top 5 cards of your deck to a player of your choice, he separates them in two face up piles, choose one to add to your hand and one to send to your grave.','45324','ALP', @last_id),
('Trade route','072A','Phoenician',2,'P','Ritual','Discard up to 4 cards, draw that many cards +1 at the beginning of your next turn.','45386','ALP', @last_id),
('Paid betrayal','073A','Phoenician','X+2','PPPP','Ritual','Add target unit with X gold cost to your hand. Cards obtained this way have no culture cost associated.','45354','ALP', @last_id),
('Colossal flood','074A','Phoenician',6,'PPPP','Ritual','Return all permanents adjacent to a sea or river hex to their owners hands.','45324','ALP', @last_id),
('Mare nostrum','075A','Phoenician',null,'P','Land','Place this hex on an unoccupied sea hex, the adjacent sea hexes cannot have hexes placed over them.','45448','ALP', @last_id);


	
DROP TABLE IF EXISTS `cartas_en_mazos`;
CREATE TABLE IF NOT EXISTS `cartas_en_mazos`(
	`id_mazo` INT NOT NULL AUTO_INCREMENT,
    `id_carta` INT NOT NULL,
    PRIMARY KEY(`id_mazo`,`id_carta`),
    FOREIGN KEY(`id_mazo`) REFERENCES `mazos`(`id_mazo`),
    FOREIGN KEY(`id_carta`) REFERENCES `cartas`(`id_carta`)
);
INSERT INTO `cartas_en_mazos` (`id_mazo`, `id_carta`)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4);
  
  DROP TABLE IF EXISTS `impresiones`;
  CREATE TABLE IF NOT EXISTS `impresiones`(
	`id_impresion` INT NOT NULL AUTO_INCREMENT,
    `id_usuario` INT NOT NULL, 
    `detalles_de_impresion` VARCHAR(100) DEFAULT NULL,
    PRIMARY KEY(`id_impresion`),
    FOREIGN KEY(`id_usuario`) REFERENCES `usuarios`(`id_usuario`)
);
INSERT INTO `impresiones` (`id_usuario`,`detalles_de_impresion`)
VALUES 
	(1,'Nuevo Mazo'),
    (2,'Nuevo Mazo');
    
DROP TABLE IF EXISTS `consulta_de_mazo`;
CREATE TABLE IF NOT EXISTS `consulta_de_mazo`(
	`id_consulta_de_mazo` INT NOT NULL AUTO_INCREMENT,
	`id_impresion` INT NOT NULL,
	`id_mazo` INT NOT NULL,
	PRIMARY KEY (`id_consulta_de_mazo`),
	FOREIGN KEY (`id_mazo`) REFERENCES `mazos` (`id_mazo`),
	FOREIGN KEY (`id_impresion`) REFERENCES `impresiones` (`id_impresion`)
);
INSERT INTO `consulta_de_mazo` (`id_impresion`, `id_mazo`)
VALUES
    (1, 1),
    (2, 2);

DROP TABLE IF EXISTS `consulta_de_registro`;
CREATE TABLE IF NOT EXISTS `consulta_de_registro`(
	`id_consulta_de_registro` INT NOT NULL AUTO_INCREMENT,
	`id_impresion` INT NOT NULL,
    `id_partida` INT NOT NULL,
    PRIMARY KEY (`id_consulta_de_registro`),
    FOREIGN KEY (`id_partida`) REFERENCES `registros_partidas`(`id_partida`),
    FOREIGN KEY (`id_impresion`) REFERENCES `impresiones`(`id_impresion`)
);
INSERT INTO `consulta_de_registro` (`id_impresion`, `id_partida`)
VALUES
    (1, 1),
    (2, 2);
  
DROP TABLE IF EXISTS `impresion_de_mazo`;
CREATE TABLE IF NOT EXISTS `impresion_de_mazo`(
	`id_impresion` INT NOT NULL,
    `id_consulta_de_mazo` INT NOT NULL,
    PRIMARY KEY(`id_impresion`),
    FOREIGN KEY(`id_consulta_de_mazo`) REFERENCES `consulta_de_mazo`(`id_consulta_de_mazo`)
);
INSERT INTO `impresion_de_mazo` (`id_impresion`, `id_consulta_de_mazo`)
VALUES
    (1, 1),
    (2, 2);
  
DROP TABLE IF EXISTS `impresion_de_registro`;
  CREATE TABLE IF NOT EXISTS `impresion_de_registro`(
	`id_impresion` INT NOT NULL,
    `id_consulta_de_registro` INT NOT NULL,
    PRIMARY KEY(`id_impresion`),
    FOREIGN KEY(`id_consulta_de_registro`) 
		REFERENCES `consulta_de_registro`(`id_consulta_de_registro`)
);
INSERT INTO `impresion_de_registro` (`id_impresion`, `id_consulta_de_registro`)
VALUES
    (1, 1),
    (2, 2);
  
 
