# Use a compatible Python version as specified in pyproject.toml
FROM python:3.12-slim

# Install PostgreSQL development headers and build tools
RUN apt-get update && apt-get install -y \
    libpq-dev gcc \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the pyproject.toml and poetry.lock files into the container
COPY pyproject.toml poetry.lock /app/

# Install Poetry
RUN pip install poetry

# Configure Poetry to install dependencies globally
RUN poetry config virtualenvs.create false

# Install dependencies using Poetry
RUN poetry install --no-root

# Copy the rest of the application code
COPY . /app/

# Expose the application port
EXPOSE 8000

# Command to run the FastAPI application using Uvicorn
CMD ["uvicorn", "src.sample_api.main:app", "--host", "0.0.0.0", "--port", "8000"]
