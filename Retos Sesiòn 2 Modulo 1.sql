###RETO 1###
use tienda;
show tables;
describe articulo;
describe puesto;

###¿Qué artículos incluyen la palabra Pasta en su nombre?
select * from articulo where nombre like '%Pasta%';
###¿Qué artículos incluyen la palabra Cannelloni en su nombre?
select * from articulo where nombre like '%Cannelloni%';
###¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
select * from articulo where nombre like '%-%';
###¿Que puestos incluyen la palabra Designer?
select * from puesto where nombre like '%Designer%';
###¿Que puestos incluyen la palabra Developer?
select * from puesto where nombre like '%Developer%';

###RETO 2###
###Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.
describe puesto;
describe articulo;

###¿Cuál es el promedio de salario de los puestos?
select avg(salario) from puesto;
###¿Cuántos artículos incluyen la palabra Pasta en su nombre?
select count(*) from articulo where nombre like '%Pasta%';
###¿Cuál es el salario mínimo y máximo?
select min(salario), max(salario) from puesto;
###¿Cuál es la suma del salario de los últimos cinco puestos agregados?
select max(id_puesto) from puesto;
select sum(salario) from puesto where id_puesto > 995;

###RETO 3###
describe puesto;
describe venta;

###¿Cuántos registros hay por cada uno de los puestos?
select nombre, count(*) from puesto group by nombre;
###¿Cuánto dinero se paga en total por puesto?
select nombre, sum(salario) from puesto group by nombre;
###¿Cuál es el número total de ventas por vendedor?
select id_empleado, count(*) from venta group by id_empleado;
###¿Cuál es el número total de ventas por artículo?
select id_articulo, count(*) from venta group by id_articulo;
