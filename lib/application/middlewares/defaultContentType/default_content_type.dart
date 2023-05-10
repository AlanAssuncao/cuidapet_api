// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shelf/src/request.dart';
import 'package:shelf/src/response.dart';

import 'package:cuidapet_api/application/middlewares/middlewares.dart';

class DefaultContentType extends Middlewares {
  final String contentType;

  DefaultContentType(
    this.contentType,
  );

  @override
  Future<Response> execute(Request request) async {
    final response = await innerHandler(request);

    return response.change(headers: {'content-type': contentType});
  }
}
