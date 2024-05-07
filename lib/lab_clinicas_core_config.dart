import 'package:asyncstate/asyncstate.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_core/src/loader/lab_clinicas_loader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class LabClinicasCoreConfig extends StatelessWidget {
  final List<FlutterGetItPageRouter>? pages;
  final List<FlutterGetItPageBuilder>? pageBuilders;
  final ApplicationBindings? binding;
  final List<FlutterGetItModule>? modules;
  final VoidCallback? didStart;
  final String title;

  const LabClinicasCoreConfig(
      {super.key,
      this.pages,
      this.pageBuilders,
      this.binding,
      this.modules,
      this.didStart,
      required this.title});
  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      debugMode: kDebugMode,
      bindings: binding,
      pages: [...pages ?? [], ...pageBuilders ?? []],
      modules: [...modules ?? []],
      builder: (context, routes, flutterGetItNavObserver) {
        if (didStart != null) {
          didStart?.call();
        }
        return AsyncStateBuilder(
          loader: LabClinicasLoader(),
          builder: (navigationObserver) {
            return MaterialApp(
              title: title,
              debugShowCheckedModeBanner: false,
              routes: routes,
              theme: LabClinicasTheme.lightTheme,
              darkTheme: LabClinicasTheme.darkTheme,
              navigatorObservers: [
                flutterGetItNavObserver,
                navigationObserver,
              ],
            );
          },
        );
      },
    );
  }
}
