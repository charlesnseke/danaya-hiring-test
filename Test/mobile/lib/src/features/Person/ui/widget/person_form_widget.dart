import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../../common/ka/styles/text_style.dart';
import '../../../../common/ka/themes/app_theme_colors.dart';
import '../../../../common/ka/widget/buttons.dart';
import '../../viewmodel/createPersonViewModel.dart';


class PersonForm extends HookWidget {
  final CreatePersonViewModel viewModel;
  final Future<void> Function(CreatePersonViewModel) onSubmit;
  final String buttonText;
  const PersonForm({
    required this.viewModel,
    required this.onSubmit,
    required this.buttonText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _identityNumberField(viewModel),
              _formSpacing(),
              _firstNameField(viewModel),
              _formSpacing(),
              _lastNameField(viewModel),
              _formSpacing(),
              _dateOfBirthField(viewModel, context),
              const SizedBox(height: 50),
              _submitButton(viewModel, onSubmit),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formSpacing() => const SizedBox(height: 16);

  Widget _identityNumberField(CreatePersonViewModel viewModel) {
    return _buildTextField(
      controller: viewModel.identityNumberController,
      focusNode: viewModel.identityNumberFocusNode,
      hintText: 'Numéro d\'identité',
      validator: viewModel.validIdentiteNumber,
      prefixIcon: Icons.perm_identity,
    );
  }

  Widget _firstNameField(CreatePersonViewModel viewModel) {
    return _buildTextField(
      controller: viewModel.firstnameController,
      focusNode: viewModel.firstnameFocusNode,
      hintText: 'Prénom',
      validator: viewModel.validateFirstName,
      prefixIcon: Icons.person_outline,
    );
  }

  Widget _lastNameField(CreatePersonViewModel viewModel) {
    return _buildTextField(
      controller: viewModel.lastnameController,
      focusNode: viewModel.lastnameFocusNode,
      hintText: 'Nom',
      validator: viewModel.validateLastName,
      prefixIcon: Icons.person_outline,
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String hintText,
    required String? Function(String?) validator,
    required IconData prefixIcon,
  }) {
    return TextFormField(
      style: KaTextStyle.bodyMedium(),
      keyboardType: TextInputType.text,
      focusNode: focusNode,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        isDense: true,
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        hintStyle: KaTextStyle.bodyMedium(xMuted: true),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: KaThemeColors.gray),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: KaThemeColors.gray.withOpacity(0.6)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: KaThemeColors.blue, width: 2),
        ),
      ),
      validator: validator,
      cursorColor: Colors.grey,
    );
  }

  Widget _dateOfBirthField(CreatePersonViewModel viewModel, BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: viewModel.dateOfBirth ?? DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          viewModel.updateDateOfBirth(pickedDate);
        }
      },
      child: AbsorbPointer(
        child: TextFormField(
          style: KaTextStyle.bodyMedium(),
          controller: viewModel.dateController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            isDense: true,
            hintText: 'Date de naissance',
            prefixIcon: Icon(Icons.calendar_today_outlined),
            contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            hintStyle: KaTextStyle.bodyMedium(xMuted: true),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: KaThemeColors.gray),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: KaThemeColors.gray.withOpacity(0.6)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: KaThemeColors.blue, width: 2),
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Veuillez sélectionner une date.';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _submitButton(CreatePersonViewModel viewModel, Future<void> Function(CreatePersonViewModel) onSubmit) {
    return ValueListenableBuilder<bool>(
      valueListenable: viewModel.loading,
      builder: (context, isLoading, child) {
        return Buttons(
          onTap: () {
            if (!isLoading && viewModel.validateForm()) {
              viewModel.loading.value = true;
              onSubmit(viewModel).then((_) {
                viewModel.loading.value = false;
              }).catchError((error) {
                viewModel.loading.value = false;
              });
            }
          },
          btnText: isLoading ? 'Chargement...' : buttonText,
        );
      },
    );
  }
}
