import 'dart:ui';
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const DiceRollerApp());
}

// Constants
const _primaryColor = Color(0xFF000080);
const _secondaryColor = Color(0xFF404040);
const _backgroundColor = Color(0xFFFFFFFF);
const _diceSize = 100.0;
const _dotSize = 20.0;
const _animationDuration = Duration(milliseconds: 500);
const _diceChangeInterval = Duration(milliseconds: 100);

class DiceRollerApp extends StatelessWidget {
  const DiceRollerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: _primaryColor),
        useMaterial3: true,
      ),
      home: const DiceRollerPage(),
    );
  }
}

class DiceRollerPage extends StatefulWidget {
  const DiceRollerPage({super.key});

  @override
  State<DiceRollerPage> createState() => _DiceRollerPageState();
}

class _DiceRollerPageState extends State<DiceRollerPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  Timer? _rollTimer;
  int _diceNumber = 1;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: _animationDuration, vsync: this)
      ..addStatusListener(_handleAnimationStatus);

    _animation = Tween<double>(
      begin: 0,
      end: 2 * pi,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Initial dice roll
    _rollDice();
  }

  @override
  void dispose() {
    _controller.dispose();
    _rollTimer?.cancel();
    super.dispose();
  }

  void _handleAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _stopRapidDiceChange();
      _rollDice();
      _controller.reset();
    } else if (status == AnimationStatus.forward) {
      _startRapidDiceChange();
    }
  }

  void _rollDice() {
    setState(() {
      _diceNumber = _random.nextInt(6) + 1;
    });
  }

  void _startRapidDiceChange() {
    _rollTimer?.cancel();
    _rollTimer = Timer.periodic(_diceChangeInterval, (timer) {
      if (!_controller.isAnimating) {
        timer.cancel();
        return;
      }
      _rollDice();
    });
  }

  void _stopRapidDiceChange() {
    _rollTimer?.cancel();
    _rollTimer = null;
  }

  void rollDice() {
    if (!_controller.isAnimating) {
      _controller.forward();
    }
  }

  Widget _buildDot(Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        width: _dotSize,
        height: _dotSize,
        decoration: const BoxDecoration(
          color: _secondaryColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _buildDiceFace() {
    final dots = <Widget>[];

    // All possible dot positions
    const positions = [
      Alignment.topLeft,
      Alignment.topRight,
      Alignment.centerLeft,
      Alignment.center,
      Alignment.centerRight,
      Alignment.bottomLeft,
      Alignment.bottomRight,
    ];

    // Determine which dots to show based on dice number
    switch (_diceNumber) {
      case 1:
        dots.add(_buildDot(positions[3]));
        break;
      case 2:
        dots.add(_buildDot(positions[0]));
        dots.add(_buildDot(positions[6]));
        break;
      case 3:
        dots.add(_buildDot(positions[0]));
        dots.add(_buildDot(positions[3]));
        dots.add(_buildDot(positions[6]));
        break;
      case 4:
        dots.add(_buildDot(positions[0]));
        dots.add(_buildDot(positions[1]));
        dots.add(_buildDot(positions[5]));
        dots.add(_buildDot(positions[6]));
        break;
      case 5:
        dots.add(_buildDot(positions[0]));
        dots.add(_buildDot(positions[1]));
        dots.add(_buildDot(positions[3]));
        dots.add(_buildDot(positions[5]));
        dots.add(_buildDot(positions[6]));
        break;
      case 6:
        dots.add(_buildDot(positions[0]));
        dots.add(_buildDot(positions[1]));
        dots.add(_buildDot(positions[2]));
        dots.add(_buildDot(positions[4]));
        dots.add(_buildDot(positions[5]));
        dots.add(_buildDot(positions[6]));
        break;
    }

    return Stack(children: dots);
  }

  Widget _buildAnimatedDice() {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: _animation.value,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: _controller.isAnimating ? 5 : 0,
              sigmaY: _controller.isAnimating ? 5 : 0,
            ),
            child: Container(
              width: _diceSize,
              height: _diceSize,
              decoration: BoxDecoration(
                color: _backgroundColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(50),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildDiceFace(),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFE0E0E0), Color(0xFFB0C4DE)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: _buildAnimatedDice()),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: _primaryColor),
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: rollDice,
                child: const Text(
                  'Roll Dice',
                  style: TextStyle(fontSize: 20, color: _primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
