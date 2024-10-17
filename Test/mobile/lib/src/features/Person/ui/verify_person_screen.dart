import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:testtech/src/features/Person/ui/widget/appbarWidget.dart';
import 'package:testtech/src/features/Person/ui/widget/person_form_widget.dart';
import 'package:testtech/src/features/Person/ui/verify_result_screen.dart'; // Ajoutez l'import de votre nouvelle vue

import '../../../common/ka/themes/app_theme_colors.dart';
import '../../../common/ka/widget/snabar.dart';
import '../cubit/person_cubit.dart';
import '../cubit/person_state.dart';
import '../viewmodel/createPersonViewModel.dart';

class VerifyPersonScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final personCubit = BlocProvider.of<PersonCubit>(context);
    final viewModel = useMemoized(() => CreatePersonViewModel(), []);

    useEffect(() {
      viewModel.init(context: context);
      return () => viewModel.dispose();
    }, [viewModel]);

    return Scaffold(
      appBar: AppbarWidget(title: "Vérifier une personne"),
      body: BlocListener<PersonCubit, PersonState>(
        listener: (context, state) {
          if (state is PersonVerifySuccess) {
            // Redirige vers la vue de résultat
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VerifyResultScreen(score: state.score),
              ),
            );
          } else {
            _handleState(context, state);
          }
        },
        child: BlocBuilder<PersonCubit, PersonState>(
          builder: (context, state) => PersonForm(
            buttonText: "Vérifier",
            viewModel: viewModel,
            onSubmit: (viewModel) => personCubit.verifyPerson(viewModel), // Appel à la méthode de vérification
          ),
        ),
      ),
    );
  }

  void _handleState(BuildContext context, PersonState state) {
    if (state is PersonCreatedSuccess) {
      _showSuccessSnackbar(context, state.message);
    } else if (state is PersonFetchError) {
      _showErrorSnackbar(context, state.message);
    }
  }

  void _showSuccessSnackbar(BuildContext context, String message) {
    showSnackBar(
      context: context,
      color: KaThemeColors.green,
      msg: message,
    );
  }

  void _showErrorSnackbar(BuildContext context, String message) {
    showSnackBar(
      context: context,
      color: KaThemeColors.red,
      msg: message,
    );
  }
}
