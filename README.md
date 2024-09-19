
# Dummy Products - Option 2

This is a Flutter-based mobile application that allows users to browse a list of products, view product details, search for products, and mark favorites. The app uses mock data to simulate API calls and includes infinite scrolling and search functionality.

## State Management

The app uses **Cubit** for managing the state of the app:

- **ProductCubit**: Manages the product listing, searching, and loading more products (infinite scrolling), toggle favorites, load favorites.

## Architecture

The app follows a simple **Clean Architecture** pattern, ensuring modularity and separation of concerns.

### Layers:

- **Presentation Layer**: Handles the UI components, cubit, state, including product list screen and product details screens.
- **Domain Layer**: Contains the business logic and core entities (e.g., ProductEntity).
- **Data Layer**: Responsible for fetching data from APIs, currently using mock APIs for testing purposes.

## Folder Structure

```bash
lib/
├── data/                    # Data models and repositories
├── domain/                  # Business entities and use cases
├── presentation/            # Cubit, State with UI screens and widgets
└── main.dart                # Main app entry point
```

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/sant00sh/dummy_products.git
   ```
   
2. Install dependencies:
   ```bash
   Use latest Flutter SDK version (using 3.24.3)
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

---
