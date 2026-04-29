# Stage 1: Build (if needed, but here it's static)
FROM nginx:alpine

# Create non-root user for security
RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid /var/cache/nginx /var/log/nginx /etc/nginx/conf.d

# Copy static files
COPY . /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER nginx
EXPOSE 8000
CMD ["nginx", "-g", "daemon off;"]
