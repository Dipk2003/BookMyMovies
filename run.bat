@echo off
echo Starting BookMyMovies Application...
echo.
echo Make sure MySQL server is running and database is configured!
echo.
java -cp "dist/BookMyMovies.jar;lib/*" service.BookMyMovieApp
pause
