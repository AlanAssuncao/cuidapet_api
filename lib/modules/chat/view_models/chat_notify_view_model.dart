// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cuidapet_api/application/helpers/request_mapping.dart';

enum NotificationUserType { user, supplier }

class ChatNotifyViewModel extends RequestMapping {
  late int chat;
  late String message;
  late NotificationUserType notificationUserType;

  ChatNotifyViewModel({
    required String dataRequest,
  }) : super(dataRequest);

  @override
  void map() {
    chat = data['chat'];
    message = data['message'];
    String notificationTypeRq = data['to'];
    notificationUserType = notificationTypeRq.toLowerCase() == 'u'
        ? NotificationUserType.user
        : NotificationUserType.supplier;
  }
}
