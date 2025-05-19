import 'dart:io';

import 'package:dinamik10_pos/product/init/config/app_environment.dart';
import 'package:dinamik10_pos/product/service/manager/product_service_manager.dart';
import 'package:dinamik10_pos/product/service/manager/project_service_path.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gen/gen.dart';

import 'package:vexana/vexana.dart';

void main() {
  late final ProductNetworkManager manager;
  setUp(() {
    AppEnvironment.general();
    manager = ProductNetworkManager.base();
  });
  test('get users items from api', () async {
    final response = await manager.send<User, User>(
      ProductServicePath.usersV1.value,
      parseModel: User(),
      options: Options(headers: {'x-api-key': 'reqres-free-v1'}),
      method: RequestType.GET,
    );

    expect(response.data, isNotNull);
  });

  test('get users items from api with error', () async {
    manager.listenErrorState(
      onErrorStatus: (value) {
        if (value == HttpStatus.unauthorized) {}
        expect(value, isNotNull);
      },
    );
    final response = await manager.send<User, List<User>>(
      ProductServicePath.usersV1.value,
      parseModel: User(),
      method: RequestType.GET,
    );

    expect(response.data, null);
  });
}
