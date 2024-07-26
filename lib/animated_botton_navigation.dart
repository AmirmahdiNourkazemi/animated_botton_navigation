import 'package:flutter/material.dart';

class AnimatedBottomNavigation extends StatefulWidget {
  final List<IconData> icons;

  final List<Widget> pages;
  final Color backgroundColor;
  final Color selectedColor;
  final Color unselectedColor;
  final Duration animationDuration;
  final Curve animationCurve;
  final BoxDecoration? indicatorDecoration;
  final BoxDecoration? itemDecoration;
  final BoxDecoration? bottonNavigationDecoration;
  final double height;
  final double indicatorHeight;
  final double indicatorSpaceBotton;
  final double iconSize;

  const AnimatedBottomNavigation({
    Key? key,
    required this.icons,
    required this.pages,
    this.backgroundColor = Colors.white,
    this.iconSize = 24.0,
    this.selectedColor = Colors.black,
    this.unselectedColor = Colors.black38,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeOutCubic,
    this.indicatorDecoration,
    this.itemDecoration,
    this.bottonNavigationDecoration,
    this.height = 57.0,
    this.indicatorHeight = 3,
    this.indicatorSpaceBotton = 15,
  })  : assert(icons.length == pages.length,
            'Icons and pages must have the same length'),
        super(key: key);

  @override
  _AnimatedBottomNavigationState createState() =>
      _AnimatedBottomNavigationState();
}

class _AnimatedBottomNavigationState extends State<AnimatedBottomNavigation> {
  int _selectedTab = 0;

  void _changePage(int page) {
    setState(() {
      _selectedTab = page;
    });
  }

  double _calculateIndicatorPosition(BuildContext context) {
    return (_selectedTab *
            MediaQuery.of(context).size.width /
            widget.icons.length) +
        (MediaQuery.of(context).size.width / (2 * widget.icons.length)) -
        (widget.iconSize / 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedTab,
        children: widget.pages,
      ),
      bottomNavigationBar: Container(
        height: widget.height,
        
        decoration: widget.bottonNavigationDecoration ??
            BoxDecoration(
              color: widget.backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: widget.animationDuration,
              left: _calculateIndicatorPosition(context),
              curve: widget.animationCurve,
              bottom: widget.indicatorSpaceBotton,
              child: Container(
                height: widget.indicatorHeight,
                width: widget.iconSize,
                decoration: widget.indicatorDecoration ??
                    BoxDecoration(
                      color: widget.selectedColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(widget.icons.length, (index) {
                return _buildNavigationItem(index, widget.icons[index]);
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationItem(int index, IconData icon) {
    bool isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () => _changePage(index),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / widget.icons.length,
        height: 57,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: widget.animationDuration,
              curve: widget.animationCurve,
              top: isSelected ? 2.0 : 8.0,
              child: Container(
                decoration: widget.itemDecoration,
                child: Icon(
                  icon,
                  size: widget.iconSize,
                  color: isSelected
                      ? widget.selectedColor
                      : widget.unselectedColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
