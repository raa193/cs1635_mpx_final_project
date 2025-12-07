// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get noFlights => 'Sin vuelos';

  @override
  String get flightTrackerApplication => 'Aplicación de Seguimiento de Vuelos';

  @override
  String get unknownAirline => 'Aerolínea Desconocida';

  @override
  String get unknownAirport => 'Aeropuerto Desconocido';

  @override
  String get status => 'Estado';

  @override
  String get unknown => 'Desconocido';

  @override
  String get all => 'Toda';

  @override
  String get scheduled => 'Programado';

  @override
  String get active => 'Activo';

  @override
  String get landed => 'Aterrizado';

  @override
  String get cancelled => 'Cancelado';

  @override
  String get incident => 'Incidente';

  @override
  String get diverted => 'Desviado';

  @override
  String get flights => 'Vuelos';

  @override
  String get departureAirport => 'Aeropuerto de Salida';

  @override
  String get arrivalAirport => 'Aeropuerto de Llegada';

  @override
  String get flightNumber => 'N.º de Vuelo';

  @override
  String get terminal => 'Terminal';

  @override
  String get gate => 'Puerta';

  @override
  String get arrivalInformation => 'Información de Llegada';

  @override
  String get baggageInformationUnannounced =>
      'La información sobre el equipaje aún no se ha anunciado...';

  @override
  String get flightActiveMessage => '¡Este vuelo ya está en marcha!';

  @override
  String get flightDelayedMessage => 'Este vuelo se ha retrasado a';

  @override
  String get flightDivertedMessage => 'Este vuelo ha sido desviado.';

  @override
  String get flightIncidentMessage => 'Este vuelo ha encontrado un problema.';

  @override
  String get flightLandedMessage => '¡Este vuelo ya ha aterrizado!';

  @override
  String get flightStatusUnknownMessage =>
      'El estado de este vuelo es actualmente desconocido.';

  @override
  String get flightScheduledMessage =>
      'Este vuelo está programado para salir a las';

  @override
  String get flightCancelledMessage => 'Este vuelo ha sido cancelado';
}
