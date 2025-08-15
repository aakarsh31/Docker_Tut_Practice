# 🚀 DOCKER_TUT — Simple Flask App in a Docker Container

This project is a learning exercise where I built a simple Flask app and containerized it using Docker.  
It helped me understand how to create a Docker image, run it as a container, and push it to Docker Hub.

---

## 📂 Project Structure

```
DOCKER_TUT/
│
├── index.py          # Main Flask application
├── Dockerfile        # Docker build instructions
├── requirements.txt  # Python dependencies
└── README.md         # This file
```

---

## 📝 Code Overview

### index.py
```python
from flask import Flask
helloworld = Flask(__name__)

@helloworld.route('/')
def run():
    return 'Hello World!'

if __name__ == '__main__':
    helloworld.run(host="0.0.0.0", port=8000, debug=True)
```
**Purpose:** Basic Flask app with one route `/` returning `"Hello World!"`.  
**Note:** `host="0.0.0.0"` ensures the app is accessible from outside the container.

---

### Dockerfile
```dockerfile
FROM python:3.13.6

WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
EXPOSE 8000
CMD python ./index.py
```
- **FROM python:3.13.6** → Base image with Python installed  
- **WORKDIR /app** → Sets working directory inside container  
- **COPY . /app** → Copies all files from project into container  
- **RUN pip install -r requirements.txt** → Installs Flask  
- **EXPOSE 8000** → Opens port 8000 for the app  
- **CMD python ./index.py** → Command to start the app  

---

### requirements.txt
```
flask
```
Only dependency for this app.

---

## 🛠 Docker Commands Used

### 1️⃣ Build the Docker Image
```bash
docker build -t aakpaak3110/hey-python-flask:0.0.1.RELEASE .
```
Tags the image with a name and version.

---

### 2️⃣ Run the Docker Container
```bash
docker container run -d -p 8000:8000 aakpaak3110/hey-python-flask:0.0.1.RELEASE
```
- `-d` → Detached mode (runs in background)  
- `-p 8000:8000` → Maps container's port 8000 to host's port 8000  
- Visit [http://localhost:8000](http://localhost:8000) to see `"Hello World!"`  

---

### 3️⃣ List Running Containers
```bash
docker container ls
```

---

### 4️⃣ Push Image to Docker Hub
```bash
docker push aakpaak3110/hey-python-flask:0.0.1.RELEASE
```

---

## 📌 Key Takeaways
- Flask is great for lightweight web servers  
- Dockerfile defines the environment and startup process  
- `docker build` creates an image, `docker run` starts a container  
- Port mapping (`-p host:container`) is essential for external access  
- Images can be pushed to Docker Hub for reuse anywhere  

---

## ✅ To Run This Project Again
1. Clone the repo or open the `DOCKER_TUT` folder  
2. Build image:
```bash
docker build -t yourname/yourimage:tag .
```
3. Run container:
```bash
docker run -d -p 8000:8000 yourname/yourimage:tag
```
4. Open browser and go to:
```
http://localhost:8000
```

---

## 🔍 How It Works — Architecture Diagram

```
[ Browser ] 
     │  (HTTP Request)
     ▼
[ Host Machine:8000 ]
     │  (Port Mapping)
     ▼
[ Docker Container ]
     │
     ├── Python 3.13.6 Environment
     │
     └── Flask App (index.py)
             │
             └── Returns "Hello World!"
```
**Explanation:**  
- The **browser** sends a request to your computer on **port 8000**.  
- Docker maps this to **port 8000 inside the container**.  
- The container runs the Flask app, which returns `"Hello World!"` as the HTTP response.  

---

**Author:** Aakarsh Reddy  
**Date:** August 2025
