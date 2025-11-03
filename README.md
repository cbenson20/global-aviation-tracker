# Global Aviation Tracker

This Ruby on Rails project collects and displays global aviation data — including airports, airlines, and flight routes — from the **OpenFlights public dataset**.

Users can:

- Browse and search airports by name, city, or country
- Filter results and view airline connections
- Navigate between related data (airports, airlines, and routes)
- See paginated results and clean Bootstrap-based layouts

### Features

- Built with **Ruby on Rails 8**
- **ActiveRecord associations** connecting Airlines, Airports, and Routes
- **Search and filter** functionality
- **Pagination** with Kaminari
- **Bootstrap grid layout** for responsive design
- Seed data loaded from three CSV datasets

### Data Source

OpenFlights Datasets:

- [`airports.dat`](https://raw.githubusercontent.com/jpatokal/openflights/master/data/airports.dat)
- [`airlines.dat`](https://raw.githubusercontent.com/jpatokal/openflights/master/data/airlines.dat)
- [`routes.dat`](https://raw.githubusercontent.com/jpatokal/openflights/master/data/routes.dat)

### Setup Instructions

1. Clone this repository
   ```bash
   git clone https://github.com/cbenson20/global-aviation-tracker.git
   cd global-aviation-tracker
   ```
