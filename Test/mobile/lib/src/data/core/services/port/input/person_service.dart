import 'package:testtech/src/data/core/models/person/Person.dart';
import 'package:testtech/src/data/core/services/commands/person_command.dart';

import '../../../../../common/error/outcome.dart';

abstract class PersonService {

  Future<Outcome<String>> createPerson({required CommandPerson cmd});

  Future<Outcome<List<Person>>> ListPerson();

  Future<Outcome<double>> verifyPerson({required CommandPerson cmd});


}