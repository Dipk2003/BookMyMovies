# BookMyMovies 🎬

A console-based movie ticket booking system built with Java and MySQL. This application allows users to book movie tickets by selecting theaters, shows, and seats.

## Features ✨

- **City-based Theater Search**: Find theaters in your city
- **Movie Show Listings**: View available shows for movies in selected theaters
- **Seat Booking**: Book specific seats for shows
- **Real-time Availability**: Check seat availability before booking
- **Transaction Safety**: Database transactions ensure booking integrity
- **Booking Confirmation**: Get confirmation with seat details and total price

## Project Structure 📁

```
BookMyMovies/
├── src/
│   ├── config/
│   │   └── DataBaseConfig.java      # Database connection configuration
│   ├── entity/                      # Entity classes
│   │   ├── Movie.java              # Movie entity
│   │   ├── Theater.java            # Theater entity
│   │   ├── Show.java               # Show entity
│   │   ├── Seat.java               # Seat entity
│   │   ├── User.java               # User entity
│   │   └── Booking.java            # Booking entity
│   └── service/
│       ├── BookMyMovieApp.java     # Main application class
│       └── BookMyMovieSys.java     # Core booking system logic
├── .gitignore
├── BookMyMovies.iml
└── README.md
```

## Technologies Used 🛠️

- **Java**: Core programming language
- **MySQL**: Database for storing movies, theaters, shows, and bookings
- **JDBC**: Database connectivity
- **IntelliJ IDEA**: IDE configuration included

## Database Schema 🗄️

The application uses the following main tables:

- **movies**: Store movie information (id, title, genre, language, duration)
- **theaters**: Store theater information (id, name, city)
- **shows**: Store show information (id, movie_id, theater_id, timing, available_seats)
- **seats**: Store seat information (id, show_id, seat_number, is_booked)
- **bookings**: Store booking information (id, user_id, show_id, seats_booked, total_price)
- **users**: Store user information

## Prerequisites 📋

- Java 8 or higher
- MySQL Server
- MySQL Connector/J (included in project)
- IntelliJ IDEA (recommended)

## Installation & Setup 🚀

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/BookMyMovies.git
cd BookMyMovies
```

### 2. Database Setup
1. Install MySQL Server
2. Create a database named `bookmymovies`:
```sql
CREATE DATABASE bookmymovies;
USE bookmymovies;
```

3. Create the required tables:
```sql
-- Movies table
CREATE TABLE movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    lang VARCHAR(50),
    duration INT
);

-- Theaters table
CREATE TABLE theaters (
    theater_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL
);

-- Shows table
CREATE TABLE shows (
    show_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    theater_id INT,
    timing VARCHAR(50),
    available_seats INT,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (theater_id) REFERENCES theaters(theater_id)
);

-- Seats table
CREATE TABLE seat (
    seat_id INT PRIMARY KEY AUTO_INCREMENT,
    show_id INT,
    seat_number VARCHAR(10),
    is_booked BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (show_id) REFERENCES shows(show_id)
);

-- Users table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(20)
);

-- Bookings table
CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    show_id INT,
    seats_booked TEXT,
    total_price DECIMAL(10,2),
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (show_id) REFERENCES shows(show_id)
);
```

4. Insert sample data:
```sql
-- Sample movies
INSERT INTO movies (title, genre, lang, duration) VALUES
('Avengers: Endgame', 'Action', 'English', 180),
('Dangal', 'Drama', 'Hindi', 161),
('KGF Chapter 2', 'Action', 'Kannada', 168);

-- Sample theaters
INSERT INTO theaters (name, city) VALUES
('PVR Cinemas', 'Mumbai'),
('INOX', 'Delhi'),
('Cinepolis', 'Bangalore');

-- Sample shows
INSERT INTO shows (movie_id, theater_id, timing, available_seats) VALUES
(1, 1, '10:00 AM', 100),
(1, 1, '2:00 PM', 100),
(2, 2, '11:00 AM', 80);

-- Sample seats
INSERT INTO seat (show_id, seat_number, is_booked) VALUES
(1, 'A1', FALSE), (1, 'A2', FALSE), (1, 'A3', FALSE), (1, 'A4', FALSE),
(1, 'B1', FALSE), (1, 'B2', FALSE), (1, 'B3', FALSE), (1, 'B4', FALSE);

