# AI Rules & Project Instructions (For Gemini, Cursor, Copilot, and any AI)

## Project Overview
This project is a Flutter application designed for discovering and tracking Movies and TV shows using TMDB API. It serves as an educational and production-grade implementation of Clean Architecture, demonstrating clean separation of concerns, state management, and repository pattern.

## Architecture
It uses Clean Architecture with feature modules divided into three standard layers:
- **Domain Layer**: The core business logic, independent of any external packages or other layers. Contains `entities` (plain Dart data objects), `usecases` (individual business flows extending `BaseUseCase`), and abstract `repository` definitions.
- **Data Layer**: The infrastructure/data logic. Contains `datasource` (remote/local API clients, e.g. `MoviesRemoteDatasource`), `model` (data models extending domain entities with JSON serialization), and concrete `repository` implementations that call the datasources and wrap returns/errors in `CustomEither`.
- **Presentation Layer**: The user interface. Contains `controller/bloc` (state management using `flutter_bloc`), `screens` (full pages), and `widgets` (modular component views).

Shared components and infrastructure helpers are organized inside the `lib/core` directory:
- `lib/core/enums`: Enums like `RequestState` (`loading`, `success`, `failure`).
- `lib/core/errors`: Error classes like `CustomException` and `ServerFailure` (with DioException parser).
- `lib/core/networking`: Api Service wrappers (`ApiServices`, `DioHandler`).
- `lib/core/services`: Dependency injection service locator registration (`ServiceLocator` using `get_it`).
- `lib/core/usecase`: Common base classes like `BaseUseCase` and `NoParams`.
- `lib/core/utils`: Shared constants and typedefs like `CustomEither` (`typedef CustomEither<R> = Future<Either<ServerFailure, R>>;`).

## Tech Stack
- **SDK**: Dart `^3.12.1` & Flutter
- **State Management**: `flutter_bloc` `^9.1.1`
- **Dependency Injection**: `get_it` `^9.2.1`
- **Network Client**: `dio` `^5.9.2` & `pretty_dio_logger` `^1.4.0`
- **Functional Programming**: `dartz` `^0.10.1` (for `Either` type)
- **Object Equality**: `equatable` `^2.0.8`
- **UI & Animations**: `animate_do` `^5.1.0`, `cached_network_image` `^3.4.1`, `carousel_slider` `^5.1.2`, `google_fonts` `^8.1.0`, `skeletonizer` `^2.1.3`, `cupertino_icons` `^1.0.8`
- **Linter**: `flutter_lints` `^6.0.0`

## Conventions
- **File Suffixes**:
  - Entity: `*_entities.dart`
  - Model: `*_model.dart`
  - Usecase: `*_usecase.dart` or custom action name (e.g. `get_movies_recommendation.dart`)
  - Repository Interface: `base_*_repo.dart` (e.g. `base_movies_repo.dart`)
  - Repository Implementation: `*_remote_repository.dart` or `*_repository.dart`
  - Remote Datasource Interface: `base_*_remote_datasource.dart` (or base inside same file)
  - Remote Datasource Implementation: `*_remote_datasource.dart`
  - Bloc files: `*_bloc.dart`, `*_event.dart`, `*_state.dart`
- **Code Patterns**:
  - Models MUST extend Entities (e.g. `class MoviesModel extends MoviesEntities`) and implement `fromJson`.
  - Repository methods and use cases MUST return `CustomEither<T>`.
  - Use cases must implement `BaseUseCase<T, Params>`. If no params are needed, use `NoParams`.
  - Blocs must extend `Bloc<Event, State>`, handling state changes via state `copyWith`.
  - Service Locator register commands are inside `lib/core/services/service_locator.dart`.

## Do
- Follow existing patterns in the codebase.
- Add file path comment at the top of every code block.
- Use const constructors where possible.
- Write unit tests for use cases and repositories.
- Register dependencies in `core/di/injection.dart` (or `lib/core/services/service_locator.dart`).
- Always maintain strict separation of layers. Keep domain models/usecases free from flutter imports or third-party JSON/Dio dependencies.
- Always use `CustomEither` typedef when returning results from data repositories and use cases.
- Always implement `Equatable` for entities, models, events, and states to optimize rebuilds and testability.
- Always use `RequestState` enum in bloc states to represent async state (`loading`, `success`, `failure`).
- Wrap HTTP/API calls inside try/catch blocks in repositories, catching `ServerFailure` (from dio exceptions) and returning them as `Left(ServerFailure(...))`.

## Don't
- Don't add new packages without asking first.
- Don't modify existing public APIs.
- Don't use print() — use Logger (or `log` from `dart:developer` / `PrettyDioLogger`).
- Don't use setState — use BLoC only.
- Don't catch generic Exception — catch specific types.
- Don't use dynamic type — always specify types.
- Never import Data layer files (models, datasources, api endpoints) or Presentation layer files (blocs, widgets) into the Domain layer.
- Never write network call logic directly inside Blocs or UI code. Always delegate network operations to Usecases, Repositories, and Datasources.
- Never use concrete repository implementations directly in UI or Blocs; always inject and refer to them via their abstract interface (e.g., `BaseMoviesRepository`).
- Avoid hardcoded API URLs or endpoints inside data sources. Keep them in `ApiConstance`.

