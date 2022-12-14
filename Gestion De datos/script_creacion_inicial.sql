USE [GD2C2021]
GO

CREATE SCHEMA LosSimuladores


/*     Creo nuevas tablas         */
GO
CREATE TABLE LosSimuladores.Viaje (
    viaje_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    viaje_fecha_inicio datetime2(3) NOT NULL,
	viaje_fecha_fin datetime2(3),
	viaje_consumo_combustible decimal(18, 2),
	viaje_camion_id INT NOT NULL,
	viaje_chofer_id INT NOT NULL,
	viaje_recorrido_idrecorrido INT NOT NULL
);
GO

CREATE TABLE LosSimuladores.Chofer (
    chofer_nro_de_legajo INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    chofer_nombre NVARCHAR(255) NOT NULL,
	chofer_apellido NVARCHAR(255) NOT NULL,
	chofer_dni decimal(18, 0) NOT NULL,
	chofer_direcccion NVARCHAR(255) NOT NULL,
	chofer_telefono INT NOT NULL,
	chofer_mail NVARCHAR(255) NOT NULL,
	chofer_fecha_nac datetime2(3) NOT NULL,
	chofer_costo_hora INT NOT NULL,
);
GO

CREATE TABLE LosSimuladores.Paquete (
    paquete_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	paquete_cantidad INT NULL,
	paquete_viaje_id INT  NOT NULL,
	paquete_tipo_de_paquete_id INT NULL
);
GO

CREATE TABLE LosSimuladores.Tipo_de_paquete (
    tipo_de_paquete_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	tipo_de_paquete_Descripcion NVARCHAR(255) NOT NULL,
	tipo_de_paquete_Precio decimal(18,2) NOT NULL,
	tipo_de_paquete_Peso_Max decimal(18,2) NOT NULL,
	tipo_de_paquete_Largo_Max decimal(18,2) NOT NULL,
	tipo_de_paquete_Ancho_Max decimal(18,2) NOT NULL,
	tipo_de_paquete_Alto_Max decimal(18,2) NOT NULL
);
GO

CREATE TABLE LosSimuladores.Recorrido (
    recorrido_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	recorrido_ciudad_origen NVARCHAR(255) NOT NULL,
	recorrido_ciudad_destino NVARCHAR(255) NOT NULL,
	recorrido_km INT NOT NULL,
	recorrido_precio DECIMAL(18,2) NOT NULL,
);
GO

CREATE TABLE LosSimuladores.Camion (
    camion_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	camion_fecha_alta DATETIME2(3) NOT NULL,
	camion_patente NVARCHAR(255) NOT NULL,
	camion_nro_chasis NVARCHAR(255) NOT NULL,
	camion_nro_motor NVARCHAR(255) NOT NULL,
	camion_modelo_id INT
);
GO

CREATE TABLE LosSimuladores.Modelo (
    modelo_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	modelo_descipcion NVARCHAR(255) NOT NULL,
	modelo_velocidad_max INT NOT NULL,
	modelo_capacidad_tanque INT NOT NULL,
	modelo_capacidad_carga INT NOT NULL,
	modelo_marca NVARCHAR(255) NOT NULL
);
GO

CREATE TABLE LosSimuladores.Taller (
    taller_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	taller_direccion NVARCHAR(255) NOT NULL,
	taller_telefono DECIMAL(18,0) NOT NULL,
	taller_mail NVARCHAR(255) NOT NULL,
	taller_nombre NVARCHAR(255) NOT NULL,
	taller_ciudad NVARCHAR(255) NOT NULL
);
GO

CREATE TABLE LosSimuladores.Orden_de_trabajo (
    orden_de_trabajo_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	orden_de_trabajo_fecha NVARCHAR(255) NOT NULL,
	orden_de_trabajo_estado NVARCHAR(255) NOT NULL,
	orden_de_trabajo_taller_id INT NOT NULL,
	orden_de_trabajo_camion_id INT NOT NULL
);
GO

