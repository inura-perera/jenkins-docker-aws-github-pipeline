# End-to-End CI/CD Pipeline with Jenkins, Docker, GitHub, and AWS

This repository demonstrates how to create a fully automated end-to-end Continuous Integration and Continuous Delivery (CI/CD) pipeline using Jenkins, Docker, GitHub, and AWS. The pipeline is set up for a simple Python Flask application that gets built, tested, and deployed to a Docker registry automatically.

## Technologies Used

- **Jenkins**: Automates the CI/CD process.
- **Docker**: Containerizes the Flask application for consistent deployment.
- **GitHub**: Hosts the source code and triggers the Jenkins pipeline via webhooks.
- **AWS**: Hosts Jenkins on an EC2 instance for running the pipeline.
- **Flask**: A Python web framework used for creating the demo application.

## Project Overview

### Pipeline Stages

1. **Build**: Jenkins pulls the code from GitHub and builds a Docker image for the Flask app.
2. **Test**: The Docker image is run, and the app is tested using `pytest`.
3. **Deploy**: The Docker image is pushed to Docker Hub, where it can be pulled and run on any platform.

### Components

- **Flask App**: A simple Python Flask app that has one route ( `/` ) which returns "Hello, World!".
- **Jenkinsfile**: A declarative pipeline script that defines the stages of the CI/CD pipeline.
- **Dockerfile**: Builds the Flask app into a Docker image.
- **tests**: Contains a simple test for the Flask app using `pytest`.

## Flask Application

The Flask app is located in the `app.py` file and has the following structure:

```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
