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