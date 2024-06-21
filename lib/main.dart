import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:kindertown_parent_app/controller/controller.dart';
import 'package:kindertown_parent_app/controller/home_controller.dart';
import 'package:kindertown_parent_app/controller/kindergarten_controller.dart';
import 'package:kindertown_parent_app/controller/mission_controller.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
// import 'package:kindertown_parent_app/pages/auth/login/login_page.dart';
// import 'package:kindertown_parent_app/pages/onboarding/hello_page.dart';
// import 'package:kindertown_parent_app/pages/onboarding/onboarding_page.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/fill_reservation_detail_first_page.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/select_payment_method_page.dart';
// import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/what_you_should_know_page.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/font/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  Get.put(KindergartenController());
  Get.put(HomeController());
  Get.put(MissionController());

  Future.delayed(const Duration(milliseconds: 200)).then((val) async {
    runApp(const MyApp());
  }, onError: (error) {});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    Future<bool> isFirstTime() async {
      const storage = FlutterSecureStorage();
      final data = await storage.read(key: 'first_time_use');
      if (data != null && bool.parse(data)) {
        await storage.write(key: 'first_time_use', value: 'false');
        return true;
      }
      return false;
    }

    Future<bool> getAllData() async {
      final getKindergatenSuccess =
          await kindergartenController.getKindergartenList();
      if (!getKindergatenSuccess) {
        return false;
      }
      final getMailSuccess = await homeController.getMailList();
      if (!getMailSuccess) {
        return false;
      }
      return true;
    }

    return MaterialApp(
        title: 'Kindertown Parent App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        navigatorObservers: [ClearFocusOnPop()],
        home: const SelectPaymentMethodPage()
        // FutureBuilder(
        //     future: isFirstTime(),
        //     builder: (context, snap) {
        //       final isFirstTime = snap.data;

        //       if (isFirstTime != null && !isFirstTime) {
        //         return FutureBuilder(
        //             future: getAllData(),
        //             builder: (context, snap) {
        //               if (snap.data == null || snap.data == false) {
        //                 return const LoginPage();
        //               } else {
        //                 return const HelloPage();
        //               }
        //             });
        //       } else {
        //         return const OnboardingPage();
        //       }
        //     }),
        );
  }
}

class ClearFocusOnPop extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(Duration.zero);
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    });
  }
}
