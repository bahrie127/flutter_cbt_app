import 'package:dartz/dartz.dart';
import 'package:flutter_cbt_app/data/models/responses/content_response_model.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import 'auth_local_datasource.dart';

class ContentRemoteDatasource {
  //get content by id
  Future<Either<String, ContentResponseModel>> getContentById(String id) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/contents?id=$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      return Right(ContentResponseModel.fromJson(response.body));
    } else {
      return const Left('get content gagal');
    }
  }
}
