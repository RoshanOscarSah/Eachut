// ignore_for_file: file_names, deprecated_member_use

import 'package:eachut/terms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class EachutScreen extends StatefulWidget {
  const EachutScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<EachutScreen> createState() => _EachutScreenState();
}

class _EachutScreenState extends State<EachutScreen> {
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
            Container(
              padding: const EdgeInsets.only(bottom: 80),
              child: PageView(
                allowImplicitScrolling: true,
                scrollDirection: Axis.horizontal,
                controller: controller,
                children: [
                  // Nepal SMS
                  Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xff515151), Color(0xff515151)],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 120,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: Image.asset(
                              "assets/img/NepalSMS_Logo.png",
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: const Text(
                              "Send sms online directly to user networks",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 14),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height >= 700
                                ? 275
                                : 150,
                            child: Image.asset(
                              "assets/img/NepalSMS_Mockup.png",
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: const Color(0xff03DAC5),
                                ),
                                child: TextButton.icon(
                                  icon: SvgPicture.asset("assets/svg/ios.svg",
                                      width: 18, color: Colors.white),
                                  onPressed: () async {
                                    _launchUrl(
                                        'https://apps.apple.com/us/app/nepal-sms/id6445808984');
                                  },
                                  label: const Text(
                                    "iOS",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: const Color(0xff03DAC5),
                                ),
                                child: TextButton.icon(
                                  icon: SvgPicture.asset(
                                      "assets/svg/android.svg",
                                      width: 18,
                                      color: Colors.white),
                                  onPressed: () async {
                                    _launchUrl(
                                        'https://play.google.com/store/apps/details?id=com.eachut.nepalsms');
                                  },
                                  label: const Text(
                                    "Android",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                  // NOC PRICES
                  Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xff515151), Color(0xff515151)],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 120,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: Image.asset(
                              "assets/img/nocprices_Logo.png",
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: const Text(
                              "Price of fuel today? Get instant notification",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 14),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height >= 700
                                ? 275
                                : 150,
                            child: Image.asset(
                              "assets/img/nocprices_Mockup.png",
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: const Color(0xff03DAC5),
                                ),
                                child: TextButton.icon(
                                  icon: SvgPicture.asset("assets/svg/ios.svg",
                                      width: 18, color: Colors.white),
                                  onPressed: () async {
                                    _launchUrl(
                                        'https://apps.apple.com/us/app/noc-prices/id6444857714');
                                  },
                                  label: const Text(
                                    "iOS",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: const Color(0xff03DAC5),
                                ),
                                child: TextButton.icon(
                                  icon: SvgPicture.asset(
                                      "assets/svg/android.svg",
                                      width: 18,
                                      color: Colors.white),
                                  onPressed: () async {
                                    _launchUrl(
                                        'https://play.google.com/store/apps/details?id=com.eachut.nocprice');
                                  },
                                  label: const Text(
                                    "Android",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                  // SPARROW SMS
                  Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xff515151), Color(0xff515151)],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 120,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: Image.asset(
                              "assets/img/sparrowsms_Logo.png",
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: const Text(
                              "Try sending sms in Nepal just using sparrow sms API. ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 14),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height >= 700
                                ? 275
                                : 150,
                            child: Image.asset(
                              "assets/img/sparrowsms_Mockup.png",
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: const Color(0xff03DAC5),
                                ),
                                child: TextButton.icon(
                                  icon: SvgPicture.asset("assets/svg/ios.svg",
                                      width: 18, color: Colors.white),
                                  onPressed: () async {
                                    _launchUrl(
                                        'https://apps.apple.com/us/app/sparrow-sms/id1673080794');
                                  },
                                  label: const Text(
                                    "iOS",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: const Color(0xff03DAC5),
                                ),
                                child: TextButton.icon(
                                  icon: SvgPicture.asset(
                                      "assets/svg/android.svg",
                                      width: 18,
                                      color: Colors.white),
                                  onPressed: () async {
                                    _launchUrl(
                                        'https://play.google.com/store/apps/details?id=com.eachut.mysparrowsms');
                                  },
                                  label: const Text(
                                    "Android",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),

//FIRST PAGE
                  Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xff515151), Color(0xff515151)],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 120,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: Image.asset(
                              "assets/img/NepaliGallery_Logo.png",
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: const Text(
                              "Discover, Create And Share Photography",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 14),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height >= 700
                                ? 275
                                : 150,
                            child: Image.asset(
                              "assets/img/NepaliGallery_Mockup.png",
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: const Color(0xff03DAC5),
                                ),
                                child: TextButton.icon(
                                  icon: SvgPicture.asset(
                                      "assets/svg/website.svg",
                                      width: 18,
                                      color: Colors.white),
                                  onPressed: () async {
                                    _launchUrl('https://nepaligallery.com');
                                  },
                                  label: const Text(
                                    "Website",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: const Color(0xff03DAC5),
                                ),
                                child: TextButton.icon(
                                  icon: SvgPicture.asset(
                                      "assets/svg/research.svg",
                                      width: 18,
                                      color: Colors.white),
                                  onPressed: () async {
                                    _launchUrl(
                                        'https://roshansah.com.np/2021/04/18/django-nepaligallery-website/');
                                  },
                                  label: const Text(
                                    "Research",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),

//SECOND PAGE
                  Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xff515151), Color(0xff515151)],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 120,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: Image.asset(
                              "assets/img/Toilet_Logo.png",
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: const Text(
                              "Explore, Contribute And Save Toilet",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 14),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height >= 700
                                ? 275
                                : 150,
                            child: Image.asset(
                              "assets/img/Toilet_Mockup.png",
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: const Color(0xff03DAC5),
                                ),
                                child: TextButton.icon(
                                  icon: SvgPicture.asset(
                                      "assets/svg/prototype.svg",
                                      width: 18,
                                      color: Colors.white),
                                  onPressed: () async {
                                    _launchUrl(
                                        "https://xd.adobe.com/view/2ffcc7cd-fde8-4005-8cbb-47235fd0d7a1-7aaf/");
                                  },
                                  label: const Text(
                                    "Prototype",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: const Color(0xff03DAC5),
                                ),
                                child: TextButton.icon(
                                  icon: SvgPicture.asset(
                                      "assets/svg/research.svg",
                                      width: 18,
                                      color: Colors.white),
                                  onPressed: () async {
                                    _launchUrl(
                                        'https://roshansah.com.np/2021/04/18/user-centered-interface-design-designing-for-usability/');
                                  },
                                  label: const Text(
                                    "Research",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),

//THIRD PAGE
                  Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xff515151), Color(0xff515151)],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 120,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: Image.asset(
                              "assets/img/control_Logo.png",
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: const Text(
                              "Explore, Listen And Share Your Favorite Music",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 14),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height >= 700
                                ? 275
                                : 150,
                            child: Image.asset(
                              "assets/img/Control_Mockup.png",
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: const Color(0xff03DAC5),
                                ),
                                child: TextButton.icon(
                                  icon: SvgPicture.asset(
                                      "assets/svg/website.svg",
                                      width: 18,
                                      color: Colors.white),
                                  onPressed: () async {
                                    _launchUrl("https://control.eachut.com/");
                                  },
                                  label: const Text(
                                    "Website",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: const Color(0xff03DAC5),
                                ),
                                child: TextButton.icon(
                                  icon: SvgPicture.asset(
                                      "assets/svg/research.svg",
                                      width: 18,
                                      color: Colors.white),
                                  onPressed: () async {
                                    _launchUrl(
                                        'https://roshansah.com.np/2021/05/09/control-django-project/');
                                  },
                                  label: const Text(
                                    "Research",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Positioned(
              top: 35,
              left: 20,
              child: Image.asset(
                "assets/img/Eachut_Logo.png",
                fit: BoxFit.cover,
                height: 50,
              ),
            ),
            Positioned(
                top: 50,
                right: 20,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TermsScreen()));
                  },
                  child: const Icon(
                    Icons.apps,
                    color: Colors.white,
                  ),
                )),
          ],
        ),
        bottomSheet: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 80,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff515151), Color(0xff515151)],
            ),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            // TextButton(
            //     onPressed: () => controller.jumpToPage(2), child: Text("Skip")),

            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 6,
                effect: const WormEffect(
                    spacing: 8.0,
                    radius: 9.0,
                    dotWidth: 15.0,
                    dotHeight: 15.0,
                    paintStyle: PaintingStyle.stroke,
                    strokeWidth: 2,
                    dotColor: Colors.white,
                    activeDotColor: Colors.white),
                onDotClicked: (index) => controller.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn),
              ),
            ),
            // TextButton(
            //     onPressed: () => controller.nextPage(
            //         duration: Duration(milliseconds: 500),
            //         curve: Curves.easeInOut),
            //     child: Text("Next")),
          ]),
        ),
      ),
    );
  }
}
