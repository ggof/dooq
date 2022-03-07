library dooq.generator.generator_config;

import 'package:postgres/postgres.dart';

class GeneratorConfig {
  final PostgreSQLConnection conn;
  final String output;
  final String library;

  GeneratorConfig._(this.conn, this.output, this.library);

  factory GeneratorConfig.fromArgs({
    required String host,
    required int port,
    required String database,
    required String output,
    required String library,
    String? username,
    String? password,
  }) =>
      GeneratorConfig._(
        PostgreSQLConnection(
          host,
          port,
          database,
          password: password,
          username: username,
        ),
        output,
        library,
      );
}
