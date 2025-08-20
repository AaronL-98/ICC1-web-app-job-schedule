FROM python:3.12-slim

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y gcc libpq-dev && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Set environment variables for Flask
ENV FLASK_APP=application.py \
    FLASK_ENV=development \
    PYTHONUNBUFFERED=1


# Expose port (change if your app uses a different port)
EXPOSE 8080

# Run the application
CMD ["flask", "run", "--host=0.0.0.0" , "--port=8080"]