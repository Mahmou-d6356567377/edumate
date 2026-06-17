import 'dart:async';
import 'package:edumate/config/routes/routes.dart';
import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/features/courses/widgets/typing_dots.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AIFloatingActionButton extends StatefulWidget {
  const AIFloatingActionButton({super.key});

  @override
  State<AIFloatingActionButton> createState() =>
      _AIFloatingActionButtonState();
}

class _AIFloatingActionButtonState extends State<AIFloatingActionButton>
    with TickerProviderStateMixin {
  // Idle "breathing" pulse — loops forever
  late AnimationController _pulseController;
  late Animation<double> _pulseScale;
  late Animation<double> _glowRadius;

  // Tap feedback
  late AnimationController _tapController;

  // Expand into pill / collapse back to circle
  late AnimationController _expandController;
  late Animation<double> _expandAnim;

  Timer? _cycleTimer;

  static const double _collapsedSize = 44;
  static const double _expandedWidth = 190;

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);

    _pulseScale = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _glowRadius = Tween<double>(begin: 6, end: 14).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _tapController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _expandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );

    _expandAnim = CurvedAnimation(
      parent: _expandController,
      curve: Curves.easeOutBack,
      reverseCurve: Curves.easeIn,
    );

    _startCycle();
  }

  // Every 8s, expand into the pill, hold for 2.5s, then collapse again
  void _startCycle() {
    _cycleTimer = Timer.periodic(const Duration(seconds: 8), (_) async {
      if (!mounted) return;
      await _expandController.forward();
      await Future.delayed(const Duration(milliseconds: 2500));
      if (!mounted) return;
      await _expandController.reverse();
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _tapController.dispose();
    _expandController.dispose();
    _cycleTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100,
      right: 25,
      child: GestureDetector(
        onTapDown: (_) => _tapController.forward(),
        onTapUp: (_) {
          _tapController.reverse();
          GoRouter.of(context).push(GoRoutes.aipagePath);
        },
        onTapCancel: () => _tapController.reverse(),
        child: AnimatedBuilder(
          animation: Listenable.merge(
            [_pulseController, _tapController, _expandController],
          ),
          builder: (context, child) {
            final pulseScale =
                _pulseScale.value - (_tapController.value * 0.12);

            final width = _collapsedSize +
                (_expandedWidth - _collapsedSize) * _expandAnim.value;

            final bgColor = Color.lerp(
              Colors.transparent,
              Colors.white,
              _expandAnim.value.clamp(0.0, 1.0),
            );

            return Transform.scale(
              scale: pulseScale,
              child: Container(
                height: _collapsedSize,
                width: width,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(_collapsedSize / 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.35),
                      blurRadius: _glowRadius.value,
                      spreadRadius: _glowRadius.value / 3,
                    ),
                    if (_expandAnim.value > 0.05)
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (_expandAnim.value > 0.05)
                      Expanded(
                        child: ClipRect(
                          child: Opacity(
                            opacity: _expandAnim.value.clamp(0.0, 1.0),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Ask EduMate',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(width: 6),
                                TypingDots(color: Colors.blue, dotSize: 5),
                              ],
                            ),
                          ),
                        ),
                      ),
                    SvgPicture.asset(
                      Constants.ai,
                      width: 36,
                      height: 36,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}