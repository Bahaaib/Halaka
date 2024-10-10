import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halaka/resources/strings.dart';
import 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitialState());

  Future<void> getStudent (String code, String birthday) async {
   // emit(HomePageLoadingState());

    emit(HomePageSuccessState());

    emit(HomePageErrorState(message: CodeStrings.errorMessage));
  }
}
