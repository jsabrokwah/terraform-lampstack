# Source Code Overview

This directory contains the source code for the LAMP stack todo application.

## Structure

- `api/` - PHP API endpoints for CRUD operations on todo items.
  - `create.php` - Create a new todo item.
  - `read.php` - Read existing todo items.
  - `update.php` - Update an existing todo item.
  - `delete.php` - Delete a todo item.
  - `config/Database.php` - Database connection configuration.
- `frontend/` - Frontend files for the application.
  - `index.html` - Main HTML page.
  - `css/style.css` - Stylesheet for the frontend.
  - `js/scripts.js` - JavaScript for frontend interactivity.

## Usage

- The API endpoints provide RESTful interfaces for managing todo items.
- The frontend interacts with the API to provide a user-friendly interface.
- Configure the database connection in `api/config/Database.php` before running.

## Requirements

- PHP 7.x or higher
- MySQL or compatible database
- Apache web server

## Running Locally

1. Set up a local LAMP stack.
2. Place the `src/` directory in the web server root.
3. Configure the database connection.
4. Access the frontend via the web server URL.

## Notes

- Ensure the database is created and accessible.
- Adjust permissions as needed for web server access.
