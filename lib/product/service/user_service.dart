import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';

import 'interface/user_operation.dart';
import 'manager/project_service_path.dart';

class UserService extends UserOperation {
  UserService(INetworkManager<EmptyModel> networkManager) : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;

  @override
  Future<List<UserData>> getUsers() async {
    final response = await _networkManager.send<User, User>(
      ProductServicePath.usersV1.value,
      parseModel: User(),
      options: Options(headers: {'x-api-key': 'reqres-free-v1'}),
      method: RequestType.GET,
    );
    return response.data?.data ?? [];
  }
}
