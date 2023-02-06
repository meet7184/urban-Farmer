import 'package:flutter/material.dart';
import 'package:urban_farmer/ui/screen/dashboad/dashboard_screen.dart';
import 'package:urban_farmer/ui/screen/forgot/forgot_screen.dart';
import 'package:urban_farmer/ui/screen/forgot/otp_verification_screen.dart';
import 'package:urban_farmer/ui/screen/forgot/reset_password_screen.dart';
import 'package:urban_farmer/ui/screen/home/home_screen.dart';
import 'package:urban_farmer/ui/screen/home/product_details_screen.dart';
import 'package:urban_farmer/ui/screen/home/product_screen.dart';
import 'package:urban_farmer/ui/screen/login/sign_in_screen.dart';
import 'package:urban_farmer/ui/screen/notification/notification_screen.dart';
import 'package:urban_farmer/ui/screen/profile/profile_screen.dart';
import 'package:urban_farmer/ui/screen/profile/t&c_screen.dart';
import 'package:urban_farmer/ui/screen/setting/order_screen.dart';
import 'package:urban_farmer/ui/screen/setting/setting_screen.dart';
import 'package:urban_farmer/ui/screen/setting/subscription_screen.dart';
import 'package:urban_farmer/ui/screen/splash/splash_screen.dart';

import '../ui/screen/login/sign_up_screen.dart';
import '../ui/screen/saved/saved_screen.dart';
import '../ui/screen/search/search_screen.dart';
import '../ui/screen/services/add_order/add_order_screen.dart';
import '../ui/screen/services/add_order/order_details_screen.dart';
import '../ui/screen/services/detail_kitchen_screen.dart';
import '../ui/screen/services/garden_all_page/garden_detailed_preview_screen.dart';
import '../ui/screen/services/garden_all_page/garden_details_screen.dart';
import '../ui/screen/services/services_category_screen.dart';
import '../ui/screen/services/services_listpage_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashScreen(),
        );
      case SignUpScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SignUpScreen(),
        );
      case SignInScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SignInScreen(),
        );
      case ForgotPasswordScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ForgotPasswordScreen(),
        );
      case OtpVerificationScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OtpVerificationScreen(),
        );
      case ResetPasswordScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ResetPasswordScreen(),
        );
      case DashBoardScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DashBoardScreen(),
        );
      case HomeScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HomeScreen(),
        );
      case SearchScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SearchScreen(),
        );
      case SavedScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SavedScreen(),
        );
      case NotificationScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const NotificationScreen(),
        );
      case ProductScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ProductScreen(),
          //ProductScreen(index: settings.arguments as ProductArgs),
        );
      case ProductDetailsScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ProductDetailsScreen(),
        );
      case ProfileScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ProfileScreen(),
        );
      case SubscriptionScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SubscriptionScreen(),
        );
      case OrderScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OrderScreen(),
        );
      case TcScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const TcScreen(),
        );
      case SettingsScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SettingsScreen(),
        );
      case ServicesCategoryScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ServicesCategoryScreen(),
        );
      case ServicesListPageScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ServicesListPageScreen(),
        );
      case DetailKitchenScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DetailKitchenScreen(),
        );
      case GardenDetailsScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const GardenDetailsScreen(),
        );
      case DetailedPreviewScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DetailedPreviewScreen(),
        );
      case AddOrderScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AddOrderScreen(),
        );
      case OrderDetailsScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OrderDetailsScreen(),
        );
      default:
        debugPrint('Navigating to ${settings.name}');
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Arggg!'),
          ),
          body: const Center(
            child: Text('Oh No! You should not be here! '),
          ),
        );
      },
    );
  }
}
