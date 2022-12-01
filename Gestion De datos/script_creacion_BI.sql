USE [GD2C2021]
GO
/*
CREATE SCHEMA LosSimuladores
*/
/*  creo dimensiones */

CREATE TABLE LosSimuladores.BI_dimension_Tiempo (
	tiempo_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,	
	tiempo_anio DECIMAL(18,0) NOT NULL,
	tiempo_cuatrimestre DECIMAL(18,0) NOT NULL
);

GO

CREATE TABLE LosSimuladores.BI_dimension_Camion (
    camion_id INT PRIMARY KEY NOT NULL,
	camion_fecha_alta DATETIME2(3) NOT NULL,
	camion_patente NVARCHAR(255) NOT NULL,
	camion_nro_chasis NVARCHAR(255) NOT NULL,
	camion_nro_motor NVARCHAR(255) NOT NULL,
	camion_modelo_id INT
);

GO

CREATE TABLE LosSimuladores.BI_dimension_Marca (
    marca_id INT PRIMARY KEY  NOT NULL,
	marca_nombre NVARCHAR(255) NOT NULL
);

CREATE TABLE LosSimuladores.BI_dimension_Modelo (
    modelo_id INT PRIMARY KEY  NOT NULL,
	modelo_descipcion NVARCHAR(255) NOT NULL,
	modelo_velocidad_max INT NOT NULL,
	modelo_capacidad_tanque INT NOT NULL,
	modelo_capacidad_carga INT NOT NULL
);
GO

CREATE TABLE LosSimuladores.BI_dimension_Taller (
    taller_id INT PRIMARY KEY  NOT NULL,
	taller_direccion NVARCHAR(255) NOT NULL,
	taller_telefono DECIMAL(18,0) NOT NULL,
	taller_mail NVARCHAR(255) NOT NULL,
	taller_nombre NVARCHAR(255) NOT NULL,
	taller_ciudad NVARCHAR(255) NOT NULL
);
GO

CREATE TABLE LosSimuladores.BI_dimension_Tipo_de_tarea (
    tipo_de_tarea_id INT PRIMARY KEY NOT NULL,
	tipo_de_tarea_descripcion NVARCHAR(255) NOT NULL
);
GO

CREATE TABLE LosSimuladores.BI_dimension_Recorrido (
    recorrido_id INT PRIMARY KEY  NOT NULL,
	recorrido_ciudad_origen NVARCHAR(255) NOT NULL,
	recorrido_ciudad_destino NVARCHAR(255) NOT NULL,
	recorrido_km INT NOT NULL,
	recorrido_precio DECIMAL(18,2) NOT NULL,
);
GO

CREATE TABLE LosSimuladores.BI_dimension_Rango (
    Rango_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Rango_descripcion NVARCHAR(255) NOT NULL
);
GO


CREATE TABLE LosSimuladores.BI_dimension_Chofer (
    chofer_nro_de_legajo INT PRIMARY KEY NOT NULL,
    chofer_nombre NVARCHAR(255) NOT NULL,
	chofer_apellido NVARCHAR(255) NOT NULL,
	chofer_dni decimal(18, 0) NOT NULL,
	chofer_direcccion NVARCHAR(255) NOT NULL,
	chofer_telefono INT NOT NULL,
	chofer_mail NVARCHAR(255) NOT NULL,
	chofer_fecha_nac datetime2(3) NOT NULL,
	chofer_costo_hora INT NOT NULL
);
GO

