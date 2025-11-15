-- tfi_p2_schema_data_corrected.sql
DROP DATABASE IF EXISTS tfi_prog2;
CREATE DATABASE IF NOT EXISTS tfi_prog2
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
USE tfi_prog2;

-- Tabla padre: usuario
CREATE TABLE IF NOT EXISTS usuario (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    eliminado BOOLEAN NOT NULL DEFAULT FALSE,
    username VARCHAR(30) NOT NULL UNIQUE,
    email VARCHAR(120) NOT NULL UNIQUE,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_registro DATETIME NOT NULL
);

CREATE TABLE IF NOT EXISTS credencial_acceso (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    eliminado BOOLEAN NOT NULL DEFAULT FALSE,
    hash_password VARCHAR(255) NOT NULL,
    salt VARCHAR(64),
    ultimo_cambio DATETIME,
    requiere_reset BOOLEAN NOT NULL DEFAULT FALSE,
    id_usuario BIGINT UNIQUE, 
    CONSTRAINT fk_credencial_usuario FOREIGN KEY (id_usuario)
      REFERENCES usuario(id) ON DELETE CASCADE
);

-- Datos de prueba: usuarios
INSERT INTO usuario (eliminado, username, email, activo, fecha_registro)
VALUES
(FALSE, 'juanp', 'juan.perez@example.com', TRUE, NOW()),
(FALSE, 'marial', 'maria.lopez@example.com', TRUE, NOW());

-- Datos de prueba: credenciales (inserción con id_usuario NULL, luego actualizaré uno)
INSERT INTO credencial_acceso (eliminado, hash_password, salt, ultimo_cambio, requiere_reset, id_usuario)
VALUES
(FALSE, 'HASH_FALSO_1', 'salt1', NOW(), FALSE, NULL),
(FALSE, 'HASH_FALSO_2', 'salt2', NOW(), FALSE, NULL);

-- Asignar credenciales a usuarios (simula el paso posterior del Service)
UPDATE credencial_acceso SET id_usuario = 1 WHERE id = 1;
UPDATE credencial_acceso SET id_usuario = 2 WHERE id = 2;

-- Comprobaciones
SELECT * FROM usuario;
SELECT * FROM credencial_acceso;
SELECT u.id AS usuario_id, u.username, u.email, ca.hash_password, ca.salt, ca.ultimo_cambio, ca.requiere_reset
FROM usuario u
JOIN credencial_acceso ca ON ca.id_usuario = u.id;