FROM python:3.11-slim

# Install system dependencies for LiveKit and audio processing
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy requirements and install them
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Start the agent worker
CMD ["python", "agent.py", "start"]
