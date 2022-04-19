import 'package:flutter/material.dart';
import 'package:in_time_petition_demo/components/animated_button.dart';
import 'package:in_time_petition_demo/core/string_extensions.dart';

class ExpandableTopMenu extends StatefulWidget {
  ExpandableTopMenu(
      {Key? key,
      required this.titles,
      required this.initialTitle,
      this.onTitleTap,
      Widget? trailing})
      : assert(titles.contains(initialTitle)),
        trailing = trailing ?? Container(),
        super(key: key);

  final List<String> titles;

  final void Function(String)? onTitleTap;

  final String initialTitle;

  final Widget trailing;

  @override
  State<ExpandableTopMenu> createState() => _ExpandableTopMenuState();
}

class _ExpandableTopMenuState extends State<ExpandableTopMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController reversedController;
  late Animation<double> animation;
  late Animation<double> reversedAnimation;

  MenuStatus menuStatus = MenuStatus.closed;

  late String currentTitle;

  @override
  void initState() {
    currentTitle = widget.initialTitle;
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    );
    reversedAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          _buildOpeningBox(),
        ],
      ),
    );
  }

  void _openMenu() {
    setState(() {
      menuStatus = MenuStatus.isAnimating;
    });

    controller.forward().whenComplete(() {
      setState(() {
        menuStatus = MenuStatus.open;
      });
    });
  }

  void _closeMenu() {
    setState(() {
      menuStatus = MenuStatus.isAnimating;
    });

    controller.reverse().whenComplete(() {
      setState(() {
        menuStatus = MenuStatus.closed;
      });
    });
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              FadeTransition(
                opacity: reversedAnimation,
                child: Visibility(
                  visible: menuStatus == MenuStatus.closed ||
                      menuStatus == MenuStatus.isAnimating,
                  child: AnimatedButton(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (menuStatus == MenuStatus.closed) {
                        _openMenu();
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.menu_rounded),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          currentTitle.capitalize(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FadeTransition(
                opacity: animation,
                child: Visibility(
                  visible: menuStatus == MenuStatus.open ||
                      menuStatus == MenuStatus.isAnimating,
                  child: AnimatedButton(
                    onTap: () {
                      if (menuStatus == MenuStatus.open) {
                        _closeMenu();
                      }
                    },
                    child: const Icon(Icons.close_rounded),
                  ),
                ),
              ),
            ],
          ),
          FadeTransition(opacity: reversedAnimation, child: widget.trailing),
        ],
      ),
    );
  }

  Widget _buildOpeningBox() {
    return SizeTransition(
      axisAlignment: 1.0,
      sizeFactor: animation,
      child: Column(
        children: [
          ...widget.titles
              .map<Widget>(
                (title) => Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: AnimatedButton(
                      onTap: () => _onChoose(title),
                      child: Text(
                        title.capitalize(),
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              )
              .toList()
            ..add(const SizedBox(height: 10)),
        ],
      ),
    );
  }

  void _onChoose(String title) {
    setState(() {
      currentTitle = title;
    });
    _closeMenu();
    widget.onTitleTap?.call(title);
  }
}

enum MenuStatus { closed, open, isAnimating }
