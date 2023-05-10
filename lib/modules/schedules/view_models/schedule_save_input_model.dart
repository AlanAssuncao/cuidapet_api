// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cuidapet_api/application/helpers/request_mapping.dart';

class ScheduleSaveInputModel extends RequestMapping {
  int userId;
  late DateTime scheduleDate;
  late String name;
  late String petName;
  late int supplierId;
  late List<int> services;

  ScheduleSaveInputModel({required this.userId, required String dataRequest})
      : super(dataRequest);

  @override
  void map() {
    scheduleDate = DateTime.parse(data['schedule_data']);
    supplierId = data['supplier_id'];
    services = List.castFrom<dynamic, int>(data['services']);
    name = data['name'];
    petName = data['pet_name'];
  }
}