-- Sample user
INSERT INTO users (name, email, phone) VALUES
('John Doe', 'john@example.com', '9876543210');
```

### 3. Configure Database Connection
Update the database credentials in `src/config/DataBaseConfig.java`:
```java
static String url = "jdbc:mysql://localhost:3306/bookmymovies";
static String username = "your_username";
static String password = "your_password";
```

### 4. Add MySQL Connector
- Download MySQL Connector/J from [MySQL website](https://dev.mysql.com/downloads/connector/j/)
- Add the JAR file to your project's classpath

## Usage 💻

### Running the Application
1. Open the project in IntelliJ IDEA
2. Run the `BookMyMovieApp.java` file
3. Follow the console prompts:
   - Enter your city
   - Select theater and movie
   - Choose show and seats
   - Confirm booking

### Example Flow
```
Enter city:
Mumbai

Theaters in Mumbai:
1. PVR Cinemas

Enter Theater Id and Movie Id:
1 1

Available Shows
1. 10:00 AM - Seats Available: 100
2. 2:00 PM - Seats Available: 100

Enter show Id and Number of seats
1

Booking Successful, Seats: [A3, A4] | Total Price: 400.0
```

## Features in Detail 🔍

### 1. Theater Display
- Shows all theaters in a specified city
- Displays theater ID and name for selection

### 2. Show Listings
- Lists available shows for a specific movie and theater
- Shows timing and available seat count

### 3. Seat Booking
- Books specified seats for a show
- Checks seat availability before booking
- Updates seat status and creates booking record
- Calculates total price (₹200 per seat)

### 4. Transaction Management
- Uses database transactions for booking integrity
- Rollback functionality for failed bookings
- Prevents double booking of seats

## Hosting Options 🌐

### 1. Local Development
- Run directly in IntelliJ IDEA
- Use local MySQL server
- Perfect for development and testing

### 2. Cloud Deployment

#### Option A: Convert to Web Application
1. **Spring Boot**: Convert to REST API
2. **Frontend**: Add React/Angular frontend
3. **Deploy to**:
   - Heroku (Free tier available)
   - AWS EC2
   - Google Cloud Platform
   - Azure App Service

#### Option B: Desktop Application
1. **Package as JAR**: Create executable JAR
2. **JavaFX**: Add GUI interface
3. **Distribute**: Share JAR file with users

### 3. Database Hosting
- **Local**: MySQL on your machine
- **Cloud**: 
  - AWS RDS
  - Google Cloud SQL
  - Azure Database for MySQL
  - PlanetScale (MySQL-compatible)

## Quick Hosting Steps 🚀

### For GitHub Pages (Static hosting):
1. Convert to a web application first
2. Build static files
3. Push to GitHub
4. Enable GitHub Pages

### For Heroku (Free web hosting):
1. Convert to Spring Boot web app
2. Add `Procfile`: `web: java -jar target/bookmymovies.jar`
3. Connect to Heroku Postgres
4. Deploy via Git

### For Local Network Sharing:
1. Package as executable JAR
2. Run on local server
3. Share via IP address

## Contributing 🤝

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Future Enhancements 🚀

- [ ] Web-based UI using Spring Boot
- [ ] User authentication and profiles
- [ ] Payment integration
- [ ] Email notifications
- [ ] Movie reviews and ratings
- [ ] Show time filtering
- [ ] Seat map visualization
- [ ] Booking history
- [ ] Admin panel for managing movies/theaters

## License 📄

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact 📧

Your Name - your.email@example.com

Project Link: [https://github.com/dipk2003/BookMyMovies](https://github.com/dipk2003/BookMyMovies)

---

## Troubleshooting 🔧

### Common Issues

1. **Database Connection Error**
   - Check MySQL server is running
   - Verify database credentials in `DataBaseConfig.java`
   - Ensure MySQL Connector JAR is in classpath

2. **Table Not Found Error**
   - Run the database setup SQL scripts
   - Verify table names match the code

3. **Booking Fails**
   - Check if seats are already booked
   - Verify show and seat IDs exist in database

### Support
For issues and questions, please open an issue in the GitHub repository.
