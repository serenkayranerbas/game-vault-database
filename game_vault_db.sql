

-- BÖLÜM 1: TABLO OLUŞTURMA--

CREATE TABLE developers (
    id SERIAL PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    founded_year INT
);
CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    price DECIMAL(6,2),
    release_date DATE,
    rating DECIMAL(3,1),
    developer_id INT,

    CONSTRAINT fk_developer
        FOREIGN KEY (developer_id)
        REFERENCES developers(id)
        ON DELETE CASCADE
);
CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT
);
CREATE TABLE games_genres (
    id SERIAL PRIMARY KEY,
    game_id INT NOT NULL,
    genre_id INT NOT NULL,

    CONSTRAINT fk_game
        FOREIGN KEY (game_id)
        REFERENCES games(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_genre
        FOREIGN KEY (genre_id)
        REFERENCES genres(id)
        ON DELETE CASCADE
);

-- BÖLÜM 2: VERİ EKLEME---

INSERT INTO developers (company_name, country, founded_year) VALUES
('CD Projekt Red', 'Poland', 2002),
('Rockstar Games', 'USA', 1998),
('Bethesda', 'USA', 1986),
('Valve', 'USA', 1996),
('EA Sports', 'USA', 1991);



INSERT INTO genres (name) VALUES
('RPG'),
('Open World'),
('Horror'),
('FPS'),
('Sports');





INSERT INTO games (title, price, release_date, rating, developer_id) VALUES
('The Witcher 3', 799.99, '2015-05-19', 9.5, 1),
('Cyberpunk 2077', 699.99, '2020-12-10', 8.5, 1),
('GTA V', 899.99, '2013-09-17', 9.7, 2),
('Red Dead Redemption 2', 999.99, '2018-10-26', 9.8, 2),
('Skyrim', 499.99, '2011-11-11', 9.2, 3),
('DOOM Eternal', 599.99, '2020-03-20', 9.0, 3),
('Half-Life 2', 299.99, '2004-11-16', 9.6, 4),
('Counter-Strike 2', 0.00, '2023-09-27', 8.8, 4),
('FIFA 23', 799.99, '2022-09-30', 8.0, 5),
('EA Sports FC 24', 899.99, '2023-09-29', 8.2, 5);



INSERT INTO games_genres (game_id, genre_id) VALUES
(1, 1), (1, 2),      -- The Witcher 3 → RPG, Open World
(2, 1),              -- Cyberpunk → RPG
(3, 2),              -- GTA V → Open World
(4, 2),              -- RDR2 → Open World
(5, 1),              -- Skyrim → RPG
(6, 4),              -- DOOM → FPS
(7, 4),              -- Half-Life 2 → FPS
(8, 4),              -- CS2 → FPS
(9, 5),              -- FIFA → Sports
(10, 5);             -- FC24 → Sports




-- BÖLÜM 3: UPDATE / DELETE--

-- İndirim Zamanı: Tüm oyunlara %10 indirim
UPDATE games
SET price = price * 0.90;

--Hata Düzeltme: Bir oyunun puanını güncelle (Cyberpunk 2077)
UPDATE games
SET rating = 9.0
WHERE title = 'Cyberpunk 2077';

--Kaldırma: Bir oyunu tamamen sil (FIFA 23)
DELETE FROM games
WHERE title = 'FIFA 23';


-- BÖLÜM 4: SELECT & JOIN---


-- SORU 1: Tüm oyunların adı, fiyatı ve geliştirici firma adı
SELECT 
    g.title,
    g.price,
    d.company_name
FROM games g
JOIN developers d ON g.developer_id = d.id;


-- SORU 2: Sadece RPG türündeki oyunların adı ve puanı

SELECT * FROM genres;
SELECT name FROM genres;
SELECT * FROM games_genres;


SELECT 
    g.title,
    g.rating
FROM games g
JOIN games_genres gg ON g.id = gg.game_id
JOIN genres ge ON gg.genre_id = ge.id
WHERE ge.name = 'RPG';


-- SORU 3: Fiyatı 500 TL üzerinde olan oyunları pahalıdan ucuza sıralama
SELECT 
    title,
    price
FROM games
WHERE price > 500
ORDER BY price DESC;



-- SORU 4: Adında "War" kelimesi geçen oyunları bulma
SELECT 
    title
FROM games
WHERE title LIKE '%War%';

