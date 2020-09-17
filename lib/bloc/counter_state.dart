part of 'counter_bloc.dart';

@immutable
 class CounterState extends Equatable {
  final int counter;

  CounterState({this.counter});

  @override
  // TODO: implement props
  List<Object> get props => [counter];
}

