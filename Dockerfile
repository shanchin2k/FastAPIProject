FROM python:3.11-slim

# Set the working directory to the root of the container
WORKDIR /app

# Copy everything from your local directory into /app
COPY . .

# Debug: List all files in the current working directory inside the container
RUN ls -R /app

# Install dependencies
RUN pip install --no-cache-dir fastapi uvicorn

# Explicitly tell Python where to look for modules
ENV PYTHONPATH=/app

# Start Uvicorn. The 'main:app' assumes main.py is in the current directory (/app)
CMD uvicorn main:app --host 0.0.0.0 --port 8080