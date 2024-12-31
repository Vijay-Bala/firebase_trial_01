import 'package:firebase_trial2/firebase_options.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_trial2/safearea.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

  FirebaseCrashlytics.instance.log("App started!");

  FirebaseCrashlytics.instance.setUserIdentifier("Vijay Bala A");

  FirebaseCrashlytics.instance.setCustomKey("user_id", "7604");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(350, 700),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: const HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    setupFirebaseMessaging();
  }

  void setupFirebaseMessaging() async {
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    await FirebaseMessaging.instance.subscribeToTopic("Trial");
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      String? token = await messaging.getToken();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("FCM Token: $token")),
      );
      print("FCM Token: $token");
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Message: ${message.notification?.title}")),
        );
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("App opened vida message")),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("User denied permission")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase"),
        toolbarHeight: 50.h,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 0.5.sw,
              height: 0.2.sh,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Text(
                  "Adaptive Container",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    throw Exception("A non-fatal error occurred");
                  } catch (e, stackTrace) {
                    FirebaseCrashlytics.instance
                        .recordError(e, stackTrace, reason: 'Non-fatal error');
                    FirebaseCrashlytics.instance.log("Non-fatal error logged");
                    await FirebaseCrashlytics.instance.sendUnsentReports();
                  }
                },
                child: Text(
                  "Log Non-Fatal Error",
                  style: TextStyle(fontSize: 18.sp),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: ElevatedButton(
                onPressed: () {
                  FirebaseCrashlytics.instance.crash();
                },
                child: Text(
                  "Crash App",
                  style: TextStyle(fontSize: 18.sp),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              width: customWidth(100),
              height: customHeight(200),
              color: Colors.green,
              child: Center(
                child: Text(
                  "Custom Scaled Box",
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              // onPressed: () => Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SafeAreaTrial()),
              // ),
              onPressed: () {
                FirebaseMessaging.instance.sendMessage();
              },
              child: Icon(
                Icons.star,
                semanticLabel: "Safe Area",
                size: 30.sp,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  double customWidth(double width) => width / 375.0 * ScreenUtil().screenWidth;
  double customHeight(double height) =>
      height / 812.0 * ScreenUtil().screenHeight;
}
