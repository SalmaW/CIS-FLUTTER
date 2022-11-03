import 'package:flutter/material.dart';
import 'package:untitled/app_router.dart';

void main() {
  runApp(BreakingBad(appRouter: AppRouter(),));
}

class BreakingBad extends StatelessWidget {
  const BreakingBad({Key? key, required this.appRouter}) : super(key: key);

  // This widget is the root of your application.
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
