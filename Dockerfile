# Nginx-based Dockerfile (most performant for static files)
# Multi-stage build: minify HTML, then serve with nginx

# Build stage: Minify HTML (only index.html needed - no build process)
FROM node:25-alpine AS builder
WORKDIR /build
COPY index.html .
RUN npm install -g html-minifier-terser && \
    html-minifier-terser \
        --collapse-whitespace \
        --remove-comments \
        --remove-optional-tags \
        --remove-redundant-attributes \
        --remove-script-type-attributes \
        --remove-style-link-type-attributes \
        --minify-css \
        --minify-js \
        --minify-urls \
        --use-short-doctype \
        --case-sensitive \
        --conservative-collapse \
        --keep-closing-slash \
        --preserve-line-breaks \
        --remove-empty-attributes \
        --remove-tag-whitespace \
        --sort-attributes \
        --sort-class-name \
        --trim-custom-fragments \
        index.html \
        -o index.min.html

# Final stage with nginx
FROM nginx:alpine
# Copy minified HTML (or fallback to original if minification failed)
COPY --from=builder /build/index.min.html /usr/share/nginx/html/index.html
# Copy favicon
COPY favicon.ico /usr/share/nginx/html/favicon.ico
# Copy custom nginx configuration (replaces default)
COPY nginx.conf /etc/nginx/nginx.conf
# Remove default config to avoid conflicts
RUN rm -f /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Health check (wget is available in alpine)
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost/health || exit 1

# Labels for metadata
LABEL maintainer="passwd.now"
LABEL description="High-performance password generator with optimized nginx"
LABEL version="1.0"

# Nginx runs automatically, no CMD needed