CREATE TABLE LosSimuladores.Orden_de_trabajo_por_tarea (
    orden_de_trabajo_por_tarea_orden_de_trabajo_id INT NOT NULL,
	orden_de_trabajo_por_tarea_tarea_id INT NOT NULL,
	orden_de_trabajo_por_tarea_mecanico_nro_legajo INT NOT NULL,
	orden_de_trabajo_por_tarea_fecha_inicio_planificado datetime2(3) NOT NULL,
	orden_de_trabajo_por_tarea_fecha_inicio datetime2(3)  NULL,
	orden_de_trabajo_por_tarea_fecha_fin datetime2(3)  NULL,
	orden_de_trabajo_por_tarea_tiempo_ejecucion decimal(18,2)  NULL
);
GO

CREATE TABLE LosSimuladores.Mecanico (
    mecanico_nro_legajo INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	mecanico_nombre NVARCHAR(255) NOT NULL,
	mecanico_apellido NVARCHAR(255) NOT NULL,
	mecanico_dni DECIMAL(18,0) NOT NULL,
	mecanico_direccion NVARCHAR(255) NOT NULL,
	mecanico_telefono INT NOT NULL,
	mecanico_mail NVARCHAR(255) NOT NULL,
	mecanico_fecha_nac DATETIME2(3) NOT NULL,
	mecanico_costo_hora INT NOT NULL
);
GO

CREATE TABLE LosSimuladores.Tarea (
    tarea_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	tarea_descripcion NVARCHAR(255) NOT NULL,
	tarea_tiempo_estimado INT NOT NULL,
	tarea_tipo_de_tarea_id INT NOT NULL
);
GO

CREATE TABLE LosSimuladores.Tipo_de_tarea (
    tipo_de_tarea_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	tipo_de_tarea_descripcion NVARCHAR(255) NOT NULL
);
GO

CREATE TABLE LosSimuladores.Tarea_por_material (
    tarea_por_material_tarea_id INT NOT NULL,
	tarea_por_material_material_id NVARCHAR(255) NOT NULL,
	tarea_por_material_cantidad INT NOT NULL
);
GO

CREATE TABLE LosSimuladores.Material (
    material_id NVARCHAR(255) PRIMARY KEY NOT NULL,
	material_descripcion NVARCHAR(255) NOT NULL,
	material_precio DECIMAL(18,2) NOT NULL
);
GO

/*     Creo Forein keys     */

ALTER TABLE LosSimuladores.Viaje 
ADD	FOREIGN KEY (viaje_chofer_id) REFERENCES LosSimuladores.Chofer(chofer_nro_de_legajo),
	FOREIGN KEY (viaje_camion_id) REFERENCES LosSimuladores.Camion(camion_id);
Go

ALTER TABLE LosSimuladores.Paquete 
ADD FOREIGN KEY (paquete_viaje_id) REFERENCES LosSimuladores.Viaje(viaje_id),
	FOREIGN KEY (paquete_tipo_de_paquete_id) REFERENCES LosSimuladores.Tipo_de_paquete(tipo_de_paquete_id);
GO

ALTER TABLE LosSimuladores.Camion 
ADD FOREIGN KEY (camion_modelo_id) REFERENCES LosSimuladores.Modelo(modelo_id);
GO

ALTER TABLE LosSimuladores.Orden_de_trabajo 
ADD FOREIGN KEY (orden_de_trabajo_taller_id) REFERENCES LosSimuladores.Taller(taller_id),
	FOREIGN KEY (orden_de_trabajo_camion_id) REFERENCES LosSimuladores.Camion(camion_id);
GO

