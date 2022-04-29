#!/usr/bin/env sh

set -e

cd /www/wwwroot

echo
echo "start time：`date '+%Y-%m-%d %H:%M:%S'`"

echo 'cache initialize ...'
php artisan config:cache
php artisan view:cache
php artisan route:cache
php artisan event:cache

exec /usr/local/bin/php /www/wwwroot/artisan horizon

