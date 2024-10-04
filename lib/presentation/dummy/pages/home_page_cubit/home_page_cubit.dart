import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_page_state.dart';

abstract class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(super.initialState);

  void validateForm() {
    try {
      //
    } catch (e) {
      emit(HomePageError(message: e.toString()));
    }
  }
}