CREATE TABLE LosSimuladores.BI_dimension_Mecanico (
    mecanico_nro_legajo INT PRIMARY KEY NOT NULL,
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

CREATE TABLE LosSimuladores.BI_dimension_Paquete (
    paquete_id INT PRIMARY KEY NOT NULL,
	paquete_cantidad INT NULL,
	paquete_viaje_id INT  NOT NULL,
	paquete_tipo_de_paquete_id INT NULL
);
GO

CREATE TABLE LosSimuladores.BI_dimension_Tipo_de_paquete (
    tipo_de_paquete_id INT PRIMARY KEY  NOT NULL,
	tipo_de_paquete_Descripcion NVARCHAR(255) NOT NULL,
	tipo_de_paquete_Precio decimal(18,2) NOT NULL,
	tipo_de_paquete_Peso_Max decimal(18,2) NOT NULL,
	tipo_de_paquete_Largo_Max decimal(18,2) NOT NULL,
	tipo_de_paquete_Ancho_Max decimal(18,2) NOT NULL,
	tipo_de_paquete_Alto_Max decimal(18,2) NOT NULL
);
GO

CREATE TABLE LosSimuladores.BI_dimension_Tarea (
    tarea_id INT PRIMARY KEY NOT NULL,
	tarea_descripcion NVARCHAR(255) NOT NULL,
	tarea_tiempo_estimado INT NOT NULL,
	tarea_tipo_de_tarea_id INT NOT NULL
);
GO


CREATE TABLE LosSimuladores.BI_dimension_Tarea_por_material (
    tarea_por_material_tarea_id INT NOT NULL,
	tarea_por_material_material_id NVARCHAR(255) NOT NULL,
	tarea_por_material_cantidad INT NOT NULL
);
GO

CREATE TABLE LosSimuladores.BI_dimension_Material (
    material_id NVARCHAR(255) PRIMARY KEY NOT NULL,
	material_descripcion NVARCHAR(255) NOT NULL,
	material_precio DECIMAL(18,2) NOT NULL
);
GO

CREATE TABLE LosSimuladores.BI_dimension_Orden_de_trabajo (
    orden_de_trabajo_id INT PRIMARY KEY NOT NULL,
	orden_de_trabajo_fecha NVARCHAR(255) NOT NULL,
	orden_de_trabajo_estado NVARCHAR(255) NOT NULL,
	orden_de_trabajo_taller_id INT NOT NULL,
	orden_de_trabajo_camion_id INT NOT NULL
);
GO

CREATE TABLE LosSimuladores.BI_dimension_Orden_de_trabajo_por_tarea (
    orden_de_trabajo_por_tarea_orden_de_trabajo_id INT NOT NULL,
	orden_de_trabajo_por_tarea_tarea_id INT NOT NULL,
	orden_de_trabajo_por_tarea_mecanico_nro_legajo INT NOT NULL,
	orden_de_trabajo_por_tarea_fecha_inicio_planificado datetime2(3) NOT NULL,
	orden_de_trabajo_por_tarea_fecha_inicio datetime2(3)  NULL,
	orden_de_trabajo_por_tarea_fecha_fin datetime2(3)  NULL,
	orden_de_trabajo_por_tarea_tiempo_ejecucion decimal(18,2)  NULL
);
GO

CREATE TABLE LosSimuladores.BI_dimension_Viaje (
    viaje_id INT PRIMARY KEY  NOT NULL,
    viaje_fecha_inicio datetime2(3) NOT NULL,
	viaje_fecha_fin datetime2(3),
	viaje_consumo_combustible decimal(18, 2),
	viaje_camion_id INT NOT NULL,
	viaje_chofer_id INT NOT NULL,
	viaje_recorrido_id INT NOT NULL
);
GO
 
/*           CREO Tablas de hechos              */

CREATE TABLE LosSimuladores.BI_hechos_Fuera_de_servicio (
    fuera_de_servicio_camion_id INT NOT NULL,
	fuera_de_servicio_taller_id INT NOT NULL,
	fuera_de_servicio_tiempo_id INT NOT NULL,
	fuera_de_servicio_tiempo_maximo decimal(18, 2) NOT NULL
);
GO

CREATE TABLE LosSimuladores.BI_hechos_Mantenimiento (
    mantenimiento_camion_id INT NOT NULL,
	mantenimiento_taller_id INT NOT NULL,
	mantenimiento_tiempo_id INT NOT NULL,
	mantenimiento_costo_total decimal(18, 2) NOT NULL
);
GO

CREATE TABLE LosSimuladores.BI_hechos_Desvio (
    desvio_tarea_id INT NOT NULL,
	desvio_taller_id INT NOT NULL,
	desvio_promedio INT NOT NULL
);
GO

CREATE TABLE LosSimuladores.BI_hechos_Top_tareas (
    top_tareas_tarea_id INT NOT NULL,
	top_tareas_Modelo_id INT NOT NULL
);
GO

CREATE TABLE LosSimuladores.BI_hechos_Top_materiales (
    top_materiales_materiales_id NVARCHAR(255) NOT NULL,
	top_materiales_taller_id INT NOT NULL
);
GO

CREATE TABLE LosSimuladores.BI_hechos_Fact_total_por_viaje (
    fact_total_viaje_id INT  NOT NULL,
	fact_total_monto_paquete decimal(18, 2) NOT NULL,
	fact_total_monto_chofer decimal(18, 2) NOT NULL
);
GO
 
 CREATE TABLE LosSimuladores.BI_hechos_Promedio_por_rango (
    promedio_por_rango_rango_id INT  NOT NULL,
	promedio_por_rango_monto decimal(18, 2) NOT NULL
);
GO

 CREATE TABLE LosSimuladores.BI_hechos_Ganancia_por_camion (
    ganancia_por_camion_camnion_id INT  NOT NULL,
	ganancia_por_camion_monto decimal(18, 2) NOT NULL
);
GO

/*				CREO FK                  */


------------- Tabla dimensiones ---------------------
ALTER TABLE LosSimuladores.BI_dimension_Viaje 
ADD	FOREIGN KEY (viaje_chofer_id) REFERENCES LosSimuladores.Chofer(chofer_nro_de_legajo),
	FOREIGN KEY (viaje_camion_id) REFERENCES LosSimuladores.Camion(camion_id);
Go

ALTER TABLE LosSimuladores.BI_dimension_Paquete 
ADD FOREIGN KEY (paquete_viaje_id) REFERENCES LosSimuladores.Viaje(viaje_id),
	FOREIGN KEY (paquete_tipo_de_paquete_id) REFERENCES LosSimuladores.Tipo_de_paquete(tipo_de_paquete_id);
GO

ALTER TABLE LosSimuladores.BI_dimension_Camion 
ADD FOREIGN KEY (camion_modelo_id) REFERENCES LosSimuladores.Modelo(modelo_id);
GO

ALTER TABLE LosSimuladores.BI_dimension_Orden_de_trabajo 
ADD FOREIGN KEY (orden_de_trabajo_taller_id) REFERENCES LosSimuladores.Taller(taller_id),
	FOREIGN KEY (orden_de_trabajo_camion_id) REFERENCES LosSimuladores.Camion(camion_id);
GO

ALTER TABLE LosSimuladores.BI_dimension_Orden_de_trabajo_por_tarea
ADD FOREIGN KEY (orden_de_trabajo_por_tarea_orden_de_trabajo_id) REFERENCES LosSimuladores.Orden_de_trabajo(orden_de_trabajo_id),
	FOREIGN KEY (orden_de_trabajo_por_tarea_mecanico_nro_legajo) REFERENCES LosSimuladores.Mecanico(mecanico_nro_legajo),
	FOREIGN KEY (orden_de_trabajo_por_tarea_tarea_id) REFERENCES LosSimuladores.Tarea(tarea_id);
GO

ALTER TABLE LosSimuladores.BI_dimension_Tarea 
ADD FOREIGN KEY (tarea_tipo_de_tarea_id) REFERENCES LosSimuladores.Tipo_de_tarea(tipo_de_tarea_id);
GO

ALTER TABLE LosSimuladores.BI_dimension_Tarea_por_material
ADD FOREIGN KEY (tarea_por_material_tarea_id) REFERENCES LosSimuladores.Tarea(tarea_id),
	FOREIGN KEY (tarea_por_material_material_id) REFERENCES LosSimuladores.Material(material_id);
GO

------------Tabla de Hechos-----------------
ALTER TABLE LosSimuladores.BI_hechos_Fuera_de_servicio
	ADD FOREIGN KEY (fuera_de_servicio_camion_id) REFERENCES LosSimuladores.BI_dimension_Camion(camion_id),
		FOREIGN KEY (fuera_de_servicio_tiempo_id) REFERENCES LosSimuladores.BI_dimension_Tiempo(tiempo_id),
		FOREIGN KEY (fuera_de_servicio_taller_id) REFERENCES LosSimuladores.BI_dimension_Taller(taller_id);
GO

ALTER TABLE LosSimuladores.BI_hechos_Mantenimiento
	ADD FOREIGN KEY (mantenimiento_camion_id) REFERENCES LosSimuladores.BI_dimension_Camion(camion_id),
		FOREIGN KEY (mantenimiento_taller_id) REFERENCES LosSimuladores.BI_dimension_Taller(taller_id),
		FOREIGN KEY (mantenimiento_tiempo_id) REFERENCES LosSimuladores.BI_dimension_Tiempo(tiempo_id);
GO

ALTER TABLE LosSimuladores.BI_hechos_Desvio
	ADD FOREIGN KEY (desvio_tarea_id) REFERENCES LosSimuladores.BI_dimension_Camion(camion_id),
		FOREIGN KEY (desvio_taller_id) REFERENCES LosSimuladores.BI_dimension_Taller(taller_id)
GO

ALTER TABLE LosSimuladores.BI_hechos_Top_tareas
	ADD FOREIGN KEY (top_tareas_tarea_id) REFERENCES LosSimuladores.BI_dimension_Tarea(tarea_id),
		FOREIGN KEY (top_tareas_modelo_id) REFERENCES LosSimuladores.BI_dimension_Modelo(modelo_id)
GO

ALTER TABLE LosSimuladores.BI_hechos_Top_materiales
	ADD FOREIGN KEY (top_materiales_materiales_id) REFERENCES LosSimuladores.BI_dimension_Material(material_id),
		FOREIGN KEY (top_materiales_taller_id) REFERENCES LosSimuladores.BI_dimension_Taller(taller_id)
GO


/*       Creo Procedures        */


CREATE PROCEDURE Migrar_BI_Dimension_tiempo
AS
BEGIN
	INSERT INTO LosSimuladores.BI_dimension_Tiempo(tiempo_anio, tiempo_cuatrimestre)
		(SELECT YEAR(v.viaje_fecha_inicio), DATEPART(quarter, v.viaje_fecha_inicio) FROM LosSimuladores.BI_dimension_Viaje v)
		UNION
		(SELECT YEAR(v.viaje_fecha_fin), DATEPART(quarter, v.viaje_fecha_fin) FROM LosSimuladores.BI_dimension_Viaje v)
		UNION
		(SELECT YEAR(t.orden_de_trabajo_por_tarea_fecha_inicio_planificado), DATEPART(quarter, t.orden_de_trabajo_por_tarea_fecha_inicio_planificado) FROM LosSimuladores.BI_dimension_Orden_de_trabajo_por_tarea t)
		UNION
		(SELECT YEAR(t.orden_de_trabajo_por_tarea_fecha_inicio), DATEPART(quarter, t.orden_de_trabajo_por_tarea_fecha_inicio) FROM LosSimuladores.BI_dimension_Orden_de_trabajo_por_tarea t)
		UNION
		(SELECT YEAR(t.orden_de_trabajo_por_tarea_fecha_fin), DATEPART(quarter, t.orden_de_trabajo_por_tarea_fecha_fin) FROM LosSimuladores.BI_dimension_Orden_de_trabajo_por_tarea t)
END
GO

CREATE PROCEDURE Migrar_BI_dimension_Chofer
AS
BEGIN
	INSERT INTO			LosSimuladores.BI_dimension_Chofer 
		SELECT	* From  LosSimuladores.Chofer
END
GO

CREATE PROCEDURE Migrar_BI_dimension_Tipo_de_paquete 
AS
BEGIN
	INSERT INTO			LosSimuladores.BI_dimension_Tipo_de_paquete 
		SELECT	* From  LosSimuladores.Tipo_de_paquete 
END
GO

CREATE PROCEDURE Migrar_BI_dimension_Recorrido 
AS
BEGIN
	INSERT INTO			LosSimuladores.BI_dimension_Recorrido  
		SELECT	* From  LosSimuladores.Recorrido
END
GO

CREATE PROCEDURE Migrar_BI_dimension_Modelo
AS
BEGIN
	INSERT INTO		[LosSimuladores].[BI_dimension_Modelo]([modelo_id],[modelo_descipcion],[modelo_velocidad_max],[modelo_capacidad_tanque],[modelo_capacidad_carga])	
		SELECT [modelo_id]
		,[modelo_descipcion]
		,[modelo_velocidad_max]
		,[modelo_capacidad_tanque]
		,[modelo_capacidad_carga]
		FROM [GD2C2021].[LosSimuladores].[Modelo]
END
GO

CREATE PROCEDURE Migrar_BI_dimension_Marca
AS
BEGIN
	INSERT INTO		[LosSimuladores].[BI_dimension_Marca]
		SELECT [modelo_id]
		,[modelo_marca]
		FROM [GD2C2021].[LosSimuladores].[Modelo]
END
GO

CREATE PROCEDURE Migrar_BI_dimension_Taller
AS
BEGIN
	INSERT INTO			LosSimuladores.BI_dimension_Taller
		SELECT	* From  LosSimuladores.Taller
END
GO

CREATE PROCEDURE Migrar_BI_dimension_Mecanico
AS
BEGIN
	INSERT INTO			LosSimuladores.BI_dimension_Mecanico
		SELECT	* From  LosSimuladores.Mecanico
END
GO

CREATE PROCEDURE Migrar_BI_dimension_Tipo_de_tarea
AS
BEGIN
	INSERT INTO			LosSimuladores.BI_dimension_Tipo_de_tarea
		SELECT	* From  LosSimuladores.Tipo_de_tarea
END
GO

CREATE PROCEDURE Migrar_BI_dimension_Material 
AS
BEGIN
	INSERT INTO			LosSimuladores.BI_dimension_Material  
		SELECT	* From  LosSimuladores.Material 
END
GO

CREATE PROCEDURE Migrar_BI_dimension_Camion
AS
BEGIN
	INSERT INTO			LosSimuladores.BI_dimension_Camion
		SELECT	* From  LosSimuladores.Camion
END
GO


CREATE PROCEDURE Migrar_BI_dimension_Viaje
AS
BEGIN
	INSERT INTO			LosSimuladores.BI_dimension_Viaje 
		SELECT	* From  LosSimuladores.Viaje
END
GO

CREATE PROCEDURE Migrar_BI_dimension_Paquete
AS
BEGIN
	INSERT INTO			LosSimuladores.BI_dimension_Paquete 
		SELECT	* From  LosSimuladores.Paquete
END
GO

CREATE PROCEDURE Migrar_BI_dimension_Orden_de_trabajo
AS
BEGIN
	INSERT INTO			LosSimuladores.BI_dimension_Orden_de_trabajo
		SELECT	* From  LosSimuladores.Orden_de_trabajo
END
GO

CREATE PROCEDURE Migrar_BI_dimension_Tarea
AS
BEGIN
	INSERT INTO			LosSimuladores.BI_dimension_Tarea
		SELECT	* From  LosSimuladores.Tarea
END
GO


CREATE PROCEDURE Migrar_BI_dimension_Orden_de_trabajo_por_tarea
AS
BEGIN
	INSERT INTO			LosSimuladores.BI_dimension_Orden_de_trabajo_por_tarea 
		SELECT	* From  LosSimuladores.Orden_de_trabajo_por_tarea
END
GO

CREATE PROCEDURE Migrar_BI_dimension_Tarea_por_material
AS
BEGIN
	INSERT INTO			LosSimuladores.BI_dimension_Tarea_por_material
		SELECT	* From  LosSimuladores.Tarea_por_material
END
GO

CREATE PROCEDURE Migrar_BI_dimension_Rango
AS
BEGIN
	INSERT INTO LosSimuladores.BI_dimension_Rango (Rango_descripcion) VALUES ('18 a 30 años'),('31 a 50 años'),('Mayores de 50 años')
END
GO

/*               Creo Funciones                       */

CREATE FUNCTION LosSimuladores.Get_BI_dimension_Tiempo_id (@DATE DATETIME2(3))
RETURNS INT
AS
BEGIN
	DECLARE @TIEMPO_ID INT

	SELECT @TIEMPO_ID = tiempo_id FROM LosSimuladores.BI_dimension_Tiempo
	WHERE tiempo_anio = YEAR(@DATE) AND tiempo_cuatrimestre = DATEPART(quarter,(@DATE))

	RETURN @TIEMPO_ID
END
GO


CREATE FUNCTION LosSimuladores.Get_BI_dimension_rango(@BORN DATETIME2(3)) 
RETURNS INT
AS
BEGIN
    DECLARE @EDAD  INT
    DECLARE @RANGO INT

    SET @EDAD = DATEDIFF(YY, @BORN, GETDATE())
	IF @EDAD BETWEEN 18 AND 30
        SET @RANGO = (SELECT rango_id FROM LosSimuladores.BI_dimension_Rango WHERE Rango_id = 1)
    ELSE IF @EDAD BETWEEN 31 AND 50
		SET @RANGO = (SELECT rango_id FROM LosSimuladores.BI_dimension_Rango WHERE Rango_id = 2)
	ELSE 
		SET @RANGO= (SELECT rango_id FROM LosSimuladores.BI_dimension_Rango WHERE Rango_id = 3)
    RETURN @RANGO
END
GO

------------------ Procedures tablas hechos ------------------------------

CREATE PROCEDURE Migrar_BI_hechos_Fuera_de_servicio
AS
BEGIN
	INSERT INTO			LosSimuladores.BI_hechos_Fuera_de_servicio
		SELECT DISTINCT c.camion_id, 
		t.taller_id, 
		LosSimuladores.Get_BI_dimension_Tiempo_id(orden.orden_de_trabajo_fecha),
		(SELECT  SUM(tarea_tiempo_estimado)
		 FROM LosSimuladores.BI_dimension_Orden_de_trabajo_por_tarea 
		 JOIN LosSimuladores.BI_dimension_Orden_de_trabajo ON orden_de_trabajo_id = orden_de_trabajo_por_tarea_orden_de_trabajo_id
		 JOIN LosSimuladores.BI_dimension_Tarea ON tarea_id = orden_de_trabajo_por_tarea_tarea_id
		 WHERE orden_de_trabajo_camion_id = 1
		 AND LosSimuladores.Get_BI_dimension_Tiempo_id(orden_de_trabajo_fecha) = LosSimuladores.Get_BI_dimension_Tiempo_id(orden.orden_de_trabajo_fecha)
		 GROUP BY orden_de_trabajo_camion_id, LosSimuladores.Get_BI_dimension_Tiempo_id(orden_de_trabajo_fecha))
		From LosSimuladores.BI_dimension_Camion c 
		JOIN LosSimuladores.BI_dimension_Orden_de_trabajo orden on orden.orden_de_trabajo_camion_id = c.camion_id
		JOIN LosSimuladores.BI_dimension_Taller t on t.taller_id = orden.orden_de_trabajo_taller_id
		GROUP BY c.camion_id, t.taller_id, LosSimuladores.Get_BI_dimension_Tiempo_id(orden.orden_de_trabajo_fecha)
END
GO


CREATE PROCEDURE Migrar_BI_hechos_Mantenimiento
AS
BEGIN
	INSERT INTO			LosSimuladores.BI_hechos_Mantenimiento
		SELECT DISTINCT camion_id, taller_id
		, DATEPART(quarter, orden_de_trabajo_por_tarea_fecha_fin) 
		, sum( (m.material_precio * tm.tarea_por_material_cantidad) + ((DATEDIFF (DAY, ot.orden_de_trabajo_por_tarea_fecha_inicio , ot.orden_de_trabajo_por_tarea_fecha_fin) * 8) * mec.mecanico_costo_hora))
		From LosSimuladores.BI_dimension_Camion c 
			JOIN LosSimuladores.BI_dimension_Orden_de_trabajo orden on orden.orden_de_trabajo_camion_id = c.camion_id
			JOIN LosSimuladores.BI_dimension_Orden_de_trabajo_por_tarea ot on orden.orden_de_trabajo_id = ot.orden_de_trabajo_por_tarea_orden_de_trabajo_id
			join LosSimuladores.BI_dimension_Tarea t on ot.orden_de_trabajo_por_tarea_tarea_id = t.tarea_id
			JOIN LosSimuladores.BI_dimension_Tarea_por_material tm on tm.tarea_por_material_tarea_id = t.tarea_id
			JOIN LosSimuladores.BI_dimension_Material m on tm.tarea_por_material_material_id = m.material_id
			JOIN LosSimuladores.BI_dimension_Mecanico mec on mec.mecanico_nro_legajo = ot.orden_de_trabajo_por_tarea_mecanico_nro_legajo
			JOIN LosSimuladores.BI_dimension_Taller tall on tall.taller_id = orden.orden_de_trabajo_taller_id
		group by c.camion_id, tall.taller_id, DATEPART(quarter, orden_de_trabajo_por_tarea_fecha_fin)
		ORDER BY c.camion_id asc
END
GO

CREATE PROCEDURE Migrar_BI_hechos_Desvio
AS
BEGIN
	INSERT INTO			LosSimuladores.BI_hechos_Desvio
		SELECT DISTINCT  t.tarea_id, 
		tall.taller_id,
		AVG((DATEDIFF (DAY, ot.orden_de_trabajo_por_tarea_fecha_inicio , ot.orden_de_trabajo_por_tarea_fecha_fin)))   
		From LosSimuladores.BI_dimension_Orden_de_trabajo orden
			JOIN LosSimuladores.BI_dimension_Orden_de_trabajo_por_tarea ot on orden.orden_de_trabajo_id = ot.orden_de_trabajo_por_tarea_orden_de_trabajo_id
			join LosSimuladores.BI_dimension_Tarea t on ot.orden_de_trabajo_por_tarea_tarea_id = t.tarea_id			
			JOIN LosSimuladores.BI_dimension_Taller tall on tall.taller_id = orden.orden_de_trabajo_taller_id
		group by  t.tarea_id, tall.taller_id,t.tarea_tiempo_estimado,ot.orden_de_trabajo_por_tarea_fecha_inicio,ot.orden_de_trabajo_por_tarea_fecha_fin

END
GO

CREATE PROCEDURE Migrar_BI_hechos_Top_tareas
AS
BEGIN
	INSERT INTO			LosSimuladores.BI_hechos_Top_tareas
		SELECT orden_de_trabajo_por_tarea_tarea_id , modelo_id
		FROM LosSimuladores.BI_dimension_Modelo m1 
		JOIN LosSimuladores.BI_dimension_Camion c on c.camion_modelo_id = m1.modelo_id 
		JOIN LosSimuladores.BI_dimension_Orden_de_trabajo orden on c.camion_id = orden.orden_de_trabajo_camion_id
		JOIN LosSimuladores.BI_dimension_Orden_de_trabajo_por_tarea ot on orden.orden_de_trabajo_id = ot.orden_de_trabajo_por_tarea_orden_de_trabajo_id
		WHERE orden_de_trabajo_por_tarea_tarea_id in ( SELECT TOP 5 
		ot.orden_de_trabajo_por_tarea_tarea_id
		FROM LosSimuladores.BI_dimension_Modelo m 
		JOIN LosSimuladores.BI_dimension_Camion c on c.camion_modelo_id = m.modelo_id 
		JOIN LosSimuladores.BI_dimension_Orden_de_trabajo orden on c.camion_id = orden.orden_de_trabajo_camion_id
		JOIN LosSimuladores.BI_dimension_Orden_de_trabajo_por_tarea ot on orden.orden_de_trabajo_id = ot.orden_de_trabajo_por_tarea_orden_de_trabajo_id
		where m.modelo_id = m1.modelo_id
		GROUP BY ot.orden_de_trabajo_por_tarea_tarea_id, m.modelo_id
		ORDER BY   COUNT(ot.orden_de_trabajo_por_tarea_tarea_id) DESC)
		GROUP BY modelo_id,orden_de_trabajo_por_tarea_tarea_id
END
GO

CREATE PROCEDURE Migrar_BI_hechos_Top_materiales
AS
BEGIN
	INSERT INTO			LosSimuladores.BI_hechos_Top_materiales
		SELECT tm.tarea_por_material_material_id, o.orden_de_trabajo_taller_id
		FROM LosSimuladores.BI_dimension_Taller t
		JOIN LosSimuladores.BI_dimension_Orden_de_trabajo o on o.orden_de_trabajo_taller_id = t.taller_id 
		JOIN LosSimuladores.BI_dimension_Orden_de_trabajo_por_tarea ot on ot.orden_de_trabajo_por_tarea_orden_de_trabajo_id = o.orden_de_trabajo_id
		JOIN LosSimuladores.BI_dimension_Tarea_por_material tm on tm.tarea_por_material_tarea_id = ot.orden_de_trabajo_por_tarea_tarea_id
		where tm.tarea_por_material_material_id in (SELECT top 10  tm2.tarea_por_material_material_id
													FROM LosSimuladores.BI_dimension_Orden_de_trabajo orden 
													JOIN LosSimuladores.BI_dimension_Orden_de_trabajo_por_tarea ot2 on ot.orden_de_trabajo_por_tarea_orden_de_trabajo_id = orden.orden_de_trabajo_id
													JOIN LosSimuladores.BI_dimension_Tarea_por_material tm2 on tm2.tarea_por_material_tarea_id = ot2.orden_de_trabajo_por_tarea_tarea_id
													WHERE t.taller_id = orden.orden_de_trabajo_taller_id 
													GROUP BY tm2.tarea_por_material_material_id,orden.orden_de_trabajo_taller_id
													ORDER BY COUNT(tm2.tarea_por_material_material_id)DESC)
		GROUP BY o.orden_de_trabajo_taller_id, tm.tarea_por_material_material_id 
		ORDER BY o.orden_de_trabajo_taller_id, COUNT(tm.tarea_por_material_material_id)
END
GO

CREATE PROCEDURE Migrar_BI_hechos_Fact_total_por_viaje
AS
BEGIN
	INSERT INTO			LosSimuladores.BI_hechos_Fact_total_por_viaje
		SELECT viaje_id,SUM(p.paquete_cantidad*tp.tipo_de_paquete_Precio),(c.chofer_costo_hora*DATEDIFF (DAY, v.viaje_fecha_inicio , v.viaje_fecha_fin)*8)
		FROM LosSimuladores.BI_dimension_Viaje v 
		JOIN LosSimuladores.BI_dimension_Paquete p on v.viaje_id = paquete_viaje_id
		JOIN LosSimuladores.BI_dimension_Tipo_de_paquete tp on p.paquete_tipo_de_paquete_id = tp.tipo_de_paquete_id
		JOIN LosSimuladores.BI_dimension_Chofer c on c.chofer_nro_de_legajo = v.viaje_chofer_id
		GROUP BY viaje_id,c.chofer_costo_hora,v.viaje_fecha_inicio , v.viaje_fecha_fin


END
GO

CREATE PROCEDURE Migrar_BI_hechos_Promedio_por_rango
AS
BEGIN
	INSERT INTO			LosSimuladores.BI_hechos_Promedio_por_rango
		SELECT Rango_id, AVG(c.chofer_costo_hora)
		FROM  LosSimuladores.BI_dimension_Chofer c
		JOIN LosSimuladores.BI_dimension_Rango r on r.Rango_id = LosSimuladores.Get_BI_dimension_rango(c.chofer_fecha_nac)
		GROUP BY LosSimuladores.Get_BI_dimension_rango(c.chofer_fecha_nac),r.Rango_id


END
GO

CREATE PROCEDURE Migrar_BI_hechos_Ganancia_por_camion
AS
BEGIN
	INSERT INTO			LosSimuladores.BI_hechos_Ganancia_por_camion
		SELECT camion_id , SUM(fv.fact_total_monto_paquete-fv.fact_total_monto_chofer-v.viaje_consumo_combustible*100-tm.tarea_por_material_cantidad*material_precio)
		FROM LosSimuladores.BI_dimension_Camion c  
		JOIN LosSimuladores.BI_dimension_Viaje v on viaje_camion_id = c.camion_id
		JOIN LosSimuladores.BI_hechos_Fact_total_por_viaje fv on v.viaje_id = fv.fact_total_viaje_id
		JOIN LosSimuladores.BI_dimension_Orden_de_trabajo orden on c.camion_id = orden.orden_de_trabajo_camion_id
		JOIN LosSimuladores.BI_dimension_Orden_de_trabajo_por_tarea ot on ot.orden_de_trabajo_por_tarea_orden_de_trabajo_id = orden.orden_de_trabajo_id
		Join LosSimuladores.BI_dimension_Tarea_por_material tm on ot.orden_de_trabajo_por_tarea_tarea_id = tm.tarea_por_material_tarea_id
		JOIn LosSimuladores.BI_dimension_Material m on  m.material_id = tm.tarea_por_material_material_id
		GROUP BY camion_id
END
GO

/*         Creo VISTAS                       */


CREATE VIEW LosSimuladores.v_Fuera_de_Servicio AS 
	SELECT 
		  fuera_de_servicio_camion_id AS [ID del camion]
		, t.tiempo_cuatrimestre AS [Cuatrimestre]
		, m.fuera_de_servicio_tiempo_maximo AS [Tiempo maximo de espera]
	FROM LosSimuladores.BI_hechos_Fuera_de_servicio m
	JOIN LosSimuladores.BI_dimension_Tiempo t on m.fuera_de_servicio_tiempo_id = t.tiempo_id
	GROUP BY fuera_de_servicio_camion_id, t.tiempo_cuatrimestre,m.fuera_de_servicio_tiempo_maximo
GO

CREATE VIEW LosSimuladores.v_Costo_Mantenimiento AS
	SELECT 
		  mantenimiento_camion_id AS [ID camion]
		, mantenimiento_taller_id AS [Id Taller]
		, t.tiempo_cuatrimestre AS [Cuatrimestre]
		, mantenimiento_costo_total AS [Costo Total de Mantenimiento]
	FROM LosSimuladores.BI_hechos_Mantenimiento m
	JOIN LosSimuladores.BI_dimension_Tiempo t on m.mantenimiento_tiempo_id = t.tiempo_id
	GROUP BY m.mantenimiento_camion_id, m.mantenimiento_taller_id, t.tiempo_cuatrimestre,mantenimiento_costo_total
GO

CREATE VIEW LosSimuladores.v_Desvios AS
	SELECT
		  desvio_taller_id AS [Id taller]
		, desvio_promedio AS [Desvío Promedio]
	FROM LosSimuladores.BI_hechos_Desvio
	GROUP BY desvio_taller_id, desvio_promedio
GO

CREATE VIEW LosSimuladores.v_Top_Tarea AS
	SELECT 
		  t.top_tareas_Modelo_id AS [ID modelo]
		, m.modelo_descipcion AS [Descripcion]
		, t.top_tareas_tarea_id AS [ID tarea]
	FROM LosSimuladores.BI_hechos_Top_tareas t
	JOIN LosSimuladores.BI_dimension_Modelo m on m.modelo_id = t.top_tareas_Modelo_id
	GROUP BY t.top_tareas_Modelo_id, t.top_tareas_tarea_id, m.modelo_descipcion 
GO

CREATE VIEW LosSimuladores.v_Materiales_Mas_Utilizados AS
	SELECT 
		  m.top_materiales_materiales_id AS [ID Codigo]
		, m.top_materiales_materiales_id AS [ID material]
		, m2.material_descripcion AS [Material]
	FROM LosSimuladores.BI_hechos_Top_materiales m
	JOIN LosSimuladores.BI_dimension_Material m2 on m.top_materiales_materiales_id = m2.material_id
	GROUP BY m.top_materiales_materiales_id,m.top_materiales_taller_id,m2.material_descripcion
GO

CREATE VIEW LosSimuladores.v_Facturacion_Total_x_Cuatriestre AS
	SELECT 
		  v.viaje_recorrido_id AS [ID recorrido]
		, r.recorrido_ciudad_origen AS [Origen]
		, r.recorrido_ciudad_destino AS [Destino]
		, t.tiempo_cuatrimestre AS [Cuatrimestre]
		, tv.fact_total_monto_paquete AS [Facturacion Total]
	FROM LosSimuladores.BI_hechos_Fact_total_por_viaje tv
	JOIN LosSimuladores.BI_dimension_Viaje  v on tv.fact_total_viaje_id = v.viaje_id
	JOIN LosSimuladores.BI_dimension_Recorrido r on r.recorrido_id = v.viaje_recorrido_id
	JOIN LosSimuladores.BI_dimension_Tiempo t on DATEPART(quarter, viaje_fecha_inicio) = t.tiempo_cuatrimestre
	GROUP BY viaje_recorrido_id, recorrido_ciudad_origen, recorrido_ciudad_destino , tiempo_cuatrimestre, fact_total_monto_paquete
GO

CREATE VIEW LosSimuladores.v_Promedio_Rango_Edad AS 
	SELECT 
		  r.Rango_descripcion AS [Rango Edad]
		, p.promedio_por_rango_monto AS [Promedio]
	FROM LosSimuladores.BI_hechos_Promedio_por_rango p
	JOIN LosSimuladores.BI_dimension_Rango r on p.promedio_por_rango_rango_id = r.Rango_id
	GROUP BY r.Rango_descripcion, p.promedio_por_rango_monto
GO

CREATE VIEW LosSimuladores.v_Ganancias_Por_Camion AS
    SELECT 
		  ganancia_por_camion_camnion_id as [Camión Código]
		, ganancia_por_camion_monto [Ganancias]
    FROM LosSimuladores.BI_hechos_Ganancia_por_camion
	GROUP BY ganancia_por_camion_camnion_id, ganancia_por_camion_monto
GO

----
EXEC Migrar_BI_dimension_Chofer
EXEC Migrar_BI_dimension_Tipo_de_paquete 
EXEC Migrar_BI_dimension_recorrido
EXEC Migrar_BI_dimension_modelo
EXEC Migrar_BI_dimension_Mecanico
EXEC Migrar_BI_dimension_taller
EXEC Migrar_BI_dimension_Tipo_de_tarea
EXEC Migrar_BI_dimension_Material 
EXEC Migrar_BI_dimension_Camion
EXEC Migrar_BI_dimension_Viaje
EXEC Migrar_BI_dimension_Paquete
EXEC Migrar_BI_dimension_Orden_de_trabajo
EXEC Migrar_BI_dimension_tarea
EXEC Migrar_BI_dimension_Orden_de_trabajo_por_tarea
EXEC Migrar_BI_dimension_tarea_por_material
EXEC Migrar_BI_dimension_Marca
EXEC Migrar_BI_dimension_Tiempo
EXEC Migrar_BI_dimension_Rango

EXEC Migrar_BI_hechos_Fuera_de_servicio
EXEC Migrar_BI_hechos_Mantenimiento
EXEC Migrar_BI_hechos_Desvio
EXEC Migrar_BI_hechos_Top_tareas
EXEC Migrar_BI_hechos_Top_materiales
EXEC Migrar_BI_hechos_Fact_total_por_viaje
EXEC Migrar_BI_hechos_Promedio_por_rango
EXEC Migrar_BI_hechos_Ganancia_por_camion

SELECT * FROM [GD2C2021].[LosSimuladores].[v_Costo_Mantenimiento]
SELECT * FROM [GD2C2021].[LosSimuladores].[v_Desvios]
SELECT * FROM [GD2C2021].[LosSimuladores].[v_Facturacion_Total_x_Cuatriestre]
SELECT * FROM [GD2C2021].[LosSimuladores].[v_Fuera_de_Servicio]
SELECT * FROM [GD2C2021].[LosSimuladores].[v_Ganancias_Por_Camion]
SELECT * FROM [GD2C2021].[LosSimuladores].[v_Materiales_Mas_Utilizados]
SELECT * FROM [GD2C2021].[LosSimuladores].[v_Promedio_Rango_Edad]
SELECT * FROM [GD2C2021].[LosSimuladores].[v_Top_Tarea]




/*
DROP PROCEDURE [dbo].Migrar_BI_dimension_Orden_de_trabajo
GO
DROP PROCEDURE [dbo].Migrar_BI_dimension_Orden_de_trabajo_por_tarea
GO
DROP PROCEDURE [dbo].Migrar_BI_dimension_Paquete
GO
DROP PROCEDURE [dbo].Migrar_BI_dimension_Recorrido
GO
DROP PROCEDURE [dbo].Migrar_BI_dimension_Tarea
GO
DROP PROCEDURE [dbo].Migrar_BI_dimension_Tarea_por_material
GO
DROP PROCEDURE [dbo].Migrar_BI_Dimension_tiempo
GO
DROP PROCEDURE [dbo].Migrar_BI_dimension_Tipo_de_paquete
GO
DROP PROCEDURE [dbo].Migrar_BI_dimension_Tipo_de_tarea
GO
DROP PROCEDURE [dbo].Migrar_BI_dimension_Viaje
GO
DROP PROCEDURE [LosSimuladores].[BI_dimension_Migrar_Rango]
GO
DROP PROCEDURE [dbo].Migrar_BI_dimension_Taller
GO
DROP FUNCTION [dbo].[Get_BI_dimension_Tiempo_id]
GO
DROP FUNCTION [LosSimuladores].[Get_BI_dimension_Tiempo_id]
GO
DROP PROCEDURE [dbo].Migrar_BI_hechos_Fuera_de_servicio
GO
DROP PROCEDURE [dbo].[Migrar_BI_dimension_Rango]
GO
DROP TABLE [LosSimuladores].[BI_hechos_Fact_total_por_viaje]
GO
DROP PROCEDURE [dbo].[Migrar_BI_hechos_Top_tareas]
GO
DROP PROCEDURE [dbo].[Migrar_BI_hechos_Mantenimiento]
GO
DROP PROCEDURE [dbo].[Migrar_BI_hechos_Desvio]
GO
DROP PROCEDURE [dbo].[Migrar_BI_hechos_Top_materiales]
GO
DROP FUNCTION [LosSimuladores].[Get_BI_dimension_rango]
GO
DROP PROCEDURE [dbo].[Migrar_BI_hechos_Fact_total_por_viaje]
GO
DROP PROCEDURE [dbo].[Migrar_BI_hechos_Promedio_por_rango]
GO
DROP VIEW [LosSimuladores].[v_Costo_Mantenimiento]
GO
DROP VIEW [LosSimuladores].[v_Desvios]
GO
DROP VIEW [LosSimuladores].[v_Facturacion_Total_x_Cuatriestre]
GO
DROP VIEW [LosSimuladores].[v_Ganancias_Por_Camion]
GO
DROP VIEW [LosSimuladores].[v_Costo_Mantenimiento]
GO
DROP VIEW [LosSimuladores].[v_Materiales_Mas_Utilizados]
GO
DROP VIEW [LosSimuladores].[v_Fuera_de_Servicio]
GO
DROP VIEW [LosSimuladores].[v_Top_Tarea]
*/

















/*
CREATE TABLE LosSimuladores.BI_hechos_Mantenimiento (
    mantenimiento_camion_id INT NOT NULL,
	mantenimiento_taller_id INT NOT NULL,
	mantenimiento_tiempo_id INT NOT NULL,
	mantenimiento_costo_total decimal(18, 2) NOT NULL
);
GO

CREATE TABLE LosSimuladores.BI_hechos_Desvio (
    desvio_tarea_id INT NOT NULL,
	desvio_taller_id INT NOT NULL,
	desvio_promedio INT NOT NULL
);
GO

CREATE TABLE LosSimuladores.BI_hechos_Top_tareas (
    top_tareas_tarea_id INT NOT NULL,
	top_tareas_camion_id INT NOT NULL
);
GO

CREATE TABLE LosSimuladores.BI_hechos_Top_materiales (
    top_materiales_materiales_id INT NOT NULL,
	top_materiales_camion_id INT NOT NULL
);
GO

CREATE TABLE LosSimuladores.BI_hechos_Fact_total (
    fact_total_recorrido_id INT NOT NULL,
	fact_total_monto decimal(18, 2),
	fact_total_tiempo_id INT NOT NULL
);
GO
 
 CREATE TABLE LosSimuladores.BI_Promedio_por_rango (
    promedio_por_rango_chofer_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	promedio_por_rango_monto decimal(18, 2) NOT NULL
);
GO

 CREATE TABLE LosSimuladores.BI_Ganancia_por_camion (
    ganancia_por_camion_camnion_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	ganancia_por_camion_monto decimal(18, 2)
);
GO


DROP TABLE [LosSimuladores].[BI_dimension_Chofer]
GO
DROP TABLE [LosSimuladores].[BI_dimension_Marca]
GO
DROP TABLE [LosSimuladores].[BI_dimension_Material]
GO
DROP TABLE [LosSimuladores].[BI_dimension_Mecanico]
GO
DROP TABLE [LosSimuladores].[BI_dimension_Modelo]
GO
DROP TABLE [LosSimuladores].[BI_dimension_Orden_de_trabajo]
GO
DROP TABLE [LosSimuladores].[BI_dimension_Orden_de_trabajo_por_tarea]
GO
DROP TABLE [LosSimuladores].BI_dimension_Paquete
GO
DROP TABLE [LosSimuladores].BI_dimension_Rango
GO
DROP TABLE [LosSimuladores].BI_dimension_Recorrido
GO
DROP TABLE [LosSimuladores].BI_dimension_Taller
GO
DROP TABLE [LosSimuladores].BI_dimension_Tarea
GO
DROP TABLE [LosSimuladores].BI_dimension_Tarea_por_material
GO
DROP TABLE [LosSimuladores].BI_dimension_Tiempo
GO
DROP TABLE [LosSimuladores].BI_dimension_Tipo_de_paquete
GO
DROP TABLE [LosSimuladores].BI_dimension_Tipo_de_tarea
GO
DROP TABLE [LosSimuladores].BI_dimension_Viaje
GO
DROP TABLE [LosSimuladores].BI_hechos_Fact_total
GO
DROP TABLE [LosSimuladores].BI_hechos_Fuera_de_servicio
GO
DROP TABLE [LosSimuladores].BI_hechos_Mantenimiento
GO
DROP TABLE [LosSimuladores].BI_hechos_Top_tareas
GO
DROP TABLE [LosSimuladores].BI_hechos_Fact_total
GO
DROP TABLE [LosSimuladores].BI_hechos_Fact_total
GO
DROP TABLE [LosSimuladores].BI_dimension_Material
GO
DROP TABLE [LosSimuladores].BI_dimension_Taller
GO
DROP TABLE [LosSimuladores].BI_hechos_Desvio
GO
DROP TABLE [LosSimuladores].BI_hechos_Ganancia_por_camion
GO
DROP TABLE [LosSimuladores].BI_hechos_Promedio_por_rango
GO
DROP TABLE [LosSimuladores].BI_hechos_Top_materiales
GO
DROP TABLE [LosSimuladores].[BI_dimension_Camion]
GO
DROP PROCEDURE [dbo].[Migrar_BI_dimension_Camion]
GO
DROP PROCEDURE [dbo].Migrar_BI_dimension_Modelo
GO
DROP PROCEDURE [dbo].Migrar_BI_dimension_Chofer
GO
DROP PROCEDURE [dbo].Migrar_BI_dimension_Material
GO
DROP PROCEDURE [dbo].Migrar_BI_dimension_Mecanico
GO
DROP PROCEDURE [dbo].Migrar_BI_dimension_Orden_de_trabajo
GO
DROP PROCEDURE [dbo].Migrar_BI_dimension_Orden_de_trabajo_por_tarea
GO
DROP PROCEDURE [dbo].Migrar_BI_dimension_Paquete
GO
DROP PROCEDURE [dbo].Migrar_BI_dimension_Recorrido
GO
DROP PROCEDURE [dbo].Migrar_BI_dimension_Tarea
GO
DROP PROCEDURE [dbo].Migrar_BI_dimension_Tarea_por_material
GO
DROP PROCEDURE [dbo].Migrar_BI_Dimension_tiempo
GO
DROP PROCEDURE [dbo].Migrar_BI_dimension_Tipo_de_paquete
GO
DROP PROCEDURE [dbo].Migrar_BI_dimension_Tipo_de_tarea
GO
DROP PROCEDURE [dbo].Migrar_BI_dimension_Viaje
GO
DROP PROCEDURE [LosSimuladores].[BI_dimension_Migrar_Rango]
GO
DROP PROCEDURE [dbo].Migrar_BI_dimension_Taller
GO
DROP FUNCTION [dbo].[Get_BI_dimension_Tiempo_id]
GO

DROP SCHEMA [LosSimuladores]
*/