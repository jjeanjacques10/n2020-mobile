import 'package:dio/dio.dart';
import 'package:n2020mobile/models/chat_message.dart';
import 'package:n2020mobile/services/service_config.dart';

class ChatMessageService {
  static final String _endpoint = "https://api-n2020.herokuapp.com/";

  static final String _resource = 'messages';

  final ServiceConfig service = new ServiceConfig(_endpoint);

  Future<List<ChatMessage>> findAll() async {
    List<ChatMessage> lista = new List<ChatMessage>();

    try {
      Response response = await service.create().get(_resource);
      if (response.statusCode == 200) {
        response.data.forEach(
          (value) {
            print(value);
            lista.add(
              ChatMessage.fromJson(value),
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

  Future<int> create(ChatMessage suggestionModel) async {
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

  Future<List<ChatMessage>> getMessagesUserById(int id) async {
    List<ChatMessage> lista = new List<ChatMessage>();

    try {
      String endpoint = _resource + "/" + id.toString();
      Response response = await service.create().get(endpoint);

      if (response.statusCode == 200) {
        response.data.forEach(
          (value) {
            print(value);
            lista.add(
              ChatMessage.fromJson(value),
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

  Future<int> update(ChatMessage suggestionModel) async {
    try {
      String endpoint = _resource + "/" + suggestionModel.name.toString();

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

  Future<void> delete(ChatMessage suggestionModel) async {
    try {
      String endpoint = _resource + "/" + suggestionModel.name.toString();

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
