# Changelog

### Added
- **Dockerfile**: Added a Dockerfile to the root of the repository to containerize the FastAPI application (`sample-api`). This Dockerfile sets up the environment required to run the application within a Docker container.
  
  - **Why**: Containerizing the application ensures consistency across different environments and simplifies the deployment process.
  
  - **What**: 
    - The Dockerfile is based on `python:3.12-slim` to provide a lightweight and efficient environment.
    - It installs necessary system dependencies, including PostgreSQL development headers (`libpq-dev`) and build tools (`gcc`).
    - Poetry is used for dependency management, with the configuration modified to install dependencies globally within the container rather than in a virtual environment.
    - The application code is copied into the container, and Uvicorn is configured to serve the FastAPI application on port 8000.
    - The container exposes port 8000, allowing the application to be accessed externally.
  
### Documentation
- **README.md**: Updated with instructions on how to build and run the Docker image for the `sample-api` FastAPI application.
