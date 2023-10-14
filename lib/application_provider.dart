import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'application_controller.dart';

class ApplicationProvider extends StatelessWidget {
  final ApplicationController controller = ApplicationController();
  final Widget child;

  ApplicationProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => controller,
      child: child,
    );
  }
}
