-- Data Cleaning

-- Checking data
	-- Checking carreras
		SELECT * FROM carreras;
        -- Revisar si esta bien relacionado el id_circuito de carreras con el de circuitos
        SELECT ca.id_circuito,ca.nombre_gran_premio, ci.id_circuito, ci.pais FROM carreras ca
        JOIN circuitos ci 
        ON ca.id_circuito = ci.id_circuito;
        
        -- Corregir
		UPDATE carreras
        SET nombre_gran_premio = 'Gran Premio de Estados Unidos' WHERE id_circuito = 6;
        -- Así con todos

	-- Checking circuitos
		SELECT * FROM circuitos;
	
    -- Checking equipos
		SELECT * FROM equipos;
        -- Corregir los nombres de los equipos
        SELECT nombre FROM equipos;
        
        SELECT nombre, TRIM(LEADING '_' FROM nombre) FROM equipos;
        UPDATE equipos
        SET nombre = TRIM(LEADING '_' FROM nombre);
        
        SELECT nombre, TRIM(TRAILING '.' FROM nombre) FROM equipos;
        UPDATE equipos
        SET nombre = TRIM(TRAILING '.' FROM nombre);
        
        SELECT nombre, TRIM(TRAILING '!' FROM nombre) FROM equipos;
        UPDATE equipos
        SET nombre = TRIM(TRAILING '!' FROM nombre);
        
        
    -- Checking pilotos
		SELECT * FROM pilotos;
			-- Completar los campos vacíos
			SELECT * FROM pilotos
            WHERE apellido = '';
            
            UPDATE pilotos
            SET apellido = 'Hamilton'
            WHERE apellido = '';
            
			-- Revisar si el id_equipo coincide con el de equipos
            SELECT p.nombre,p.apellido,p.id_equipo AS id_equipo_tabla_P,e.id_equipo AS id_equipo_tabla_E,e.nombre FROM pilotos p 
            JOIN equipos e 
            ON p.id_equipo = e.id_equipo;
            
            UPDATE pilotos
            SET id_equipo = 5 WHERE nombre = 'Jack';
            -- Así con todos
            
            -- Corregir según el 2025
            UPDATE pilotos
            SET id_equipo = 1 WHERE nombre = 'Lewis';
            
            UPDATE pilotos
            SET id_equipo = 3 WHERE nombre = 'Liam';
            
            INSERT INTO pilotos (nombre,apellido,nacionalidad,id_equipo,campeonatos_ganados)
            VALUES ('Yuki','Tsunoda','Japonés',7,0);
            
            INSERT INTO pilotos (nombre,apellido,nacionalidad,id_equipo,campeonatos_ganados)
            VALUES ('Isack ','Hadjar ','Francés',7,0);
            
            INSERT INTO pilotos (nombre,apellido,nacionalidad,id_equipo,campeonatos_ganados)
            VALUES ('Nico','Hülkenberg','Alemán',9,0);
            
            -- Checkear duplicado de Nico Hulkenberg
            SELECT * FROM pilotos
            WHERE nombre = 'Nico';
            DELETE FROM pilotos
            WHERE id_piloto = 24;
            
	
    -- Checking resultados
		SELECT * FROM resultados;

