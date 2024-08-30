# Use a compatible Python version as specified in pyproject.toml
FROM python:3.12-slim

# Create a non-root user
RUN useradd -m myuser

# Install PostgreSQL development headers and build tools
RUN apt-get update && apt-get install -y \
    libpq-dev gcc \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the pyproject.toml and poetry.lock files into the container
COPY pyproject.toml poetry.lock /app/

# Change to the non-root user
USER myuser

# Install Poetry
RUN pip install --user poetry

# Configure Poetry to install dependencies globally
ENV PATH="/home/myuser/.local/bin:$PATH"
RUN poetry config virtualenvs.create false

# Install dependencies using Poetry
RUN poetry install --no-root

# Copy the rest of the application code
COPY . /app/

# Expose the application port
EXPOSE 8000

# Command to run the FastAPI application using Uvicorn
CMD ["uvicorn", "src.sample_api.main:app", "--host", "0.0.0.0", "--port", "8000"]
