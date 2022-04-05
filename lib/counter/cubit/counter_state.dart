part of 'counter_cubit.dart';

class CounterState extends Equatable {
  const CounterState({required this.counterValue});

  final int counterValue;

  @override
  List<Object?> get props => [counterValue];
}
