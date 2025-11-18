-- =============================================
-- PhotoGallery Database Schema - VERSIONE LIGHT
-- Per migrazione da JSON a MySQL (Fase 2)
-- =============================================

-- Creazione Database
CREATE DATABASE IF NOT EXISTS photogallery_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE photogallery_db;

-- =============================================
-- TABELLE PRINCIPALI
-- =============================================

-- Tabella Users
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL COMMENT 'Hash bcrypt della password',
    fullName VARCHAR(100),
    bio TEXT,
    profileImage VARCHAR(255),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_username (username),
    INDEX idx_email (email)
) ENGINE=InnoDB;

-- Tabella Albums
CREATE TABLE albums (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    isPublic BOOLEAN DEFAULT TRUE COMMENT 'true = pubblico, false = privato',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    imagesCount INT DEFAULT 0 COMMENT 'Contatore denormalizzato per performance',
    FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_userId (userId),
    INDEX idx_isPublic (isPublic),
    INDEX idx_createdAt (createdAt)
) ENGINE=InnoDB;

-- Tabella Images
CREATE TABLE images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    albumId INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    path VARCHAR(255) NOT NULL COMMENT 'Path o URL dell immagine',
    tags JSON COMMENT 'Array di tags in formato JSON',
    views INT DEFAULT 0 COMMENT 'Contatore visualizzazioni',
    uploadDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (albumId) REFERENCES albums(id) ON DELETE CASCADE,
    INDEX idx_albumId (albumId),
    INDEX idx_uploadDate (uploadDate),
    INDEX idx_views (views),
    FULLTEXT idx_title_desc (title, description)
) ENGINE=InnoDB;

-- =============================================
-- TRIGGER PER CONTEGGI AUTOMATICI
-- =============================================

-- Trigger: Incrementa contatore immagini quando si aggiunge un'immagine
DELIMITER //
CREATE TRIGGER after_image_insert
AFTER INSERT ON images
FOR EACH ROW
BEGIN
    UPDATE albums 
    SET imagesCount = imagesCount + 1
    WHERE id = NEW.albumId;
END//
DELIMITER ;

-- Trigger: Decrementa contatore immagini quando si elimina un'immagine
DELIMITER //
CREATE TRIGGER after_image_delete
AFTER DELETE ON images
FOR EACH ROW
BEGIN
    UPDATE albums 
    SET imagesCount = imagesCount - 1
    WHERE id = OLD.albumId;
END//
DELIMITER ;

-- =============================================
-- VIEW UTILI
-- =============================================

-- View: Album con informazioni utente
CREATE VIEW albums_with_users AS
SELECT 
    a.id,
    a.name AS albumName,
    a.description AS albumDescription,
    a.isPublic,
    a.createdAt,
    a.imagesCount,
    u.id AS userId,
    u.username,
    u.fullName
FROM albums a
JOIN users u ON a.userId = u.id;

-- View: Immagini con informazioni album e utente
CREATE VIEW images_full_info AS
SELECT 
    i.id AS imageId,
    i.title AS imageTitle,
    i.description AS imageDescription,
    i.path AS imagePath,
    i.tags,
    i.views,
    i.uploadDate,
    a.id AS albumId,
    a.name AS albumName,
    a.isPublic AS albumIsPublic,
    u.id AS userId,
    u.username,
    u.fullName
FROM images i
JOIN albums a ON i.albumId = a.id
JOIN users u ON a.userId = u.id;

-- View: Statistiche utente
CREATE VIEW user_statistics AS
SELECT 
    u.id AS userId,
    u.username,
    COUNT(DISTINCT a.id) AS totalAlbums,
    COUNT(DISTINCT i.id) AS totalImages,
    COALESCE(SUM(i.views), 0) AS totalViews
FROM users u
LEFT JOIN albums a ON u.id = a.userId
LEFT JOIN images i ON a.id = i.albumId
GROUP BY u.id, u.username;

-- =============================================
-- STORED PROCEDURES UTILI
-- =============================================

-- Procedura: Ottieni album pubblici con paginazione
DELIMITER //
CREATE PROCEDURE GetPublicAlbums(
    IN page_number INT,
    IN page_size INT
)
BEGIN
    DECLARE offset_value INT;
    SET offset_value = (page_number - 1) * page_size;
    
    SELECT 
        a.*,
        u.username,
        u.fullName
    FROM albums a
    JOIN users u ON a.userId = u.id
    WHERE a.isPublic = TRUE
    ORDER BY a.createdAt DESC
    LIMIT page_size OFFSET offset_value;
END//
DELIMITER ;

-- Procedura: Ottieni statistiche complete album
DELIMITER //
CREATE PROCEDURE GetAlbumStats(IN album_id INT)
BEGIN
    SELECT 
        a.id,
        a.name,
        a.description,
        a.isPublic,
        a.createdAt,
        u.username AS owner,
        COUNT(i.id) AS imageCount,
        COALESCE(SUM(i.views), 0) AS totalViews,
        COALESCE(MAX(i.views), 0) AS maxViews,
        COALESCE(AVG(i.views), 0) AS avgViews
    FROM albums a
    JOIN users u ON a.userId = u.id
    LEFT JOIN images i ON a.id = i.albumId
    WHERE a.id = album_id
    GROUP BY a.id, a.name, a.description, a.isPublic, a.createdAt, u.username;
END//
DELIMITER ;

-- Procedura: Incrementa views immagine
DELIMITER //
CREATE PROCEDURE IncrementImageViews(IN image_id INT)
BEGIN
    UPDATE images 
    SET views = views + 1
    WHERE id = image_id;
    
    SELECT views FROM images WHERE id = image_id;
END//
DELIMITER ;

-- =============================================
-- INDICI AGGIUNTIVI PER PERFORMANCE
-- =============================================

-- Indice composito per ricerca album per utente
CREATE INDEX idx_user_albums ON albums(userId, createdAt DESC);

-- Indice composito per immagini recenti per album
CREATE INDEX idx_album_images ON images(albumId, uploadDate DESC);

-- =============================================
-- COMMENTI DOCUMENTAZIONE
-- =============================================

ALTER TABLE users COMMENT = 'Tabella utenti del sistema. Password hashate con bcrypt';
ALTER TABLE albums COMMENT = 'Album fotografici. isPublic determina visibilità';
ALTER TABLE images COMMENT = 'Metadati immagini. Path può essere URL o percorso locale';

-- =============================================
-- FINE SCHEMA
-- =============================================

-- Verifica creazione
SELECT 'Schema Light creato con successo!' AS Message;
SELECT COUNT(*) AS TotalTables FROM information_schema.tables 
WHERE table_schema = 'photogallery_db';
