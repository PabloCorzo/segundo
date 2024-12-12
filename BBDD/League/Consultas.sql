-- Winrate del personaje Bard
select
sum(victory from metricas where personaje == 'Bard')
/
select(count(victory from metricas where personaje == 'Bard'));
-- Oro promedio que consigue Teemo
select
avg(oro from metricas where personaje == 'Teemo');
-- Inventarios de Kayn que hayan costado menos de 5000
select item1,item2,item3,item4,item5,item6 from inventario join 
    item i1 on item1 = i1.nombre
join 
    item i2 on item2 = i2.nombre
join 
    item i3 on item3 = i3.nombre
join 
    item i4 on item4 = i4.nombre
join 
    item i5 on item5 = i5.nombre
join 
    item i6 on item6 = i6.nombre
where campeon = 'Kayn' group by(inv.id) having (i1.precio+i2.precio+i3.precio+i4.precio+i5.precio+i6.precio)<5000;

-- Objetos recomendados para cada personaje en forma de vista para poder consultar en partida
create view recomendados as select
 personaje.nombre as campeon,item.nombre as 'item recomendado' from personaje
 join
 item on personaje.rol = item.tipo
 order by campeon,item.precio;
-- Todas las runas en las que se han escogido dos runas de ataque (solo se pueden escoger dos como máximo, valor penúltimo y antepenúltimo)
-- % para cierre negativo y _ para positivo
select keystone || settings as runas from runas where settings LIKE '_______11_'; 
-- explicar codificacion 

-- Todas las pasivas de Bard con sus explicaciones
SELECT personaje.nombre_pasiva AS pasiva, pasiva.activacion AS descripcion
FROM personaje
JOIN pasiva ON personaje.nombre_pasiva = pasiva.nombre
WHERE personaje.nombre = 'Bard'

UNION

SELECT hab1.nombre_pasiva AS pasiva, pasiva.activacion AS descripcion
FROM hab1
JOIN pasiva ON hab1.nombre_pasiva = pasiva.nombre
JOIN personaje ON personaje.nombre_hab1 = hab1.nombre
WHERE personaje.nombre = 'Bard'

UNION

SELECT hab2.nombre_pasiva AS pasiva, pasiva.activacion AS descripcion
FROM hab2
JOIN pasiva ON hab2.nombre_pasiva = pasiva.nombre
JOIN personaje ON personaje.nombre_hab2 = hab2.nombre
WHERE personaje.nombre = 'Bard'

UNION

SELECT hab3.nombre_pasiva AS pasiva, pasiva.activacion AS descripcion
FROM hab3
JOIN pasiva ON hab3.nombre_pasiva = pasiva.nombre
JOIN personaje ON personaje.nombre_hab3 = hab3.nombre
WHERE personaje.nombre = 'Bard'

UNION

SELECT hab4.nombre_pasiva AS pasiva, pasiva.activacion AS descripcion
FROM hab4
JOIN pasiva ON hab4.nombre_pasiva = pasiva.nombre
JOIN personaje ON personaje.nombre_hab4 = hab4.nombre
WHERE personaje.nombre = 'Bard';


--update y borrado
update item set precio = 3350 where nombre = 'eclipse';
update s
