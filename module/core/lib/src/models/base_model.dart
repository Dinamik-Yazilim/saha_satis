/// Base interface for database models.
/// Every database model must implement this interface.
abstract class BaseModel {
  /// The ID of the model. In SQLite, the PRIMARY KEY is typically an integer ID.
  dynamic id;

  BaseModel({this.id});

  /// Converts the model to a [Map<String, dynamic>] structure.
  Map<String, dynamic> toMap();

  /// Creates a model object from a [Map<String, dynamic>] structure.
  /// This factory constructor is used for BaseModel itself.
  BaseModel.fromMap(Map<String, dynamic> map) {
    id = map['id'] as dynamic;
  }

  /// Returns the name of the database table corresponding to this model.
  String get tableName;

  /// A factory method that creates an object of this model type from a [Map<String, dynamic>] structure.
  /// This is required for GenericRepository to correctly instantiate the model.
  BaseModel fromMap(Map<String, dynamic> map);
}
