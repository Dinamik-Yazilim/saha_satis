import 'package:gen/gen.dart';

abstract class UserOperation {
  Future<List<UserData>> getUsers();
}
