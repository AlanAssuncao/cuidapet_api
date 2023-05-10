// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:cuidapet_api/application/logger/i_logger.dart';
import 'package:cuidapet_api/entities/supplier.dart';
import 'package:cuidapet_api/modules/supplier/view_models/create_supplier_user_view_model.dart';
import 'package:cuidapet_api/modules/user/view_models/supplier_update_input_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'package:cuidapet_api/modules/supplier/service/i_supplier_service.dart';

part 'supplier_controller.g.dart';

@Injectable()
class SupplierController {
  final ISupplierService service;
  final ILogger log;

  SupplierController({
    required this.service,
    required this.log,
  });

  @Route.get('/')
  Future<Response> findNearByMe(Request request) async {
    try {
      final lat = double.tryParse(request.url.queryParameters['lat'] ?? '');
      final lng = double.tryParse(request.url.queryParameters['lng'] ?? '');

      if (lat == null || lng == null) {
        return Response(
          400,
          body: jsonEncode({'message': 'Latitude e longitude obbrigatórios'}),
        );
      }

      final suppliers = await service.findNearByMe(lat, lng);
      final result = suppliers
          .map((s) => {
                'id': s.id,
                'name': s.name,
                'logo': s.logo,
                'distance': s.distance,
                'category': s.categoryId,
              })
          .toList();

      return Response.ok(jsonEncode(result));
    } catch (e, s) {
      log.error('Erro ao buscar fornecedores perto de mim', e, s);
      return Response.internalServerError(
          body: jsonEncode(
              {'message': 'Erro ao buscar fornecedores perto de mim'}));
    }
  }

  @Route.get('/<id|[0-9]+>')
  Future<Response> findById(Request request, String id) async {
    final supplier = await service.findById(int.parse(id));

    if (supplier == null) {
      return Response.ok(jsonEncode({}));
    }

    return Response.ok(_supplierMapper(supplier));
  }

  @Route.get('/<supplierId|[0-9]+>/services')
  Future<Response> findServicesBySupplierId(
      Request request, String supplierId) async {
    try {
      final supplierServices =
          await service.findServicesBySupplier(int.parse(supplierId));

      return Response.ok(jsonEncode(supplierServices
          .map((e) => {
                'id': e.id,
                'supplier_id': e.supplierId,
                'name': e.name,
                'price': e.price,
              })
          .toList()));
    } catch (e, s) {
      log.error('Erro ao buscar servicos', e, s);
      return Response.internalServerError(
          body: jsonEncode({'message': 'Erro ao buscar servicos'}));
    }
  }

  @Route.get('/user')
  Future<Response> checkUserExists(Request request) async {
    final email = request.url.queryParameters['email'];
    if (email == null) {
      return Response(400, body: jsonEncode({'message': 'E-mail obrigatório'}));
    }

    final isEmailExists = await service.checkUserEmailExists(email);
    return isEmailExists ? Response(200) : Response(204);
  }

  @Route.post('/user')
  Future<Response> createNewUser(Request request) async {
    try {
      final model = CreateSupplierUserViewModel(await request.readAsString());
      await service.createUserSupplier(model);

      return Response.ok(jsonEncode({}));
    } catch (e, s) {
      log.error('Erro ao cadastrar um novo fornecedor e usuário', e, s);
      return Response.internalServerError(
          body: jsonEncode(
              {'message': 'Erro ao cadastrar um novo fornecedor e usuário'}));
    }
  }

  @Route.put('/')
  Future<Response> update(Request request) async {
    try {
      final supplier = int.tryParse(request.headers['supplier'] ?? "");

      if (supplier == null) {
        return Response(400,
            body: jsonEncode(
                {'message': 'código do fornecedor não pode ser nulo'}));
      }

      final model = SupplierUpdateInputModel(
        supplierId: supplier,
        dataRequest: await request.readAsString(),
      );

      final supplierResponse = await service.update(model);

      return Response.ok(_supplierMapper(supplierResponse));
    } catch (e, s) {
      log.error('Erro ao atualizar fornecedor', e, s);
      return Response.internalServerError();
    }
  }

  String _supplierMapper(Supplier supplier) {
    return jsonEncode({
      'id': supplier.id,
      'name': supplier.name,
      'logo': supplier.logo,
      'address': supplier.address,
      'phone': supplier.phone,
      'lat': supplier.lat,
      'lng': supplier.lng,
      'category': {
        'id': supplier.category?.id,
        'name': supplier.category?.name,
        'type': supplier.category?.type,
      }
    });
  }

  Router get router => _$SupplierControllerRouter(this);
}
