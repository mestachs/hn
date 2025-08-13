#!/usr/bin/env bash
set -euo pipefail

REPO_URL="git@github.com:mestachs/hn-o-ai.git"  # change this
BRANCH="gh-pages"
BUILD_DIR="/tmp/hn-noai-deploy"

rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"

# Copy your static HTML file into temp dir
cp index.html "$BUILD_DIR/"

# Init a temporary repo for gh-pages
cd "$BUILD_DIR"
git init
git checkout -b "$BRANCH"
git add index.html
git commit -m "Deploy Hacker News — No-AI"
git remote add origin "$REPO_URL"

# Force push to gh-pages branch
git push --force origin "$BRANCH"

echo "✅ Deployed to GitHub Pages: https://mestachs.github.io/hn/"
