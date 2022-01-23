USE youtunes;
DROP USER IF EXISTS 'youtunes_user'@'localhost';

CREATE USER 'youtunes_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';

GRANT ALL PRIVILEGES ON youtunes.* TO'youtunes_user'@'localhost';

DROP DATABASE IF EXISTS youtunes;
CREATE DATABASE youtunes;
USE youtunes;

DROP TABLE IF EXISTS artist; 
DROP TABLE IF EXISTS album; 

CREATE TABLE artist (
	artist_id 		INT 			NOT NULL		AUTO_INCREMENT,
	last_name		VARCHAR(75)		NOT NULL,
	first_name		VARCHAR(75)		NOT NULL,
	PRIMARY KEY(artist_id)
);

CREATE TABLE album (
	album_id		INT 			NOT NULL 		AUTO_INCREMENT,
	title			VARCHAR(150)	NOT NULL,
	price			DECIMAL(5, 2)	NOT NULL,
	genre			VARCHAR(75)		NOT NULL,
	img_url			VARCHAR(150)	NOT NULL,
	artist_id		INT				NOT NULL,
	PRIMARY KEY(album_id),
	CONSTRAINT fk_artist
	FOREIGN KEY(artist_id)
		REFERENCES artist(artist_id)
); 

INSERT INTO artist(last_name, first_name)
	VALUES('Perry', 'Katy');

INSERT INTO artist(last_name, first_name)
	VALUES('Gaga', 'Lady');
	
INSERT INTO artist(last_name, first_name)
	VALUES('Keys', 'Alicia');
	
INSERT INTO artist(last_name, first_name)
	VALUES('Trainor', 'Meghan');
	
INSERT INTO artist(last_name, first_name)
	VALUES('Lewis', 'Leona');
	
INSERT INTO artist(last_name, first_name)
	VALUES('Swift', 'Taylor');




INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES('Teenage Dream', 19.99, 'Pop', '../images/katyPerryAlbumCover.jpg', (SELECT artist_id FROM artist WHERE last_name = 'Perry'));
	
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES('The Fame', 21.99, 'Pop', '../images/ladyGagaAlbumCover.jpg', (SELECT artist_id FROM artist WHERE last_name = 'Gaga'));
	
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES('As I Am', 20.99, 'Pop', '../images/aliciaKeyAlbumCover.jpg', (SELECT artist_id FROM artist WHERE last_name = 'Keys'));
	
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES('Title', 18.99, 'Pop', '../images/meghanTrainorAlbumCover.jpg', (SELECT artist_id FROM artist WHERE last_name = 'Trainor'));
	
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES('Spirit', 22.99, 'Pop', '../images/LeonaLewisAlbumCover.jpg', (SELECT artist_id FROM artist WHERE last_name = 'Lewis'));
	
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES('1989', 23.99, 'Pop', '../images/taylorSwiftAlbumCover.jpg', (SELECT artist_id FROM artist WHERE last_name = 'Swift'));
	
	
	
	
	
	