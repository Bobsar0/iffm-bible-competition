import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/competition_controller.dart';
import '../../../components/dropdown_widget.dart';
import '../../../styles/button_styles.dart';

class QuotationSearchWidget extends StatelessWidget {
  const QuotationSearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Bible Quotation: '),
        const SizedBox(width: 10),
        Expanded(
            child: TextField(
          controller: context.read<CompetitionController>().quotationController,
          onChanged: (String text) =>
              context.read<CompetitionController>().notify,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter Bible passage',
          ),
        )),
        const SizedBox(width: 15),
        SizedBox(width: 100, child: DropdownWidget()),
        const SizedBox(width: 15),
        ElevatedButton.icon(
          onPressed: context
                  .watch<CompetitionController>()
                  .quotationController
                  .text
                  .isEmpty
              ? null
              : () async => await context
                  .read<CompetitionController>()
                  .searchBiblePassage(),
          icon: const Icon(Icons.search),
          label: const Text('Search'),
          style: elevatedButtonStyle(),
        ),
      ],
    );
  }
}
