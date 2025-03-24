# Use official Python image
FROM python:3.12

# Set the working directory
WORKDIR /app

# Copy project files
COPY . /app

# Install system dependencies (Tesseract OCR)
RUN apt-get update && apt-get install -y tesseract-ocr

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port Flask runs on
EXPOSE 8080

# Run the Flask app
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]
