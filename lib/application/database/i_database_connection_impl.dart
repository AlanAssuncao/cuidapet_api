// ignore_for_file: public_member_api_docs, sort_constructors_fi

import 'package:cuidapet_api/application/config/database_connection_configuration.dart';
import 'package:injectable/injectable.dart';
import 'package:mysql1/mysql1.dart';

import './i_database_connection.dart';

@LazySingleton(as: IDatabaseConnection)
class IDatabaseConnectionImpl implements IDatabaseConnection {
  final DatabaseConnectionConfiguration _configuration;

  IDatabaseConnectionImpl({
    required DatabaseConnectionConfiguration configuration,
  }) : _configuration = configuration;

  @override
  Future<MySqlConnection> openConnection() {
    return MySqlConnection.connect(ConnectionSettings(
      host: _configuration.host,
      port: _configuration.port,
      user: _configuration.user,
      password: _configuration.password,
      db: _configuration.databaseName,
    ));
  }
}
