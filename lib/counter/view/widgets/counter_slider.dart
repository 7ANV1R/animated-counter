// ignore_for_file: lines_longer_than_80_chars

import 'package:animated_counter/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterSlider extends StatefulWidget {
  const CounterSlider({
    Key? key,
  }) : super(key: key);

  @override
  _Stepper2State createState() => _Stepper2State();
}

class _Stepper2State extends State<CounterSlider> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  late double _startAnimationPosX;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, lowerBound: -0.5, upperBound: 0.5);
    _controller.value = 0.0;
    _controller.addListener(() {});

    _animation = Tween<Offset>(begin: Offset.zero, end: const Offset(1.5, 0.0)).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CounterSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    _animation = Tween<Offset>(begin: Offset.zero, end: const Offset(1.5, 0.0)).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        width: 550,
        height: 120,
        child: Material(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(60),
          color: Theme.of(context).secondaryHeaderColor.withOpacity(0.5),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                left: 24,
                child: Icon(
                  Icons.remove,
                  color: Theme.of(context).iconTheme.color!.withOpacity(0.7),
                ),
              ),
              Positioned(
                right: 24,
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).iconTheme.color!.withOpacity(0.7),
                ),
              ),
              GestureDetector(
                onHorizontalDragStart: _onPanStart,
                onHorizontalDragUpdate: _onPanUpdate,
                onHorizontalDragEnd: _onPanEnd,
                child: SlideTransition(
                  position: Tween<Offset>(begin: Offset.zero, end: const Offset(1.5, 0)).animate(_controller),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Material(
                      color: Theme.of(context).secondaryHeaderColor,
                      shape: const CircleBorder(),
                      elevation: 5,
                      child: Center(
                        child: Icon(
                          Icons.trip_origin,
                          color: Theme.of(context).iconTheme.color!.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double offsetFromGlobalPos(Offset globalPosition) {
    final box = context.findRenderObject()! as RenderBox;
    final local = box.globalToLocal(globalPosition);
    _startAnimationPosX = ((local.dx * 0.75) / box.size.width) - 0.4;

    return ((local.dx * 0.75) / box.size.width) - 0.4;
  }

  void _onPanStart(DragStartDetails details) {
    _controller.stop();
    _controller.value = offsetFromGlobalPos(details.globalPosition);
  }

  void _onPanUpdate(DragUpdateDetails details) {
    _controller.value = offsetFromGlobalPos(details.globalPosition);
  }

  void _onPanEnd(DragEndDetails details) {
    _controller.stop();

    if (_controller.value <= -0.20) {
      context.read<CounterCubit>().decrement();
    } else if (_controller.value >= 0.20) {
      context.read<CounterCubit>().increment();
    }

    final _kDefaultSpring = SpringDescription.withDampingRatio(
      mass: 0.9,
      stiffness: 250,
      ratio: 0.6,
    );

    _controller.animateWith(SpringSimulation(_kDefaultSpring, _startAnimationPosX, 0.0, 0.0));
  }
}