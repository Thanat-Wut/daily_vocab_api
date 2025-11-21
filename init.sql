CREATE TABLE IF NOT EXISTS words (
    id INT AUTO_INCREMENT PRIMARY KEY,
    word VARCHAR(100) NOT NULL UNIQUE,
    definition TEXT,
    difficulty_level ENUM('Beginner', 'Intermediate', 'Advanced') DEFAULT 'Beginner',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS practice_sessions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    word_id INT NOT NULL,
    user_sentence TEXT NOT NULL,
    score DECIMAL(3,1),
    feedback TEXT,
    corrected_sentence TEXT,
    practiced_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (word_id) REFERENCES words(id) ON DELETE CASCADE
);

-- Example data
INSERT INTO words (word, definition, difficulty_level) VALUES
('creative', 'Able to use imagination to make new things', 'Intermediate'),
('resilient', 'Able to recover quickly from difficulties', 'Advanced'),
('notebook', 'A small book used for writing notes', 'Beginner'),
('apple', 'A round fruit with red, green, or yellow skin', 'Beginner'),
('ambitious', 'Having a strong desire to succeed', 'Intermediate'),
('perseverance', 'Continued effort despite difficulties', 'Advanced'),
('library', 'A place where books are kept for reading', 'Beginner'),
('collaborate', 'To work together with others', 'Intermediate');

