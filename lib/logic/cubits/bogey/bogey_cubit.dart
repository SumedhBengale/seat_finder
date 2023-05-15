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

  Map<int, bool> selectedSeats = {};

  //list of seats in a bogey
  Map<int, String> berths = {
    1: 'lower',
    2: 'middle',
    3: 'upper',
    4: 'lower',
    5: 'middle',
    6: 'upper',
    7: 'sidelower',
    8: 'sideupper',
  };

  Future<void> getBogeyLayoutData() async {
    //Map 'selected-seats' with 'total-seats' values and all seats are unselected(false) initially
    selectedSeats = {
      for (var item in List.generate(totalSeats, (index) => index + 1))
        item: false
    };

    //Bloc enters some race conditon if we don't delay the execution, so we delay it for 1 second
    await Future.delayed(const Duration(seconds: 1));
    emit(BogeyLayoutData(
        totalSeats: totalSeats,
        totalCompartments: totalCompartments,
        totalSeatsInCompartment: totalSeatsInCompartment,
        berths: berths,
        selectedSeats: selectedSeats,
        error: false,
        errorMessage: ''));
  }

  void search(String text) {
    //If text is a number
    if (int.tryParse(text) != null) {
      seatNumberSearch(text);
    } else {
      text = text.toLowerCase().replaceAll(' ', '');

      if (berths.containsValue(text)) {
        berthSearch(text);
      } else {
        //set all seats to unselected(false)
        selectedSeats = {
          for (var item in List.generate(totalSeats, (index) => index + 1))
            item: false
        };
        showError("Invalid Berth");
      }
    }

    //Update state
    emit(BogeyLayoutData(
        totalSeats: totalSeats,
        totalCompartments: totalCompartments,
        totalSeatsInCompartment: totalSeatsInCompartment,
        berths: berths,
        selectedSeats: selectedSeats,
        error: false,
        errorMessage: ''));
  }

  void seatNumberSearch(String text) {
    //If text is a valid seat number
    if (int.parse(text) > 0 && int.parse(text) <= totalSeats) {
      //set all seats to unselected(false)
      selectedSeats = {
        for (var item in List.generate(totalSeats, (index) => index + 1))
          item: false
      };
      //set the seat to selected(true)
      selectedSeats[int.parse(text)] = true;
    } else {
      //set all seats to unselected(false)
      selectedSeats = {
        for (var item in List.generate(totalSeats, (index) => index + 1))
          item: false
      };
      showError("Invalid Seat Number");
    }
  }

  void berthSearch(String text) {
    print("Searching for $text");
    //set all seats to unselected(false)
    selectedSeats = {
      for (var item in List.generate(totalSeats, (index) => index + 1))
        item: false
    };

    //For each seat in selected seats
    selectedSeats.forEach((key, value) {
      //If the seat is of the given berth
      if (key % 8 == 0) {
        if (berths[8] == text) {
          print(key);
          //set the seat to selected(true)
          selectedSeats[key] = true;
        }
      } else {
        if (berths[key % 8] == text) {
          print(key);
          //set the seat to selected(true)
          selectedSeats[key] = true;
        }
      }
    });
  }

  Future<void> showError(String message) async {
    print("error");
    await Future.delayed(const Duration(seconds: 1));
    emit(BogeyError(
        totalSeats: totalSeats,
        totalCompartments: totalCompartments,
        totalSeatsInCompartment: totalSeatsInCompartment,
        berths: berths,
        selectedSeats: selectedSeats,
        error: true,
        errorMessage: message));
    await Future.delayed(const Duration(seconds: 2));
    emit(BogeyLayoutData(
        totalSeats: totalSeats,
        totalCompartments: totalCompartments,
        totalSeatsInCompartment: totalSeatsInCompartment,
        berths: berths,
        selectedSeats: selectedSeats,
        error: false,
        errorMessage: ''));
  }
}
