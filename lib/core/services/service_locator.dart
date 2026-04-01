import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_client.dart';
import 'storage_service.dart';
import 'package:insulin95/features/recipes/data/datasources/recipes_remote_datasource.dart';
import 'package:insulin95/features/recipes/data/datasources/recipes_local_datasource.dart';
import 'package:insulin95/features/recipes/data/repositories/recipes_repository_impl.dart';
import 'package:insulin95/features/recipes/domain/repositories/recipes_repository.dart';
import 'package:insulin95/features/recipes/domain/usecases/get_recipes.dart';
import 'package:insulin95/features/recipes/domain/usecases/get_categories.dart';
import 'package:insulin95/features/recipes/domain/usecases/search_recipes.dart';
import 'package:insulin95/features/recipes/logic/recipes_bloc.dart';


/// Global service locator instance
/// Used for dependency injection throughout the app
final GetIt sl = GetIt.instance;

/// Initialize all service dependencies
/// Call this method before running the app
Future<void> init() async {
  // Core Services
  await _initCoreServices();
  
  // External Services
  await _initExternalServices();
  
  // Data Services
  await _initDataServices();
}

/// Initialize core utilities and basic services
Future<void> _initCoreServices() async {
  // SharedPreferences for local storage
  // Lazy singleton - created only when first accessed
  sl.registerLazySingleton<SharedPreferences>(
    () => throw UnimplementedError('SharedPreferences not initialized. Call init() first.'),
  );
  
  // Initialize SharedPreferences synchronously
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.unregister<SharedPreferences>();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  
  // Storage Service wrapper for type-safe local storage
  // Lazy singleton - uses the SharedPreferences instance
  sl.registerLazySingleton<StorageService>(() => StorageService(sl()));
}

/// Initialize external service clients
Future<void> _initExternalServices() async {
  // HTTP Client for API calls
  // Lazy singleton - single instance for the app lifecycle
  sl.registerLazySingleton<http.Client>(() => http.Client());
  
  // API Client wrapper with consistent configuration
  // Lazy singleton - uses the shared HTTP client
  sl.registerLazySingleton<ApiClient>(() => ApiClient(sl()));
  
  // Firebase Auth instance
  // Lazy singleton - Firebase maintains its own singleton internally
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
}

/// Initialize data layer services
Future<void> _initDataServices() async {
  // Recipes Feature Data Layer
  // Remote data source
  sl.registerLazySingleton<RecipesRemoteDataSource>(
    () => RecipesRemoteDataSourceImpl(sl()),
  );
  
  // Local data source
  sl.registerLazySingleton<RecipesLocalDataSource>(
    () => RecipesLocalDataSourceImpl(sl()),
  );
  
  // Repository implementation
  sl.registerLazySingleton<RecipesRepository>(
    () => RecipesRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );
  
  // Use cases
  sl.registerLazySingleton<GetRecipes>(
    () => GetRecipes(sl()),
  );
  
  sl.registerLazySingleton<GetCategories>(
    () => GetCategories(sl()),
  );
  
  sl.registerLazySingleton<SearchRecipes>(
    () => SearchRecipes(sl()),
  );
  
  // Recipes BLoC
  sl.registerFactory<RecipesBloc>(
    () => RecipesBloc(
      getRecipes: sl(),
      getCategories: sl(),
      searchRecipes: sl(),
    ),
  );
}

/// Clean up all registered services
/// Useful for testing or app restart
Future<void> reset() async {
  await sl.reset();
}

/// Check if a service is registered
bool isRegistered<T extends Object>() {
  return sl.isRegistered<T>();
}
