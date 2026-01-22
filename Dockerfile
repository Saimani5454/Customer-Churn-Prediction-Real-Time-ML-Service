FROM python:3.10-slim

# Set working directory inside container
WORKDIR /app

# Copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy entire project
COPY . .

# Railway provides PORT automatically
CMD ["sh", "-c", "uvicorn app.main:app --host 0.0.0.0 --port $PORT"]
