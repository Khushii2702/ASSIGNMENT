#1.
CREATE TABLE Playlist (
    id INT PRIMARY KEY,
    song_name VARCHAR(100),
    artist VARCHAR(100),
    duration INT
);
INSERT INTO Playlist (id, song_name, artist, duration)
VALUES (1, 'Kesariya', 'Arijit Singh', 268);
#2.
INSERT INTO Playlist (id, song_name, artist, duration)
VALUES
(2, 'Brown Munde', 'AP Dhillon', 245),
(3, 'Blinding Lights', 'The Weeknd', 200),
(4, 'Perfect', 'Ed Sheeran', 263);
#3.
SET SQL_SAFE_UPDATES = 0;

UPDATE Playlist
SET artist = 'Arijit Singh'
WHERE artist = 'Arjit Singh';

SET SQL_SAFE_UPDATES = 1;
#4
SET SQL_SAFE_UPDATES = 0;

DELETE FROM Playlist
WHERE duration < 120;

SET SQL_SAFE_UPDATES = 1;
#5
SET SQL_SAFE_UPDATES = 0;

UPDATE Playlist
SET song_name = CONCAT(song_name, ' (Remix)')
WHERE artist = 'AP Dhillon'
  AND duration > 180;

SET SQL_SAFE_UPDATES = 1;