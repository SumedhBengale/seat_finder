import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bogey_state.dart';

class BogeyCubit extends Cubit<BogeyState> {
  BogeyCubit() : super(BogeyInitial());

  //Total seats in bogey
  int totalSeats = 72;

  //Total 9 compartments in a bogey
  int totalCompartments = 9;

  //Set of 8 seats in a compartment
  int totalSeatsInCompartment = 8;

  //list of seats in a bogey
  Map<int, String> seats = {
    1: 'Lower',
    2: 'Middle',
    3: 'Upper',
    4: 'Lower',
    5: 'Middle',
    6: 'Upper',
    7: 'Side Lower',
    8: 'Side Upper',
  };

  Future<void> getBogeyLayoutData() async {
    //Bloc enters some race conditon if we don't delay the execution, so we delay it for 1 second
    await Future.delayed(const Duration(seconds: 1));
    emit(BogeyLayoutData(
        totalSeats: totalSeats,
        totalCompartments: totalCompartments,
        totalSeatsInCompartment: totalSeatsInCompartment,
        seats: seats));
  }
}
