import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_waifu/di/injection_config.dart';
import 'package:random_waifu/ui/screens/cloud/cubit/cloud_cubit.dart';
import 'package:random_waifu/ui/screens/cloud/cubit/cloud_state.dart';
import 'package:random_waifu/ui/screens/cloud/widgets/logged_in_widget.dart';
import 'package:random_waifu/ui/screens/cloud/widgets/login_widget.dart';

class CloudPage extends StatefulWidget {
  CloudPage({Key? key}) : super(key: key);

  @override
  _CloudPageState createState() => _CloudPageState();
}

class _CloudPageState extends State<CloudPage> {
  final _cloudCubit = getIt.get<CloudCubit>();

  @override
  void initState() {
    super.initState();
    _cloudCubit.init();
  }

  @override
  void dispose() {
    _cloudCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cloud",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10.0,
            ),
          ],
        ),
        child: BlocProvider(
          create: (context) => _cloudCubit,
          child: BlocBuilder<CloudCubit, CloudState>(
            bloc: _cloudCubit,
            builder: (context, state) {
              if (state is CloudStateLogin)
                return Center(
                  child: CircularProgressIndicator(),
                );

              if (state is CloudStateCompleted && state.userInformation != null)
                return LoggedInWidget(
                  userInformation: state.userInformation!,
                  autoSave: state.autoSave,
                );

              return LoginWidget();
            },
          ),
        ),
      ),
    );
  }
}