ALTER TABLE LosSimuladores.Orden_de_trabajo_por_tarea
ADD FOREIGN KEY (orden_de_trabajo_por_tarea_orden_de_trabajo_id) REFERENCES LosSimuladores.Orden_de_trabajo(orden_de_trabajo_id),
	FOREIGN KEY (orden_de_trabajo_por_tarea_mecanico_nro_legajo) REFERENCES LosSimuladores.Mecanico(mecanico_nro_legajo),
	FOREIGN KEY (orden_de_trabajo_por_tarea_tarea_id) REFERENCES LosSimuladores.Tarea(tarea_id);
GO

ALTER TABLE LosSimuladores.Tarea 
ADD FOREIGN KEY (tarea_tipo_de_tarea_id) REFERENCES LosSimuladores.Tipo_de_tarea(tipo_de_tarea_id);
GO

ALTER TABLE LosSimuladores.Tarea_por_material
ADD FOREIGN KEY (tarea_por_material_tarea_id) REFERENCES LosSimuladores.Tarea(tarea_id),
	FOREIGN KEY (tarea_por_material_material_id) REFERENCES LosSimuladores.Material(material_id);
GO

/*		Creo Store Procedures     */

CREATE PROCEDURE Migrar_chofer 
AS
BEGIN
SET IDENTITY_INSERT LosSimuladores.Chofer ON
	INSERT INTO			LosSimuladores.Chofer (chofer_nro_de_legajo, chofer_nombre, chofer_apellido, chofer_dni, chofer_direcccion, chofer_telefono, chofer_mail, chofer_fecha_nac, chofer_costo_hora)
		SELECT DISTINCT			CHOFER_NRO_LEGAJO, CHOFER_NOMBRE, CHOFER_APELLIDO, CHOFER_DNI, CHOFER_DIRECCION, CHOFER_TELEFONO, CHOFER_MAIL, CHOFER_FECHA_NAC, CHOFER_COSTO_HORA		
		FROM				gd_esquema.Maestra
		WHERE				CHOFER_NRO_LEGAJO IS NOT NULL
SET IDENTITY_INSERT LosSimuladores.Chofer OFF
END
GO


CREATE PROCEDURE Migrar_tipo_Paquete 
AS
BEGIN
	INSERT INTO		LosSimuladores.Tipo_de_paquete(tipo_de_paquete_Descripcion, tipo_de_paquete_Peso_Max, tipo_de_paquete_Alto_Max, tipo_de_paquete_Ancho_Max, tipo_de_paquete_Largo_Max, tipo_de_paquete_Precio)
		SELECT DISTINCT PAQUETE_DESCRIPCION, PAQUETE_PESO_MAX, PAQUETE_ALTO_MAX, PAQUETE_ANCHO_MAX, PAQUETE_ALTO_MAX, PAQUETE_PRECIO
		FROM			gd_esquema.Maestra
		WHERE			PAQUETE_DESCRIPCION IS NOT NULL
		GROUP BY		PAQUETE_DESCRIPCION, PAQUETE_PESO_MAX, PAQUETE_ALTO_MAX, PAQUETE_ANCHO_MAX, PAQUETE_ALTO_MAX, PAQUETE_PRECIO
END
GO

CREATE PROCEDURE Migrar_recorrido 
AS
BEGIN
	INSERT INTO		LosSimuladores.Recorrido(recorrido_ciudad_destino,recorrido_ciudad_origen,recorrido_km,recorrido_precio)
		SELECT DISTINCT RECORRIDO_CIUDAD_DESTINO, RECORRIDO_CIUDAD_ORIGEN,RECORRIDO_KM, RECORRIDO_PRECIO
		FROM			gd_esquema.Maestra
		WHERE			RECORRIDO_CIUDAD_DESTINO IS NOT NULL
		
END
GO

