09-December-2024 | 20:26

Status: #done  

Tags: [[Back End]], [[DevOps]],

# 🏗️ Docker Images, Containers, and the Complete Ecosystem

### 📝 Dockerfile: The Blueprint
A Dockerfile is a text document containing all the commands needed to assemble a Docker image. It's like a recipe for creating a consistent, reproducible environment.

```dockerfile
# Example Dockerfile
FROM ubuntu:20.04
LABEL maintainer="your-email@example.com"

# Update package lists
RUN apt-get update && apt-get upgrade -y

# Install dependencies
RUN apt-get install -y python3 pip

# Set working directory
WORKDIR /app

# Copy application files
COPY . /app

# Install python dependencies
RUN pip install -r requirements.txt

# Specify the command to run
CMD ["python3", "app.py"]>)
```

### 📸 Docker Images: The Blueprint
A Docker image is a read-only template containing:
- Base operating system
- Application code
- Runtime environment
- Dependencies
- Configuration settings

#### Image Management
```bash
# Build an image from Dockerfile
docker build -t myapp:v1 .

# Tag and push to registry
docker tag myapp:v1 username/myapp:v1
docker push username/myapp:v1

# List local images
docker images

# Remove images
docker rmi myapp:v1
```

### 🚢 Docker Containers: Living Instances
A container is a runnable instance of an image - the actual executing environment.

```bash
# Run a container
docker run -d --name my-app myapp:v1

# Interact with running container
docker exec -it my-app bash

# Stop and remove container
docker stop my-app
docker rm my-app
```
### 💻 Typical Docker Workflow
1. 📝 Write Dockerfile
2. 🏗️ Build Image (`docker build`)
3. 🚀 Create and Run Containers (`docker run`)
4. 🔍 Monitor and Manage
5. 🔄 Update and Redeploy

#### 🌐  Exploring and Using Docker Hub
```bash
# Search for images
docker search [keyword]

# Pull official images
docker pull nginx
docker pull postgres
docker pull python

# View and manage local images
docker images
docker image inspect [image_name]
```


## References