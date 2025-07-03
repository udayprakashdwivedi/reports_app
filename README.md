# 📊 Reports App

This is a Rails 5.2.8 application for managing reports. It supports user authentication, report CRUD, filtering, file uploads, background jobs, and pagination.

---

## 🚀 Features

- 🔐 Devise-based User Authentication
- 👨‍💼 Admin vs Regular User Access Control
- 📄 CRUD for Reports
- 🖼️ Upload logo for each report (Active Storage)
- 🧹 Filter by Category & Status
- 📃 Pagination (kaminari)
- 🔁 Background job with Sidekiq when report is marked `published`
- 🧾 Logs published reports to `Rails.logger`
- 💅 Bootstrap 5 UI
- ✍️ jQuery-based character counter for report description

---

## 🧑‍💻 Tech Stack

- Ruby 2.7.2
- Rails 5.2.8
- PostgreSQL
- Devise for Authentication
- Active Storage for File Uploads
- Sidekiq + Redis for Background Jobs
- Kaminari for Pagination
- Bootstrap 5 + jQuery

---
