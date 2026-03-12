FROM python:3.11-slim

WORKDIR /app

# Copy all files
COPY . .

# Install the core requirements
RUN pip install --no-cache-dir fastapi uvicorn

# IMPORTANT: Cloud Run gives us the port via $PORT. 
# Use the shell form to ensure the $PORT variable is expanded correctly
CMD uvicorn main:app --host 0.0.0.0 --port ${PORT:-8080}