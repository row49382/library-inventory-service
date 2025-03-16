-- Switch to the schema
USE `library-inventory`;

-- Create the Publisher table
CREATE TABLE IF NOT EXISTS `PUBLISHER` (
    `PUBLISHER_ID` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `NAME` VARCHAR(255) NOT NULL,
    `COUNTRY` VARCHAR(255) NOT NULL,
    `OPENING_DATE` DATE NOT NULL,
    `CLOSING_DATE` DATE
);

-- Create the Author table
CREATE TABLE IF NOT EXISTS `AUTHOR` (
    `AUTHOR_ID` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `FIRST_NAME` VARCHAR(255) NOT NULL,
    `LAST_NAME` VARCHAR(255) NOT NULL,
    `BIRTH_DATE` DATE NOT NULL,
    `DEATH_DATE` DATE
);

-- Create the Genre table (Enum values stored as strings)
CREATE TABLE IF NOT EXISTS `GENRE` (
    `GENRE_ID` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `NAME` VARCHAR(50) NOT NULL UNIQUE
);

-- Create the Book table
CREATE TABLE IF NOT EXISTS `BOOK` (
    `BOOK_ID` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `ISBN` VARCHAR(13) NOT NULL UNIQUE,
    `TITLE` VARCHAR(255) NOT NULL,
    `PUBLISHER_ID` BIGINT NOT NULL,
    `GENRE` VARCHAR(50) NOT NULL,
    `COST` DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (`PUBLISHER_ID`) REFERENCES `PUBLISHER`(`PUBLISHER_ID`)
);

-- Insert Publishers
INSERT INTO `PUBLISHER` (`NAME`, `COUNTRY`, `OPENING_DATE`, `CLOSING_DATE`) VALUES
('Penguin Random House', 'USA', '1927-01-01', NULL),
('HarperCollins', 'USA', '1989-01-01', NULL),
('Macmillan', 'USA', '1843-01-01', NULL),
('Hachette Book Group', 'France', '1837-01-01', NULL),
('Simon & Schuster', 'USA', '1924-01-01', NULL);

-- Insert Authors
INSERT INTO `AUTHOR` (`FIRST_NAME`, `LAST_NAME`, `BIRTH_DATE`, `DEATH_DATE`) VALUES
('John', 'Doe', '1980-05-10', NULL),
('Jane', 'Smith', '1975-09-23', NULL),
('George', 'Orwell', '1903-06-25', '1950-01-21'),
('J.K.', 'Rowling', '1965-07-31', NULL),
('Isaac', 'Asimov', '1920-01-02', '1992-04-06'),
('Margaret', 'Atwood', '1939-11-18', NULL),
('Neil', 'Gaiman', '1960-11-10', NULL),
('Stephen', 'King', '1947-09-21', NULL),
('Tolkien', 'J.R.R.', '1892-01-03', '1973-09-02'),
('F. Scott', 'Fitzgerald', '1896-09-24', '1940-12-21');

-- Insert Genres
INSERT INTO `GENRE` (`NAME`) VALUES
('FICTION'),
('NON_FICTION'),
('SCIENCE'),
('HISTORY'),
('FANTASY'),
('DRAMA'),
('MYSTERY'),
('THRILLER');

-- Insert Books
INSERT INTO `BOOK` (`ISBN`, `TITLE`, `PUBLISHER_ID`, `GENRE`, `COST`) VALUES
('9780451524935', '1984', 3, 'FICTION', 19.99),
('9780439708180', 'Harry Potter and the Sorcerer\'s Stone', 4, 'FANTASY', 29.99),
('9780547928227', 'The Hobbit', 5, 'FANTASY', 24.99),
('9780441013593', 'Dune', 3, 'SCIENCE', 22.99),
('9780385490818', 'The Handmaid\'s Tale', 2, 'FICTION', 18.99),
('9780743273565', 'The Great Gatsby', 1, 'FICTION', 15.99),
('9780062803192', 'Murder on the Orient Express', 2, 'MYSTERY', 12.99),
('9780553382563', 'Foundation', 3, 'SCIENCE', 19.99),
('9780307743657', 'The Shining', 4, 'THRILLER', 19.99),
('9780060853983', 'Good Omens', 5, 'FANTASY', 14.99);
