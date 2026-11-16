# proprietor

A Flutter property-management app organized around a layered architecture.

Structure

- core/
  - app-wide configuration, theming, shared primitives, and utilities
- features/
  - auth/
    - presentation/
    - application/
    - data/
  - settings/
    - presentation/
    - application/
    - data/
  - dashboard/
    - presentation/
  - properties/
    - presentation/
  - tenancy/
    - presentation/
  - payments/
    - presentation/

The app root remains the composition point for dependency wiring and route setup, while feature screens and state are exposed through feature-level entry points.
