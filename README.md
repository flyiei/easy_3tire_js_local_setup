# Microservices Demo with Docker Compose and Tilt

This project demonstrates a local development setup for a microservices architecture using Docker Compose for container orchestration and Tilt for improved developer experience.

## Architecture

The demo consists of four services:

1. **Frontend**: React application for the user interface
2. **API**: Node.js/Express service that handles business logic
3. **Spring Boot API**: Java-based REST API service 
4. **Database**: PostgreSQL database for data persistence

## Prerequisites

- Docker and Docker Compose
- Tilt ([installation instructions](https://docs.tilt.dev/install.html))
- Node.js and npm (for local development)
- Java 17 or higher (for Spring Boot development)

## Getting Started

### Clone the repositories in the following order:

```bash
# 1. Clone the main setup repository
git clone git@github.com:flyiei/easy_3tire_js_local_setup.git
cd easy_3tire_js_local_setup

# 2. Clone the API repository
git clone git@github.com:flyiei/easy_3tire_js_api.git

# 3. Clone the frontend repository
git clone git@github.com:flyiei/easy_3tire_js_frontend.git

# 4. Clone the Spring Boot API repository
git clone git@github.com:flyiei/easy_3tire_springboot_api.git
```

### Running with Docker Compose only

```bash
# Start all services
docker-compose up

# Start in detached mode
docker-compose up -d

# Stop all services
docker-compose down
```

### Running with Tilt

```bash
# Start all services
tilt up

# Start specific services only
tilt up -- db api
tilt up -- api frontend
tilt up -- db frontend springboot-api

# Access Tilt UI
# Open http://localhost:10350/ in your browser

# Stop all services
tilt down
```

## Development Workflow

Tilt provides several advantages for local development:

1. **Live Updates**: Code changes are synced to containers automatically
2. **Selective Rebuilds**: Only affected services are rebuilt when code changes
3. **Service Dependencies**: Services start in the correct order
4. **Unified Logs**: View all service logs in one place
5. **Resource Dashboard**: Monitor all services in the Tilt web UI

## Project Structure

```
project/
├── easy_3tire_js_api/          # Node.js API service
├── easy_3tire_js_frontend/     # React Frontend application
├── easy_3tire_springboot_api/  # Spring Boot API service
├── db/                         # Database initialization
├── docker-compose.yml          # Docker Compose configuration
├── Tiltfile                    # Tilt configuration
└── README.md                   # Documentation
```

## Service Access

- **Frontend**: http://localhost:8080
- **API**: http://localhost:3000
- **Spring Boot API**: http://localhost:8081
- **Database**: PostgreSQL on port 5432

## Service Details

### Frontend
- React application running on port 80 in container (mapped to port 8080)
- Source code in `easy_3tire_js_frontend/src/`
- Main component in `app.js`

### API
- Node.js/Express application running on port 3000
- RESTful endpoints at `/api/items`
- Health check at `/health`
- Root endpoint with API documentation at `/`

### Spring Boot API
- Java Spring Boot application running on port 8080 in container (mapped to port 8081)
- RESTful endpoints at `/api/spring/items`
- Uses Gradle for build automation
- Features automatic code reloading with Spring DevTools

### Database
- PostgreSQL database
- Initial schema defined in `db/init.sql`
- Credentials in docker-compose.yml (for development only)

## Customization

- Modify `docker-compose.yml` to adjust service configurations
- Edit the `Tiltfile` to change Tilt behavior
- Update Dockerfiles in each service directory to modify build processes