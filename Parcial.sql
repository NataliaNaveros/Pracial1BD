/**Punto 1**/
create user 'NataliaH'@'localhost' identified by '123456';
create user 'Profesor'@'localhost' identified by '123456';
GRANT ALL PRIVILEGES ON *.* TO 'NataliaH'@'localhost';
GRANT create ON *.* TO 'Profesor'@'localhost'; 
REVOKE create ON *.* FROM 'Profesor'@'localhost';
DROP user 'Profesor'@'localhost';
/**Punto 2**/
create database biblioteca;
create table Libro(
	Clavelibro integer unsigned not null,
	Titulo varchar(100) not null,
	Idioma varchar(50) not null,
	Formato varchar(100) not null,
	Categoria varchar(50) not null,
	ClaveEditorial varchar(200) not null
);
alter table Libro add constraint pk_libro primary key(Clavelibro);
alter table Libro add constraint uq_ed unique (ClaveEditorial);
create table Tema(
	ClaveTema varchar(50) not null,
	Nombre varchar(200) not null
);
alter table Tema add constraint pk_Tema primary key (ClaveTema);
create table Autor(
	ClaveAutor integer unsigned not null,
	Nombre varchar(200) not null
);
alter table Autor add constraint pk_autor primary key(ClaveAutor);
create table Editorial(
	ClaveEditorial varchar(200) not null,
	Nombre varchar(200) not null,
	Direccion varchar(100) not null,
	Telefono varchar(20) not null
);
alter table Editorial add constraint uq_editorr unique (ClaveEditorial);
create table Ejemplar(
	Clavelibro integer unsigned not null,
	NumeroOrden integer unsigned not null,
	Edicion varchar(100) not null,
	Ubicacion varchar(100) not null
);
create table Socio(
	ClaveSocio integer unsigned not null,
	Nombre varchar(100) not null,
	Direccion varchar(100) not null,
	Telefono varchar(20) not null,
	Categoria varchar(50)
);
alter table Socio add constraint pk_Socio primary key(ClaveSocio);
create table Prestamo(
	ClaveSocio integer unsigned not null,
	Clavelibro integer unsigned not null,
	NumeroOrden integer unsigned not null, 
	FechaPrestamo varchar(30) not null,
	FechaDevolucion varchar(30) not null,
	Notas text
);
alter table Prestamo add constraint pk_libros primary key(Clavelibro, ClaveSocio);
create table TrataSobre(
	Clavelibro integer unsigned not null,
	ClaveTema varchar(50)
);
alter table TrataSobre add constraint pk_CLibros primary key(Clavelibro);
create table EscritoPor(
	Clavelibro integer unsigned not null,
	ClaveTema varchar (50)
);
/**Punto 3**/
alter table EscritoPor add constraint pk_ClaLibros primary key(Clavelibro);
insert into Libro(Clavelibro,Titulo,Idioma,Formato,Categoria,ClaveEditorial)
	values("1234","Yo Antes De Ti","Español","Digital","Romance","YADT2016");
insert into Tema(ClaveTema,Nombre)
	values("Rom1234","Yo Antes De Ti");
insert into Autor(ClaveAutor,Nombre)
	values ("1256","Silvestre");
insert into Editorial(ClaveEditorial,Nombre,Direccion,Telefono)
	values("YADT2016","Atenea","Calle 20 # 22-56","315 617 8982");
insert into Ejemplar(Clavelibro,NumeroOrden,Edicion,Ubicacion)
	values("1234","1","Edicion54","España");
insert into Socio(ClaveSocio,Nombre,Direccion,Telefono,Categoria)
	values("15625","Martin Saenz","Calle 20 # E-22","312 657","MS12")
insert into Prestamo(ClaveSocio,Clavelibro,NumeroOrden,FechaPrestamo,FechaDevolucion,Notas)
	values("15625","1234","1","12 Enero 2017","30 Abril 2017","Yo Antes De Ti");
insert into TrataSobre(Clavelibro,ClaveTema)
	values("1234","Rom1234");
insert into EscritoPor(Clavelibro,ClaveTema)
	values("1234","Rom1234");
/**Punto 4**/
show databases;
Use biblioteca;
show table;
describe libro;
select * from libro;
/**Punto 6**/
#mysql -u root -p elecciones <mysql/bin/elecciones_personero.sql
/**Punto 7**/
select * from migrations;
select * from usuarios;
select * from votos;
select count(*) from migrations;
select count(*) from usuarios;
select count(*) from votos;

/**Punto 8**/
alter table usuarios add sexo varchar(20);
alter table usuarios add correo varchar(100) unique;
alter table usuarios add fnac varchar(20);