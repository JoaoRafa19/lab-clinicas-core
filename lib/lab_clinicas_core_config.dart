import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class LabClinicasCoreConfig extends StatelessWidget {
  const LabClinicasCoreConfig({
    super.key,
    this.bindings,
    this.pages,
    this.pageBuilders,
    this.modules,
    required this.title,
  });

  final List<FlutterGetItPageRouter>? pages;
  final List<FlutterGetItPageBuilder>? pageBuilders;
  final ApplicationBindings? bindings;
  final List<FlutterGetItModule>? modules;
  final String title;
  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      debugMode: kDebugMode,
      bindings: bindings,
      pages: [...pages ?? [], ...pageBuilders ?? []],
      modules: [...modules ?? []],
      builder: (context, routes, flutterGetItNavObserver) {
        return MaterialApp(
          title: title,
          routes: routes,
          navigatorObservers: [
            flutterGetItNavObserver,
          ],
        );
      },
    );
  }
}
