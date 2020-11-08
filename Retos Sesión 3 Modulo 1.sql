####RETO 1####
show tables;
describe empleado;
describe puesto;
describe venta;
describe articulo;

#¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?
select nombre, id_puesto from empleado where id_puesto in (select id_puesto from puesto where salario < 10000);

#¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
select id_empleado, max(cantidad_ventas) as Maximo_Ventas, min(cantidad_ventas) as Minimo_Ventas
	from (select clave, id_empleado, count(*) as cantidad_ventas from venta group by clave, id_empleado order by id_empleado) 
    as subconsulta group by id_empleado;

#¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?
select distinct clave from venta where id_articulo in (select id_articulo from articulo where precio > 5000) order by clave;

####RETO 2####

#¿Cuál es el nombre de los empleados que realizaron cada venta?
select concat(e.nombre," ",e.apellido_paterno," ",e.apellido_materno) as Nombre_Empleado, clave from empleado as e join venta as v on e.id_empleado = v.id_empleado order by clave;

#¿Cuál es el nombre de los artículos que se han vendido?
select nombre as Nombre_Articulo, clave from articulo as a join venta as v on a.id_articulo = v.id_articulo order by clave;

#¿Cuál es el total de cada venta?
select round(sum(precio),3) as Total_Venta, clave from articulo as a join venta as v on a.id_articulo = v.id_articulo group by clave order by clave;

####RETO 3####

#Obtener el puesto de un empleado.
create view Puesto_de_Empleado_174 as select p.nombre as Puesto, concat(e.nombre," ",e.apellido_paterno," ",e.apellido_materno) as Nombre_Empleado from puesto as p join empleado as e using(id_puesto);
select * from Puesto_de_Empleado_174;

#Saber qué artículos ha vendido cada empleado.
create view Articulo_Vendido_174 as select a.nombre as Articulo, concat(e.nombre," ",e.apellido_paterno," ",e.apellido_materno) as Nombre_Empleado, clave as Clave_venta from articulo as a join venta as v using(id_articulo) join empleado as e using(id_empleado) order by Nombre_Empleado;
select * from Articulo_Vendido_174;
 
#Saber qué puesto ha tenido más ventas.
create view Ventas_por_Puesto_174 as select p.nombre as Puesto, count(*) as Cantidad_Ventas from puesto as p join empleado as e using(id_puesto) join venta using(id_empleado) group by Puesto order by Puesto;
select * from Ventas_por_Puesto_174 order by Cantidad_Ventas DESC limit 1;