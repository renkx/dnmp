#!/usr/bin/env sh

set -e

cd /www/wwwroot

echo
echo "start time：`date '+%Y-%m-%d %H:%M:%S'`"

http_workers=${HTTP_WORKERS:-4}

task_workers=${TASK_WORKERS:-4}

http_port=${HTTP_PORT:-9000}

echo 'cache initialize ...'
#php artisan config:cache
#php artisan view:cache
#php artisan route:cache
#php artisan event:cache

#exec php-fpm
exec /usr/local/bin/php /www/wwwroot/artisan octane:start --host=0.0.0.0 --port=$http_port --workers=$http_workers --task-workers=$task_workers

