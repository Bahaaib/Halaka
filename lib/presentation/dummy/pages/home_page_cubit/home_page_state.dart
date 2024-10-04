import 'package:flutter_bloc/flutter_bloc.dart';

 abstract class HomePageState extends Cubit<HomePageState> {
  HomePageState() : super(HomePageInitial());
}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageSuccess extends HomePageState {}

class HomePageError extends HomePageState {
  final String message;

  HomePageError({required this.message});
}
