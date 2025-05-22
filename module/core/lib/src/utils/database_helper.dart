/// A helper class to map SQLite data types with Dart types.
/// Contains helper methods for generating and managing queries.
class DatabaseHelper {
  /// Converts a Dart type to its corresponding SQLite data type string.
  static String getSqliteType(Type dartType) {
    if (dartType == int) {
      return 'INTEGER';
    } else if (dartType == String) {
      return 'TEXT';
    } else if (dartType == double) {
      return 'REAL';
    } else if (dartType == bool) {
      return 'INTEGER'; // SQLite doesn't have a boolean type; we store it as 0 or 1.
    } else {
      // For more complex types, consider using JSON or BLOB.
      return 'TEXT';
    }
  }

  /// Generates a CREATE TABLE SQL query for a given table.
  /// [tableName]: The name of the table to be created.
  /// [columns]: A Map containing column names and their Dart types. E.g., {'id': int, 'name': String}
  /// [primaryKey]: The name of the column to be used as the Primary Key.
  /// [autoIncrement]: Whether the Primary Key should AUTOINCREMENT.
  static String createTableSql(
    String tableName,
    Map<String, Type> columns,
    String primaryKey, {
    bool autoIncrement = true,
  }) {
    final columnDefinitions = <String>[];
    columns.forEach((name, type) {
      String columnSql = '$name ${getSqliteType(type)}';
      if (name == primaryKey) {
        columnSql += ' PRIMARY KEY';
        if (autoIncrement) {
          columnSql += ' AUTOINCREMENT';
        }
      }
      columnDefinitions.add(columnSql);
    });
    return 'CREATE TABLE $tableName (${columnDefinitions.join(', ')})';
  }

  /// Generates an ALTER TABLE SQL query to add a column to a table.
  /// [tableName]: The name of the table to which the column will be added.
  /// [columnName]: The name of the column to be added.
  /// [columnType]: The Dart type of the column to be added.
  /// [defaultValue]: The default value for the new column (optional).
  static String addColumnSql(String tableName, String columnName, Type columnType, {dynamic defaultValue}) {
    String sql = 'ALTER TABLE $tableName ADD COLUMN $columnName ${getSqliteType(columnType)}';
    if (defaultValue != null) {
      // Check if the default value needs to be quoted.
      if (columnType == String) {
        sql += ' DEFAULT \'${defaultValue.toString()}\'';
      } else {
        sql += ' DEFAULT $defaultValue';
      }
    }
    return sql;
  }
}
