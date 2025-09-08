
CREATE TABLE user (
    user_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE bookcase (
    bookcase_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    name VARCHAR(100) NOT NULL,            -- e.g., "Living Room Case"
    style VARCHAR(50) DEFAULT 'classic',   -- FUTURE: realistic/bookcase themes
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE
);


CREATE TABLE shelf (
    shelf_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    bookcase_id INT UNSIGNED NOT NULL,
    position TINYINT UNSIGNED NOT NULL,   -- order in bookcase (1 = top shelf)
    capacity SMALLINT UNSIGNED DEFAULT 10, -- FUTURE: optional size limit
    FOREIGN KEY (bookcase_id) REFERENCES bookcase(bookcase_id) ON DELETE CASCADE,
    UNIQUE (bookcase_id, position)        -- no two shelves in the same position
);


CREATE TABLE book (
    book_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    shelf_id INT UNSIGNED NULL,           -- NULL if "unshelved"
    isbn VARCHAR(20),                     -- edition-specific identifier
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    publisher VARCHAR(255),
    publication_year YEAR,
    width_mm DECIMAL(5,2) NULL,           -- FUTURE: for realistic sizes
    height_mm DECIMAL(5,2) NULL,          -- FUTURE: for realistic sizes
    thickness_mm DECIMAL(5,2) NULL,       -- FUTURE: for realistic sizes
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE,
    FOREIGN KEY (shelf_id) REFERENCES shelf(shelf_id) ON DELETE SET NULL
);


CREATE VIEW unshelved_books AS
SELECT * FROM book WHERE shelf_id IS NULL;
