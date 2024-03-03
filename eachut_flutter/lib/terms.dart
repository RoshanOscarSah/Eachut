// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  final controller = PageController();
  static const SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Color(0xff515151),
    systemNavigationBarColor: Color(0xff515151),
  );
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    });
  }

  // ignore: unused_element
  Future<void> _launchUrl(url) async {
    final Uri url0 = Uri.parse(url);
    if (!await launchUrl(url0)) {
      throw Exception('Could not launch $url0');
    }
  }

  // ignore: unused_element
  Future<void> _showMyDialog(String text) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(text),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Dismiss',
                style: TextStyle(color: Color(0xff03DAC5)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
// AnnotatedRegion<SystemUiOverlayStyle>(
//       value: SystemUiOverlayStyle(
//         statusBarColor: Color(0xff515151),
//         systemNavigationBarColor: Color(0xff515151),
//       ),
    // child:

    SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    return WillPopScope(
      onWillPop: () async {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
            statusBarColor: Color(0xffBBBCBD),
            systemNavigationBarColor: Color(0xffAFA39A),
          ));
        });

        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xff515151),
        body: Stack(
          children: [
            ListView(
                padding: const EdgeInsets.only(
                    bottom: 80, top: 120, left: 50, right: 50),
                children: [
                  RichText(
                      text: const TextSpan(
                          text:
                              'Eachut Generic Terms and Conditions \n\nTerms and Conditions ("Terms") \n\nLast updated: (2020) \n\nPlease read these Terms and Conditions ("Terms", "Terms and Conditions") carefully before using the http://www.eachut.com website and the Eachut’s Mobile App mobile application (the "Service") operated by Eachut ("us", "we", or "our"). \nYour access to and use of the Service is conditioned on your acceptance of and compliance with these Terms. These Terms apply to all visitors, users and others who access or use the Service. \nBy accessing or using the Service you agree to be bound by these Terms. If you disagree with any part of the terms then you may not access the Service. \n\nPurchases \nIf you wish to purchase any product or service made available through the Service ("Purchase"), you may be asked to supply certain information relevant to your Purchase including, without limitation, your … \nThe Purchases section is for businesses that sell online (physical or digital). For the full disclosure section, create your own Terms and Conditions. \n\nSubscriptions \nSome parts of the Service are billed on a subscription basis ("Subscription(s)"). You will be billed in advance on a recurring ... \nThe Subscriptions section is for SaaS businesses. For the full disclosure section, create your own Terms and Conditions. \n\nContent \nOur Service allows you to post, link, store, share and otherwise make available certain information, text, graphics, videos, or other material ("Content"). You are responsible for the … \nThe Content section is for businesses that allow users to create, edit, share, make content on their websites or apps. For the full disclosure section, create your own Terms and Conditions. \n\nLinks To Other Web Sites \nOur Service may contain links to third-party web sites or services that are not owned or controlled by Eachut. \nEachut has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that Eachut shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with use of or reliance on any such content, goods or services available on or through any such web sites or services. \n\nChanges \nWe reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material we will try to provide at least 30 days notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion. \n\nContact Us \nIf you have any questions about these Terms, please contact us.\n ',
                          style: TextStyle(color: Colors.white)))
                ]),
            Positioned(
              top: 35,
              left: 50,
              child: Image.asset(
                "assets/img/Eachut_Logo.png",
                fit: BoxFit.cover,
                height: 50,
              ),
            ),
            Positioned(
                top: 50,
                left: 20,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