CREATE PROCEDURE Migrar_modelo
AS
BEGIN
	INSERT INTO		LosSimuladores.Modelo(modelo_capacidad_carga,modelo_capacidad_tanque,modelo_descipcion,modelo_marca,modelo_velocidad_max)
		SELECT DISTINCT MODELO_CAPACIDAD_CARGA, MODELO_CAPACIDAD_TANQUE, MODELO_CAMION, MARCA_CAMION_MARCA, MODELO_VELOCIDAD_MAX
		FROM			gd_esquema.Maestra
		WHERE			MODELO_CAMION IS NOT NULL
		GROUP BY		MODELO_CAPACIDAD_CARGA,MODELO_CAPACIDAD_TANQUE, MODELO_CAMION, MARCA_CAMION_MARCA, MODELO_VELOCIDAD_MAX
END
GO

CREATE PROCEDURE Migrar_taller
AS
BEGIN
	INSERT INTO		LosSimuladores.Taller(taller_ciudad,taller_direccion,taller_mail,taller_nombre,taller_telefono)
		SELECT DISTINCT TALLER_CIUDAD, TALLER_DIRECCION, TALLER_MAIL,TALLER_NOMBRE, TALLER_TELEFONO
		FROM			gd_esquema.Maestra
		WHERE			TALLER_CIUDAD IS NOT NULL
		GROUP BY		TALLER_CIUDAD, TALLER_DIRECCION, TALLER_MAIL,TALLER_NOMBRE, TALLER_TELEFONO
END
GO

CREATE PROCEDURE Migrar_Mecanico
AS
BEGIN
SET IDENTITY_INSERT LosSimuladores.Mecanico ON
	INSERT INTO		LosSimuladores.Mecanico(mecanico_apellido,mecanico_costo_hora,mecanico_direccion,mecanico_dni,mecanico_fecha_nac,mecanico_mail,mecanico_nombre,mecanico_nro_legajo,mecanico_telefono)
		SELECT DISTINCT MECANICO_APELLIDO,MECANICO_COSTO_HORA,MECANICO_DIRECCION,MECANICO_DNI,MECANICO_FECHA_NAC,MECANICO_MAIL,MECANICO_NOMBRE,MECANICO_NRO_LEGAJO, MECANICO_TELEFONO
		FROM			gd_esquema.Maestra
		WHERE			MECANICO_NRO_LEGAJO IS NOT NULL
		GROUP BY		MECANICO_APELLIDO,MECANICO_COSTO_HORA,MECANICO_DIRECCION,MECANICO_DNI,MECANICO_FECHA_NAC,MECANICO_MAIL,MECANICO_NOMBRE,MECANICO_NRO_LEGAJO, MECANICO_TELEFONO
SET IDENTITY_INSERT LosSimuladores.Mecanico OFF
END
GO

CREATE PROCEDURE Migrar_Tipo_de_tarea
AS
BEGIN
	INSERT INTO		LosSimuladores.Tipo_de_tarea(tipo_de_tarea_descripcion)
		SELECT DISTINCT TIPO_TAREA
		FROM			gd_esquema.Maestra
		WHERE			TIPO_TAREA IS NOT NULL
		GROUP BY		TIPO_TAREA
END
GO

CREATE PROCEDURE Migrar_Material 
AS
BEGIN
	INSERT INTO		LosSimuladores.Material(material_id, material_descripcion, material_precio)
		SELECT DISTINCT MATERIAL_COD, MATERIAL_DESCRIPCION, MATERIAL_PRECIO
		FROM			gd_esquema.Maestra
		WHERE			MATERIAL_COD IS NOT NULL
		GROUP BY		MATERIAL_COD, MATERIAL_DESCRIPCION, MATERIAL_PRECIO
END
GO

CREATE PROCEDURE Migrar_Camion
AS
BEGIN
	INSERT INTO		LosSimuladores.Camion(camion_fecha_alta, camion_modelo_id, camion_nro_chasis,camion_nro_motor,camion_patente)
		SELECT DISTINCT CAMION_FECHA_ALTA, modelo.modelo_id, CAMION_NRO_CHASIS,CAMION_NRO_MOTOR,CAMION_PATENTE
		FROM			gd_esquema.Maestra maestra
		JOIN			LosSimuladores.Modelo modelo on maestra.MODELO_CAMION = modelo.modelo_descipcion and maestra.MODELO_CAPACIDAD_CARGA = modelo.modelo_capacidad_carga
		WHERE			(CAMION_FECHA_ALTA is not null)
		GROUP BY		CAMION_FECHA_ALTA, modelo.modelo_id, CAMION_NRO_CHASIS,CAMION_NRO_MOTOR,CAMION_PATENTE
