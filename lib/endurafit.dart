
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/presentation/bloc/blocs.dart';
import 'src/presentation/screens/screens.dart';
import 'src/utils/app_theme.dart';

class EnduraFit extends StatelessWidget {
  const EnduraFit({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashBloc()..add(StartAnimation())),
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.APP_THEME_LIGHT,
        home: SplashScreen(),
      ),
    );
  }
}
