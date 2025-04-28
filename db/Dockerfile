FROM postgres:14-alpine

# Copy initialization scripts
COPY init.sql /docker-entrypoint-initdb.d/

# Set environment variables
ENV POSTGRES_PASSWORD=devpassword
ENV POSTGRES_USER=devuser
ENV POSTGRES_DB=microservices_db

# Expose PostgreSQL port
EXPOSE 5432