END
GO


CREATE PROCEDURE Migrar_Viaje
AS
BEGIN
	INSERT INTO		LosSimuladores.Viaje (viaje_camion_id, viaje_chofer_id	, viaje_consumo_combustible, viaje_fecha_fin, viaje_fecha_inicio, viaje_recorrido_idrecorrido)
	(
	SELECT DISTINCT	camion.camion_id,Chofer.chofer_nro_de_legajo, VIAJE_CONSUMO_COMBUSTIBLE,VIAJE_FECHA_FIN ,VIAJE_FECHA_INICIO,recorrido.recorrido_id
		FROM			GD2C2021.gd_esquema.Maestra maestra

		JOIN			LosSimuladores.Camion camion  on camion.camion_fecha_alta = maestra.CAMION_FECHA_ALTA
		AND				camion.camion_nro_motor = maestra.CAMION_NRO_MOTOR
		AND				camion.camion_patente = maestra.CAMION_PATENTE
		AND				camion.camion_nro_chasis = maestra.CAMION_NRO_CHASIS


		JOIN			LosSimuladores.Chofer chofer  on  chofer.chofer_apellido = maestra.CHOFER_APELLIDO
		AND				chofer.chofer_mail = maestra.CHOFER_MAIL
		AND				chofer.chofer_costo_hora = maestra.CHOFER_COSTO_HORA
		AND				chofer.chofer_dni = maestra.CHOFER_DNI
		AND				chofer.chofer_direcccion = maestra.CHOFER_DIRECCION
		AND				chofer.chofer_nombre = maestra.CHOFER_NOMBRE
		AND				chofer.chofer_nro_de_legajo = maestra.CHOFER_NRO_LEGAJO

		JOIN			LosSimuladores.Recorrido recorrido on recorrido.recorrido_km = maestra.RECORRIDO_KM
		AND				recorrido.recorrido_precio = maestra.RECORRIDO_PRECIO

		where			(camion.camion_id is not null) or (Chofer.chofer_nro_de_legajo is not null) or (recorrido.recorrido_id is not null) or (VIAJE_FECHA_INICIO is not null) or (VIAJE_FECHA_FIN is not null) or (VIAJE_CONSUMO_COMBUSTIBLE is not null)
		GROUP BY		camion.camion_id, Chofer.chofer_nro_de_legajo, VIAJE_CONSUMO_COMBUSTIBLE,VIAJE_FECHA_FIN , VIAJE_FECHA_INICIO, recorrido.recorrido_id
	)
END
GO

CREATE PROCEDURE Migrar_Paquete
AS
BEGIN
	INSERT INTO		LosSimuladores.Paquete(paquete_cantidad, paquete_tipo_de_paquete_id, paquete_viaje_id)
		SELECT DISTINCT PAQUETE_CANTIDAD, paquete.tipo_de_paquete_id, viaje.viaje_id
		FROM			gd_esquema.Maestra maestra
		JOIN			LosSimuladores.Viaje viaje on maestra.VIAJE_FECHA_INICIO = viaje.viaje_fecha_inicio
		AND				maestra.VIAJE_FECHA_FIN = viaje.viaje_fecha_fin
		AND				maestra.VIAJE_CONSUMO_COMBUSTIBLE = viaje.viaje_consumo_combustible

		JOIN			LosSimuladores.Tipo_de_paquete paquete on maestra.PAQUETE_PESO_MAX = paquete.tipo_de_paquete_Peso_Max
		AND				maestra.PAQUETE_ALTO_MAX = paquete.tipo_de_paquete_Alto_Max
		AND				maestra.PAQUETE_ANCHO_MAX = paquete.tipo_de_paquete_Ancho_Max
		AND				maestra.PAQUETE_LARGO_MAX = paquete.tipo_de_paquete_Largo_Max

		WHERE			maestra.PAQUETE_PESO_MAX IS NOT NULL
		GROUP BY		PAQUETE_CANTIDAD, paquete.tipo_de_paquete_id, viaje.viaje_id
