import 'package:flutter_bloc/flutter_bloc.dart';

import 'dummy_state.dart';

class DummyCubit extends Cubit<DummyState> {
  DummyCubit() : super(const DummyStateInitialState());
}
