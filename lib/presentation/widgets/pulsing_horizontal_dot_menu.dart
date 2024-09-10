import 'package:flutter/material.dart';

class PulsingHorizontalDotMenu extends StatefulWidget {
  const PulsingHorizontalDotMenu({super.key, required this.index});
  final int index;
  @override
  State<PulsingHorizontalDotMenu> createState() =>
      _PulsingHorizontalDotMenuState();
}

class _PulsingHorizontalDotMenuState extends State<PulsingHorizontalDotMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(3, (index) {
          final delay = index * 0.2;
          final animation = TweenSequence([
            TweenSequenceItem(
              tween: Tween(begin: 1.0, end: 1.5)
                  .chain(CurveTween(curve: Curves.easeInOut)),
              weight: 50,
            ),
            TweenSequenceItem(
              tween: Tween(begin: 1.5, end: 1.0)
                  .chain(CurveTween(curve: Curves.easeInOut)),
              weight: 50,
            ),
          ]).animate(CurvedAnimation(
            parent: _controller,
            curve: Interval(delay, 1.0, curve: Curves.easeInOut),
          ));

          return AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Transform.scale(
                scale: animation.value,
                child: Icon(
                  Icons.circle,
                  size: index == widget.index ? 20 : 15,
                  color: Theme.of(context)
                      .primaryColor
                      .withOpacity(index == widget.index ? 1 : 0.5),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
