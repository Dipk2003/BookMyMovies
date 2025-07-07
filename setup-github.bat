@echo off
echo Setting up GitHub repository for BookMyMovies...
echo.

REM Initialize git repository
git init

REM Add all files
git add .

REM Create initial commit
git commit -m "Initial commit: BookMyMovies console application"

echo.
echo Repository initialized! Next steps:
echo 1. Create a new repository on GitHub
echo 2. Copy the repository URL
echo 3. Run: git remote add origin YOUR_REPOSITORY_URL
echo 4. Run: git push -u origin main
echo.
pause
