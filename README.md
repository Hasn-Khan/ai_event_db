# ai_event_db

## Overview

This repository contains the database schema and related information for the AI-powered application. The database integrates data from events, companies, and people to support various queries about events, companies, and individuals attending those events.

## Database Schema

The database consists of the following tables:

1. **events**: Contains information about events.
2. **companies**: Contains information about companies.
3. **people**: Contains information about people working for the companies.
4. **merged_data**: Contains the merged data from events, companies, and people.

### Tables

**events**:
- `event_url`: Primary key, unique URL of the event.
- `event_name`: Name of the event.
- `event_date`: Date of the event.
- `event_location`: Location of the event.
- `event_industry`: Industry of the event.

**companies**:
- `homepage_base_url`: Primary key, unique URL of the company's homepage.
- `company_name`: Name of the company.
- `company_revenue`: Revenue of the company.
- `company_industry`: Industry of the company.
- `number_of_employees`: Number of employees in the company.

**people**:
- `person_id`: Primary key, unique identifier for the person.
- `person_name`: Name of the person.
- `job_title`: Job title of the person.
- `email`: Email address of the person.
- `homepage_base_url`: Foreign key referencing `companies.homepage_base_url`.

## How to Set Up

### Prerequisites

- PostgreSQL installed and running.
- A PostgreSQL user with necessary privileges.

### Steps

1. **Create Database**: Create a PostgreSQL database.
   ```sql
   CREATE DATABASE ai_event;

   psql -U your_username -d ai_event -f schema.sql

### Challenges

- Data Integration: Merging data from different sources (events, companies, people) was challenging due to inconsistencies in the data.
- Normalization: Ensuring that the data is normalized to avoid redundancy while maintaining query performance.
- Data Cleaning: Handling missing or inconsistent data entries required careful data cleaning and validation.

### Improvements
- Indexing: Adding indexes on frequently queried fields to improve performance.
- Data Validation: Implementing more robust data validation to ensure data consistency and integrity.
- Optimizations: Optimizing queries and database design to handle large datasets more efficiently.
- Scalability: Exploring partitioning or sharding strategies for large datasets.
