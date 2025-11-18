-- ============================================
-- DATI DI ESEMPIO (SEED DATA)
-- Dati per testare l'applicazione
-- ============================================

USE photogallery;

-- ============================================
-- UTENTI DI ESEMPIO
-- Password: "password123" hashata con bcrypt
-- ============================================
INSERT INTO users (username, email, password, first_name, last_name, bio, profile_image) VALUES
('mario_rossi', 'mario.rossi@email.com', '$2b$10$abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGH', 'Mario', 'Rossi', 'Fotografo di paesaggi', 'https://via.placeholder.com/150'),
('giulia_bianchi', 'giulia.bianchi@email.com', '$2b$10$abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGH', 'Giulia', 'Bianchi', 'Appassionata di fotografia urbana', 'https://via.placeholder.com/150'),
('luca_verdi', 'luca.verdi@email.com', '$2b$10$abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGH', 'Luca', 'Verdi', 'Fotografo professionista', 'https://via.placeholder.com/150'),
('sara_neri', 'sara.neri@email.com', '$2b$10$abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGH', 'Sara', 'Neri', 'Amante della natura', 'https://via.placeholder.com/150');

-- ============================================
-- ALBUM DI ESEMPIO
-- ============================================
INSERT INTO albums (name, description, user_id) VALUES
('Paesaggi Montani', 'Le mie migliori foto di montagna', 1),
('Vacanze 2024', 'Ricordi delle vacanze estive', 1),
('Street Photography', 'Momenti urbani catturati', 2),
('Portfolio Professionale', 'Lavori commissionati', 3),
('Natura Selvaggia', 'Flora e fauna', 4);

-- ============================================
-- IMMAGINI DI ESEMPIO
-- ============================================
INSERT INTO images (title, description, album_id, user_id, image_url, tags, views) VALUES
('Alba sulle Dolomiti', 'Scattata al rifugio', 1, 1, 'https://picsum.photos/800/600?random=10', '["montagna", "alba", "dolomiti"]', 150),
('Lago di montagna', 'Vista panoramica', 1, 1, 'https://picsum.photos/800/600?random=11', '["lago", "panorama"]', 89),
('Spiaggia al tramonto', 'Ultimo giorno di vacanza', 2, 1, 'https://picsum.photos/800/600?random=12', '["mare", "tramonto"]', 45),
('Graffiti urbano', 'Arte di strada', 3, 2, 'https://picsum.photos/800/600?random=13', '["street", "arte"]', 234),
('Mercato locale', 'Colori e sapori', 3, 2, 'https://picsum.photos/800/600?random=14', '["street", "persone"]', 167),
('Ritratto Corporate', 'CEO aziendale', 4, 3, 'https://picsum.photos/800/600?random=15', '["ritratto", "professionale"]', 456),
('Cervo nel bosco', 'Incontro fortunato', 5, 4, 'https://picsum.photos/800/600?random=16', '["natura", "animali"]', 789),
('Fiori selvatici', 'Prato in primavera', 5, 4, 'https://picsum.photos/800/600?random=17', '["natura", "fiori"]', 345);

-- Imposta cover images per gli album
UPDATE albums SET cover_image_id = 1 WHERE id = 1;
UPDATE albums SET cover_image_id = 4 WHERE id = 3;
UPDATE albums SET cover_image_id = 6 WHERE id = 4;
UPDATE albums SET cover_image_id = 7 WHERE id = 5;

-- ============================================
-- VERIFICA DATI INSERITI
-- ============================================

-- Conteggio per tabella
SELECT 'users' as tabella, COUNT(*) as record FROM users
UNION ALL
SELECT 'albums' as tabella, COUNT(*) as record FROM albums
UNION ALL
SELECT 'images' as tabella, COUNT(*) as record FROM images;

-- ============================================
-- QUERY DI ESEMPIO PER TESTARE
-- ============================================

-- Album con numero di immagini
SELECT 
    a.id,
    a.name,
    u.username as owner,
    COUNT(i.id) as num_images
FROM albums a
JOIN users u ON a.user_id = u.id
LEFT JOIN images i ON a.id = i.album_id
GROUP BY a.id;

-- Top 5 immagini più visualizzate
SELECT 
    i.title,
    u.username as photographer,
    a.name as album,
    i.views
FROM images i
JOIN users u ON i.user_id = u.id
JOIN albums a ON i.album_id = a.id
ORDER BY i.views DESC
LIMIT 5;
