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

### Added
- **GitHub Workflow file**: Added a GitHub Actions workflow file (`.github/workflows/sample-api.yaml`) to automate the CI/CD pipeline for the FastAPI application.

  - **Why**: Automating the CI/CD process ensures that the application is continuously tested, built, and deployed in a consistent and reliable manner.

  - **What**:
    - The workflow is triggered on every push to the `main` branch.
    - It sets up a Python environment using Python 3.12 and installs dependencies using Poetry.
    - The workflow runs unit tests to validate the code.
    - It builds a Docker image for the FastAPI application, tagging it with the commit SHA.
    - The workflow logs in to the GitHub Container Registry (GHCR) and pushes the built Docker image to the registry.
    - The matrix strategy is used to build the Docker image for both `linux/amd64` and `linux/arm64` platforms, ensuring compatibility across different environments.

### Added
- **README Instructions**: Added detailed instructions in the `README.md` file on how to:

  - Log in to the GitHub Container Registry (GHCR) from a local environment.
  - Pull and run the Docker image from GHCR.
  - Trigger and monitor the GitHub Actions workflow.

### Changed
- **Poetry Configuration**: Updated the Dockerfile and workflow to ensure that Poetry installs dependencies in a non-root user's home directory, addressing potential permission issues during the build process.

  - **Why**: Running as a non-root user is a best practice in containerized environments, as it enhances security and avoids permission-related problems.
