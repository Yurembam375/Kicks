import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_app/Router/router.gr.dart';

import '../Utility/logger.dart';
import 'cubit/authflow_cubit.dart';

class AuthFlowpage extends StatelessWidget {
  const AuthFlowpage({super.key});

  @override
  Widget build(BuildContext context) {
    var state = context.watch<AuthflowCubit>().state;
    logger.e(state);

    return AutoRouter.declarative(
      routes: (handler) {
        switch (state.status) {
          case Status.initial:
            return [];

          case Status.login:
            return [const DashboardRoute()];
            
          case Status.logout:
            return [const LoginRoute()];
        }
      },
    );
  }
}
