FROM python:3.9-alpine

# Set the working directory inside the container
WORKDIR /flask_app

# Copy the requirements.txt to the container and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install pytest for testing
RUN pip install pytest

# Copy the application file and tests directory to the working directory
COPY app.py .
COPY tests/ ./tests/

# Command to run the Flask app
CMD ["python", "app.py"]
