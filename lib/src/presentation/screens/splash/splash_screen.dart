import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../screens.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashAnimationCompleted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SignInScreen()),
            );
          }
        },
        child: Center(
          child: BlocBuilder<SplashBloc, SplashState>(
            builder: (context, state) {
              double width = 0;
              if (state is SplashAnimationStarting) {
                width = state.width;
              }
              return AnimatedContainer(
                duration: Duration(seconds: 2),
                curve: Curves.easeInOut,
                width: width,
                height: 1000,
                child: Image.network(
                    'https://images.pexels.com/photos/321552/pexels-photo-321552.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    fit: BoxFit.contain),
              );
            },
          ),
        ),
      ),
    );
  }
}
