CREATE DATABASE IF NOT EXISTS afrostay;
USE afrostay;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    mot_de_passe VARCHAR(255),
    role ENUM('locataire','proprietaire') DEFAULT 'locataire',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE logements (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(255),
    description TEXT,
    prix DECIMAL(10,2),
    ville VARCHAR(100),
    quartier VARCHAR(100),
    image VARCHAR(255),
    user_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE reservations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    logement_id INT,
    date_debut DATE,
    date_fin DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (logement_id) REFERENCES logements(id)
);
CREATE TABLE avis (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    logement_id INT,
    note INT CHECK (note BETWEEN 1 AND 5),
    commentaire TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (logement_id) REFERENCES logements(id)
);
CREATE TABLE favoris (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    logement_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (logement_id) REFERENCES logements(id)  
);  
          