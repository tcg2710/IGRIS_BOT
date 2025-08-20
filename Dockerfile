# Use Python 3.11 slim image (lighter and more modern than 3.10-buster)
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    wget \
    curl \
    bash \
    ffmpeg \
    gcc \
    libpq-dev \
    libffi-dev \
    libssl-dev \
    neofetch \
    && rm -rf /var/lib/apt/lists/*

# Optional: Install Node.js (if required by your bot)
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

# Copy requirements and install Python deps
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip setuptools wheel \
    && pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Expose port (only required if using webhooks)
EXPOSE 8080

# Default run command
CMD ["python", "-m", "SaitamaRobot"]
