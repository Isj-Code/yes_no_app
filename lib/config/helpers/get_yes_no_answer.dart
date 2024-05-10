import 'package:dio/dio.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

import '../../domain/entities/message.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    // * Pasamos la respuesta al modelo mapeado
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    // * Usamos el modelo mapeado para devolver nuestra entidad
    return yesNoModel.toMessageEntity();
  }
}
