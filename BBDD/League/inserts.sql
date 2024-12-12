PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE habilidad(
nombre varchar(30) primary key not null,
cd int not null default 0,
coste int not null default 0,
tipo int not null default 0);
INSERT INTO habilidad VALUES('Meeps',0,0,0);
INSERT INTO habilidad VALUES('Cosmic Binding',11,60,1);
INSERT INTO habilidad VALUES('Caretakers Shrine',18,70,2);
INSERT INTO habilidad VALUES('Magical Journey',22,30,3);
INSERT INTO habilidad VALUES('Tempered Fate',110,100,4);
INSERT INTO habilidad VALUES('Runic Blade',0,0,0);
INSERT INTO habilidad VALUES('Broken Wings',13,0,1);
INSERT INTO habilidad VALUES('Ki Burst',11,0,2);
INSERT INTO habilidad VALUES('Valor',10,0,3);
INSERT INTO habilidad VALUES('Blade of the Exile',120,0,4);
INSERT INTO habilidad VALUES('Thorns',0,0,0);
INSERT INTO habilidad VALUES('Ever Rising Moon',0,0,0);
INSERT INTO habilidad VALUES('Get Excited!',0,0,0);
INSERT INTO habilidad VALUES('Switcheroo!',0.9,20,1);
INSERT INTO habilidad VALUES('Zap!',8,40,2);
INSERT INTO habilidad VALUES('Flame Chompers!',24,90,3);
INSERT INTO habilidad VALUES('Super Mega Death Rocket!',85,100,4);
INSERT INTO habilidad VALUES('Bring it Down',0,0,0);
INSERT INTO habilidad VALUES('Ravenous Crescent',10,0,1);
INSERT INTO habilidad VALUES('Cleave',0,0,0);
INSERT INTO habilidad VALUES('Reaping Slash',7,50,1);
INSERT INTO habilidad VALUES('Blades Reach',13,60,2);
INSERT INTO habilidad VALUES('Shadow Step',21,90,3);
INSERT INTO habilidad VALUES('Umbral Trespass',120,100,4);
INSERT INTO habilidad VALUES('Timewinder',9,50,1);
INSERT INTO habilidad VALUES('Parallel Convergence',22,30,2);
INSERT INTO habilidad VALUES('Phase Dive',9,40,3);
INSERT INTO habilidad VALUES('Chronobreak',110,100,4);
INSERT INTO habilidad VALUES('Z-Drive Resonance',5,0,0);
INSERT INTO habilidad VALUES('The Darkin Scythe',0,0,0);
INSERT INTO habilidad VALUES('Slow',0,0,0);
INSERT INTO habilidad VALUES('None_pas',0,0,0);
INSERT INTO habilidad VALUES('None_act',0,0,1);
INSERT INTO habilidad VALUES('Speed',0,0,0);
INSERT INTO habilidad VALUES('Portal Ally Preference',0,0,0);
INSERT INTO habilidad VALUES('Stun',0,0,0);
INSERT INTO habilidad VALUES('Shield',0,0,0);
INSERT INTO habilidad VALUES('Attack Boost',0,0,0);
INSERT INTO habilidad VALUES('Range Boost',0,0,0);
INSERT INTO habilidad VALUES('Execute',0,0,0);
INSERT INTO habilidad VALUES('Headshot',0,0,0);
INSERT INTO habilidad VALUES('Guerrilla Warfare',0,0,0);
INSERT INTO habilidad VALUES('Nightstalker',0,0,0);
INSERT INTO habilidad VALUES('Perfection',0,0,0);
INSERT INTO habilidad VALUES('Immolate',0,0,0);
INSERT INTO habilidad VALUES('Torment',0,0,0);
INSERT INTO habilidad VALUES('Resurrection',0,0,0);
INSERT INTO habilidad VALUES('Piltover Peacemaker',10,55,1);
INSERT INTO habilidad VALUES('Blinding Dart',7,70,1);
INSERT INTO habilidad VALUES('Yordle Snap Trap',26,20,2);
INSERT INTO habilidad VALUES('Move Quick',14,40,2);
INSERT INTO habilidad VALUES('90 Caliber Net',16,75,3);
INSERT INTO habilidad VALUES('Toxic Shot',0,0,3);
INSERT INTO habilidad VALUES('Ace in the Hole',90,100,4);
INSERT INTO habilidad VALUES('Noxious Trap',35,75,0);
INSERT INTO habilidad VALUES('Poison',0,0,0);

