## How to Pull and Run Your Docker Image

### 1. Log in to GitHub Container Registry (GHCR)

Before pulling the Docker image, you need to log in to GHCR using your GitHub username and a Personal Access Token (PAT)(classic). Run the following command in your terminal:

```bash
echo YOUR_PAT_TOKEN | docker login ghcr.io -u YOUR_GITHUB_USERNAME --password-stdin

### 2. Pull the image from GitHub Container Registry (GHCR)

docker pull ghcr.io/YOUR_GITHUB_USERNAME/YOUR_REPO/YOUR_IMAGE:latest

### 3. Run the image
docker run -d -p 8000:8000 ghcr.io/YOUR_GITHUB_USERNAME/YOUR_REPO/YOUR_IMAGE:latest

### 3. Test in browser
http://localhost:8000/docs

### 5. How to trigger and run the workflow
git add .
git commit -m "Your commit message"
git push origin main
