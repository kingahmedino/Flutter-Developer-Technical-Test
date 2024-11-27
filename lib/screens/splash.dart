import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nouns_app_demo/screens/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _bounceController;
  late AnimationController _slideController;
  late Animation<double> _bounceAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _loadingAnimation;
  late Animation<double> _opacityAnimation;
  bool _showLoading = false;

  @override
  void initState() {
    super.initState();

    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _bounceAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0, end: -5),
        weight: 25,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: -5, end: 15),
        weight: 25,
      ),
    ]).animate(CurvedAnimation(
      parent: _bounceController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<double>(
      begin: 0,
      end: -540,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeInOut,
    ));

    _loadingAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.linear,
    ));

    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.3,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.linear,
    ));

    Future.delayed(const Duration(seconds: 2), () {
      _bounceController.forward().then((_) {
        setState(() => _showLoading = true);
        _slideController.forward().then((_) {
          // Add delay to simulate making an API call, while showing the loader
          Future.delayed(const Duration(milliseconds: 500), () {
            if (!mounted) return;
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const HomeScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
                transitionDuration: const Duration(milliseconds: 800),
              ),
            );
          });
        });
      });
    });
  }

  @override
  void dispose() {
    _bounceController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _loadingAnimation,
            builder: (context, child) {
              return Positioned.fill(
                child: Opacity(
                  opacity: _opacityAnimation.value,
                  child: Image.asset(
                    'assets/images/superman_dexter.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  AnimatedBuilder(
                    animation:
                        Listenable.merge([_bounceAnimation, _slideAnimation]),
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(
                            0, _bounceAnimation.value + _slideAnimation.value),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 48.0),
                          child: Image.asset(
                            'assets/images/nouns_logo.png',
                          ),
                        ),
                      );
                    },
                  ),
                  if (!_showLoading)
                    Text(
                      'Game and Software © Dash Studios. Dash Studios and its Logo are a trademark of Dash Studios.',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: AnimatedBuilder(
                        animation: _loadingAnimation,
                        builder: (context, child) {
                          final progress = (_loadingAnimation.value * 100)
                              .toDouble()
                              .floorToDouble();
                          return Container(
                            width: double.infinity,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                FractionallySizedBox(
                                  alignment: Alignment.centerLeft,
                                  widthFactor: _loadingAnimation.value,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFEFA55D),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Loading...$progress%',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
