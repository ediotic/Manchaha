
// app routes
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../provider/controllers/home_provider.dart';
import '../screens/address/add_new_address.dart';
import '../screens/address/address_screen.dart';
import '../screens/bottom_nav_bar.dart';
import '../screens/cards/card_screen.dart';
import '../screens/cards/selected_card.dart';
import '../screens/categories/categories_screen.dart';
import '../screens/faq/faq_screem.dart';
import '../screens/fliter_products/filter_products_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/my_cart/my_cart_screen.dart';
import '../screens/my_wishlist/my_wishlist_screen.dart';
import '../screens/notifications/notification_screen.dart';
import '../screens/onboarding/login/login_screen.dart';
import '../screens/onboarding/login/welcome.dart';
import '../screens/onboarding/otp_verification/otp_veification_screen.dart';
import '../screens/onboarding/signup/signup_screen.dart';
import '../screens/onboarding/splash/splash_screen.dart';
import '../screens/order_history/order_history_screen.dart';
import '../screens/order_summary/order_summary.dart';
import '../screens/payments_verification/otp_verification_screen.dart';
import '../screens/payments_verification/payments_otpsent_phnoneverification_screen.dart';
import '../screens/payments_verification/payments_successfull_screen.dart';
import '../screens/privacy_&_policy/privacy_policy.dart';
import '../screens/products_collection/menstshirt_screen.dart';
import '../screens/profiles/my_profile_screen.dart';
import '../screens/profiles/profile_screen.dart';
import '../screens/search_field/searchfield_screen.dart';
import '../screens/selected_product_details/selected_product_details_screen.dart';
import '../screens/terms_conditons/terma_conditions.dart';
import '../screens/track_order/track_order_screen.dart';
import 'app_keys.dart';
import 'app_route_names.dart';

class AppRouter {
  static GoRouter goRouter = GoRouter(
    navigatorKey: WidgetKeys.navigatorKey,
    routes: [
      //onbaording--------------
      GoRoute(
        name: "initial",
        path: "/",
        builder: (context, state) => const SizedBox(),
        redirect: (context, state) async {
          return AppRoutes.splash;
        },
      ),
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.welcome,
        name: AppRoutes.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        name: AppRoutes.signUp,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: AppRoutes.otpVerification,
        name: AppRoutes.otpVerification,
        builder: (context, state) => const PhoneVerificationScreen(),
      ),
      GoRoute(
        path: AppRoutes.bottomNavBar,
        name: AppRoutes.bottomNavBar,
        builder: (context, state) => BottomNavBar(
          staticIndex: BottomNavArguments(),
        ),
      ),

      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (context, state) => ChangeNotifierProvider(
          create: (context) => HomeProvider(),
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.otpPayments,
        name: AppRoutes.otpPayments,
        builder: (context, state) => const PaymentOTPSentPhoneVerification(),
      ),
      GoRoute(
        path: AppRoutes.searchBar,
        name: AppRoutes.searchBar,
        builder: (context, state) => const SearchField(),
      ),
      GoRoute(
        path: AppRoutes.paymentsOTPVerification,
        name: AppRoutes.paymentsOTPVerification,
        builder: (context, state) => const PhoneOTPVerificationScreen(),
      ),
      GoRoute(
        path: AppRoutes.successPayments,
        name: AppRoutes.successPayments,
        builder: (context, state) => const PaymentSuccessScreen(),
      ),
      GoRoute(
        path: AppRoutes.myCart,
        name: AppRoutes.myCart,
        builder: (context, state) => const MyCartScreen(),
      ),
      GoRoute(
        path: AppRoutes.mesnCollection,
        name: AppRoutes.mesnCollection,
        builder: (context, state) => const MensTShirt(),
      ),
      GoRoute(
        path: AppRoutes.address,
        name: AppRoutes.address,
        builder: (context, state) => const CustomerAddress(),
      ),
      GoRoute(
        path: AppRoutes.newAddress,
        name: AppRoutes.newAddress,
        builder: (context, state) => const AddNewAddress(),
      ),
      GoRoute(
        path: AppRoutes.selectedProduct,
        name: AppRoutes.selectedProduct,
        builder: (context, state) {
          Map<String, dynamic> extra = state.extra as Map<String, dynamic>;
          return SelectedProduct(
            image: extra['image'],
            productName: extra['productName'],
            details: extra['details'],
          );
        },
      ),

      GoRoute(
        path: AppRoutes.filterProducts,
        name: AppRoutes.filterProducts,
        builder: (context, state) => const FilterProducts(),
      ),
      GoRoute(
        path: AppRoutes.myCards,
        name: AppRoutes.myCards,
        builder: (context, state) => const CardScreen(),
      ),
      GoRoute(
        path: AppRoutes.selectedCards,
        name: AppRoutes.selectedCards,
        builder: (context, state) => const SelectedCardScreen(),
      ),
      GoRoute(
        path: AppRoutes.orderSummary,
        name: AppRoutes.orderSummary,
        builder: (context, state) => const OrderSummaryScreen(),
      ),
      GoRoute(
        path: AppRoutes.profile,
        name: AppRoutes.profile,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: AppRoutes.myProfile,
        name: AppRoutes.myProfile,
        builder: (context, state) => const MyProfileScreen(),
      ),
      GoRoute(
        path: AppRoutes.orderHistory,
        name: AppRoutes.orderHistory,
        builder: (context, state) => const OrderHistoryScreen(),
      ),
      GoRoute(
        path: AppRoutes.trackOrder,
        name: AppRoutes.trackOrder,
        builder: (context, state) => const TrackOrderScreen(),
      ),
      GoRoute(
        path: AppRoutes.wishlist,
        name: AppRoutes.wishlist,
        builder: (context, state) => const MyWishlistScreen(),
      ),
      GoRoute(
        path: AppRoutes.privacyPolicy,
        name: AppRoutes.privacyPolicy,
        builder: (context, state) => const PrivacyPolicy(),
      ),
      GoRoute(
        path: AppRoutes.termsConditons,
        name: AppRoutes.termsConditons,
        builder: (context, state) => const TermsConditions(),
      ),
      GoRoute(
        path: AppRoutes.faq,
        name: AppRoutes.faq,
        builder: (context, state) => const FactAndQuestions(),
      ),
      GoRoute(
        path: AppRoutes.notification,
        name: AppRoutes.notification,
        builder: (context, state) => const NotificationScreen(),
      ),
      GoRoute(
        path: AppRoutes.categories,
        name: AppRoutes.categories,
        builder: (context, state) => const CategoriesScreen(),
      ),
    ],
  );
}

class BottomNavArguments {
  int index;

  BottomNavArguments({this.index = 0});
}
