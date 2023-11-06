import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/injector.dart';
import 'presentation/feature/application/application_state.dart';
import 'presentation/feature/home/home_screen.dart';
import 'presentation/feature/application/application_cubit.dart';
import 'presentation/feature/home/home_cubit.dart';
import 'presentation/theme/themes.dart';

void main() {
  configureDependencies(getIt);
  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: MyTheme.light,
      darkTheme: MyTheme.dark,
      home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (BuildContext context) => getIt<ApplicationCubit>()),
            BlocProvider(create: (BuildContext context) => getIt<HomeCubit>()..init())
          ],
          child: BlocBuilder<ApplicationCubit, ApplicationState>(
              builder: (BuildContext context, ApplicationState state) {
            return const HomeScreen();
          })),
    );
  }
}
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a blue toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }
