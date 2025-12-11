# Stage 1: Minification
FROM oven/bun:1-alpine AS builder

WORKDIR /build

# Install html-minifier-terser (minifies HTML + inline JS/CSS)
# RUN npm install -g html-minifier-terser (not needed with bunx)

# Copy source files
COPY index.html .
COPY favicon.ico .

# Minify HTML with inline JS/CSS minification
RUN bunx html-minifier-terser index.html \
    --collapse-whitespace \
    --remove-comments \
    --remove-optional-tags \
    --remove-redundant-attributes \
    --remove-script-type-attributes \
    --remove-style-link-type-attributes \
    --minify-css true \
    --minify-js true \
    --output index.html

# Stage 2: Production
FROM nginx:alpine

# Labels
LABEL maintainer="passwd.now"
LABEL description="Secure Password Generator"

# Copy minified files
COPY --from=builder /build/index.html /usr/share/nginx/html/
COPY --from=builder /build/favicon.ico /usr/share/nginx/html/

# Copy robots.txt (not minified)
COPY robots.txt /usr/share/nginx/html/

EXPOSE 80
