	CREATE TABLE Paises(
	idPais int(3) PRIMARY KEY auto_increment,
	nombre varchar(100) not null
	);

	CREATE TABLE Ciudades(
	idCiudad int(12) PRIMARY KEY auto_increment,
	nombre varchar(100) not null,
	idPais int(3) not null,
	FOREIGN KEY(idPais) REFERENCES Paises(idPais)
	);

	CREATE TABLE Roles(
	idRol int(2) PRIMARY KEY auto_increment,
	nombre varchar(15) not null
	);

	CREATE TABLE Sexo(
	idSexo int(2) PRIMARY KEY auto_increment,
	nombre varchar(15)
	);

	CREATE TABLE Tipo_Lugares(
	idTipoLugar int(3) PRIMARY KEY auto_increment,
	nombre varchar(20) not null
	);

	CREATE TABLE Lugares(
	idLugar int(15) PRIMARY KEY auto_increment,
	nombre varchar(50) not null,
	descripcion varchar(255) not null,
	fechaInicio date not null,
	fechaFin date,
	idCiudad int(12) not null,
	idTipoLugar int(3) not null,
	FOREIGN KEY(idCiudad) REFERENCES Ciudades(idCiudad),
	FOREIGN KEY(idTipoLugar) REFERENCES Tipo_Lugares(idTipoLugar) 
	);

	CREATE TABLE Personas(
	idPersona int(12) PRIMARY KEY auto_increment,
	nombres varchar(50) not null,
	apellidos varchar(50) not null,
	contrasena varchar(50) not null,
	email varchar(50) not null,
	sexo int(2) not null,
	fechaNacimiento date not null,
	lugarNacimiento int(12) not null,
	lugarActual int(12) not null,
	idRol int(2) not null,
	fechacreacion date default CURRENT_TIMESTAMP(),
	FOREIGN KEY(sexo) REFERENCES Sexo(idSexo),
	FOREIGN KEY(lugarNacimiento) REFERENCES Ciudades(idCiudad),
	FOREIGN KEY(lugarActual) REFERENCES Ciudades(idCiudad),
	FOREIGN KEY(idRol) REFERENCES Roles(idRol),
	UNIQUE(email)
	);

	CREATE TABLE Usuarios(
	idUsuario int(12) PRIMARY KEY auto_increment,
	apodo varchar(50),
	idPersona int(12) not null,
	fotoPerfil int(15),
	FOREIGN KEY(idPersona) REFERENCES Personas(idPersona)
	-- FOREIGN KEY(fotoPerfil) REFERENCES Imagenes(idImagen) --- Mejor poner solamente el id y ya para que no de error
	);

	CREATE TABLE Usuarios_Lugares(
	idUsuario int(12),
	idLugar int(15),
	FOREIGN KEY(idUsuario) REFERENCES Usuarios(idUsuario),
	FOREIGN KEY(idLugar) REFERENCES Lugares(idLugar)
	);

	CREATE TABLE Amistades(
	esAmigo int(12),
	de int(12),
	aceptado boolean,
	FOREIGN KEY(esAmigo) REFERENCES Usuarios(idUsuario),
	FOREIGN KEY(de) REFERENCES Usuarios(idUsuario)
	);

	CREATE Table Notificaciones(
	idNotificaciones int(15) PRIMARY KEY auto_increment,
	descripcion varchar(MAX) not null,
	fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
	visto boolean default false
	);

	CREATE TABLE Usuarios_Notificaciones(
	idUsuario int(12),
	idNotificaciones int(15),
	FOREIGN KEY(idUsuario) REFERENCES Usuarios(idUsuario),
	FOREIGN KEY(idNotificaciones) REFERENCES Notificaciones(idNotificaciones)
	);

	CREATE TABLE TipoPost(
	idTipoPost int(2) PRIMARY KEY auto_increment,
	tipoPost varchar(MAX) not null
	);

	CREATE TABLE Posts(
	idPost int(16) PRIMARY KEY auto_increment,
	tipoPost int(2) not null,
	fechaPost TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
	descripcion varchar(MAX),
	idUsuario int(12) not null,
	emisorUsuario int(12),
	FOREIGN KEY(tipoPost) REFERENCES TipoPost(idTipoPost),
	FOREIGN KEY(idUsuario) REFERENCES Usuarios(idUsuario),
	FOREIGN KEY(emisorUsuario) REFERENCES USUARIOS(idUsuario),
	);

	CREATE TABLE Comentarios(
	idComentario int(18) PRIMARY KEY auto_increment,
	comentario varchar(MAX) not null,
	fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
	idUsuario int(12) not null,
	FOREIGN KEY(idUsuario) REFERENCES Usuarios(idUsuario)
	);

	CREATE TABLE Comentarios_Posts(
	idComentario int(18),
	idPost int(16),
	FOREIGN KEY(idComentario) REFERENCES Comentarios(idComentario),
	FOREIGN KEY(idPost) REFERENCES Posts(idPost)
	);

	CREATE TABLE Likes(
	idLike int(16) PRIMARY KEY auto_increment,
	idUsuario int(12) not null,
	FOREIGN KEY(idUsuario) REFERENCES Usuarios(idUsuario)
	);

	CREATE TABLE Likes_Posts(
	idLike int(16),
	idPost int(16),
	FOREIGN KEY(idLike) REFERENCES Likes(idLike),
	FOREIGN KEY(idPost) REFERENCES Posts(idPost)
	);

	CREATE TABLE Imagenes(
	idImagen int(16) PRIMARY KEY auto_increment,
	descripcion varchar(MAX),
	imagen varchar(MAX) not null,
	fechaSubida TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
	idUsuario int(12) not null,
	idPost int(16) not null,
	FOREIGN KEY(idUsuario) REFERENCES Usuarios(idUsuario),
	FOREIGN KEY(idPost) REFERENCES Posts(idPost)
	);

	CREATE TABLE Albumes(
	idAlbum int(15) PRIMARY KEY auto_increment,
	descripcion varchar(MAX) not null,
	idUsuario int(12) not null,
	idPost int(16) not null,
	FOREIGN KEY(idUsuario) REFERENCES Usuarios(idUsuario),
	FOREIGN KEY(idPost) REFERENCES Posts(idPost)
	);

	CREATE TABLE Albumes_Imagenes(
	idAlbum int(15),
	idImagen int(15),
	FOREIGN KEY(idAlbum) REFERENCES Albumes(idAlbum),
	FOREIGN KEY(idImagen) REFERENCES Imagenes(idImagen)
	);

	CREATE TABLE Etiqueta_Post(
	idPost int(16),
	idUsuarioEtiquetado int(12),
	FOREIGN KEY(idPost) REFERENCES Posts(idPost),
	FOREIGN KEY(idUsuarioEtiquetado) REFERENCES Usuarios(idUsuario)
	);

	--****************************************************-------
	--**************Insertardo dos paises*****************-------
	--****************************************************-------

	INSERT INTO PAISES(nombre) values('Estados Unidos');
	INSERT INTO PAISES(nombre) values('Republica Dominicana');

	--****************************************************-------
	--**************Insertardo las ciudades***************-------
	--****************************************************-------

	INSERT INTO CIUDADES(nombre,idPais) VALUES('Alabama', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Alaska', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Arizona', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Arkansas', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('California', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Carolina del Norte', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Carolina del Sur', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Colorado', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Connecticut', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Dakota del Norte', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Dakota del Sur', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Delaware', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Distrito del Columbia', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Florida', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Georgia', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Hawai', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Idaho', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Illinois', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Indiana', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Iowa', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Kansas', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Kentucky', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Louisiana', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Maine', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Maryland', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Massachusetts', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Michigan', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Minnesota', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Mississippi', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Missouri', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Montana', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Nebraska', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Nevada', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Nueva Hampshire', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Nueva Jersey', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Nueva York', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Nuevo México', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Ohio', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Oklahoma', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Oregón', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Pennsylvania', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Rhode Island', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Tennessee', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Texas', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Utah', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Vermont', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Virginia', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Virginia del Oeste', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Washington', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Washington D.C.', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Wisconsin', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');
	INSERT INTO CIUDADES(nombre,idPais) VALUES('Wyoming', SELECT idPais FROM PAISES WHERE nombre='Estados Unidos');

	INSERT INTO Ciudades(nombre,idPais) VALUES('Azua', SELECT idPais FROM PAISES WHERE nombre='Republica Dominicana');
	INSERT INTO Ciudades(nombre,idPais) VALUES('Barahona', SELECT idPais FROM PAISES WHERE nombre='Republica Dominicana');
	INSERT INTO Ciudades(nombre,idPais) VALUES('Duarte', SELECT idPais FROM PAISES WHERE nombre='Republica Dominicana');
	INSERT INTO Ciudades(nombre,idPais) VALUES('El Seibo', SELECT idPais FROM PAISES WHERE nombre='Republica Dominicana');
	INSERT INTO Ciudades(nombre,idPais) VALUES('Espaillat', SELECT idPais FROM PAISES WHERE nombre='Republica Dominicana');
	INSERT INTO Ciudades(nombre,idPais) VALUES('Hato Mayor', SELECT idPais FROM PAISES WHERE nombre='Republica Dominicana');
	INSERT INTO Ciudades(nombre,idPais) VALUES('Hermanas Mirabal', SELECT idPais FROM PAISES WHERE nombre='Republica Dominicana');
	INSERT INTO Ciudades(nombre,idPais) VALUES('La Altagracia', SELECT idPais FROM PAISES WHERE nombre='Republica Dominicana');
	INSERT INTO Ciudades(nombre,idPais) VALUES('La Romana', SELECT idPais FROM PAISES WHERE nombre='Republica Dominicana');
	INSERT INTO Ciudades(nombre,idPais) VALUES('La Vega', SELECT idPais FROM PAISES WHERE nombre='Republica Dominicana');
	INSERT INTO Ciudades(nombre,idPais) VALUES('Maria Trinidad Sanchez', SELECT idPais FROM PAISES WHERE nombre='Republica Dominicana');
	INSERT INTO Ciudades(nombre,idPais) VALUES('Monseñor Nouel', SELECT idPais FROM PAISES WHERE nombre='Republica Dominicana');
	INSERT INTO Ciudades(nombre,idPais) VALUES('Monte Plata', SELECT idPais FROM PAISES WHERE nombre='Republica Dominicana');
	INSERT INTO Ciudades(nombre,idPais) VALUES('Peravia', SELECT idPais FROM PAISES WHERE nombre='Republica Dominicana');
	INSERT INTO Ciudades(nombre,idPais) VALUES('Puerto Plata', SELECT idPais FROM PAISES WHERE nombre='Republica Dominicana');
	INSERT INTO Ciudades(nombre,idPais) VALUES('Samana', SELECT idPais FROM PAISES WHERE nombre='Republica Dominicana');
	INSERT INTO Ciudades(nombre,idPais) VALUES('San Cristobal', SELECT idPais FROM PAISES WHERE nombre='Republica Dominicana');
	INSERT INTO Ciudades(nombre,idPais) VALUES('San Jose de Ocoa', SELECT idPais FROM PAISES WHERE nombre='Republica Dominicana');
	INSERT INTO Ciudades(nombre,idPais) VALUES('San Juan', SELECT idPais FROM PAISES WHERE nombre='Republica Dominicana');
	INSERT INTO Ciudades(nombre,idPais) VALUES('San Pedro de Macoris', SELECT idPais FROM PAISES WHERE nombre='Republica Dominicana');
	INSERT INTO Ciudades(nombre,idPais) VALUES('Sanchez Ramirez', SELECT idPais FROM PAISES WHERE nombre='Republica Dominicana');
	INSERT INTO Ciudades(nombre,idPais) VALUES('Santiago Rodriguez', SELECT idPais FROM PAISES WHERE nombre='Republica Dominicana');
	INSERT INTO Ciudades(nombre,idPais) VALUES('Santiago', SELECT idPais FROM PAISES WHERE nombre='Republica Dominicana');
	INSERT INTO Ciudades(nombre,idPais) VALUES('Santo Domingo', SELECT idPais FROM PAISES WHERE nombre='Republica Dominicana');
	INSERT INTO Ciudades(nombre,idPais) VALUES('Valverde', SELECT idPais FROM PAISES WHERE nombre='Republica Dominicana');

	------------------------
	--Insertado tipo post--
	-------------------------

	INSERT INTO TipoPost(tipoPost) VALUES('estado');
	INSERT INTO TipoPost(tipoPost) VALUES('foto');
	INSERT INTO TipoPost(tipoPost) VALUES('album');
	INSERT INTO TipoPost(tipoPost) VALUES('muro');

	------------------------
	--Insertando tipo lugares---
	-----------

	INSERT INTO Tipo_Lugares(nombre) VALUES('Academico');
	INSERT INTO Tipo_Lugares(nombre) VALUES('Laboral');

	--------------------------
	--Insertando sexo-------
	------------------

	INSERT INTO Sexo(nombre) VALUES('Femenino');
	INSERT INTO Sexo(nombre) VALUES('Masculino');