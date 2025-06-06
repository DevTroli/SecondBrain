09-December-2024 | 20:34

Status: #done  

## 🔍 Quick Command Reference

| Command             | Function             | Example                         |
| ------------------- | -------------------- | ------------------------------- |
| `docker pull`       | Download image       | `docker pull ubuntu`            |
| `docker run`        | Run container        | `docker run -it ubuntu bash`    |
| `docker ps`         | List containers      | `docker ps -a`                  |
| `docker stop`       | Stop container       | `docker stop container_id`      |
| `docker rm`         | Remove container     | `docker rm container_id`        |
| `docker build`      | Build image          | `docker build -t myimage:tag .` |
| `docker-compose up` | Start micro-services | `docker-compose up -d`          |

#### 🚦 Common Docker Flags Quick Reference
- `-d`: Detached mode
- `-it`: Interactive terminal
- `-p`: Port mapping
- `--name`: Named container
- `--rm`: Automatically remove container on exit
- `-e`: Set environment variables
- `-v`: Mount volumes
- `--network`: Specify network
- `--restart`: Container restart policy
- `--cpus`: CPU limit
- `--memory`: Memory limit

---
## 🚦 Docker Run: Diving Deep into Container Execution

### 🎯 Basic Docker Run Command Structure
```bash
docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
```

### 🚀 Run Modes and Essential Flags

#### 1. Interactive Mode `-it`
```bash
# Interactive mode breakdown
# -i: Keep STDIN open (Interactive)
# -t: Allocate pseudo-TTY (Terminal)
docker run -it ubuntu bash

# Practical examples
docker run -it python:slim python
docker run -it alpine sh
```
==💡 **Use Cases**:== 
- ==Exploring container internals==
- ==Running interactive shells==
- ==Debugging container environments==

#### 2. Detached Mode `-d`
```bash
# Run containers in background
docker run -d nginx
docker run -d postgres
docker run -d redis

# View running background containers
docker ps
```
==💡 **Use Cases**:==
- ==Long-running services==
- ==Web servers==
- ==Databases==
- ==Background processing==

#### 3. Port Mapping `-p`
```bash
# Map host port to container port
# Format: -p [host_port]:[container_port]
docker run -p 8080:80 nginx
docker run -p 5432:5432 postgres
docker run -p 6379:6379 redis

# Multiple port mappings
docker run -p 8080:80 -p 443:443 nginx
```
==💡 **Key Benefits**:==
- ==Expose container services to host==
- ==Enable external access==
- ==Create network bridges==

#### 4. Environment Variables `-e`
```bash
# Set environment variables
docker run -e DATABASE_URL=postgres://user:pass@host:5432/db postgres
docker run -e MYSQL_ROOT_PASSWORD=secret mysql

# Multiple environment variables
docker run -e APP_ENV=production \
           -e DEBUG=false \
           myapp
```
==💡 **Use Cases**:==
- ==Configure application settings==
- ==Pass credentials securely==
- ==Control runtime behavior==

#### 5. Volume Mounting `-v`
```bash
# Mount host directory to container
docker run -v /host/path:/container/path nginx

# Persistent data storage
docker run -v postgres_data:/var/lib/postgresql/data postgres

# Read-only volumes
docker run -v /config:/app/config:ro myapp
```
==💡 **Benefits**:==
- ==Persistent data storage==
- ==Configuration management==
- ==Sharing files between host and container==

#### 6. Resource Limitations
```bash
# Limit CPU and memory
docker run --cpus=2 --memory=1g myapp

# Restrict container resources
docker run --memory-reservation=512m \
           --cpu-shares=512 \
           myapp
```
==💡 **Use Cases**:==
- ==Prevent resource overconsumption==
- ==Simulate production constraints==
- ==Improve container isolation==

### 🔍 Others Run Flags and Options

#### Name & Restart Policies
```bash
# Named containers
docker run --name web_server nginx

# Restart policies
docker run --restart=always postgres
docker run --restart=on-failure nginx
```

#### Network Configuration
```bash
# Custom network
docker run --network=mynetwork nginx

# Disable network
docker run --network=none myapp
```


## 🛠️ Advanced Docker Commands and Flags

### 🔍 Comprehensive Command Overview
```bash
# Container Filtering
docker ps -f "status=running"
docker ps -f "name=web"

# Resource Management
docker stats                  # Monitor container resources
docker system df              # Check Docker disk usage

# Network Management
docker network ls             # List networks
docker network create mynet   # Create custom network

# Volume Management
docker volume create myvolume
docker volume ls
docker volume rm myvolume
```

### 🔍 Life-cycle and Monitoring
```bash
# Container management
docker ps                  # Running containers
docker ps -a               # All containers
docker stop [container_id] # Stop container
docker rm [container_id]   # Remove container

# Resource monitoring
docker stats               # Real-time resource usage
docker system df           # Docker disk usage
```


## References