CREATE TABLE pasiva(
nombre varchar(30) primary key not null,
activacion text,
foreign key(nombre) references habilidad(nombre));
INSERT INTO pasiva VALUES('Meeps','His basic attacks are empowered to each consume a Meep on-attack');
INSERT INTO pasiva VALUES('Runic Blade','Rivens ability casts generate a stack of Charge for 6 seconds, refreshing on subsequent casts and stacking up to 3 times. Rivens basic attacks are empowered to each consume a stack to deal bonus physical damage');
INSERT INTO pasiva VALUES('Ever Rising Moon','Damaging basic attacks, abilities, item effects, and summoner spells, as well as the application of Stun icon crowd control and damage over time effects within a 2 second period deals bonus physical damage');
INSERT INTO pasiva VALUES('Get Excited!','Whenever Jinx scores a takedown against an enemy champion, epic monster, turret, or inhibitor within 3 seconds of damaging them, she gains 175% bonus movement speed decaying over 6 seconds.');
INSERT INTO pasiva VALUES('Bring it Down',' Basic attacks on-hit grant a stack for 3 seconds, up to 2 stacks. At 2 stacks, the next basic attack consumes all stacks to deal bonus physical damage on-hit.');
INSERT INTO pasiva VALUES('Cleave','Basic attacks on-hit deal damage to nearby enemies in a radius.');
INSERT INTO pasiva VALUES('The Darkin Scythe','Dealing damage against champions causes them to drops orbs that are automatically collected upon leaving combat, filling a bar above Kayns portrait');
INSERT INTO pasiva VALUES('Charge Attack','Increase Damage from basic attack');
INSERT INTO pasiva VALUES('Time Heal','Recover all the health lost in the last 4 seconds');
INSERT INTO pasiva VALUES('Z-Drive Resonance','Ekkos Zero-Drive charges his spells and attacks with temporal energy');
INSERT INTO pasiva VALUES('Slow','Slows enemies hit');
INSERT INTO pasiva VALUES('None_pas','No passive effect');
INSERT INTO pasiva VALUES('Speed','Speeds allies affected');
INSERT INTO pasiva VALUES('Portal Ally Preference','Allies move 30% faster through the portal');
INSERT INTO pasiva VALUES('Stun','Stops enemies from doing anything');
INSERT INTO pasiva VALUES('Shield','Shields the user');
INSERT INTO pasiva VALUES('Attack Boost','Gives the user a boost in their attack damage stat');
INSERT INTO pasiva VALUES('Thorns','When struck by a basic attack on-hit, deal 20 magic damage to the attacker');
INSERT INTO pasiva VALUES('Range Boost','User has their range attack increased.');
INSERT INTO pasiva VALUES('Execute','Deals more damage the lower the enemy health is.');
INSERT INTO pasiva VALUES('Headshot','After a set number of basic attacks or when attacking an enemy caught in her traps or net, her next basic attack deals bonus damage based on her critical strike chance');
INSERT INTO pasiva VALUES('Guerrilla Warfare','If Teemo stands still for 1.5 seconds without taking damage, he becomes invisible indefinitely');
INSERT INTO pasiva VALUES('Nightstalker','Grants invisibility for 1.5 seconds after a takedown and resets cooldown.');
INSERT INTO pasiva VALUES('Perfection','Increases critical strike damage by 35% when critical chance exceeds 60%.');
INSERT INTO pasiva VALUES('Immolate','Deals magic damage per second to nearby enemies and enhances basic attacks after immobilizing an enemy.');
INSERT INTO pasiva VALUES('Torment','Deals bonus magic damage over time and increases damage based on enemy max health.');
INSERT INTO pasiva VALUES('Resurrection','Revives the user upon death with 50% base health and mana after a 4-second delay.');
INSERT INTO pasiva VALUES('Poison','Poisons enemies, dealing damage over time');
INSERT INTO pasiva VALUES('Blind','Blinds enemies, preventing them from using their basic attacks.');
CREATE TABLE hab1(
nombre varchar(30) primary key not null,
dano int not null default 0,
nombre_pasiva varchar(30),
foreign key(nombre) references habilidad(nombre),
foreign key(nombre_pasiva) references pasiva(nombre));
INSERT INTO hab1 VALUES('Cosmic Binding',80,'Slow');
INSERT INTO hab1 VALUES('Broken Wings',45,'None_pas');
INSERT INTO hab1 VALUES('None_act',0,'None_pas');
INSERT INTO hab1 VALUES('Switcheroo!',110,'Range Boost');
INSERT INTO hab1 VALUES('Ravenous Crescent',30,'Cleave');
INSERT INTO hab1 VALUES('Reaping Slash',75,'The Darkin Scythe');
INSERT INTO hab1 VALUES('Timewinder',70,'Slow');
INSERT INTO hab1 VALUES('Piltover Peacemaker',50,'Headshot');
INSERT INTO hab1 VALUES('Blinding Dart',80,'Blind');
CREATE TABLE hab2(
nombre varchar(30) primary key not null,
modificacion text,
nombre_pasiva varchar(30),
foreign key(nombre) references habilidad(nombre),
foreign key(nombre_pasiva) references pasiva(nombre));
INSERT INTO hab2 VALUES('Caretakers Shrine','Heals allies. After 5 seconds, healing is doubled','Speed');
INSERT INTO hab2 VALUES('Ki Burst','Stuns nearby enemies for 0.75s','Stun');
INSERT INTO hab2 VALUES('Zap!','Reveals enemies hit','Slow');
INSERT INTO hab2 VALUES('Blades Reach','After a short delay all enemies in a line are slowed by 90%, decaying over 1.5 seconds.','Slow');
INSERT INTO hab2 VALUES('Parallel Convergence','attacks against enemies below 30% health deal 3% of the targets missing health as magic damage','Stun');
INSERT INTO hab2 VALUES('Yordle Snap Trap','sets a trap that roots enemies who step on it and reveals them for a short duration','Headshot');
INSERT INTO hab2 VALUES('Move Quick','Teemo passively gains bonus movement speed unless he is damaged. When activated, Teemo sprints for a short duration, gaining even more movement speed','Speed');
CREATE TABLE hab3(
nombre varchar(30) primary key not null,
distancia int not null default 0,
nombre_pasiva varchar(30),
foreign key(nombre) references habilidad(nombre),
foreign key(nombre_pasiva) references pasiva(nombre));
INSERT INTO hab3 VALUES('Magical Journey',1000,'Portal Ally Preference');
INSERT INTO hab3 VALUES('Valor',250,'Shield');
INSERT INTO hab3 VALUES('Flame Chompers!',0,'Stun');
INSERT INTO hab3 VALUES('Shadow Step',40,'Speed');
INSERT INTO hab3 VALUES('Phase Dive',325,'Charge Attack');
INSERT INTO hab3 VALUES('90 Caliber Net',750,'Headshot');
INSERT INTO hab3 VALUES('Toxic Shot',0,'Poison');
CREATE TABLE hab4(
nombre varchar(30) primary key not null,
atributo varchar(20),
nombre_pasiva varchar(30),
foreign key(nombre) references habilidad(nombre),
foreign key(nombre_pasiva) references pasiva(nombre));
INSERT INTO hab4 VALUES('Tempered Fate','Ability Haste','None_pas');
INSERT INTO hab4 VALUES('Blade of the Exile','Attack Damage','Attack Boost');
INSERT INTO hab4 VALUES('Super Mega Death Rocket!','Attack Damage','Execute');
INSERT INTO hab4 VALUES('Umbral Trespass','Attack Damage','The Darkin Scythe');
INSERT INTO hab4 VALUES('Chronobreak','Ability Power','Time Heal');
INSERT INTO hab4 VALUES('Ace in the Hole','Range','Headshot');
INSERT INTO hab4 VALUES('Noxious Trap','Range','Poison');
CREATE TABLE item(
nombre varchar(20) primary key not null,
precio int not null default 0,
stats varchar(32) not null,
tipo varchar(10) not null,
descripcion text not null,
nombre_pasiva varchar(30),
nombre_hab1 varchar(30),
foreign key(nombre_pasiva) references pasiva(nombre),
foreign key(nombre_hab1) references hab1(nombre));
INSERT INTO item VALUES('None',0,'No stats','','','None_pas','None_act');
INSERT INTO item VALUES('Thornmail',2450,'Armor,Hp','Tank','Item good for tanks, especially against basic attack teams','Thorns','None_act');
INSERT INTO item VALUES('Eclipse',2900,'Attack Damage, Ability Haste','Fighter','Item good for fighters','Ever Rising Moon','None_act');
INSERT INTO item VALUES('Kraken Slayer',3100,'Attack Damage, Attack Speed','Marksman','Item great for marksmen,good for taking down tanks','Bring it Down','None_act');
INSERT INTO item VALUES('Ravenous Hydra',3300,'Attack Damage, Lifesteal','Fighter','Item great for fighters who lack sustain in battle','Ravenous Crescent','Cleave');
INSERT INTO item VALUES('Duskblade of Draktharr',3100,'60ad, 18lethality, 20ah','Assassin','Grants bonus damage and invisibility after a takedown.','Nightstalker','Cosmic Binding');
INSERT INTO item VALUES('Infinity Edge',3400,'70ad, 20crit','Marksman','Increases critical strike damage by 35% when crit chance is above 60%.','Perfection','Cosmic Binding');
INSERT INTO item VALUES('Sunfire Aegis',3200,'500hp, 50armor, 50mr','Tank','Deals AoE magic damage around the user and enhances basic attacks after immobilizing an enemy.','Immolate','Cosmic Binding');
INSERT INTO item VALUES('Liandrys Anguish',3200,'80ap, 600mana, 20ah','Mage','Deals bonus damage over time and increases damage based on enemy max health.','Torment','Blinding Dart');
CREATE TABLE runas(
id integer primary key autoincrement,
keystone char(1) not null, 
settings char(10) not null);
INSERT INTO runas VALUES(1,'R','233D013213');
INSERT INTO runas VALUES(2,'P','213R330213');
INSERT INTO runas VALUES(3,'D','333P203213');
INSERT INTO runas VALUES(4,'P','223I201113');
INSERT INTO runas VALUES(5,'D','331I201213');
INSERT INTO runas VALUES(6,'D','2133S033213');
CREATE TABLE personaje(
nombre varchar(30) primary key not null,
nombre_pasiva varchar(30) not null,
nombre_hab1 varchar(30) not null,
nombre_hab2 varchar(30) not null,
nombre_hab3 varchar(30) not null,
nombre_hab4 varchar(30) not null,
stats varchar(64) not null,
rol varchar(15) not null,
foreign key (nombre_pasiva) references pasiva(nombre),
foreign key (nombre_hab1) references hab1(nombre),
foreign key (nombre_hab2) references hab2(nombre),
foreign key (nombre_hab3) references hab3(nombre),
foreign key (nombre_hab4) references hab4(nombre));
INSERT INTO personaje VALUES('Bard','Meeps','Cosmic Binding','Caretakers Shrine','Magical Journey','Tempered Fate','630hp,5.5regen,34armor,30mr,330ms,350mana,6mregen,52ad,175crit,500range','Tank');
INSERT INTO personaje VALUES('Riven','Runic Blade','Broken Wings','Ki Burst','Valor','Blade of the Exile','630hp,N/A,8.5hpregen,N/A,33armor,64ad,32mr,175crit,340ms,125range','Fighter');
INSERT INTO personaje VALUES('Jinx','Get Excited!','Switcheroo!','Zap!','Flame Chompers!','Super Mega Death Rocket!','630hp,260mana,3.75hpregen,6.7manaregen,26armor,59ad,30mr,175crit,325ms,525range','Marksman');
INSERT INTO personaje VALUES('Kayn','The Darkin Sythe','Reaping Slash','Blades Reach','Shadow Step','Umbral Trespass','655hp, 8regen, 38armor, 32mr, 340ms, 410mana, 11.5mregen, 68 ad, 175crit, 175range','Assassin');
INSERT INTO personaje VALUES('Ekko','Z-Drive Resonance','Timewinder','Parallel Convergence','Phase Dive','Chronobreak','655hp, 9regen, 32armor, 32mr, 340ms, 280mana, 7mregen, 58 ad, 175crit, 125range','Assassin');
INSERT INTO personaje VALUES('Caitlyn','Headshot','Piltover Peacemaker','Yordle Snap Trap','90 Caliber Net','Ace in the Hole','630hp, 5.5regen, 34armor, 30mr, 330ms, 350mana, 6mregen, 52ad, 175crit,600range','Bot');
INSERT INTO personaje VALUES('Teemo','Guerrilla Warfare','Blinding Dart','Move Quick','Toxic Shot','Noxious Trap','598hp,5.5regen,24armor,30mr,330ms,250mana,7mregen,54ad,500range','Mage');
CREATE TABLE inventario(
campeon varchar(30) not null,
item1 varchar(20),
item2 varchar(20),
item3 varchar(20),
item4 varchar(20),
item5 varchar(20),
item6 varchar(20),
id integer primary key autoincrement,
foreign key(campeon) references personaje(nombre),
foreign key(item1,item2,item3,item4,item5,item6) references item(nombre,nombre,nombre,nombre,nombre,nombre));
CREATE TABLE partida(
id integer primary key autoincrement,
mins integer not null default 0,
secs integer not null default 0,
ganador char(4) not null,
personaje_rojo varchar(30) not null,
inventario_rojo integer not null,
runas_rojo integer not null,
personaje_azul varchar(30) not null,
inventario_azul integer not null,
runas_azul integer not null,
foreign key(runas_rojo,runas_azul) references runas(id,id),
foreign key(personaje_rojo,personaje_azul) references personaje(nombre,nombre),
foreign key(inventario_rojo,inventario_azul) references inventario(id,id),
check(ganador in('rojo','azul')));
CREATE TABLE metricas(
id integer primary key autoincrement,
victory integer not null default 0,
partida integer not null,
personaje varchar(30) not null,
dano integer not null default 0,
oro integer not null default 0,
farm integer not null default 0,
asesinatos integer not null default 0,
muertes integer not null default 0,
asistencias integer not null default 0,
vision integer not null default 0,
foreign key(partida) references partida(id),
foreign key(personaje) references personaje(nombre));
INSERT INTO sqlite_sequence VALUES('runas',6);
INSERT INTO sqlite_sequence VALUES('runas',2);
COMMIT;
