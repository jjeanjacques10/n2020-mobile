import 'package:dio/dio.dart';
import 'package:n2020mobile/models/suggestions_model.dart';
import 'package:n2020mobile/services/service_config.dart';

class SuggestionService {
  static final String _endpoint =
      "https://api-n2020.herokuapp.com/";

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

  Future<int> create(SuggestionModel suggestionModel) async {
    try {
      Response response = await service.create().post(
            _resource,
            data: suggestionModel.toJson(),
          );

      if (response.statusCode == 201) {
        var retorno = (response.data["id"] is String)
            ? int.parse(response.data["id"])
            : response.data["id"];
        return retorno;
      }
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }
  }

  Future<SuggestionModel> getById(int id) async {
    try {
      String endpoint = _resource + "/" + id.toString();
      Response response = await service.create().get(endpoint);

      if (response.statusCode == 200) {
        var retorno = SuggestionModel.fromJson(response.data);
        return retorno;
      }
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }
  }

  Future<int> update(SuggestionModel suggestionModel) async {
    try {
      String endpoint = _resource + "/" + suggestionModel.id.toString();

      Response response = await service.create().put(
            endpoint,
            data: suggestionModel.toJson(),
          );

      var retorno = (response.data["id"] is String)
          ? int.parse(response.data["id"])
          : response.data["id"];
      return retorno;
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }
  }

  Future<void> delete(SuggestionModel suggestionModel) async {
    try {
      String endpoint = _resource + "/" + suggestionModel.id.toString();

      Response response = await service.create().delete(
            endpoint,
          );

      if (response.statusCode != 200) {
        throw Exception("Não foi possível excluir o recurso!");
      }
    } catch (error) {
      throw error;
    }
  }
}
