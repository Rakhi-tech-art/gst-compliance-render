#!/usr/bin/env bash
# Railway build script for GST Compliance System

echo "🚀 Starting Railway build process..."

# Install dependencies
echo "📦 Installing Python dependencies..."
pip install -r requirements.txt

# Create necessary directories
echo "📁 Creating directories..."
mkdir -p staticfiles
mkdir -p media
mkdir -p logs

# Collect static files
echo "🎨 Collecting static files..."
python manage.py collectstatic --noinput

# Run database migrations
echo "🗄️ Running database migrations..."
python manage.py migrate

# Create default email templates (ignore if command doesn't exist)
echo "📧 Creating default email templates..."
python manage.py create_default_templates || echo "Templates command not available, skipping..."

echo "✅ Railway build completed successfully!"
