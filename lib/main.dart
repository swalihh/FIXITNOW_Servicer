import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servicer/bloc/bloc/signup_bloc.dart';
import 'package:servicer/data/sharedpreference/sharedpref.dart';
import 'package:servicer/view/opening.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Sharedprfe.instance.init();
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignupBloc()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Opening(),
      ),
    );
  }
}
