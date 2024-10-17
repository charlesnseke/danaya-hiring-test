
import 'dart:convert';

import 'package:testtech/src/common/error/data_state.dart';


import '../../../common/utils/api/api_endpoint.dart';
import '../../../common/utils/api/api_service.dart';
import '../../../common/utils/api/error_handler.dart';
import '../../core/services/commands/person_command.dart';
import '../../core/services/dto/dto_person.dart';
import '../../core/services/port/output/person_repository.dart';

class PersonRepositoryImpl implements PersonRepository{
  PersonRepositoryImpl({
    required ApiService apiService
  }) : _apiService = apiService ;
  final ApiService _apiService;

  static const String _endpoint = '${ApiEndpoint.baseUrlPublic}';

  @override
  Future<DataState<DtoPerson>> createPerson({required CommandPerson command}) async {
    try {
      Uri uri = Uri.parse('$_endpoint/persons');

      var body = json.encode(
          command
      );
      var result = await _apiService.post(secure: true, uri: uri, body: body);
      print("status code ==> $result['status']");
      if(result['status'] == 200){
        print("2000");
        return DataSuccess(DtoPerson.fromJson(result['data']));
      }
      return DataFailed(result["message"]);

    } catch (err) {
      print(ErrorHandler.handleCaughtError(err));
      return DataFailed(ErrorHandler.handleCaughtError(err));
    }
  }

  @override
  Future<DataState<List<DtoPerson>>> getListPerson() async {
    try {
      Uri uri = Uri.parse('$_endpoint/persons');

      var result = await _apiService.get(secure: false, uri: uri);

      List<DtoPerson> dto = List<DtoPerson>.from(result['data'].map((it)=>DtoPerson.fromJson(it)).toList());

      return DataSuccess(dto);
    } catch (err) {
      return DataFailed(ErrorHandler.handleCaughtError(err));
    }
  }

  @override
  Future<DataState<double>> verifyPerson({required CommandPerson command}) async {
    try {
      Uri uri = Uri.parse('$_endpoint/persons/verify');

      var body = json.encode(
          command
      );
      var result = await _apiService.post(secure: true, uri: uri, body: body);

      return DataSuccess(result['data']);
    } catch (err) {
      print(ErrorHandler.handleCaughtError(err));
      return DataFailed(ErrorHandler.handleCaughtError(err));
    }
  }


  
}
