import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_waifu/ui/bloc/InformationBloc/InformationCubit.dart';

class CountdownTimer extends StatefulWidget {
  CountdownTimer({Key key}) : super(key: key);

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  TimeOfDay today;
  var tomorrow;
  var difference;
  @override
  void initState() {
    super.initState();
    today = TimeOfDay.now();

    var hourDifference = 24 - today.hour;

    difference = (hourDifference * 60 * 60) - (today.minute * 60);

    _animationController = AnimationController(
        vsync: this, duration: Duration(seconds: difference));
    _animationController
        .reverse(
            from: _animationController.value == 0.0
                ? 1.0
                : _animationController.value)
        .whenComplete(
            () => BlocProvider.of<InformationCubit>(context).getRandomWaifu());
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 25,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => Container(
            height: 100,
            margin: EdgeInsets.only(right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Next waifu",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade600),
                  textAlign: TextAlign.right,
                ),
                Text(
                  "$timerString",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade600),
                  textAlign: TextAlign.right,
                ),
              ],
            )),
      ),
    );
  }

  String get timerString {
    Duration duration =
        _animationController.duration * _animationController.value;

    return '${duration.inHours}:${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
