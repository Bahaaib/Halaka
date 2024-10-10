abstract class HomePageState {}

class HomePageInitialState extends HomePageState {}

class HomePageLoadingState extends HomePageState {}

class HomePageSuccessState extends HomePageState {}

class HomePageErrorState extends HomePageState {
  final String message;

  HomePageErrorState({required this.message});
}
