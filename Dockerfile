# Use an official lightweight Python image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the local code to the container
COPY . .

# Install dependencies (since you don't have a requirements.txt, we install manually for now)
RUN pip install --no-cache-dir fastapi uvicorn

# Allow Cloud Run to pass the port dynamically (standard is 8080)
ENV PORT 8080

# Command to run the app
CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port ${PORT}"]