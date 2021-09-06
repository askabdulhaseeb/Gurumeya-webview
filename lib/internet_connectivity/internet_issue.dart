import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:gurumeya_webview/configs/configs.dart';
import 'package:gurumeya_webview/landing_page/landing_page.dart';

class InternetIssueScreen extends StatefulWidget {
  const InternetIssueScreen({Key? key}) : super(key: key);
  static const String routeName = '/InternetIssueScreen';
  @override
  _InternetIssueScreenState createState() => _InternetIssueScreenState();
}

class _InternetIssueScreenState extends State<InternetIssueScreen> {
  @override
  void initState() {
    super.initState();
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult connresult) {
      if (connresult == ConnectivityResult.mobile ||
          connresult == ConnectivityResult.wifi) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          LandingPage.routeName,
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Configs.networkIssueImage),
              const SizedBox(height: 20),
              Text(
                'Internet connectivity issue!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
              Text(
                'Please connect your mobile with internet!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
