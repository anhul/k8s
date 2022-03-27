FROM nginx:alpine

ARG APP_VERSION
ENV APP_VERSION=${APP_VERSION}

COPY entrypoint.sh /
RUN chmod 755 /entrypoint.sh
COPY app-${APP_VERSION}/index.html /usr/share/nginx/html/

HEALTHCHECK --interval=30s --timeout=5s --retries=3 --start-period=5s \
  CMD curl -f http://localhost:80/index.html || exit 1

ENTRYPOINT ["/entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]