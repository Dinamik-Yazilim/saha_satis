import 'package:core/core.dart';
import 'package:core/src/repositories/base_repository.dart';

/// We directly access the global singleton instance of DatabaseProvider.
/// This instance will have already been initialized in main.dart.
final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

/// A generic repository for any data of type BaseModel.
/// This class eliminates the need to create a separate repository class for each model.
///
/// Type T must extend BaseModel and have a `fromMap` factory constructor
/// that can create itself from a Map.
class GenericRepository<T extends BaseModel> extends BaseRepository<T> {
  // We hold a reference to the fromMap factory constructor of type `T`.
  // This will be used when implementing BaseModel's abstract fromMap method.
  final T Function(Map<String, dynamic> map) _concreteFromMapFactory;

  /// The new constructor for GenericRepository.
  /// It no longer needs to directly receive DatabaseProvider.
  /// However, we must explicitly specify the model's `fromMap` factory and table name,
  /// because Dart's ability to directly create instances with generic types is limited.
  GenericRepository({
    required T Function(Map<String, dynamic> map) fromMapFactory,
    required String tableName, // We get the table name externally
  }) : _concreteFromMapFactory = fromMapFactory,
       super(
         _databaseProvider, // We use the global DatabaseProvider instance
         tableName, // We pass the table name from the constructor to BaseRepository
       );

  /// Implements BaseRepository's abstract `fromMap` method.
  /// It creates an object of type T using the factory function provided in the constructor.
  @override
  T fromMap(Map<String, dynamic> map) {
    return _concreteFromMapFactory(map);
  }
}
