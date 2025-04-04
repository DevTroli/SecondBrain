09-December-2024 | 20:30

Status: #done 

# 🛠️ Installation: Preparing the Ground

#### For Linux Developers
```bash
# Update package lists
sudo apt update

# Install Docker and Docker Compose
sudo apt install docker.io docker-compose

# Enable Docker to start automatically
sudo systemctl enable --now docker docker.socket containerd

# Add your user to docker group
sudo usermod -aG docker $USER

# Verify installation
docker --version
docker-compose --version
```

#### For Windows and Mac
- **Recommendation**: Docker Desktop
  - Simplified installation
  - User-friendly graphical interface
  - Integrated Kubernetes support
  - Easier setup for non-Linux environments

### 💻 Docker Desktop vs Docker Engine

#### 🖥️ Docker Engine
- Low-level runtime
- Command-line interface
- Core Docker functionality
- Works directly on Linux
- Requires manual setup

#### 🌟 Docker Desktop
- Graphical user interface
- Includes Docker Engine
- Easier installation on Windows/Mac
- Includes additional tools
- Simplified container management
- Integrated Kubernetes support

## References