import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:urban_farmer/const/app_color.dart';
import 'core/bindings/app_bindings.dart';
import 'core/network/api_client.dart';
import 'core/network/dio/dio_api_client.dart';
import 'core/repository/user_repository.dart';
import 'core/repository/user_repository_impl.dart';
import 'core/utils/app_controller.dart';
import 'core/utils/app_prefs.dart';
import 'core/utils/global.dart';
import 'route/route_generator_n.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingletonAsync(() => AppPrefs.getInstance());
  GetIt.I.registerSingletonAsync<ApiClient>(() => DioApiClient.getInstance());
  GetIt.I.registerSingletonWithDependencies<UserRepository>(
    () => UserRepositoryImpl(),
    dependsOn: [ApiClient],
  );
  await GetIt.I.allReady();
  Get.put(AppController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayColor: Colors.black54,
      overlayWidget: Center(
        child: CircularProgressIndicator(
          strokeWidth: 4,
          color: AppColor.kPrimaryGreen,
        ),
      ),
      child: GetMaterialApp(
        theme: ThemeData(
          fontFamily: "Nunito",
        ),
        initialBinding: AppBindings(),
        initialRoute: getInitialRoute,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        navigatorKey: navigatorKey,
        // getPages: routes,
      ),
    );
  }
}
