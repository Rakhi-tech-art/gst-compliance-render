@echo off
echo ========================================
echo   GST Compliance System - Railway Deploy
echo ========================================
echo.

echo 🚂 Preparing for Railway deployment...
echo.

REM Add Railway-specific files to git
echo 📁 Adding Railway configuration files...
git add railway.json
git add nixpacks.toml
git add railway_build.sh
git add RAILWAY_DEPLOYMENT.md
git add railway_env_vars.txt
git add deploy_railway.bat

REM Add all other changes
echo 📦 Adding all project files...
git add .

echo 💾 Committing changes...
git commit -m "Add Railway deployment configuration - %date% %time%"

echo.
echo ========================================
echo   🚂 RAILWAY DEPLOYMENT STEPS
echo ========================================
echo.
echo ✅ Files prepared and committed to git!
echo.
echo 📋 NEXT STEPS (Follow these in order):
echo.
echo 1️⃣ PUSH TO GITHUB:
echo    git remote add origin https://github.com/YOUR_USERNAME/gst-compliance-system.git
echo    git branch -M main
echo    git push -u origin main
echo.
echo 2️⃣ DEPLOY ON RAILWAY:
echo    - Go to https://railway.app
echo    - Login with GitHub
echo    - Click "New Project"
echo    - Select "Deploy from GitHub repo"
echo    - Choose your gst-compliance-system repository
echo.
echo 3️⃣ SET ENVIRONMENT VARIABLES:
echo    In Railway dashboard, go to Variables tab and add:
echo    SECRET_KEY = django-insecure-gst-compliance-railway-2025-deployment-secret-key
echo    DEBUG = False
echo    ALLOWED_HOSTS = *.railway.app
echo.
echo 4️⃣ YOUR APP WILL BE LIVE AT:
echo    https://your-project-name.up.railway.app
echo.
echo ========================================
echo   🎉 RAILWAY ADVANTAGES:
echo ========================================
echo ⚡ Faster deployments than Render
echo 🔥 No cold starts - always warm
echo 💰 Simple pricing - $5/month hobby plan
echo 🗄️ Built-in PostgreSQL database
echo 🔒 Automatic HTTPS and custom domains
echo 📊 Excellent monitoring and logs
echo.
echo ========================================
echo   📚 DOCUMENTATION:
echo ========================================
echo 📖 Read RAILWAY_DEPLOYMENT.md for detailed guide
echo 📋 Check railway_env_vars.txt for environment variables
echo 🔧 Railway auto-detects Django and configures everything!
echo.
echo 🚂 Ready for Railway deployment! 
echo.

pause
