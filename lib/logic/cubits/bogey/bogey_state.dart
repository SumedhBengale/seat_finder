part of 'bogey_cubit.dart';

@immutable
abstract class BogeyState {}

class BogeyInitial extends BogeyState {}

class BogeyLayoutData extends BogeyState {
  final int totalSeats;
  final int totalCompartments;
  final int totalSeatsInCompartment;
  final Map<int, String> seats;

  BogeyLayoutData({
    required this.totalSeats,
    required this.totalCompartments,
    required this.totalSeatsInCompartment,
    required this.seats,
  });
}
