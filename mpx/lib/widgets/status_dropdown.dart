import 'package:flutter/material.dart';
import 'package:mpx/l10n/app_localizations.dart';
import 'package:mpx/viewmodels/flight_list_view_model.dart';
import 'package:provider/provider.dart';
import 'package:mpx/utils/parsing_utils.dart';

class StatusDropdown extends StatelessWidget {
  const StatusDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<FlightListViewModel>(context, listen: false);
    final t = AppLocalizations.of(context)!;

    return DropdownButtonFormField(
      initialValue: 'All',
      items:
          [
                'All',
                'Scheduled',
                'Active',
                'Landed',
                'Cancelled',
                'Incident',
                'Diverted',
              ]
              .map(
                (status) => DropdownMenuItem(
                  value: status,
                  child: Text(getLocalizedStatus(status, t).capitalize()),
                ),
              )
              .toList(),
      onChanged: (value) {
        vm.setStatusSearchQuery(value ?? "all");
      },
    );
  }
}
