CREATE TABLE concepto(
   id_concepto INTEGER  NOT NULL PRIMARY KEY 
  ,nombre      VARCHAR(25) NOT NULL
  ,prioridad   VARCHAR(10) NOT NULL
);
INSERT INTO concepto(id_concepto,nombre,prioridad) VALUES (1,'Reservas','Media');
INSERT INTO concepto(id_concepto,nombre,prioridad) VALUES (2,'Solvencia','Alta');
INSERT INTO concepto(id_concepto,nombre,prioridad) VALUES (3,'Cierre Administrativo','Urgente');
INSERT INTO concepto(id_concepto,nombre,prioridad) VALUES (4,'Presupuesto','Media');
INSERT INTO concepto(id_concepto,nombre,prioridad) VALUES (5,'Proyecciones','Baja');
INSERT INTO concepto(id_concepto,nombre,prioridad) VALUES (6,'Tasas','Media');
INSERT INTO concepto(id_concepto,nombre,prioridad) VALUES (7,'Calce','Alta');
INSERT INTO concepto(id_concepto,nombre,prioridad) VALUES (8,'Portafolio','Urgente');
INSERT INTO concepto(id_concepto,nombre,prioridad) VALUES (9,'Pagos','Alta');
INSERT INTO concepto(id_concepto,nombre,prioridad) VALUES (10,'Deudas','Media');
INSERT INTO concepto(id_concepto,nombre,prioridad) VALUES (11,'Proveedores','Alta');
INSERT INTO concepto(id_concepto,nombre,prioridad) VALUES (12,'Inmuebles','Media');
INSERT INTO concepto(id_concepto,nombre,prioridad) VALUES (13,'Prediales','Media');
INSERT INTO concepto(id_concepto,nombre,prioridad) VALUES (14,'Plan Expansion','Baja');
INSERT INTO concepto(id_concepto,nombre,prioridad) VALUES (15,'Ocupacion sedes','Baja');
INSERT INTO concepto(id_concepto,nombre,prioridad) VALUES (16,'EEFF','Urgente');
INSERT INTO concepto(id_concepto,nombre,prioridad) VALUES (17,'Dias de cartera','Alta');
INSERT INTO concepto(id_concepto,nombre,prioridad) VALUES (18,'Costo amortizado','Media');
INSERT INTO concepto(id_concepto,nombre,prioridad) VALUES (19,'Numero empleados','Baja');

CREATE TABLE empleado(
   id_empleado      INTEGER  NOT NULL PRIMARY KEY 
  ,nombre           VARCHAR(15) NOT NULL
  ,apellido         VARCHAR(15) NOT NULL
  ,salario          INTEGER  NOT NULL
  ,id_gerencia      INTEGER  NOT NULL
  ,id_jefe          INTEGER 
  ,fecha_nacimiento DATE  NOT NULL
);
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (1,'Liz','Guti',20000,6,NULL,'1960/10/12');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (2,'Abelardo','Perea',10000,1,1,'1985/12/01');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (3,'Maria','Mesa',5000,1,2,'1990/01/01');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (4,'Carol','Garcia',2500,1,3,'1994/10/04');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (5,'Anuel','Montero',5000,1,2,'1994/06/07');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (6,'Farid','Trujillo',3750,1,5,'1992/01/26');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (7,'Anuel','Loaiza',1000,1,6,'1999/04/25');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (8,'Melina','Gonzalbez',10000,2,1,'1985/09/11');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (9,'George','Chapelle',3750,2,8,'1985/09/15');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (10,'Carles','Misas',7500,2,8,'1965/06/30');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (11,'Valeria','Loaiza',5000,2,8,'1990/08/07');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (12,'Andrey','Munera',5000,2,8,'1962/03/17');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (13,'Tulio','Rescalvo',10000,3,1,'1959/09/14');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (14,'Martin','Arenas',5000,3,13,'1968/03/04');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (15,'Daniela','Mejia',2500,3,14,'1993/09/30');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (16,'Alexis','Henao',1000,3,14,'1996/09/27');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (17,'Abelardo','Rocha',5000,3,13,'1990/07/07');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (18,'Isa','Lozano',4000,3,13,'1988/12/13');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (19,'Tiago','Hernandez',10000,4,1,'1976/05/24');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (20,'George','Caballero',5000,4,19,'1980/11/07');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (21,'Catalina','Tamayo',5000,4,19,'1970/02/28');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (22,'Luian','Salazar',2000,4,21,'1992/06/12');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (23,'Sara','Mu�oz',6000,4,19,'1965/06/29');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (24,'Pedro','Munera',5000,4,23,'1969/07/09');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (25,'Maria','Arango',2500,4,23,'1979/11/19');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (26,'Reinaldo','Perea',4000,4,23,'1985/01/31');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (27,'Sonia','Martinez',10000,5,1,'1988/01/12');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (28,'Tiago','Arevalo',5000,5,27,'1991/04/26');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (29,'Carlos','Fuentes',4000,5,27,'1980/08/24');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (30,'Cristian','Osorno',2000,5,29,'1989/09/30');
INSERT INTO empleado(id_empleado,nombre,apellido,salario,id_gerencia,id_jefe,fecha_nacimiento) VALUES (31,'Alan','Mesa',1500,5,29,'1992/06/03');


