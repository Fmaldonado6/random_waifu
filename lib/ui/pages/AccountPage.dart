import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_waifu/services/AuthService.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:random_waifu/ui/bloc/authCubit/auth_cubit.dart';
import 'package:random_waifu/ui/bloc/authCubit/auth_state.dart';
import 'package:random_waifu/ui/widgets/Auth/LoggedInWidget.dart';
import 'package:random_waifu/ui/widgets/Auth/LoginWidget.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final _authCubit = kiwi.KiwiContainer().resolve<AuthCubit>();

  @override
  void initState() {
    super.initState();
    _authCubit.init();
  }

  @override
  void dispose() {
    super.dispose();
    _authCubit.close();
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
          create: (context) => _authCubit,
          child: BlocBuilder<AuthCubit, AuthState>(
            cubit: _authCubit,
            builder: (context, state) {
              if (state is AuthStateLogin)
                return Center(
                  child: CircularProgressIndicator(),
                );

              if (state is AuthStateCompleted && state.userInformation != null)
                return LoggedInWidget(
                  userInformation: state.userInformation,
                );

              return LoginWidget();
            },
          ),
        ),
      ),
    );
  }
}
