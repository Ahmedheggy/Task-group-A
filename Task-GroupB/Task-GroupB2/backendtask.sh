APP_DIR="/var/www/html"
cd $APP_DIR

# 1. Pull the new changes
echo "a. Pulling latest changes from main..."
git pull origin main

# 2. Install Dependencies 
echo "Installing/Updating Composer dependencies..."
sudo composer install --no-dev --optimize-autoloader --no-interaction

# 3. Generate App Key (CRUCIAL if you copied .env.example)
# This command generates the APP_KEY required by Laravel
echo "Generating application key..."
php artisan key:generate

# 4. Clear Configuration Cache (CRITICAL to load new .env settings)
echo "Clearing application cache..."
php artisan config:clear

# 5. Run Migrations
echo "b. Running database migrations..."
php artisan migrate --force

# 6. Optimize Caches 
echo "Optimizing application..."
php artisan optimize:clear

echo "--- Deployment Successful ---"
"deploy_laravel.sh" 34L, 868B    