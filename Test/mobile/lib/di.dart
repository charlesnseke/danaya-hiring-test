
import 'package:testtech/src/data/core/services/port/input/person_service.dart';
import 'package:testtech/src/data/core/services/port/output/person_repository.dart';
import 'package:testtech/src/data/core/services/port/person_service_impl.dart';
import 'package:testtech/src/data/infra/adapter/person_repository_impl.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'src/common/utils/api/api_service.dart';


class DependencyInjection {
  static Future<Dependencies> setupDependencies() async {
       /// Local DB
    Intl.defaultLocale = 'fr_FR';
    await initializeDateFormatting('fr_FR', null);


    SharedPreferences prefs = await SharedPreferences.getInstance();

      /// Http
    http.Client client = http.Client();
    ApiService apiService = ApiServiceImpl(httpClient: client, prefs: prefs);


      /// Adapters
    PersonRepository personRepository = PersonRepositoryImpl(apiService: apiService);

/// Services

    PersonService personService = PersonSericeImpl(personRepository: personRepository);

  return Dependencies(

      personService: personService
    );
  }
  }

  class Dependencies {

   final PersonService personService;

  Dependencies({

    required this.personService
  });
}