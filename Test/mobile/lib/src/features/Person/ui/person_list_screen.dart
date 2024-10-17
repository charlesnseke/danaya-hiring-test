import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:testtech/src/features/Person/cubit/person_cubit.dart';
import 'package:testtech/src/features/Person/cubit/person_state.dart';
import 'package:testtech/src/features/Person/ui/widget/appbarWidget.dart';

import '../../../common/ka/styles/text_style.dart';
import '../../../common/ka/themes/app_theme_colors.dart';
import '../../../data/core/models/person/Person.dart';

class PersonListScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final personCubit = context.read<PersonCubit>();
    final searchController = useTextEditingController();
    final isDialOpen = useState(false);

    useEffect(() {
      personCubit.fetchPerson();
      return null;
    }, []);

    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildSearchField(searchController, personCubit),
          _buildPersonList(personCubit),
        ],
      ),
      floatingActionButton: _buildSpeedDial(isDialOpen, context),
    );
  }

  // AppBar
  AppbarWidget _buildAppBar() {
    return AppbarWidget(title: 'Liste des personnes', showLeading: false);
  }

  // Search TextField
  Padding _buildSearchField(
      TextEditingController searchController, PersonCubit personCubit) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          labelStyle: TextStyle(),
          hintText: 'Rechercher par numéro d\'identité',
          prefixIcon: Icon(Icons.search, color: KaThemeColors.blue),
          border: _buildOutlineInputBorder(),
          focusedBorder:
          _buildOutlineInputBorder(color: KaThemeColors.blue, width: 2),
          enabledBorder: _buildOutlineInputBorder(color: KaThemeColors.gray),
        ),
        onChanged: personCubit.searchPersonByIdentityNumber,
      ),
    );
  }

  // Person List
  Expanded _buildPersonList(PersonCubit personCubit) {
    return Expanded(
      child: BlocBuilder<PersonCubit, PersonState>(
        builder: (context, state) {
          if (state is PersonLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PersonFetchSuccess) {
            if (state.person.isEmpty) {
              return Center(
                  child: Text(
                    'Aucun résultat trouvé.',
                    style: KaTextStyle.bodyLarge(),
                  ));
            }
            return _buildPersonListView(state.person);
          } else if (state is PersonFetchError) {
            return Center(child: Text('Erreur: ${state.message}'));
          }
          return Center(
              child: Text('Aucune donnée disponible.',
                  style: KaTextStyle.bodyLarge()));
        },
      ),
    );
  }

  // Person ListView
  ListView _buildPersonListView(List<Person> personList) {
    return ListView.builder(
      itemCount: personList.length,
      itemBuilder: (context, index) {
        final person = personList[index];
        return _buildPersonCard(person);
      },
    );
  }

  // Person Card
  Card _buildPersonCard(Person person) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row for the name and identity number
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 40,
                      color: KaThemeColors.blue,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          person.lastName,
                          style: KaTextStyle.titleLarge(
                           // fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          person.firstName,
                          style: KaTextStyle.titleMedium(),
                        ),
                      ],
                    ),
                  ],
                ),
                // Identity number on the right
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'ID:',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      person.identityNumber,
                      style: KaTextStyle.bodyLarge(
                        color: KaThemeColors.blue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Date of birth
            Row(
              children: [
                const Icon(
                  Icons.cake,
                  color: KaThemeColors.gray,
                ),
                const SizedBox(width: 10),
                Text(
                  'Date de naissance : ${person.dateOfBirth}',
                  style: KaTextStyle.bodyLarge(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // SpeedDial
  SpeedDial _buildSpeedDial(
      ValueNotifier<bool> isDialOpen, BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: const IconThemeData(size: 22.0),
      openCloseDial: ValueNotifier<bool>(isDialOpen.value),
      onOpen: () => isDialOpen.value = true,
      onClose: () => isDialOpen.value = false,
      backgroundColor: KaThemeColors.blue,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.add),
          label: 'Ajouter un utilisateur',
          onTap: () => Navigator.pushNamed(context, '/createPerson'),
        ),
        SpeedDialChild(
          child: const Icon(Icons.check),
          label: 'Vérifier un utilisateur',
          onTap: () => Navigator.pushNamed(context, '/searchPerson'),
        ),
      ],
    );
  }

  // OutlineInputBorder for TextField
  OutlineInputBorder _buildOutlineInputBorder({Color? color, double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color ?? KaThemeColors.blue, width: width),
    );
  }
}
