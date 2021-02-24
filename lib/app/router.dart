import 'package:auto_route/auto_route_annotations.dart';
import 'package:products_app/ui/views/views.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: HomeView),
  MaterialRoute(page: LoginView),
])
class $Router {}
