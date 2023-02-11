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
import 'package:urban_farmer/ui/widget/shopping_screen.dart';
import '../ui/screen/kitchen/gardeners_visit_screen.dart';
import '../ui/screen/login/sign_in_verification.dart';
import '../ui/screen/login/sign_up_verification.dart';
import '../ui/screen/services/corporate_gifts/corporate_details_screen.dart';
import '../ui/screen/services/corporate_gifts/corporate_gifts_screen.dart';
import '../ui/screen/services/green_gift/green_details_screen.dart';
import '../ui/screen/services/green_gift/green_gift_screen.dart';
import '../ui/screen/cart/cart_screen.dart';
import '../ui/screen/services/garden_maintenance.dart';
import '../ui/screen/login/sign_up_screen.dart';
import '../ui/screen/saved/saved_screen.dart';
import '../ui/screen/search/search_screen.dart';
import '../ui/screen/kitchen/planters/planters_order_screen.dart';
import '../ui/screen/kitchen/planters/order_detailed_preview_screen.dart';
import '../ui/screen/kitchen/planters/order_details_screen.dart';
import '../ui/screen/kitchen/what_doyouwishto_grow_screen.dart';
import '../ui/screen/kitchen/detail_kitchengarden_screen.dart';
import '../ui/screen/kitchen/kitchen_detailed_preview_screen.dart';
import '../ui/screen/kitchen/kitchen_order/kitchen_orde_screen.dart';
import '../ui/screen/services/online_gardening_screen.dart';
import '../ui/screen/kitchen/services_category_screen.dart';
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
      case DetailKitchenGardenScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DetailKitchenGardenScreen(),
        );
      case KitchenOrderScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const KitchenOrderScreen(),
        );
      case KitchenDetailedPreviewScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const KitchenDetailedPreviewScreen(),
        );
      case PlantersOrderScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const PlantersOrderScreen(),
        );
      case OrderDetailsScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OrderDetailsScreen(),
        );
      case PlantersPreviewScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const PlantersPreviewScreen(),
        );
      case WhatDoYouWishToGrowScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const WhatDoYouWishToGrowScreen(),
        );
      case CartScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const CartScreen(),
        );
      case GardenersVisitScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const GardenersVisitScreen(),
        );
      case GardenMaintenanceScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const GardenMaintenanceScreen(),
        );
      case CorporateGiftsScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const CorporateGiftsScreen(),
        );
      case CorporateDetailsScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const CorporateDetailsScreen(),
        );
      case OnlineGardeningScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OnlineGardeningScreen(),
        );
      case GreenGiftScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const GreenGiftScreen(),
        );
      case GreenDetailsScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const GreenDetailsScreen(),
        );
      case ShoppingScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ShoppingScreen(),
        );
      case SignUpVerificationScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SignUpVerificationScreen(),
        );
      case SignInVerificationScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SignInVerificationScreen(),
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
