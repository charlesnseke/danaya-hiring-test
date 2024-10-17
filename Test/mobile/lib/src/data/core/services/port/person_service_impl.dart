import 'package:testtech/src/common/error/outcome.dart';
import 'package:testtech/src/data/core/models/person/Person.dart';
import 'package:testtech/src/data/core/services/commands/person_command.dart';
import 'package:testtech/src/data/core/services/port/input/person_service.dart';
import 'package:testtech/src/data/core/services/port/output/person_repository.dart';

import '../../../../common/error/data_state.dart';

class PersonSericeImpl implements PersonService{
  final PersonRepository _personRepository;
  PersonSericeImpl({
    required PersonRepository personRepository
  }) : _personRepository = personRepository;

  @override
  Future<Outcome<String>> createPerson({required CommandPerson cmd}) async {
    final result = await _personRepository.createPerson(command: cmd);
    if (result is DataSuccess) {

      return Outcome(data: 'Personne créé avec succès 🎉');
    }


    return Outcome(error: result.error);
  }

  @override
  Future<Outcome<List<Person>>> ListPerson() async {
    final result = await _personRepository.getListPerson();
    if (result is DataSuccess) {
      List<Person> persons =  result.data!.map((it) => Person.fromDtoPerson(it)).toList();

      return Outcome(data: persons);
    }

    return Outcome(error: result.error);
  }

  @override
  Future<Outcome<double>> verifyPerson({required CommandPerson cmd}) async {
    final result = await _personRepository.verifyPerson(command: cmd);
    if (result is DataSuccess) {

      return Outcome(data: result.data);
    }


    return Outcome(error: result.error);
  }

}
