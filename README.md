# Microservices Demo with Docker Compose and Tilt

This project demonstrates a local development setup for a microservices architecture using Docker Compose for container orchestration and Tilt for improved developer experience.

## Architecture

The demo consists of three services:

1. **Frontend**: React application for the user interface
2. **API**: Node.js/Express service that handles business logic
3. **Database**: PostgreSQL database for data persistence

## Prerequisites

- Docker and Docker Compose
- Tilt ([installation instructions](https://docs.tilt.dev/install.html))
- Node.js and npm (for local development)

## Getting Started

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
tilt up -- db frontend

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
├── easy_3tire_js_api/      # API service
├── easy_3tire_js_frontend/ # Frontend application
├── db/                     # Database initialization
├── docker-compose.yml      # Docker Compose configuration
├── Tiltfile                # Tilt configuration
└── README.md               # Documentation
```

## Service Access

- **Frontend**: http://localhost:8080
- **API**: http://localhost:3000
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

### Database
- PostgreSQL database
- Initial schema defined in `db/init.sql`
- Credentials in docker-compose.yml (for development only)

## Customization

- Modify `docker-compose.yml` to adjust service configurations
- Edit the `Tiltfile` to change Tilt behavior
- Update Dockerfiles in each service directory to modify build processes