# Sleek Todo List App

A sleek, responsive, glassmorphism-themed **To-Do List** application built with Python (Flask), HTML5, Vanilla CSS3, and JavaScript.

---

## ⚡ Local Setup

### 1. Prerequisites
Ensure you have **Python 3.8+** and **Git** installed on your system.

### 2. Setup Virtual Environment & Install Dependencies
Open your terminal in this directory (`todo_app/`) and run:

```bash
# Create a virtual environment
python -m venv venv

# Activate virtual environment
# On Windows (Command Prompt):
venv\Scripts\activate
# On Windows (PowerShell):
.\venv\Scripts\Activate.ps1
# On macOS/Linux:
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt
```

### 3. Run the App Locally
Start the local development server:
```bash
python app.py
```
Open **[http://127.0.0.1:5001](http://127.0.0.1:5001)** in your browser.

---

## 📤 Git Preparation & Pushing to GitHub

To make this a standalone project on GitHub:

1. Open a PowerShell terminal in the `todo_app` directory and execute the automated helper script:
   ```powershell
   .\setup_git.ps1
   ```
   *(If you are on macOS/Linux, run `git init && git add . && git commit -m "Initial commit" && git branch -M main`)*
2. Create a new repository named `todo-app` on [GitHub](https://github.com/new) (**do not** add a README, license, or `.gitignore` file during creation).
3. Connect your local repository and push:
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/todo-app.git
   git push -u origin main
   ```

---

## 🚀 Easy Deployment Guides

Once your project is on GitHub, you can deploy it for free using one of the services below:

### 1. Deploy on Render (Recommended - 100% Free & Simplest)
1. Sign up/log in at [Render.com](https://render.com).
2. Click **New +** and select **Web Service**.
3. Connect your GitHub account and choose your `todo-app` repository.
4. Set the following details:
   - **Name**: `my-todo-list-app` (or any unique name)
   - **Environment**: `Python`
   - **Region**: Select the region closest to you
   - **Branch**: `main`
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `gunicorn app:app`
5. Select the **Free Instance Type** and click **Deploy Web Service**!

### 2. Deploy on Heroku
1. Log in to the Heroku CLI in your terminal:
   ```bash
   heroku login
   ```
2. Create a new application:
   ```bash
   heroku create my-todo-list-app
   ```
3. Push to deploy:
   ```bash
   git push heroku main
   ```

---

## 💾 Production Data Storage Warning

This app currently uses a local `tasks.json` file for simplicity and ease of setup. 
> [!WARNING]
> Platforms like Render and Heroku use **ephemeral file systems**, which means any tasks you add will be reset whenever the app restarts or redeploys.
>
> If you want long-term storage in production, you can easily change the storage mechanism in `app.py` to use a **SQLite database** (coupled with Render's Persistent Disk feature) or connect to an external **PostgreSQL database**.
