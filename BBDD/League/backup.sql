PRAGMA foreign_keys=OFF;
.nullvalue $$NO_HAY_NA$$
.mode column
BEGIN TRANSACTION;

1CREATE TABLE habilidad(
nombre varchar(30) primary key not null,
cd int not null default 0,
coste int not null default 0);

CREATE TABLE pasiva(
nombre varchar(30) primary key not null,
activacion text,
foreign key(nombre) references habilidad(nombre));

CREATE TABLE hab1(
nombre varchar(30) primary key not null,
dano int not null default 0,
nombre_pasiva varchar(30),
foreign key(nombre) references habilidad(nombre),
foreign key(nombre_pasiva) references pasiva(nombre));

CREATE TABLE hab2(
nombre varchar(30) primary key not null,
modificacion text,
nombre_pasiva varchar(30),
foreign key(nombre) references habilidad(nombre),
foreign key(nombre_pasiva) references pasiva(nombre));

CREATE TABLE hab3(
nombre varchar(30) primary key not null,
distancia int not null default 0,
nombre_pasiva varchar(30),
foreign key(nombre) references habilidad(nombre),
foreign key(nombre_pasiva) references pasiva(nombre));

CREATE TABLE hab4(
nombre varchar(30) primary key not null,
atributo varchar(20),
nombre_pasiva varchar(30),
foreign key(nombre) references habilidad(nombre),
foreign key(nombre_pasiva) references pasiva(nombre));

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

CREATE TABLE runas(
id integer primary key autoincrement,
keystone char(1) not null, 
settings char(10) not null);
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

INSERT INTO pasiva VALUES('Meeps','His basic attacks are empowered to each consume a Meep on-attack');
INSERT INTO pasiva VALUES('Slow','Slows enemies hit');
INSERT INTO pasiva VALUES('None','No passive effect');
INSERT INTO pasiva VALUES('Speed','Speeds allies affected');
INSERT INTO pasiva VALUES('Portal Ally Preference','Allies move 30% faster through the portal');
INSERT INTO sqlite_sequence VALUES('runas',1);
INSERT INTO personaje VALUES('Bard','Meeps','Cosmic Binding','Caretakers Shrine','Magical Journey','Tempered Fate','630hp,5.5regen,34armor,30mr,330ms,350mana,6mregen,52ad,175crit,500range','Support');
INSERT INTO hab1 VALUES('Cosmic Binding',80,'Slow');
INSERT INTO hab2 VALUES('Caretakers Shrine','Heals allies. After 5 seconds, healing is doubled','Speed');
INSERT INTO hab3 VALUES('Magical Journey',1000,'Portal Ally Preference');
INSERT INTO hab4 VALUES('Tempered Fate','Ability Haste','None');
INSERT INTO habilidad VALUES('Runic Blade',0,0);
INSERT INTO habilidad VALUES('Broken Wings',13,0);
INSERT INTO habilidad VALUES('Ki Burst',11,0);
INSERT INTO habilidad VALUES('Valor',10,0);
INSERT INTO habilidad VALUES('Blade of the Exile',120,0);
INSERT INTO pasiva VALUES('Runic Blade','Rivens ability casts generate a stack of Charge for 6 seconds, refreshing on subsequent casts and stacking up to 3 times. Rivens basic attacks are empowered to each consume a stack to deal bonus physical damage');
INSERT INTO pasiva VALUES('Stun','Stops enemies from doing anything');
INSERT INTO pasiva VALUES('Shield','Shields the user');
INSERT INTO pasiva VALUES('Attack Boost','Gives the user a boost in their attack damage stat');
INSERT INTO hab1 VALUES('Broken Wings',45,'None');
INSERT INTO hab2 VALUES('Ki Burst','Stuns nearby enemies for 0.75s','Stun');
INSERT INTO hab3 VALUES('Valor',250,'Shield');
INSERT INTO hab4 VALUES('Blade of the Exile','Attack Damage','Attack Boost');
INSERT INTO runas VALUES(2,'P','213R330213');
INSERT INTO personaje VALUES('Riven','Runic Blade','Broken Wings','Ki Burst','Valor','Blade of the Exile','630hp,N/A,8.5hpregen,N/A,33armor,64ad,32mr,175crit,340ms,125range','Fighter','rojo',1);
INSERT INTO sqlite_sequence VALUES('runas',2);

COMMIT;
