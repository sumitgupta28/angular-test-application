/\s*#/d
/listen/s%80%8080%
s/^user *nginx;//
s%^error_log /var/opt/rh/rh-nginx112/log/nginx/error.log;%error_log /dev/stderr;%
s%access_log  /var/opt/rh/rh-nginx112/log/nginx/access.log  main;%access_log /dev/stdout    main;%
s%/etc/opt/rh/rh-nginx112/nginx/conf.d/%/opt/app-root/etc/nginx.d/%
s%/etc/opt/rh/rh-nginx112/nginx/default.d/%/opt/app-root/etc/nginx.default.d/%
s%/opt/rh/rh-nginx112/root/usr/share/nginx/html%/opt/app-root/src%
/location \/ {/atry_files \$uri \$uri/ /index.html;
