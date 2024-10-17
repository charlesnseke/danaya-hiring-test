import 'package:flutter/material.dart';
import 'package:testtech/src/common/ka/styles/text_style.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showLeading; // Paramètre booléen pour afficher ou non le leading

  const AppbarWidget({
    super.key,
    required this.title,
    this.showLeading = true, // Valeur par défaut à true pour afficher l'icône
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: showLeading
          ? GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height / 45),
            child: const Icon(Iconsax.arrow_left),
          ),
        ),
      )
          : null, // Si showLeading est false, le leading est null
      centerTitle: true,
      title: Text(
        title,
        style: KaTextStyle.headlineSmall(),
      ),
    );
  }

  // Implement the preferredSize getter
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
