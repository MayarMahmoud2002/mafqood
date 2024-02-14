import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/home_screen/presentation/views/screen/profile_screen.dart';
import 'package:mafqood/profile_bloc/profile_bloc.dart';
import 'package:mafqood/signup_screens/presentation/views/screens/otp_screen/otp_screen.dart';
import 'package:mafqood/signup_screens/presentation/views/screens/signup1_screen/sign_up_screen_1.dart';
import 'package:mafqood/signup_screens/presentation/views/screens/signup2_screen/sign_up_screen_2.dart';
import 'package:mafqood/signup_screens/presentation/views/screens/signup3_screen/sign_up_screen_3.dart';
import 'package:mafqood/signup_screens/presentation/views/screens/signup5_screen/sign_up_screen_5.dart';
import 'package:mafqood/splash_screen/presentation/views/screens/splash_screen.dart';
import 'addPost_screen/views/screens/find_post_screen.dart';
import 'addPost_screen/views/screens/lost_post_screen.dart';
import 'authentication_bloc/authentication_bloc.dart';
import 'core/utilis/repository.dart';
import 'founded_person_post_bloc/find_post_bloc.dart';
import 'home_screen/presentation/views/screen/home_screen.dart';
import 'home_screen/presentation/views/screen/main_screen.dart';
import 'login_screen/presentation/views/screen/login_screen.dart';
import 'lost_person_post_bloc/lost_person_bloc.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(AuthenticationRepository()),
          ),
          BlocProvider<ProfileBloc>(
            create: (context) => ProfileBloc(ProfileRepository()),
          ),
          BlocProvider<FindPostBloc>(
            create: (context) => FindPostBloc(FoundedPostRepository()),
          ),
          BlocProvider<LostPersonBloc>(
            create: (context) => LostPersonBloc((LostPostRepository())),
          ),
        ],
        child: MaterialApp(
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
          },
          localizationsDelegates: const [
            CountryLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          home: FindPostScreen(),
        ),
      ),
    );
  }
}
