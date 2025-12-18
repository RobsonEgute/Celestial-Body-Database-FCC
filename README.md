# Universe PostgreSQL Database Description

This document provides a detailed explanation of the **`universe`** PostgreSQL database. The database models astronomical structures and objects, including galaxies, stars, planets, moons, and interstellar objects, along with their relationships.

---

## 1. Database Overview

- **Database Name:** `universe`
- **PostgreSQL Version:** 12.9
- **Encoding:** UTF-8
- **Locale:** `C.UTF-8`
- **Owner:** `freecodecamp`
- **Schema:** `public`

The database is designed to represent a simplified astronomical hierarchy, from galaxies down to moons, with additional support for general interstellar objects.

---

## 2. Entity Summary

The database consists of the following tables:

1. `galaxy`
2. `star`
3. `planet`
4. `moon`
5. `interstellar_objects`

Each table represents a distinct class of celestial objects.

---

## 3. Table: `galaxy`

### Purpose
Stores high-level information about galaxies.

### Structure

| Column Name | Data Type | Constraints | Description |
|------------|----------|-------------|-------------|
| `galaxy_id` | `integer` | Primary Key, NOT NULL | Unique identifier for each galaxy |
| `name` | `varchar(50)` | NOT NULL, UNIQUE | Galaxy name |
| `galaxy_type` | `varchar(30)` | NOT NULL | Type of galaxy (e.g., spiral, elliptical) |
| `age_billion_years` | `integer` | NOT NULL | Age of the galaxy in billions of years |
| `description` | `text` | Nullable | Descriptive information |

### Constraints
- **Primary Key:** `galaxy_id`
- **Unique Constraint:** `name`

### Auto-Increment
- Uses sequence `galaxy_galaxy_id_seq`

---

## 4. Table: `star`

### Purpose
Stores stars and associates them with galaxies.

### Structure

| Column Name | Data Type | Constraints | Description |
|------------|----------|-------------|-------------|
| `star_id` | `integer` | Primary Key, NOT NULL | Unique identifier for each star |
| `name` | `varchar(50)` | NOT NULL | Star name |
| `age_million_years` | `integer` | NOT NULL | Age in millions of years |
| `distance_light_years` | `integer` | NOT NULL | Distance from Earth in light-years |
| `description` | `text` | Nullable | Star description |
| `galaxy_id` | `integer` | NOT NULL, FK | Associated galaxy |

### Constraints
- **Primary Key:** `star_id`
- **Foreign Key:** `galaxy_id → galaxy(galaxy_id)`
- **Unique Constraint:** `star_id`

### Auto-Increment
- Uses sequence `star_star_id_seq`

---

## 5. Table: `planet`

### Purpose
Represents planets orbiting stars.

### Structure

| Column Name | Data Type | Constraints | Description |
|------------|----------|-------------|-------------|
| `planet_id` | `integer` | Primary Key, NOT NULL | Unique planet identifier |
| `name` | `varchar(50)` | NOT NULL | Planet name |
| `age_billion_years` | `integer` | NOT NULL | Age in billions of years |
| `has_life` | `boolean` | Nullable | Indicates presence of life |
| `star_id` | `integer` | NOT NULL, FK | Star the planet orbits |

### Constraints
- **Primary Key:** `planet_id`
- **Foreign Key:** `star_id → star(star_id)`
- **Unique Constraint:** `planet_id`

### Auto-Increment
- Uses sequence `planet_planet_id_seq`

---

## 6. Table: `moon`

### Purpose
Stores moons associated with planets and optionally galaxies.

### Structure

| Column Name | Data Type | Constraints | Description |
|------------|----------|-------------|-------------|
| `moon_id` | `integer` | Primary Key, NOT NULL | Unique moon identifier |
| `planet_id` | `integer` | FK, Nullable | Planet the moon orbits |
| `name` | `varchar(50)` | NOT NULL | Moon name |
| `description` | `text` | Nullable | Moon description |
| `galaxy_id` | `integer` | Nullable | Galaxy association |

### Constraints
- **Primary Key:** `moon_id`
- **Foreign Key:** `planet_id → planet(planet_id)`
- **Unique Constraint:** `moon_id`

> **Note:** `galaxy_id` exists but does not enforce a foreign key constraint, allowing flexibility but potentially reducing data integrity.

### Auto-Increment
- Uses sequence `moon_moon_id_seq`

---

## 7. Table: `interstellar_objects`

### Purpose
Stores general interstellar objects not directly tied to stars or planets.

### Structure

| Column Name | Data Type | Constraints | Description |
|------------|----------|-------------|-------------|
| `interstellar_objects_id` | `integer` | Primary Key, NOT NULL | Unique object identifier |
| `name` | `varchar(50)` | NOT NULL | Object name |
| `size` | `numeric(2,1)` | Nullable | Relative size scale |
| `has_life` | `boolean` | Nullable | Life presence indicator |

### Constraints
- **Primary Key:** `interstellar_objects_id`
- **Unique Constraint:** `interstellar_objects_id`

### Auto-Increment
- Uses sequence `interstellar_objects_id_seq`

---

## 8. Relationships Between Tables

### Hierarchical Structure

