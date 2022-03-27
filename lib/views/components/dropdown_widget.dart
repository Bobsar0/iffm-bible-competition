import 'package:bible_competition/controllers/competition_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/bible.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CompetitionController>();

    return DropdownButtonFormField<Bible>(
      value: controller.selectedBible,
      focusColor: Colors.transparent,
      onChanged: (Bible? newValue) {
        controller.selectedBible = newValue;
      },
      items: controller.dropdownItems,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            // borderSide: const BorderSide(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.white),
      elevation: 18,
    );
  }
}
