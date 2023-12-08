import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../models/responses/materi_response_model.dart';
import 'auth_local_datasource.dart';

class MateriRemoteDatasource {
  //get content by id
  Future<Either<String, MateriResponseModel>> getAllMateri() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/materis'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      return Right(MateriResponseModel.fromJson(response.body));
    } else {
      return const Left('get content gagal');
    }
  }
}
