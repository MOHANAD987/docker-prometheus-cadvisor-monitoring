#!/bin/bash

# 1. Update existing packages
echo "Updating packages..."
sudo apt update

# 2. Install prerequisite packages
echo "Installing prerequisites..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# 3. Add GPG key for the official Docker repo
echo "Adding Docker GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# 4. Add Docker repo to APT sources
echo "Adding Docker repository..."
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" -y

# 5. Update database with new Docker packages
echo "Updating package database..."
sudo apt update

# 6. Install Docker CE
echo "Installing Docker CE..."
sudo apt install -y docker-ce

# 7. Start and enable Docker service
echo "Starting and enabling Docker..."
sudo systemctl start docker
sudo systemctl enable docker

# 8. Add current user and 'ubuntu' to docker group
echo "Adding user to Docker group..."
sudo usermod -aG docker ubuntu

echo "--------------------------------------------------"
echo "Docker Installation Completed Successfully!"
echo "Status check:"
sudo systemctl status docker --no-pager
echo "--------------------------------------------------"
echo "IMPORTANT: Please restart your machine or log out and back in for group changes to take effect."
