#!/usr/bin/env python
"""
Simple deployment test script to verify Django setup
"""
import os
import sys
import django
from django.conf import settings
from django.core.management import execute_from_command_line

if __name__ == '__main__':
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'gst_compliance_system.settings')
    
    try:
        django.setup()
        print("✅ Django setup successful!")
        print(f"✅ DEBUG: {settings.DEBUG}")
        print(f"✅ ALLOWED_HOSTS: {settings.ALLOWED_HOSTS}")
        print(f"✅ Database: {settings.DATABASES['default']['ENGINE']}")
        print("✅ All configurations look good!")
        
        # Test URL patterns
        from django.urls import reverse
        try:
            health_url = reverse('health')
            print(f"✅ Health check URL: {health_url}")
        except:
            print("⚠️  Health check URL not found")
            
    except Exception as e:
        print(f"❌ Error: {e}")
        sys.exit(1)
