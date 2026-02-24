// ignore_for_file: file_names, deprecated_member_use

import 'package:eachut/terms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

/// Page data for lazy-loaded PageView (only visible page loads images).
class _AppPage {
  const _AppPage({
    required this.logo,
    required this.mockup,
    required this.description,
    required this.buttons,
  });
  final String logo;
  final String mockup;
  final String description;
  final List<({String icon, String label, String url})> buttons;
}

const List<_AppPage> _pages = [
  _AppPage(
    logo: 'assets/img/NepalSMS_Logo.png',
    mockup: 'assets/img/NepalSMS_Mockup.png',
    description: 'Send sms online directly to user networks',
    buttons: [
      (icon: 'assets/svg/ios.svg', label: 'iOS', url: 'https://apps.apple.com/us/app/nepal-sms/id6445808984'),
      (icon: 'assets/svg/android.svg', label: 'Android', url: 'https://play.google.com/store/apps/details?id=com.eachut.nepalsms'),
    ],
  ),
  _AppPage(
    logo: 'assets/img/nocprices_Logo.png',
    mockup: 'assets/img/nocprices_Mockup.png',
    description: 'Price of fuel today? Get instant notification',
    buttons: [
      (icon: 'assets/svg/ios.svg', label: 'iOS', url: 'https://apps.apple.com/us/app/noc-prices/id6444857714'),
      (icon: 'assets/svg/android.svg', label: 'Android', url: 'https://play.google.com/store/apps/details?id=com.eachut.nocprice'),
    ],
  ),
  _AppPage(
    logo: 'assets/img/sparrowsms_Logo.png',
    mockup: 'assets/img/sparrowsms_Mockup.png',
    description: 'Try sending sms in Nepal just using sparrow sms API. ',
    buttons: [
      (icon: 'assets/svg/ios.svg', label: 'iOS', url: 'https://apps.apple.com/us/app/sparrow-sms/id1673080794'),
      (icon: 'assets/svg/android.svg', label: 'Android', url: 'https://play.google.com/store/apps/details?id=com.eachut.mysparrowsms'),
    ],
  ),
  _AppPage(
    logo: 'assets/img/NepaliGallery_Logo.png',
    mockup: 'assets/img/NepaliGallery_Mockup.png',
    description: 'Discover, Create And Share Photography',
    buttons: [
      (icon: 'assets/svg/website.svg', label: 'Website', url: 'https://demo.eachut.com/NepaliGallery%20PHP/'),
      (icon: 'assets/svg/research.svg', label: 'Research', url: 'https://roshansah.com.np/2021/04/18/django-nepaligallery-website/'),
    ],
  ),
  _AppPage(
    logo: 'assets/img/Toilet_Logo.png',
    mockup: 'assets/img/Toilet_Mockup.png',
    description: 'Explore, Contribute And Save Toilet',
    buttons: [
      (icon: 'assets/svg/prototype.svg', label: 'Prototype', url: 'https://xd.adobe.com/view/2ffcc7cd-fde8-4005-8cbb-47235fd0d7a1-7aaf/'),
      (icon: 'assets/svg/research.svg', label: 'Research', url: 'https://roshansah.com.np/2021/04/18/user-centered-interface-design-designing-for-usability/'),
    ],
  ),
  _AppPage(
    logo: 'assets/img/control_Logo.png',
    mockup: 'assets/img/Control_Mockup.png',
    description: 'Explore, Listen And Share Your Favorite Music',
    buttons: [
      (icon: 'assets/svg/website.svg', label: 'Github', url: 'https://github.com/RoshanOscarSah/control'),
      (icon: 'assets/svg/research.svg', label: 'Research', url: 'https://roshansah.com.np/2021/05/09/control-django-project/'),
    ],
  ),
];

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

  Widget _buildPage(BuildContext context, int index) {
    final p = _pages[index];
    final mockupHeight = MediaQuery.of(context).size.height >= 700 ? 275.0 : 150.0;
    return Container(
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
          const SizedBox(height: 120),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: Image.asset(p.logo, width: double.infinity),
          ),
          const SizedBox(height: 50),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              p.description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: mockupHeight,
            child: Image.asset(p.mockup, width: double.infinity),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (final b in p.buttons)
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color(0xff03DAC5),
                  ),
                  child: TextButton.icon(
                    icon: SvgPicture.asset(b.icon, width: 18, color: Colors.white),
                    onPressed: () => _launchUrl(b.url),
                    label: Text(b.label, style: const TextStyle(color: Colors.white)),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
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
              child: PageView.builder(
                allowImplicitScrolling: true,
                scrollDirection: Axis.horizontal,
                controller: controller,
                itemCount: _pages.length,
                itemBuilder: _buildPage,
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
