CREATE TABLE Agentes (
    ID INT IDENTITY PRIMARY KEY,
    Nombre VARCHAR(50),
    Email VARCHAR(100),
    Telefono VARCHAR(20)
)
go

CREATE TABLE Clientes (
    ID INT IDENTITY PRIMARY KEY,
    Nombre VARCHAR(50),
    Email VARCHAR(100),
    Telefono VARCHAR(20)
)
go

CREATE TABLE Casas (
    ID INT IDENTITY PRIMARY KEY,
    Direccion VARCHAR(100),
    Ciudad VARCHAR(50),
    Precio DECIMAL(10, 2)
)
go

CREATE TABLE Ventas (
    ID INT IDENTITY PRIMARY KEY,
    ID_Agente INT,
    ID_Cliente INT,
    ID_Casa INT,
    Fecha DATE,
    FOREIGN KEY (ID_Agente) REFERENCES Agentes(ID),
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID),
    FOREIGN KEY (ID_Casa) REFERENCES Casas(ID)
);

INSERT INTO Agentes (Nombre, Email, Telefono) VALUES
('Juan Pérez', 'juan@example.com', '123-456-7890'),
('María López', 'maria@example.com', '987-654-3210'),
('Carlos González', 'carlos@example.com', '456-789-0123');

INSERT INTO Clientes (Nombre, Email, Telefono) VALUES
('Laura Martínez', 'laura@example.com', '111-222-3333'),
('Pedro Rodríguez', 'pedro@example.com', '444-555-6666'),
('Ana García', 'ana@example.com', '777-888-9999');

INSERT INTO Casas (Direccion, Ciudad, Precio) VALUES
('Calle 123', 'Madrid', 250000.00),
('Avenida 456', 'Barcelona', 300000.00),
('Calle 789', 'Valencia', 200000.00);

INSERT INTO Ventas (ID_Agente, ID_Cliente, ID_Casa, Fecha) VALUES
(1, 2, 1, '2024-04-01'),
(2, 3, 2, '2024-04-03'),
(3, 1, 3, '2024-04-05');

go

CREATE PROCEDURE GestionarAgentes
    @accion NVARCHAR(10),
    @agente_id INT = NULL,
    @agente_nombre NVARCHAR(50) = NULL,
    @agente_email NVARCHAR(100) = NULL,
    @agente_telefono NVARCHAR(20) = NULL
AS
BEGIN
    IF @accion = 'agregar'
    BEGIN
        INSERT INTO Agentes (Nombre, Email, Telefono) VALUES (@agente_nombre, @agente_email, @agente_telefono);
    END
    ELSE IF @accion = 'borrar'
    BEGIN
        DELETE FROM Agentes WHERE ID = @agente_id;
    END
    ELSE IF @accion = 'modificar'
    BEGIN
        UPDATE Agentes SET 
            Nombre = @agente_nombre,
            Email = @agente_email,
            Telefono = @agente_telefono
        WHERE ID = @agente_id;
    END
    ELSE IF @accion = 'consultar'
    BEGIN
        SELECT * FROM Agentes;
    END
    ELSE
    BEGIN
        SELECT 'Acción no válida';
    END
END
go

EXEC GestionarAgentes 'agregar', NULL, 'Nuevo Agente', 'nuevo@example.com', '123-456-7890';
EXEC GestionarAgentes 'borrar', 4; 
EXEC GestionarAgentes 'modificar', 1, 'Juan Pérez Modificado', 'juan@example.com', '123-456-7890'; 
EXEC GestionarAgentes 'consultar';

select * from Agentes;
select * from Clientes;
select * from Casas;
select * from Ventas;



------------------------------------------------sql usado------

SELECT [ID]
      ,[ID_Agente]
      ,[ID_Cliente]
      ,[ID_Casa]
      ,[Fecha]
  FROM [dbo].[Ventas]

  SELECT [ID]
      ,[Nombre]
      ,[Email]
      ,[Telefono]
  FROM [dbo].[Clientes]

  SELECT [ID]
      ,[Direccion]
      ,[Ciudad]
      ,[Precio]
  FROM [dbo].[Casas]

  SELECT [ID]
      ,[Nombre]
      ,[Email]
      ,[Telefono]
      ,[Rol]
      ,[Contraseña]
  FROM [dbo].[Agentes]
  -----------------------------------------------SP
  ALTER PROCEDURE [dbo].[GestionarAgentes]
    @accion NVARCHAR(10),
    @agente_id INT = NULL,
    @agente_nombre NVARCHAR(50) = NULL,
    @agente_email NVARCHAR(100) = NULL,
    @agente_telefono NVARCHAR(20) = NULL,
    @agente_rol NVARCHAR(20) = NULL
