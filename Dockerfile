# Stage 1: Build (if needed, but here it's static)
FROM nginx:alpine

# Create non-root user for security
RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid /var/cache/nginx /var/log/nginx /etc/nginx/conf.d

# Copy static files
COPY . /usr/share/nginx/html

USER nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