END
GO

CREATE PROCEDURE Migrar_Orden_de_trabajo
AS
BEGIN
	INSERT INTO		LosSimuladores.Orden_de_trabajo(orden_de_trabajo_estado,orden_de_trabajo_fecha,orden_de_trabajo_camion_id,orden_de_trabajo_taller_id)
		SELECT DISTINCT ORDEN_TRABAJO_ESTADO, ORDEN_TRABAJO_FECHA, camion.camion_id,taller.taller_id
		FROM			gd_esquema.Maestra maestra
		JOIN			LosSimuladores.Camion camion on maestra.CAMION_NRO_CHASIS = camion.camion_nro_chasis
		AND				maestra.CAMION_PATENTE = camion.camion_patente

		JOIN			LosSimuladores.Taller taller on maestra.TALLER_DIRECCION = taller.TALLER_DIRECCION
		AND				maestra.TALLER_TELEFONO = taller.taller_telefono

		WHERE			(maestra.TALLER_DIRECCION IS NOT NULL) or (maestra.CAMION_NRO_MOTOR IS NOT NULL)
		GROUP BY		ORDEN_TRABAJO_ESTADO, ORDEN_TRABAJO_FECHA, camion.camion_id,taller.taller_id
END
GO

CREATE PROCEDURE Migrar_tarea
AS
BEGIN
	INSERT INTO		LosSimuladores.Tarea(tarea_descripcion,tarea_tiempo_estimado,tarea_tipo_de_tarea_id)
		SELECT DISTINCT TAREA_DESCRIPCION, TAREA_TIEMPO_ESTIMADO, tipo.tipo_de_tarea_id
		FROM			gd_esquema.Maestra maestra
		JOIN			LosSimuladores.Tipo_de_tarea tipo on maestra.TIPO_TAREA = tipo.tipo_de_tarea_descripcion

		WHERE			(maestra.TIPO_TAREA IS NOT NULL)
		GROUP BY		TAREA_DESCRIPCION, TAREA_TIEMPO_ESTIMADO, tipo.tipo_de_tarea_id
END
GO


CREATE PROCEDURE Migrar_Orden_de_trabajo_por_tarea
AS
BEGIN
	INSERT INTO		LosSimuladores.Orden_de_trabajo_por_tarea(
	orden_de_trabajo_por_tarea_fecha_fin,
	orden_de_trabajo_por_tarea_fecha_inicio,
	orden_de_trabajo_por_tarea_fecha_inicio_planificado,
	orden_de_trabajo_por_tarea_orden_de_trabajo_id,
	orden_de_trabajo_por_tarea_tarea_id,
	orden_de_trabajo_por_tarea_mecanico_nro_legajo)

		SELECT DISTINCT TAREA_FECHA_FIN, TAREA_FECHA_INICIO, TAREA_FECHA_INICIO_PLANIFICADO, orden.orden_de_trabajo_id, tarea.tarea_id, mecanico.mecanico_nro_legajo
		FROM			gd_esquema.Maestra maestra
		JOIN			LosSimuladores.Tarea tarea on maestra.TAREA_CODIGO = tarea.tarea_id
		JOIN			LosSimuladores.Mecanico mecanico on maestra.MECANICO_DNI = mecanico.mecanico_dni and (maestra.MECANICO_NRO_LEGAJO = mecanico.mecanico_nro_legajo)
		JOIN			LosSimuladores.Orden_de_trabajo orden on (maestra.ORDEN_TRABAJO_FECHA = orden.orden_de_trabajo_fecha and maestra.ORDEN_TRABAJO_ESTADO = orden.orden_de_trabajo_estado)

		WHERE			(maestra.ORDEN_TRABAJO_ESTADO IS NOT NULL) or (maestra.MECANICO_NOMBRE IS NOT NULL) or (maestra.TALLER_NOMBRE IS NOT NULL)
		GROUP BY		TAREA_FECHA_FIN, TAREA_FECHA_INICIO, TAREA_FECHA_INICIO_PLANIFICADO, orden.orden_de_trabajo_id, tarea.tarea_id, mecanico.mecanico_nro_legajo
