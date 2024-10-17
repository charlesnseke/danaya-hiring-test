import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtech/src/data/core/services/commands/person_command.dart';
import 'package:testtech/src/features/Person/cubit/person_state.dart';
import 'package:testtech/src/features/Person/viewmodel/createPersonViewModel.dart';
import '../../../common/error/outcome.dart';
import '../../../data/core/models/person/Person.dart';
import '../../../data/core/services/port/input/person_service.dart';

class PersonCubit extends Cubit<PersonState> {
  final PersonService _personService;
  List<Person> _allPersons = []; // Stocker la liste complète des personnes

  PersonCubit({
    required PersonService personService,
  })  : _personService = personService,
        super(PersonInitial());

  void fetchPerson() async {
    emit(PersonLoading());
    final result = await _personService.ListPerson();
    if (result.hasData) {
      _allPersons = result.data!; // Enregistrer la liste complète
      emit(PersonFetchSuccess(person: _allPersons));
    } else if (result.hasError) {
      emit(PersonFetchError(message: result.error!));
    }
  }

  Future<void> createPerson(CreatePersonViewModel viewmodel) async {
    final cmd = CommandPerson(
      identityNumber: viewmodel.identityNumberController.text,
      firstName: viewmodel.firstnameController.text,
      lastName: viewmodel.lastnameController.text,
      dateOfBirth: viewmodel.dateController.text,
    );

    await _executeAction<String>(
          () => _personService.createPerson(cmd: cmd), // Retourne Future<Outcome<String>>
      viewmodel,
      "Personne créée avec succès !!!", // Message de succès
    );
  }


  Future<void> verifyPerson(CreatePersonViewModel viewmodel) async {
    final cmd = CommandPerson(
      identityNumber: viewmodel.identityNumberController.text,
      firstName: viewmodel.firstnameController.text,
      lastName: viewmodel.lastnameController.text,
      dateOfBirth: viewmodel.dateController.text,
    );

    await _executeAction<double>(
          () => _personService.verifyPerson(cmd: cmd),
      viewmodel,
      "Vérification réussie !!!",
    );
  }



  Future<void> _executeAction<T>(
      Future<Outcome<T>> Function() action,
      CreatePersonViewModel viewmodel,
      String successMessage,
      ) async {
    emit(PersonLoading());
    viewmodel.loading.value = true;

    final resultat = await action();

    if (resultat.hasData) {
      // Vérifier le type de T pour récupérer le score
      if (resultat.data is double) {
        emit(PersonVerifySuccess(score: resultat.data as double));
      } else {
        emit(PersonCreatedSuccess(message: successMessage));
      }
    } else if (resultat.hasError) {
      emit(PersonFetchError(message: resultat.error.toString()));
    }

    viewmodel.loading.value = false;
  }






  void searchPersonByIdentityNumber(String identityNumber) {
    if (identityNumber.isEmpty) {
      emit(PersonFetchSuccess(person: _allPersons));
    } else {
      final filteredPersons = _allPersons.where((person) =>
          (person as Person).identityNumber.contains(identityNumber)).toList();
      if (filteredPersons.isNotEmpty) {
        emit(PersonFetchSuccess(person: filteredPersons));
      } else {
        emit(PersonFetchSuccess(person: []));
      }
    }
  }

}
