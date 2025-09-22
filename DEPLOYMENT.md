# GST Compliance System - Render Deployment Guide

## Prerequisites
1. GitHub account
2. Render account (free tier available)
3. Git installed on your local machine

## Deployment Steps

### 1. Push Code to GitHub
```bash
# Initialize git repository (if not already done)
git init

# Add all files
git add .

# Commit changes
git commit -m "Initial commit - GST Compliance System"

# Add GitHub remote (replace with your repository URL)
git remote add origin https://github.com/yourusername/gst-compliance-system.git

# Push to GitHub
git push -u origin main
```

### 2. Deploy on Render

#### Option A: Using render.yaml (Recommended)
1. Go to [Render Dashboard](https://dashboard.render.com/)
2. Click "New" → "Blueprint"
3. Connect your GitHub repository
4. Render will automatically detect the `render.yaml` file
5. Click "Apply" to deploy all services

#### Option B: Manual Setup
1. **Create Web Service:**
   - Go to Render Dashboard
   - Click "New" → "Web Service"
   - Connect your GitHub repository
   - Configure:
     - **Name:** gst-compliance-system
     - **Environment:** Python 3
     - **Build Command:** `./build.sh`
     - **Start Command:** `gunicorn gst_compliance_system.wsgi:application`

2. **Create PostgreSQL Database:**
   - Click "New" → "PostgreSQL"
   - **Name:** gst-compliance-db
   - **Database Name:** gst_compliance_system
   - **User:** gst_user

3. **Create Redis Instance:**
   - Click "New" → "Redis"
   - **Name:** gst-compliance-redis

4. **Set Environment Variables:**
   - In your web service settings, add:
     - `SECRET_KEY`: Generate a secure key
     - `DEBUG`: False
     - `ALLOWED_HOSTS`: .onrender.com
     - `DATABASE_URL`: Copy from PostgreSQL service
     - `REDIS_URL`: Copy from Redis service

### 3. Environment Variables
Set these in your Render web service:

```
SECRET_KEY=your-generated-secret-key
DEBUG=False
ALLOWED_HOSTS=.onrender.com
DATABASE_URL=postgresql://user:password@host:port/database
REDIS_URL=redis://host:port
```

### 4. Custom Domain (Optional)
1. In your web service settings
2. Go to "Settings" → "Custom Domains"
3. Add your domain name
4. Configure DNS records as instructed

## Features Available After Deployment

✅ **Web Application:** Fully functional GST compliance system
✅ **Database:** PostgreSQL for production data
✅ **Static Files:** Served via WhiteNoise
✅ **Background Tasks:** Celery with Redis
✅ **Security:** Production-ready settings
✅ **SSL:** Automatic HTTPS on Render

## Post-Deployment Setup

1. **Create Superuser:**
   - Go to your web service shell in Render
   - Run: `python manage.py createsuperuser`

2. **Access Admin Panel:**
   - Visit: `https://your-app.onrender.com/admin/`

3. **Test Application:**
   - Visit: `https://your-app.onrender.com/`

## Monitoring and Logs

- **Application Logs:** Available in Render dashboard
- **Database Monitoring:** PostgreSQL metrics in Render
- **Performance:** Monitor response times and errors

## Scaling

- **Web Service:** Upgrade to paid plan for auto-scaling
- **Database:** Upgrade for more storage and connections
- **Redis:** Upgrade for more memory

## Troubleshooting

### Common Issues:
1. **Build Fails:** Check `build.sh` permissions and dependencies
2. **Database Connection:** Verify DATABASE_URL format
3. **Static Files:** Ensure WhiteNoise is configured correctly
4. **Environment Variables:** Double-check all required variables

### Support:
- Check Render documentation
- Review application logs
- Verify environment variables
- Test database connectivity

## Cost Estimation

**Free Tier:**
- Web Service: 750 hours/month (free)
- PostgreSQL: 1GB storage (free)
- Redis: 25MB memory (free)

**Paid Plans:**
- Web Service: $7/month (starter)
- PostgreSQL: $7/month (starter)
- Redis: $7/month (starter)

## Security Notes

- All sensitive data is encrypted
- HTTPS enforced in production
- Database credentials secured
- Environment variables protected
- CSRF protection enabled

Your GST Compliance System will be live at: `https://your-app-name.onrender.com`
