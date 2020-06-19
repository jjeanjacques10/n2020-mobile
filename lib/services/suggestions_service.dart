import 'package:dio/dio.dart';
import 'package:n2020mobile/models/suggestions_model.dart';
import 'package:n2020mobile/services/service_config.dart';

class SuggestionService {
  static final String _endpoint = "https://api-n2020.herokuapp.com/";

  static final String _resource = 'suggestions';

  final ServiceConfig service = new ServiceConfig(_endpoint);

  Future<List<SuggestionModel>> findAll() async {
    List<SuggestionModel> lista = new List<SuggestionModel>();

    try {
      Response response = await service.create().get(_resource);
      if (response.statusCode == 200) {
        response.data.forEach(
          (value) {
            print(value);
            lista.add(
              SuggestionModel.fromJson(value),
            );
          },
        );
      }
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }

    return lista;
  }
}
