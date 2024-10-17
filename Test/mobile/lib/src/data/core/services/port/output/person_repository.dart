import 'package:testtech/src/data/core/services/dto/dto_person.dart';

import '../../../../../common/error/data_state.dart';
import '../../commands/person_command.dart';

abstract class PersonRepository {

  Future<DataState<List<DtoPerson>>> getListPerson( );

  Future<DataState<DtoPerson>> createPerson({required CommandPerson command});

   Future<DataState<double>>verifyPerson({required CommandPerson command});



}