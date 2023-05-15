part of 'bogey_cubit.dart';

@immutable
abstract class BogeyState {}

class BogeyInitial extends BogeyState {}

class BogeyLayoutData extends BogeyState {
  final int totalSeats;
  final int totalCompartments;
  final int totalSeatsInCompartment;
  final Map<int, String> berths;
  final Map<int, bool> selectedSeats;
  final bool error;
  final String errorMessage;

  BogeyLayoutData({
    required this.totalSeats,
    required this.totalCompartments,
    required this.totalSeatsInCompartment,
    required this.berths,
    required this.selectedSeats,
    required this.error,
    required this.errorMessage,
  });
}

class BogeyError extends BogeyState {
  final int totalSeats;
  final int totalCompartments;
  final int totalSeatsInCompartment;
  final Map<int, String> berths;
  final Map<int, bool> selectedSeats;
  final bool error;
  final String errorMessage;

  BogeyError({
    required this.totalSeats,
    required this.totalCompartments,
    required this.totalSeatsInCompartment,
    required this.berths,
    required this.selectedSeats,
    required this.error,
    required this.errorMessage,
  });
}
