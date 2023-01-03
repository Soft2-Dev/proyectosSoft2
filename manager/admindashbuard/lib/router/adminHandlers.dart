import 'package:admin_dashbuard/provider/authProvider.dart';
import 'package:admin_dashbuard/ui/views/auth/loginView.dart';
import 'package:admin_dashbuard/ui/views/dashboardView.dart';

import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class AdminHandlers {
  static Handler login = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.authStatus == AuthStatus.notAuthenticated)
      return LoginView();
    else
      return DashboardView();
  });

  
}