CREATE TABLE gerencia(
   id_gerencia INTEGER  NOT NULL PRIMARY KEY 
  ,nombre      VARCHAR(20) NOT NULL
  ,piso        INTEGER  NOT NULL
  ,id_gerente  INTEGER  NOT NULL
);
INSERT INTO gerencia(id_gerencia,nombre,piso,id_gerente) VALUES (1,'Planeacion',1,2);
INSERT INTO gerencia(id_gerencia,nombre,piso,id_gerente) VALUES (2,'Tesoreria',1,8);
INSERT INTO gerencia(id_gerencia,nombre,piso,id_gerente) VALUES (3,'Logistica',2,13);
INSERT INTO gerencia(id_gerencia,nombre,piso,id_gerente) VALUES (4,'Contabilidad',3,19);
INSERT INTO gerencia(id_gerencia,nombre,piso,id_gerente) VALUES (5,'Servicios',4,27);
INSERT INTO gerencia(id_gerencia,nombre,piso,id_gerente) VALUES (6,'VPF',1,1);


CREATE TABLE reporte(
   id_reporte    INTEGER  NOT NULL
  ,id_gerencia   INTEGER  NOT NULL
  ,reporte_fecha DATE  NOT NULL
);
INSERT INTO reporte(id_reporte,id_gerencia,reporte_fecha) VALUES (1,1,'2020/11/03');
INSERT INTO reporte(id_reporte,id_gerencia,reporte_fecha) VALUES (2,1,'2020/11/13');
INSERT INTO reporte(id_reporte,id_gerencia,reporte_fecha) VALUES (3,1,'2020/11/23');
INSERT INTO reporte(id_reporte,id_gerencia,reporte_fecha) VALUES (4,2,'2020/12/03');
INSERT INTO reporte(id_reporte,id_gerencia,reporte_fecha) VALUES (5,2,'2020/12/13');
INSERT INTO reporte(id_reporte,id_gerencia,reporte_fecha) VALUES (6,2,'2020/12/23');
INSERT INTO reporte(id_reporte,id_gerencia,reporte_fecha) VALUES (7,3,'2021/01/02');
INSERT INTO reporte(id_reporte,id_gerencia,reporte_fecha) VALUES (8,3,'2021/01/12');
INSERT INTO reporte(id_reporte,id_gerencia,reporte_fecha) VALUES (9,3,'2021/01/22');
INSERT INTO reporte(id_reporte,id_gerencia,reporte_fecha) VALUES (10,4,'2021/02/01');
INSERT INTO reporte(id_reporte,id_gerencia,reporte_fecha) VALUES (11,4,'2021/02/11');
INSERT INTO reporte(id_reporte,id_gerencia,reporte_fecha) VALUES (12,4,'2021/02/21');
INSERT INTO reporte(id_reporte,id_gerencia,reporte_fecha) VALUES (13,5,'2021/03/03');
INSERT INTO reporte(id_reporte,id_gerencia,reporte_fecha) VALUES (14,5,'2021/03/13');
INSERT INTO reporte(id_reporte,id_gerencia,reporte_fecha) VALUES (15,6,'2021/03/23');

CREATE TABLE reporte_concepto(
   id_reporte   INTEGER  NOT NULL
  ,id_concepto  INTEGER  NOT NULL
  ,correcciones INTEGER  NOT NULL
);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (1,1,0);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (1,2,0);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (1,3,0);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (2,3,1);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (2,4,1);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (2,5,1);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (3,1,0);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (3,3,0);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (4,6,0);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (5,7,1);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (5,8,0);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (5,9,0);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (5,10,1);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (6,8,0);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (7,10,2);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (7,11,2);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (8,12,0);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (9,11,1);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (9,12,0);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (9,13,2);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (9,14,2);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (9,15,1);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (10,16,2);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (11,16,0);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (12,16,0);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (13,17,0);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (13,18,0);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (14,17,0);
INSERT INTO reporte_concepto(id_reporte,id_concepto,correcciones) VALUES (15,19,1);
