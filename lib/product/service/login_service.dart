import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';

import 'interface/authenction_operation.dart';
import 'manager/project_service_path.dart';

final class LoginService extends AuthenticationOperation {
  LoginService(INetworkManager<EmptyModel> networkManager) : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;

  @override
  Future<List<User>> users() async {
    final response = await _networkManager.send<User, List<User>>(
      ProductServicePath.usersV1.value,
      parseModel: User(),
      method: RequestType.GET,
    );
    return response.data ?? [];
  }
}
