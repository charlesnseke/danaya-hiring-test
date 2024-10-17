import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtech/app.dart';
import 'package:testtech/di.dart';
import 'package:testtech/src/features/Person/cubit/person_cubit.dart';


Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();

    final di = await DependencyInjection.setupDependencies();
  

  runApp(
    MultiBlocProvider(providers: [

      BlocProvider(create: (context)=>
      PersonCubit(personService: di.personService, ),),
    ],
     child: const App())
  );
}



