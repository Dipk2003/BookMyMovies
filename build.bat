@echo off
echo Building BookMyMovies JAR...

REM Create directories
if not exist "build" mkdir build
if not exist "dist" mkdir dist

REM Compile Java files
echo Compiling Java files...
javac -d build -cp "lib/*" src/config/*.java src/entity/*.java src/service/*.java

REM Create JAR file
echo Creating JAR file...
jar cfe dist/BookMyMovies.jar service.BookMyMovieApp -C build .

echo Build complete! JAR file created at dist/BookMyMovies.jar
echo.
echo To run the application:
echo java -cp "dist/BookMyMovies.jar;lib/*" service.BookMyMovieApp
pause
