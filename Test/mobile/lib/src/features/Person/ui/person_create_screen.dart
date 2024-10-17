import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:testtech/src/common/ka/themes/app_theme_colors.dart';
import 'package:testtech/src/features/Person/cubit/person_cubit.dart';
import 'package:testtech/src/features/Person/cubit/person_state.dart';
import 'package:testtech/src/features/Person/ui/widget/appbarWidget.dart';
import 'package:testtech/src/features/Person/ui/widget/person_form_widget.dart';
import '../../../common/ka/widget/snabar.dart';
import '../viewmodel/createPersonViewModel.dart';

class PersonAddScreen extends HookWidget {
  const PersonAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final personCubit = BlocProvider.of<PersonCubit>(context);
    final viewModel = useMemoized(() => CreatePersonViewModel(), []);

    useEffect(() {
      viewModel.init(context: context);
      return () => viewModel.dispose();
    }, [viewModel]);

    return Scaffold(
      appBar: AppbarWidget(title: "Ajouter une personne"),
      body: BlocListener<PersonCubit, PersonState>(
        listener: (context, state) => _handleState(context, state),
        child: BlocBuilder<PersonCubit, PersonState>(
          builder: (context, state) => PersonForm(
            buttonText: "Ajouter",
            viewModel: viewModel,
            onSubmit: (viewModel) => personCubit.createPerson(viewModel),
          ),
        ),
      ),
    );
  }

  void _handleState(BuildContext context, PersonState state) {
    if (state is PersonCreatedSuccess) {
      _showSuccessSnackbar(context, state.message);
      Navigator.pushNamed(context, '/');
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
