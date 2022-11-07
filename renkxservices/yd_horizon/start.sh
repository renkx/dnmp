#!/usr/bin/env sh

set -e

cd /www/wwwroot

echo
echo "start time：`date '+%Y-%m-%d %H:%M:%S'`"

open_test=${OPEN_TEST}

max_processes=${MAX_PROCESSES:-10}

echo 'cache initialize ...'
#php artisan config:cache
#php artisan view:cache
#php artisan route:cache
#php artisan event:cache

if [[ "$open_test" = "true" ]]; then
    exec /usr/local/bin/php /www/wwwroot/artisan horizon --test --maxProcesses=$max_processes
else
    exec /usr/local/bin/php /www/wwwroot/artisan horizon
fi



