import 'package:flutter/material.dart';

class CreatePersonViewModel {
  late GlobalKey<FormState> formKey;
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController identityNumberController = TextEditingController();
  final TextEditingController dateController = TextEditingController(); // Contrôleur pour la date

  final FocusNode firstnameFocusNode = FocusNode();
  final FocusNode lastnameFocusNode = FocusNode();
  final FocusNode identityNumberFocusNode = FocusNode();
  final FocusNode dateFocusNode = FocusNode();

  late ValueNotifier<bool> checkNotifier;
  final ValueNotifier<bool> loading = ValueNotifier(false);

  DateTime? dateOfBirth; // Champ pour stocker la date de naissance

  void dispose() {
    loading.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    identityNumberController.dispose();
    dateController.dispose(); // Libération des ressources
  }

  void init({required BuildContext context}) {
    formKey = GlobalKey<FormState>();
  }

  void updateDateOfBirth(DateTime? date) {
    dateOfBirth = date;
    dateController.text = date != null
        ? "${date.year}-${date.month}-${date.day}"
        : "";
  }

  // **Ajout de la méthode validateForm**
  bool validateForm() {
    final form = formKey.currentState;
    if (form != null && form.validate()) {
      // Si le formulaire est valide, on renvoie true
      return true;
    }
    // Sinon, on renvoie false
    return false;
  }

  String? validIdentiteNumber(String? identiteNumber) {
    if (identiteNumber == null || identiteNumber.isEmpty) {
      return 'Veuillez saisir le numéro d\'identité svp';
    } else if (identiteNumber.length < 9) {
      return 'Minimum 9 caractères';
    }
    return null;
  }

  String? validateFirstName(String? firstname) {
    if (firstname == null || firstname.isEmpty) {
      return 'Veuillez saisir le nom svp';
    } else if (firstname.length < 2) {
      return 'Minimum 3 caractères';
    }
    return null;
  }

  String? validateLastName(String? lastname) {
    if (lastname == null || lastname.isEmpty) {
      return 'Veuillez saisir le prénom svp';
    } else if (lastname.length < 3) {
      return 'Minimum 3 caractères';
    }
    return null;
  }

  String? validateDate(String? date) {
    if (date == null || date.isEmpty) {
      return 'Veuillez sélectionner une date de naissance svp';
    }

    // Conversion de la chaîne de date en DateTime
    try {
      dateOfBirth = DateTime.parse(date); // Assurez-vous que la chaîne est dans le format ISO 8601
    } catch (e) {
      return 'Format de date invalide'; // Gérer les exceptions
    }

    return null;
  }

  /// **UI Style**
  OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: Colors.transparent),
  );
}
