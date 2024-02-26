import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mafqood/core/utilis/desk_storage.dart';
import 'package:mafqood/core/utilis/navigation_service.dart';
import 'package:mafqood/forget_password_screen/forget_password_screen.dart';
import 'package:mafqood/home_screen/presentation/views/screen/profile_screen.dart';
import 'package:mafqood/persons_bloc/persons_bloc.dart';
import 'package:mafqood/profile_bloc/profile_bloc.dart';
import 'package:mafqood/signup_screens/presentation/views/screens/otp_screen/otp_screen.dart';
import 'package:mafqood/signup_screens/presentation/views/screens/signup1_screen/sign_up_screen_1.dart';
import 'package:mafqood/signup_screens/presentation/views/screens/signup2_screen/sign_up_screen_2.dart';
import 'package:mafqood/signup_screens/presentation/views/screens/signup3_screen/sign_up_screen_3.dart';
import 'package:mafqood/signup_screens/presentation/views/screens/signup4_screen/front_of_id_screen.dart';
import 'package:mafqood/signup_screens/presentation/views/screens/signup5_screen/sign_up_screen_5.dart';
import 'package:mafqood/splash_screen/presentation/views/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'addPost_screen/views/screens/find_post_screen.dart';
import 'addPost_screen/views/screens/lost_post_screen.dart';
import 'authentication_bloc/authentication_bloc.dart';
import 'core/utilis/repository.dart';
import 'home_screen/presentation/views/screen/home_screen.dart';
import 'home_screen/presentation/views/screen/main_screen.dart';
import 'login_screen/presentation/views/screen/login_screen.dart';
import 'signup_screens/presentation/views/screens/otp_screen/otp_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initSecureStorage();
  await AuthenticationRepository().init();
  await PersonsRepository().init();
  await ProfileRepository().init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}
initSecureStorage() async {
  await Hive.initFlutter();
  const secureStorage = FlutterSecureStorage();
  final encryprionKey = await secureStorage.read(key: 'key');
  if (encryprionKey == null) {
    final key = Hive.generateSecureKey();
    await secureStorage.write(
      key: 'key',
      value: base64UrlEncode(key),
    );
  }
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return Material(

      child: MultiBlocProvider(
        providers: [
          ChangeNotifierProvider<OTPProvider>(
            create: (_) => OTPProvider(),
          ),
          BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(AuthenticationRepository()),
          ),
          BlocProvider<ProfileBloc>(
            create: (context) => ProfileBloc(ProfileRepository()),
          ),
          BlocProvider<PersonsBloc>(
            create: (context) => PersonsBloc(PersonsRepository()),
          ),

        ],
        child: MaterialApp(
          navigatorKey: NavigationService.navigatorKey,
          supportedLocales: const [
            Locale("af"),
            Locale("am"),
            Locale("ar"),
            Locale("az"),
            Locale("be"),
            Locale("bg"),
            Locale("bn"),
            Locale("bs"),
            Locale("ca"),
            Locale("cs"),
            Locale("da"),
            Locale("de"),
            Locale("el"),
            Locale("en"),
            Locale("es"),
            Locale("et"),
            Locale("fa"),
            Locale("fi"),
            Locale("fr"),
            Locale("gl"),
            Locale("ha"),
            Locale("he"),
            Locale("hi"),
            Locale("hr"),
            Locale("hu"),
            Locale("hy"),
            Locale("id"),
            Locale("is"),
            Locale("it"),
            Locale("ja"),
            Locale("ka"),
            Locale("kk"),
            Locale("km"),
            Locale("ko"),
            Locale("ku"),
            Locale("ky"),
            Locale("lt"),
            Locale("lv"),
            Locale("mk"),
            Locale("ml"),
            Locale("mn"),
            Locale("ms"),
            Locale("nb"),
            Locale("nl"),
            Locale("nn"),
            Locale("no"),
            Locale("pl"),
            Locale("ps"),
            Locale("pt"),
            Locale("ro"),
            Locale("ru"),
            Locale("sd"),
            Locale("sk"),
            Locale("sl"),
            Locale("so"),
            Locale("sq"),
            Locale("sr"),
            Locale("sv"),
            Locale("ta"),
            Locale("tg"),
            Locale("th"),
            Locale("tk"),
            Locale("tr"),
            Locale("tt"),
            Locale("uk"),
            Locale("ug"),
            Locale("ur"),
            Locale("uz"),
            Locale("vi"),
            Locale("zh"),
          ],
          initialRoute: '/',
          routes: {
            'splashScreen': (context) => SplashScreen(),
            'loginScreen': (context) => LoginScreen(),
            'signUpScreen2': (context) => SignUpScreen2(),
            'signUpScreen3': (context) => SignUpScreen3(),
            'otpScreen': (context) => OtpScreen(),
            'signUpScreen1': (context) => SignUpScreen1(),
            'findPostScreen': (context) => FindPostScreen(),
            'homeScreen': (context) => HomeScreen(),
            'mainScreen': (context) => MainScreen(),
            'signUpScreen5' : (context) => SignUpScreen5(),
            'profileScreen' : (context) => ProfileScreen(),
            'lostPostScreen' : (context) => LostPostScreen(),
            'idScreen' : (context) => IdImagesScreen(),
            "forgotPasswordScreen" :(context) => ForgetPassword(),
          },
          localizationsDelegates: const [
            CountryLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          home: FutureBuilder(
            future: DeskStorage().getToken(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data != null) {
                  DeskStorage().getAllAuthenticatedData();
                  return MainScreen();
                } else {
                  return SplashScreen();
                }
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
