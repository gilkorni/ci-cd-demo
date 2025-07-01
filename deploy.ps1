# -------- CONFIGURATION --------
$dockerUsername = "gilhamelech"
$imageName = "fastapi-demo"
$tag = "latest"
$releaseName = "fastapi-app"
$chartPath = "./fastapi-chart"
# -------------------------------

# STEP 1: Build Docker image
Write-Host "🔨 Building Docker image..."
docker build -t "$imageName" .

# STEP 2: Tag the image for Docker Hub
Write-Host "🏷️ Tagging image..."
docker tag "$imageName" "${dockerUsername}/${imageName}:${tag}"

# STEP 3: Push the image
Write-Host "📤 Pushing image to Docker Hub..."
docker push "${dockerUsername}/${imageName}:${tag}"

# STEP 4: Deploy with Helm
Write-Host "🚀 Deploying to Kubernetes with Helm..."
helm upgrade --install $releaseName $chartPath

Write-Host "`n✅ Done! Your app should be live shortly."
