import 'package:dio/dio.dart';
import 'package:n2020mobile/models/users_model.dart';
import 'package:n2020mobile/services/service_config.dart';

class UserService {
  static final String _endpoint = "https://api-n2020.herokuapp.com/";

  static final String _resource = "user";

  final ServiceConfig service = new ServiceConfig(_endpoint);

  Future<int> create(UserModel userModel) async {
    try {
      Response response = await service.create().post(
            _resource,
            data: userModel.toJson(),
            options: Options(
                contentType: 'application/json',
                method: 'post',
                responseType: ResponseType.json,
                receiveTimeout: 100000,
                followRedirects: false,
                validateStatus: (status) {
                  return status < 500;
                }),
          );

      if (response.statusCode == 201) {
        var retorno = (response.data["id"] is String)
            ? int.parse(response.data["id"])
            : response.data["id"];
        return retorno;
      } else {
        return 1;
      }
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }
  }

  Future<UserModel> getById(int id) async {
    try {
      String endpoint = _resource + "/" + id.toString();
      Response response = await service.create().get(endpoint);

      if (response.statusCode == 200) {
        var retorno = UserModel.fromJson(response.data);
        return retorno;
      } else {
        return null;
      }
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }
  }

  Future<UserModel> getLogin(String email, String password) async {
    try {
      String endpoint = _resource + "/login";
      Response response = await service.create().post(
            endpoint,
            data: {"email": email, "password": password},
            options: Options(
                contentType: 'application/json',
                method: 'post',
                responseType: ResponseType.json,
                receiveTimeout: 100000,
                followRedirects: false,
                validateStatus: (status) {
                  return status < 500;
                }),
          );

      if (response.statusCode == 200) {
        if (response.data[0].length != 0) {
          var retorno = UserModel.fromJson(response.data[0]);
          return retorno;
        } else {
          return null;
        }
      }
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        getLogin(email, password);
      }
      if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
        getLogin(email, password);
      }
    }
  }

  Future<int> update(UserModel userModel) async {
    try {
      String endpoint = _resource + "/" + userModel.id.toString();

      Response response = await service.create().put(
            endpoint,
            data: userModel.toJson(),
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
}
