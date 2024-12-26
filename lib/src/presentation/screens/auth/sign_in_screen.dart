import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';


class SignInScreen extends StatelessWidget {


  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/background.png',
                    width: MediaQuery.of(context).size.width,
                    height: 280,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 280,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.grey.shade100,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors
                                  .black, // Choose the color of text as needed
                            ),
                          ),
                          Text(
                            'Let’s personalize your fitness with AI',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors
                                  .black, // Choose the color of text as needed
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              return Column(
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xFFF3F3F4),
                                      labelText: 'Email',
                                      errorText: state.emailError,
                                      prefixIcon: Icon(Icons.email),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            8.0), // Rounded corners
                                        borderSide: BorderSide(
                                            color: Colors
                                                .grey), // Default border color
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                            color: Color(0xFF5C524C), width: 2),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                            color: Colors.red.shade500, width: 2),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFF3F3F4),
                                        ),
                                      ),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (value) => context.read<AuthBloc>().add(EmailChanged(value)),
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    obscureText: state.isPasswordVisible,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xFFF3F3F4),
                                      labelText: 'Password',
                                      errorText: state.passwordError,
                                      prefixIcon: Icon(Icons.lock),
                                      suffixIcon: IconButton(
                                        icon: Icon(state.isPasswordVisible
                                            ? Icons.visibility_off
                                            : Icons.visibility_outlined),
                                        onPressed: () {
                                          context.read<AuthBloc>().add(PasswordVisibilityToggled());
                                        },

                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            8.0), // Rounded corners
                                        borderSide: BorderSide(
                                            color: Colors
                                                .grey), // Default border color
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                            color: Color(0xFF5C524C), width: 2),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                            color: Colors.red.shade500, width: 2),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFF3F3F4),
                                        ),
                                      ),
                                    ),
                                    onChanged: (value) => context.read<AuthBloc>().add(PasswordChanged(value)),
                                  ),
                                ],
                              );
                            }),
                        SizedBox(height: 40),
                        BlocConsumer<AuthBloc, AuthState>(
                          listener: (context, state) {
                            if (state.navigateToHome) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Login Successful')),
                              );
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                              debugPrint('Welcome Home');
                            } else if (state.failedNavigateToHome) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Invalid credentials')),
                              );
                              debugPrint('Something Worng');
                            }
                          },
                          builder: (context, state) {
                            if (state.isSubmitting) {
                              return CircularProgressIndicator();
                            }
                            return InkWell(
                              onTap: state.isValid
                                  ? () => context
                                  .read<AuthBloc>()
                                  .add(LoginSubmitted())
                                  : null,
                              child: Container(
                                height: 56,
                                decoration: BoxDecoration(
                                    color: Color(0xFF111214),
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Center(
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text('Or'),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 100.0),
                          child: Divider(),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SocialIconsButton(
                                imageUrl: 'assets/icons/insta_icon.svg'),
                            SizedBox(
                              width: 20,
                            ),
                            SocialIconsButton(
                                imageUrl: 'assets/icons/facebook_icons.svg'),
                            SizedBox(
                              width: 20,
                            ),
                            SocialIconsButton(
                                imageUrl: 'assets/icons/linkdin_icon.svg'),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Don't have an account?",
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: ' Sign Up',
                                    style: TextStyle(
                                        color: Color(0xFFF97316), fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Terms & condition',
                              style: TextStyle(
                                  color: Color(0xFFF97316), fontSize: 16),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
