import 'package:freezed_annotation/freezed_annotation.dart';

part 'dummy_state.freezed.dart';

@freezed
class DummyState with _$DummyState {
  const factory DummyState.initial() = DummyStateInitialState;
}
