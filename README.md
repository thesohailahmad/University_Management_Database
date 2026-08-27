# 🎓 University Learning Management Database

## 📌 Project Goal
To design and build a robust relational database system for managing university operations, ensuring strict data integrity and efficient information retrieval.

## 🚀 Day 1 Progress & Achievements
- [x] Initialized the core `university_management_db` database.
- [x] Designed and created the `departments` and `students` tables.
- [x] Implemented **Primary Keys** for unique record identification.
- [x] Established **Foreign Key** relationships to accurately link students to their respective departments.
- [x] Populated the database with realistic sample data for testing.
- [x] Successfully executed core **CRUD** (Create, Read, Update, Delete) operations.
- [x] Wrote and tested the first relational **JOIN** query to seamlessly combine student and department data.

## 🛠️ PostgreSQL Concepts 
- **Core Commands:** `CREATE TABLE`, `INSERT`, `SELECT`, `UPDATE`, `DELETE`
- **Structural Constraints:** `PRIMARY KEY`, `FOREIGN KEY`
- **Relational Logic:** `JOIN` operations

## 📂 Project Structure
* `database/schema.sql`: Contains the database structure and table definitions.
* `database/seed.sql`: Contains the initial data used to populate the tables.
* `database/queries.sql`: Contains the saved CRUD and JOIN queries for interaction and testing.

## 💻 How to Run
1. Connect to your PostgreSQL server using **pgAdmin** or your preferred CLI.
2. Create a new database named `university_management_db`.
3. Open the Query Tool and execute the SQL scripts in the following order:
   * First, run `schema.sql` to build the tables.
   * Next, run `seed.sql` to insert the initial data.
   * Finally, use `queries.sql` to test the relationships and view the data.