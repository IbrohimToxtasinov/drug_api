import 'package:drugs_app/screens/category_Listing.dart';
import 'package:drugs_app/screens/home_page.dart';
import 'package:drugs_app/screens/slider.dart';
import 'package:drugs_app/screens/welcome_page.dart';
import 'package:drugs_app/utils/images.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  String button = "Next";
  int _currentPage = 0;
  final PageController _controller = PageController();

  final List <Widget> _pages = const [
    SliderPage(title: "View and buy Medicine online", description: "Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.", image: MyImages.imageOnboarding1,),
    SliderPage(title: "Online medical & Healthcare", description: "Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.", image: MyImages.imageOnboarding2,),
    SliderPage(title: "Get Delivery on time", description: "Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.", image: MyImages.imageOnboarding3,),
  ];
  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget> [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: _pages.length,
            onPageChanged: _onChanged,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(_pages.length, (int index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 10,
                    width: (index == _currentPage) ? 30 : 10,
                    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: (index == _currentPage)
                      ? Colors.blue
                      : Colors.blue.withOpacity(0.5)
                    ),
                  );
                }),
              ),
              InkWell(
                onTap: () {
                  if(_currentPage == (_pages.length - 1)){
                    Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => const WelcomePage()));
                  }
                  else {
                    _controller.nextPage(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeInOutQuint);
                  }
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 70,
                  alignment: Alignment.center,
                  width: (_currentPage == (_pages.length - 1)) ? 200 : 70,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: (_currentPage == (_pages.length - 1))
                  ? Text(button = "Get Stardred",
                  style: const TextStyle(color: Colors.white, fontSize: 20),)
                  : const Icon(Icons.navigate_next, size: 50, color: Colors.white,)
                ),
              ),
              const SizedBox(height: 50,),
            ],
          ),
        ],
      ),
    );
  }
}