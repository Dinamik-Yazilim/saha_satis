import 'package:flutter/material.dart';
import 'package:core/core.dart';

import 'database/migrations.dart';
import 'models/user_model.dart';

// ---
// Global Declarations
// We create the MigrationManager once here and provide it with our list of migration classes.
final MigrationManager _migrationManager = MigrationManager(
  migrations: [
    MigrationV1(),
    MigrationV2(),
    MigrationV3(), // When a new migration is added, just add it here!
  ],
);

// We provide the created _migrationManager when initializing DatabaseProvider.
// DatabaseProvider will automatically get the database version from _migrationManager.
final DatabaseProvider databaseProvider = DatabaseProvider(migrationManager: _migrationManager);

// ---
// main Function
void main() async {
  // We need to ensure that Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // We initialize the database before the application starts.
  // This establishes the database connection and runs any pending migrations.
  try {
    await databaseProvider.database;
    AppLogger.info('Database successfully initialized and migrations applied.');
  } catch (e, stackTrace) {
    AppLogger.fatal('Database error during application startup: $e', e, stackTrace);
    // If the database cannot be initialized, we could show an error screen here or close the app.
    // For now, only the error is logged, and the app still starts (DB operations will fail).
  }

  // Start the Flutter application
  runApp(const MyApp());
}

// ---
// MyApp Widget
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// ---
// _MyAppState Class
class _MyAppState extends State<MyApp> {
  // We initialize GenericRepository with the UserModel type.
  // Since it directly accesses databaseProvider, no need to pass it in the constructor.
  late GenericRepository<UserModel> _userRepository;
  List<UserModel> _users = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // When initializing GenericRepository,
    // we pass the model's static table name (_staticTableName) and the fromMap factory method.
    _userRepository = GenericRepository<UserModel>(
      tableName: UserModel.staticTableName, // Static table name from UserModel
      fromMapFactory: UserModel.fromMap, // UserModel's fromMap factory
    );
    _loadUsers(); // Load users at startup
  }

  /// Loads users from the database with flexible parameters.
  Future<void> _loadUsers({int? limit, int? offset, String? orderBy, String? where, List<Object?>? whereArgs}) async {
    setState(() {
      _isLoading = true; // Start loading state
    });
    try {
      _users = await _userRepository.getAll(
        limit: limit,
        offset: offset,
        orderBy: orderBy,
        where: where,
        whereArgs: whereArgs,
      );
      AppLogger.info('Users loaded: ${_users.length} items.');
    } catch (e, stackTrace) {
      AppLogger.error('Error occurred while loading users: $e', e, stackTrace);
    } finally {
      setState(() {
        _isLoading = false; // End loading state
      });
    }
  }

  /// Adds a new user.
  Future<void> _addUser() async {
    final newUser = UserModel(
      name: 'New User ${DateTime.now().millisecond}',
      age: 25 + DateTime.now().second % 10, // Random age
      email: 'user${DateTime.now().millisecond}@example.com',
      isActive: true,
      gender: DateTime.now().second % 2 == 0 ? 'male' : 'female', // Random gender
    );
    try {
      await _userRepository.save(newUser); // Save (add) the user
      AppLogger.info('New user added: ${newUser.name}');
      await _loadUsers(); // Refresh the list
    } catch (e, stackTrace) {
      AppLogger.error('Error occurred while adding user: $e', e, stackTrace);
    }
  }

  /// Updates an existing user.
  Future<void> _updateUser(UserModel user) async {
    user.age = user.age + 1; // Increment age by one
    user.name = '${user.name} (Updated)';
    user.isActive = !user.isActive; // Toggle active status
    try {
      await _userRepository.save(user); // Save (update) the user
      AppLogger.info('User updated: ${user.name}');
      await _loadUsers(); // Refresh the list
    } catch (e, stackTrace) {
      AppLogger.error('Error occurred while updating user: $e', e, stackTrace);
    }
  }

  /// Deletes the user with the specified ID.
  Future<void> _deleteUser(int id) async {
    try {
      await _userRepository.delete(id); // Delete the user
      AppLogger.info('User deleted, ID: $id');
      await _loadUsers(); // Refresh the list
    } catch (e, stackTrace) {
      AppLogger.error('Error occurred while deleting user: $e', e, stackTrace);
    }
  }

  /// Clears all users.
  Future<void> _clearAllUsers() async {
    try {
      await _userRepository.deleteAll(); // Delete all users
      AppLogger.info('All users cleared.');
      await _loadUsers(); // Refresh the list
    } catch (e, stackTrace) {
      AppLogger.error('Error occurred while clearing all users: $e', e, stackTrace);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OkeanosCore Example Application',
      theme: ThemeData(primarySwatch: Colors.blueGrey, visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('OkeanosCore Example'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: 'Refresh Users (by age descending)',
              onPressed: () => _loadUsers(orderBy: 'age DESC'),
            ),
            IconButton(
              icon: const Icon(Icons.download),
              tooltip: 'First 5 Users (by name)',
              onPressed: () => _loadUsers(limit: 5, orderBy: 'name ASC'),
            ),
            IconButton(icon: const Icon(Icons.delete_sweep), tooltip: 'Delete All Users', onPressed: _clearAllUsers),
          ],
        ),
        body:
            _isLoading
                ? const Center(child: CircularProgressIndicator()) // Show while loading
                : _users.isEmpty
                ? const Center(child: Text('No users yet. Press the add button!')) // Show if no users
                : ListView.builder(
                  itemCount: _users.length,
                  itemBuilder: (context, index) {
                    final user = _users[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      elevation: 3,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: user.isActive ? Colors.green : Colors.red,
                          child: Text(user.age.toString(), style: const TextStyle(color: Colors.white)),
                        ),
                        title: Text(user.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          'Email: ${user.email}\nActive: ${user.isActive ? "Yes" : "No"}\nGender: ${user.gender}',
                        ), // Gender is also displayed
                        isThreeLine: true,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              tooltip: 'Edit',
                              onPressed: () => _updateUser(user),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              tooltip: 'Delete',
                              onPressed: () => _deleteUser(user.id!),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _addUser,
          label: const Text('Add User'),
          icon: const Icon(Icons.person_add),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
