import 'package:admin_dashbuard/provider/sideMenuProvide.dart';
import 'package:admin_dashbuard/ui/views/view404.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class View404Handlers {
  static Handler view404 = new Handler(handlerFunc: (context, params) {
    Provider.of<SideMenuProvider>(context!).setCurrentPageUrl('/404');
    return View404();
  });
}
