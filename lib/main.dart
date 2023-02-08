import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:urban_farmer/ui/screen/cart/cart_screen.dart';
import 'package:urban_farmer/ui/screen/dashboad/dashboard_screen.dart';
import 'package:urban_farmer/ui/screen/splash/splash_screen.dart';
import 'core/bindings/app_bindings.dart';
import 'route/route_generator_n.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayColor: Colors.black54,
      overlayWidget: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 4,
          color: Colors.blue,
        ),
      ),
      child: GetMaterialApp(
        theme: ThemeData(
          fontFamily: "Nunito",
        ),
        initialBinding: AppBindings(),
        initialRoute: DashBoardScreen.routeName,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        navigatorKey: navigatorKey,
        // getPages: routes,
      ),
    );
  }
}
