@echo off
echo ========================================
echo   GST Compliance System - Render Deploy
echo ========================================
echo.

echo Step 1: Preparing files for deployment...
echo.

REM Check if git is initialized
if not exist .git (
    echo Initializing Git repository...
    git init
)

echo Adding all files to git...
git add .

echo Committing changes...
git commit -m "Deploy GST Compliance System to Render - %date% %time%"

echo.
echo ========================================
echo   NEXT STEPS (Manual):
echo ========================================
echo.
echo 1. Create GitHub Repository:
echo    - Go to https://github.com
echo    - Click "New Repository"
echo    - Name: gst-compliance-system
echo    - Make it Public
echo    - Click "Create Repository"
echo.
echo 2. Push to GitHub:
echo    git remote add origin https://github.com/YOUR_USERNAME/gst-compliance-system.git
echo    git branch -M main
echo    git push -u origin main
echo.
echo 3. Deploy on Render:
echo    - Go to https://dashboard.render.com
echo    - Click "New" - "Web Service"
echo    - Connect your GitHub repository
echo    - Use these settings:
echo      * Build Command: ./build.sh
echo      * Start Command: gunicorn gst_compliance_system.wsgi:application
echo      * Environment Variables:
echo        SECRET_KEY = django-insecure-your-secret-key-here
echo        DEBUG = False
echo        ALLOWED_HOSTS = *.onrender.com
echo.
echo 4. Your app will be live at:
echo    https://gst-compliance-system-XXXX.onrender.com
echo.
echo ========================================
echo   Files Ready for Deployment!
echo ========================================

pause
