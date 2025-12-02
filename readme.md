# Unity-Care-Clinic-SQL

## Table of Contents

-   [Project overview](#project-overview)
-   [Objectives](#objectives)
-   [Repository structure](#repository-structure)
-   [Technologies used](#technologies-used)
-   [SQL exercises](#sql-exercises)
-   [Getting started](#getting-started)
-   [Future additions](#future-additions)
-   [Future improvements](#future-improvements)
-   [Author](#author)
-   [Acknowledgments](#acknowledgments)
-   [License](#license)

## Project overview

Unity-Care-Clinic-SQL defines the relational data model for the Unity Care Clinic, a hospital management system, using MySQL and SQL scripts. The repository focuses on the ERD, schema creation, sample data, and query exercises that will later support a full application layer.

## Objectives

-   Design a coherent ERD representing core hospital entities such as patients, staff, departments, rooms, admissions, appointments, and prescriptions.
-   Implement the model in MySQL with proper primary keys, foreign keys, and constraints to enforce data integrity.
-   Provide realistic sample data and query exercises to practice CRUD operations, joins, aggregations, and reporting.

## Repository structure

```bash
📦 Unity-Care-Clinic-SQL
├── ERD/
│   ├── Unity-Care-Clinic-ERD.pdf    # ERD exported from dbdiagram.io
│   ├── Unity-Care-Clinic-ERD.png    # ERD image snapshot
│   ├── ddl.sql                      # Schema definition (tables, keys, constraints)
│   ├── dml.sql                      # Sample data generated with Mockaroo
│   └── dql.sql                      # Query exercises (CRUD, joins, aggregates, views)
└── README.md
```

**Descriptions:**

-   `Unity-Care-Clinic-ERD.pdf / .png`: Visual data model of the Unity Care Clinic database designed with dbdiagram.io.
-   `ddl.sql`: DDL script that creates all tables, relationships, indexes, and constraints defined in the ERD.
-   `dml.sql`: Insert statements generated with Mockaroo to populate the schema with realistic hospital data.
-   `dql.sql`: Collection of SQL queries that implement the brief's exercises and bonus questions.

## Technologies used

-   MySQL for relational data storage and query execution.
-   SQL (DDL, DML, DQL) for schema definition, data population, and data querying.
-   dbdiagram.io for ERD design and export, and Mockaroo for synthetic data generation.

## SQL exercises

The `dql.sql` file covers a range of use cases aligned with the training brief.

-   Core exercises: table exploration, CRUD operations, filtering with conditions, ordering, limiting results, aggregates with `GROUP BY` and `HAVING`, and multiple levels of joins.
-   Advanced exercises: more complex joins across patients, staff, departments, and admissions, along with reporting queries that answer typical hospital management questions.

## Getting started

1. Create a new MySQL database (for example, `unity_care_clinic`).
2. Run `ERD/ddl.sql` to create all tables and constraints defined by the ERD.
3. Execute `ERD/dml.sql` to insert the sample data generated via Mockaroo.
4. Open `ERD/dql.sql` and run the queries to explore the dataset and validate the model.

## Future additions

-   Extend the query set with richer reporting, such as KPIs per department, admission trends, and staff workload dashboards.
-   Introduce stored procedures, triggers, and functions to encapsulate recurring hospital business rules.
-   Add scenario-based SQL exercises for learners (e.g., on-call planning, room turnover, and medication usage analysis).

## Future improvements

-   Review and refine indexing strategies on frequently queried columns to improve performance at scale.
-   Strengthen data quality through additional constraints, stricter data types, and validation rules aligned with real hospital policies.
-   Prepare the schema for integration with future applications by planning role-based access, audit tables, and data security considerations.

## 👤 Author

Sami Regragui  
Unity-Care-Clinic-SQL was created as a backend data‑modeling challenge focused on ERD design and SQL practice for the Unity Care Clinic platform.

## 🙏 Acknowledgments

-   Training and project supervision provided by the pedagogical team.
-   dbdiagram.io for providing an efficient interface to design and export the ERD.
-   Mockaroo for generating realistic sample data used in `dml.sql`.
-   Open source SQL and database communities for patterns, best practices, and learning resources.

## 📄 License

This project is intended primarily for educational use and portfolio demonstration. It may be reused or adapted for internal, professional, or commercial purposes provided that this README and appropriate attribution to the author are retained.

---

**Tech stack:** MySQL | SQL (DDL / DML / DQL) | Git  
**Goal:** Deliver a consistent, extensible hospital management database ready to support future web or desktop applications.
