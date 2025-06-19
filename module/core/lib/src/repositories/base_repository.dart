import 'package:core/src/utils/exceptions.dart';
import 'package:sqflite/sqflite.dart' hide DatabaseException;
import 'package:core/core.dart'; // For AppLogger and CustomDatabaseException

/// A base abstract class for all model repositories.
abstract class BaseRepository<T extends BaseModel> {
  final DatabaseProvider databaseProvider;
  final String tableName;

  BaseRepository(this.databaseProvider, this.tableName);

  /// Creates a model object from a [Map<String, dynamic>] structure.
  /// This method must be implemented by derived classes.
  T fromMap(Map<String, dynamic> map);

  /// Converts the model to a [Map<String, dynamic>] structure.
  /// Since the `toMap` method is already defined in `BaseModel`, there's no need to
  /// define it again in `BaseRepository`. You can directly call `model.toMap()`.
  Map<String, dynamic> toMap(T model) => model.toMap();

  /// Inserts a new record into the database or updates an existing one.
  Future<T> save(T model) async {
    final db = await databaseProvider.database;
    try {
      if (model.id == null) {
        // New record: Insert
        final id = await db.insert(tableName, toMap(model), conflictAlgorithm: ConflictAlgorithm.replace);
        model.id = id;
        AppLogger.debug('New record added to $tableName table, ID: $id');
      } else {
        // Existing record: Update
        final rowsAffected = await db.update(
          tableName,
          toMap(model),
          where: 'id = ?',
          whereArgs: [model.id],
          conflictAlgorithm: ConflictAlgorithm.replace,
        );

        if (rowsAffected > 0) {
          AppLogger.debug('Record with ID: ${model.id} updated in $tableName table.');
        } else {
          AppLogger.warning('Record with ID: ${model.id} not found in $tableName table, update failed.');
          throw DatabaseException('Record to be updated not found.');
        }
      }
      return model;
    } catch (e, stackTrace) {
      AppLogger.error('Error occurred while saving the record: $e', e, stackTrace);
      throw DatabaseException('Could not save the record: $e');
    }
  }

  /// Retrieves the record with the specified ID.
  Future<T?> getById(dynamic id) async {
    final db = await databaseProvider.database;
    try {
      final List<Map<String, dynamic>> maps = await db.query(tableName, where: 'id = ?', whereArgs: [id]);
      if (maps.isNotEmpty) {
        AppLogger.debug('Record with ID: $id retrieved from $tableName table.');
        return fromMap(maps.first);
      }
      AppLogger.debug('Record with ID: $id not found in $tableName table.');
      return null;
    } catch (e, stackTrace) {
      AppLogger.error('Error occurred while retrieving record by ID: $e', e, stackTrace);
      throw DatabaseException('Could not retrieve the record: $e');
    }
  }

  /// Retrieves all records. It's more flexible with the newly added parameters.
  ///
  /// [columns]: List of columns to retrieve (all columns if null).
  /// [where]: SQL string for the WHERE clause (e.g., 'name = ? AND age > ?').
  /// [whereArgs]: Values for the '?' placeholders in the WHERE clause.
  /// [limit]: Limit the number of records to retrieve.
  /// [offset]: Starting point for records (for pagination).
  /// [orderBy]: SQL string for ordering (e.g., 'name ASC, age DESC').
  /// [distinct]: True/false for unique results.
  /// [groupBy]: SQL string for the GROUP BY clause.
  /// [having]: SQL string for the HAVING clause.
  Future<List<T>> getAll({
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    int? limit,
    int? offset,
    String? orderBy,
    bool? distinct,
    String? groupBy,
    String? having,
  }) async {
    final db = await databaseProvider.database;
    try {
      final List<Map<String, dynamic>> maps = await db.query(
        tableName,
        columns: columns,
        where: where,
        whereArgs: whereArgs,
        limit: limit,
        offset: offset,
        orderBy: orderBy,
        distinct: distinct,
        groupBy: groupBy,
        having: having,
      );
      AppLogger.debug('${maps.length} records retrieved from $tableName table.');
      return List.generate(maps.length, (i) => fromMap(maps[i]));
    } catch (e, stackTrace) {
      AppLogger.error('Error occurred while retrieving all records: $e', e, stackTrace);
      throw DatabaseException('Could not retrieve records: $e');
    }
  }

  /// Retrieves records that match the specified conditions. (Almost identical to `getAll` but can be more specific).
  Future<List<T>> query({
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    int? limit,
    int? offset,
    String? orderBy,
    bool? distinct,
    String? groupBy,
    String? having,
  }) async {
    return await getAll(
      columns: columns,
      where: where,
      whereArgs: whereArgs,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      distinct: distinct,
      groupBy: groupBy,
      having: having,
    );
  }

  /// Deletes the record with the specified ID.
  Future<int> delete(dynamic id) async {
    final db = await databaseProvider.database;
    try {
      final rowsAffected = await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
      if (rowsAffected > 0) {
        AppLogger.debug('Record with ID: $id deleted from $tableName table.');
      } else {
        AppLogger.warning('Record with ID: $id not found in $tableName table, deletion failed.');
      }
      return rowsAffected;
    } catch (e, stackTrace) {
      AppLogger.error('Error occurred while deleting the record: $e', e, stackTrace);
      throw DatabaseException('Could not delete the record: $e');
    }
  }

  /// Deletes all records.
  Future<int> deleteAll() async {
    final db = await databaseProvider.database;
    try {
      final rowsAffected = await db.delete(tableName);
      AppLogger.debug('All records deleted from $tableName table ($rowsAffected records).');
      return rowsAffected;
    } catch (e, stackTrace) {
      AppLogger.error('Error occurred while deleting all records: $e', e, stackTrace);
      throw DatabaseException('Could not delete all records: $e');
    }
  }

  /// Returns the count of records that match the specified conditions.
  Future<int?> count({String? where, List<Object?>? whereArgs, bool? distinct, String? groupBy, String? having}) async {
    final db = await databaseProvider.database;
    try {
      final List<Map<String, Object?>> result = await db.query(
        tableName,
        columns: ['COUNT(*)'],
        where: where,
        whereArgs: whereArgs,
        distinct: distinct,
        groupBy: groupBy,
        having: having,
      );
      if (result.isNotEmpty && result.first.values.isNotEmpty) {
        return result.first.values.first as int?;
      }
      return 0;
    } catch (e, stackTrace) {
      AppLogger.error('Error occurred while getting record count: $e', e, stackTrace);
      throw DatabaseException('Could not get record count: $e');
    }
  }

  /// Executes a raw SQL query and returns the results.
  Future<List<Map<String, dynamic>>> rawQuery(String sql, [List<Object?>? arguments]) async {
    final db = await databaseProvider.database;
    try {
      final result = await db.rawQuery(sql, arguments);
      AppLogger.debug('Raw SQL query executed: $sql');
      return result;
    } catch (e, stackTrace) {
      AppLogger.error('Error occurred while executing raw SQL query: $e', e, stackTrace);
      throw DatabaseException('Could not execute raw query: $e');
    }
  }

  /// Executes a raw SQL update/insert/delete query and returns the number of affected rows.
  Future<int> rawUpdate(String sql, [List<Object?>? arguments]) async {
    final db = await databaseProvider.database;
    try {
      final result = await db.rawUpdate(sql, arguments);
      AppLogger.debug('Raw SQL update executed: $sql ($result rows affected).');
      return result;
    } catch (e, stackTrace) {
      AppLogger.error('Error occurred while executing raw SQL update: $e', e, stackTrace);
      throw DatabaseException('Could not execute raw update: $e');
    }
  }
}