END
GO	

CREATE PROCEDURE Migrar_tarea_por_materiales
AS
BEGIN
	INSERT INTO	LosSimuladores.Tarea_por_material(tarea_por_material_material_id,tarea_por_material_tarea_id,tarea_por_material_cantidad)
		SELECT DISTINCT MATERIAL_COD, TAREA_CODIGO , COUNT(MATERIAL_COD)
		FROM			gd_esquema.Maestra maestra
		WHERE			TAREA_CODIGO IS NOT NULL
		GROUP BY		MATERIAL_COD, TAREA_CODIGO
END
GO

/*     Ejecuto store procesedures */


EXEC Migrar_chofer
EXEC Migrar_tipo_Paquete 
EXEC Migrar_recorrido
EXEC Migrar_modelo
EXEC Migrar_Mecanico
EXEC Migrar_taller
EXEC Migrar_Tipo_de_tarea
EXEC Migrar_Material 
EXEC Migrar_Camion
EXEC Migrar_Viaje
EXEC Migrar_Paquete
EXEC Migrar_Orden_de_trabajo
EXEC Migrar_tarea
EXEC Migrar_Orden_de_trabajo_por_tarea
EXEC Migrar_tarea_por_materiales

/*     Hago DROPS de las tablas procedure y schema   */
/*
DROP TABLE [LosSimuladores].Viaje;
DROP TABLE [LosSimuladores].Paquete;
DROP TABLE [LosSimuladores].Camion;
DROP TABLE [LosSimuladores].Material;
DROP TABLE [LosSimuladores].Mecanico;
DROP TABLE [LosSimuladores].Modelo;
DROP TABLE [LosSimuladores].Orden_de_trabajo;
DROP TABLE [LosSimuladores].Orden_de_trabajo_por_tarea;
DROP TABLE [LosSimuladores].Chofer;
DROP TABLE [LosSimuladores].Recorrido;
DROP TABLE [LosSimuladores].Taller;
DROP TABLE [LosSimuladores].Tarea;
DROP TABLE [LosSimuladores].Tarea_por_material;
DROP TABLE [LosSimuladores].Tipo_de_paquete;
DROP TABLE [LosSimuladores].Tipo_de_tarea;



DROP PROCEDURE Migrar_chofer
DROP PROCEDURE Migrar_tipo_Paquete 
DROP PROCEDURE Migrar_recorrido
DROP PROCEDURE Migrar_modelo
DROP PROCEDURE Migrar_Mecanico
DROP PROCEDURE Migrar_taller
DROP PROCEDURE Migrar_Mecanico
DROP PROCEDURE Migrar_Tipo_de_tarea
DROP PROCEDURE Migrar_Material 
DROP PROCEDURE Migrar_Camion
DROP PROCEDURE Migrar_Viaje
DROP PROCEDURE Migrar_Paquete
DROP PROCEDURE Migrar_Orden_de_trabajo
DROP PROCEDURE Migrar_tarea
DROP PROCEDURE Migrar_Orden_de_trabajo_por_tarea
DROP PROCEDURE Migrar_tarea_por_materiales

DROP SCHEMA [LosSimuladores] 
*/