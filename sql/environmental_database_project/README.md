# GeoBase – Relational Database Project

GeoBase is an academic relational database project developed as part of a university course.
The project focuses on designing and implementing a normalized database that supports
environmental monitoring, species protection, and field observations.

The database demonstrates proper use of:
- primary and foreign keys
- integrity constraints
- cascading actions (UPDATE CASCADE, DELETE CASCADE)
- realistic test data
- example SQL queries and demonstrations

---

## Technologies
- Microsoft SQL Server

---

## Project Scope

The database models a system for:
- organizations involved in environmental activities
- users working within those organizations
- geographic regions (lands)
- species (flora and fauna)
- individual specimens
- field activities and tasks
- observations and medical diagnoses

The project emphasizes **data integrity, relational consistency, and practical database design**.

---

## Database Structure

Main entities include:
- `Organizacje` – organizations
- `Uzytkownicy` – users
- `Krainy_Geograficzne` – geographic regions
- `Gatunki` – species
- `Osobniki` – individual specimens
- `Dzialania` – environmental activities
- `Zadania` – tasks
- `Obserwacje` – field observations
- `Diagnozy` – health diagnoses

Many-to-many relationships are handled using junction tables such as:
- `Gatunki_Krainy`
- `Pobyt_Osobnika`

---

## Repository Structure

