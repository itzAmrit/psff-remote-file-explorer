FROM nginx:alpine

RUN addgroup -g 1003 -S amrit \
    && adduser -S -D -H -u 1002 -G amrit amrit \
    && sed -i 's/^user .*/user amrit amrit;/' /etc/nginx/nginx.conf

COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/index.html