AS
BEGIN
    IF @accion = 'agregar'
    BEGIN
        INSERT INTO Agentes (Nombre, Email, Telefono, Rol) VALUES (@agente_nombre, @agente_email, @agente_telefono, @agente_rol);
    END
    ELSE IF @accion = 'borrar'
    BEGIN
        DELETE FROM Agentes WHERE ID = @agente_id;
    END
    ELSE IF @accion = 'modificar'
    BEGIN
        UPDATE Agentes SET 
            Nombre = @agente_nombre,
            Email = @agente_email,
            Telefono = @agente_telefono,
            Rol = @agente_rol
        WHERE ID = @agente_id;
    END
    ELSE IF @accion = 'consultar'
    BEGIN
        -- Devolver datos de los agentes
        SELECT ID, Nombre, Email, Telefono, Rol FROM Agentes;
    END
    ELSE
    BEGIN
        SELECT 'Acción no válida';
    END
END

------------------------------------

ALTER PROCEDURE [dbo].[GestionarCasas]
    @accion NVARCHAR(10),
    @casa_id INT = NULL,
    @direccion NVARCHAR(100) = NULL,
    @ciudad NVARCHAR(50) = NULL,
    @precio DECIMAL(18, 2) = NULL
AS
BEGIN
    IF @accion = 'agregar'
    BEGIN
        INSERT INTO Casas (Direccion, Ciudad, Precio) VALUES (@direccion, @ciudad, @precio);
    END
    ELSE IF @accion = 'borrar'
    BEGIN
        DELETE FROM Casas WHERE ID = @casa_id;
    END
    ELSE IF @accion = 'modificar'
    BEGIN
        UPDATE Casas SET 
            Direccion = @direccion,
            Ciudad = @ciudad,
            Precio = @precio
        WHERE ID = @casa_id;
    END
    ELSE IF @accion = 'consultar'
    BEGIN
        SELECT * FROM Casas;
    END
    ELSE
    BEGIN
        SELECT 'Acción no válida';
    END
END
--------------------------------------
ALTER PROCEDURE [dbo].[GestionarClientes]
    @accion NVARCHAR(10),
    @cliente_id INT = NULL,
    @nombre NVARCHAR(50) = NULL,
    @email NVARCHAR(100) = NULL,
    @telefono NVARCHAR(20) = NULL
AS
BEGIN
    IF @accion = 'agregar'
    BEGIN
        INSERT INTO Clientes (Nombre, Email, Telefono) VALUES (@nombre, @email, @telefono);
    END
    ELSE IF @accion = 'borrar'
    BEGIN
        -- Eliminar registros relacionados en la tabla Ventas
        DELETE FROM Ventas WHERE ID_Cliente = @cliente_id;

        -- Eliminar el cliente
        DELETE FROM Clientes WHERE ID = @cliente_id;
    END
    ELSE IF @accion = 'modificar'
    BEGIN
        UPDATE Clientes SET 
            Nombre = @nombre,
            Email = @email,
            Telefono = @telefono
        WHERE ID = @cliente_id;
    END
    ELSE IF @accion = 'consultar'
    BEGIN
        SELECT * FROM Clientes;
    END
    ELSE
    BEGIN
        SELECT 'Acción no válida';
    END
END
---------------------------------------------
ALTER PROCEDURE [dbo].[GestionarVentas]
    @accion NVARCHAR(10),
    @venta_id INT = NULL,
    @agente_id INT = NULL,
    @cliente_id INT = NULL,
    @casa_id INT = NULL,
    @fecha DATE = NULL
AS
BEGIN
    IF @accion = 'agregar'
    BEGIN
        INSERT INTO Ventas (ID_Agente, ID_Cliente, ID_Casa, Fecha) 
        VALUES (@agente_id, @cliente_id, @casa_id, @fecha);
    END
    ELSE IF @accion = 'borrar'
    BEGIN
        DELETE FROM Ventas WHERE ID = @venta_id;
    END
    ELSE IF @accion = 'modificar'
    BEGIN
        UPDATE Ventas SET 
            ID_Agente = @agente_id,
            ID_Cliente = @cliente_id,
            ID_Casa = @casa_id,
            Fecha = @fecha
        WHERE ID = @venta_id;
    END
    ELSE IF @accion = 'consultar'
    BEGIN
        SELECT * FROM Ventas;
    END
    ELSE
    BEGIN
        SELECT 'Acción no válida';
    END
END