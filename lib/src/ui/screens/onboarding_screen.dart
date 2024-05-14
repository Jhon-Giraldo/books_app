import 'package:books_app/src/config/theme/app_colors_config.dart';
import 'package:books_app/src/config/theme/app_text_style_config.dart';
import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/onboarding.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "¡Bienvenido a Books App!",
                    style: AppTextStyleConfig.titleStyle,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Descubre y disfruta de una gran variedad de libros",
                    style: AppTextStyleConfig.subtitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SliderButton(
        action: () async {
          Navigator.pushNamed(context, 'newBooksScreen');
          return false;
        },
        label: const Text(
          "Desliza para iniciar",
          style: AppTextStyleConfig.buttonTextStyle,
        ),
        icon: const Icon(
          Icons.arrow_forward_ios,
          color: AppColorsConfig.blackColor,
        ),
        width: MediaQuery.of(context).size.width * 0.7,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
