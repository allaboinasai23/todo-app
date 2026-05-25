# Clear the host for cleaner output
Clear-Host

Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "          Todo App - Git Setup Helper" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan

# 1. Verify Git Installation
if (!(Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "[ERROR] Git is not installed or not in your PATH. Please install Git first!" -ForegroundColor Red
    Exit
}

# 2. Check if a git repository already exists in this folder
if (Test-Path .git) {
    Write-Host "[WARNING] A Git repository (.git) already exists in this folder." -ForegroundColor Yellow
    $ans = Read-Host "Do you want to re-initialize it? (y/n)"
    if ($ans -ne "y") {
        Write-Host "Setup aborted." -ForegroundColor Yellow
        Exit
    }
    Remove-Item -Recurse -Force .git
    Write-Host "Existing Git repository removed." -ForegroundColor Yellow
}

# 3. Initialize Git Repository
Write-Host "`nInitializing a brand-new Git repository..." -ForegroundColor Green
git init

# 4. Add all files
Write-Host "Staging files..." -ForegroundColor Green
git add .

# 5. Make initial commit
Write-Host "Creating initial commit..." -ForegroundColor Green
git commit -m "Initial commit: Standalone Todo App with deployment config"

# 6. Set main branch
git branch -M main

Write-Host "`n==================================================" -ForegroundColor Green
Write-Host "                 SETUP SUCCESSFUL!" -ForegroundColor Green
Write-Host "==================================================" -ForegroundColor Green
Write-Host "Your standalone Git repository has been created successfully!"
Write-Host ""
Write-Host "To push this project to a new repository on your GitHub:"
Write-Host "1. Go to https://github.com/new and create a new repository named 'todo-app'."
Write-Host "2. Leave all default options unchecked (do NOT add a README, .gitignore, or license)."
Write-Host "3. Copy the Git URL (e.g., https://github.com/YOUR_USERNAME/todo-app.git)."
Write-Host "4. Run these final commands in this folder's terminal:" -ForegroundColor Yellow
Write-Host "   git remote add origin YOUR_REPOSITORY_URL" -ForegroundColor Yellow
Write-Host "   git push -u origin main" -ForegroundColor Yellow
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "Press any key to exit..."
try {
    [void][System.Console]::ReadKey($true)
} catch {
    Start-Sleep -Seconds 2
}
