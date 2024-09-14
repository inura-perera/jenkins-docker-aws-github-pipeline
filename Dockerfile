FROM python:3.9-alpine

# Set the working directory inside the container
WORKDIR /flask_app

# Copy the requirements.txt to the container
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install pytest

# Copy the application file to the working directory
COPY app.py .

# Command to run the Flask app
CMD ["python", "app.py"]
