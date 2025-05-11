import 'package:clean_bookly_code/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import 'go_to_animation.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

// bt7dd al value 3shan t3ml tick tick kol saNYA  t3ml refresh
class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController; // btl3 value lhad 1  mn 0 to 1
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }



  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/logo.png'),
        // bst5dm AnimatedBuilder 3shan a3eed bna2 el widget el bda5lha fakt
        GoToAnimation(animation: animation),
      ],
    );
  }


  void navigateToHome() {
    Future.delayed(Duration(seconds: 4), () {
      Get.to(() => HomeView(), transition: Transition.circularReveal);
    });
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation = Tween<Offset>(
      begin: Offset(0, 2),
      end: Offset.zero,
    ).animate(animationController);

    animationController.forward();
  }
}
