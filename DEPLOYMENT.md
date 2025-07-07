# BookMyMovies Deployment Guide 🚀

This guide provides step-by-step instructions for hosting your BookMyMovies application in different ways.

## Quick Start Options

### Option 1: Local JAR Distribution (Easiest)

1. **Build the JAR file:**
   ```bash
   # Run the build script
   build.bat
   ```

2. **Share your application:**
   - Copy the `dist` folder and `lib` folder to any computer
   - Run `run.bat` or use: `java -cp "dist/BookMyMovies.jar;lib/*" service.BookMyMovieApp`

### Option 2: GitHub Repository

1. **Initialize repository:**
   ```bash
   # Run the setup script
   setup-github.bat
   ```

2. **Create GitHub repository:**
   - Go to [GitHub](https://github.com) and create a new repository
   - Name it `BookMyMovies`
   - Don't initialize with README (you already have one)

3. **Push to GitHub:**
   ```bash
   git remote add origin https://github.com/yourusername/BookMyMovies.git
   git branch -M main
   git push -u origin main
   ```

## Web Hosting Options

### Option 3: Convert to Spring Boot Web App

#### Step 1: Add Spring Boot Dependencies
Create `pom.xml`:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 
         http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.example</groupId>
    <artifactId>bookmymovies</artifactId>
    <version>1.0.0</version>
    <packaging>jar</packaging>

    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.7.0</version>
        <relativePath/>
    </parent>

    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-jpa</artifactId>
        </dependency>
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
        </plugins>
    </build>
</project>
```

#### Step 2: Create REST Controllers
```java
@RestController
@RequestMapping("/api")
public class BookingController {
    
    @Autowired
    private BookMyMovieSys bookingService;
    
    @GetMapping("/theaters")
    public List<Theater> getTheaters(@RequestParam String city) {
        return bookingService.getTheatersByCity(city);
    }
    
    @GetMapping("/shows")
    public List<Show> getShows(@RequestParam int movieId, @RequestParam int theaterId) {
        return bookingService.getShows(movieId, theaterId);
    }
    
    @PostMapping("/book")
    public BookingResponse bookTickets(@RequestBody BookingRequest request) {
        return bookingService.bookTicket(request);
    }
}
```

#### Step 3: Deploy to Heroku
1. **Install Heroku CLI**
2. **Create Heroku app:**
   ```bash
   heroku create bookmymovies-app
   ```
3. **Add database:**
   ```bash
   heroku addons:create cleardb:ignite
   ```
4. **Deploy:**
   ```bash
   git push heroku main
   ```

### Option 4: Deploy to Railway (Free hosting)

1. **Go to [Railway](https://railway.app)**
2. **Connect your GitHub repository**
3. **Add MySQL database service**
4. **Deploy automatically**

### Option 5: Deploy to Render (Free hosting)

1. **Go to [Render](https://render.com)**
2. **Connect GitHub repository**
3. **Choose "Web Service"**
4. **Add environment variables for database**

## Database Hosting Options

### Free Database Options:

1. **PlanetScale (Free tier)**
   - MySQL-compatible
   - Easy setup
   - Good for development

2. **Aiven (Free tier)**
   - Various database options
   - Good performance

3. **Railway PostgreSQL**
   - Free with GitHub account
   - Easy integration

### Paid Database Options:

1. **AWS RDS**
   - Reliable and scalable
   - Pay-as-you-use

2. **Google Cloud SQL**
   - Managed MySQL
   - Good integration with GCP

## Frontend Options (For Web Version)

### Option 1: Simple HTML/CSS/JavaScript
- Create basic forms for booking
- Use fetch API to call backend
- Host on GitHub Pages or Netlify

### Option 2: React Application
```bash
npx create-react-app bookmymovies-frontend
cd bookmymovies-frontend
npm install axios
```

### Option 3: Vue.js Application
```bash
npm create vue@latest bookmymovies-frontend
cd bookmymovies-frontend
npm install axios
```

## Mobile App Options

### Option 1: React Native
- Reuse web frontend code
- Deploy to App Store/Play Store

### Option 2: Flutter
- Cross-platform mobile app
- Good performance

## Monitoring and Analytics

### Free Monitoring:
1. **Heroku Metrics** (if using Heroku)
2. **Google Analytics** (for web version)
3. **Railway Analytics** (if using Railway)

### Paid Monitoring:
1. **New Relic**
2. **DataDog**
3. **Sentry** (for error tracking)

## Security Considerations

1. **Environment Variables:**
   - Never commit database passwords
   - Use environment variables for secrets

2. **HTTPS:**
   - Always use HTTPS in production
   - Most platforms provide this automatically

3. **Input Validation:**
   - Validate all user inputs
   - Prevent SQL injection

4. **Authentication:**
   - Add user authentication for production
   - Use JWT tokens or sessions

## Cost Estimates

### Free Tier (Monthly):
- **Database:** Free tier on PlanetScale or Railway
- **Hosting:** Free tier on Render or Railway
- **Domain:** Free subdomain
- **Total:** $0/month

### Paid Tier (Monthly):
- **Database:** $5-20/month
- **Hosting:** $7-25/month
- **Domain:** $10-15/year
- **Total:** $12-45/month

## Next Steps

1. **Choose your hosting option** based on your needs
2. **Set up database** (local or cloud)
3. **Deploy your application**
4. **Test thoroughly**
5. **Monitor and maintain**

## Support

For deployment issues:
1. Check platform documentation
2. Search Stack Overflow
3. Ask in platform Discord/Slack channels
4. Create issues in your GitHub repository

---

**Note:** Start with the simple JAR distribution for testing, then move to web hosting for broader access.
