import 'package:flutter/material.dart';

/// A widget that provides an animated bottom navigation bar with customizable
/// options for smooth and engaging transitions between icons.
class AnimatedBottomNavigation extends StatefulWidget {
  /// The list of icons to display in the bottom navigation bar.
  final List<IconData> icons;

  /// A callback function that gets triggered when an icon is tapped.
  ///
  /// The navigation will be handled externally using this callback.
  final Function(int) onTapChange;

  /// The background color of the bottom navigation bar.
  ///
  /// Defaults to [Colors.white].
  final Color backgroundColor;

  /// The current index of the selected icon.
  ///
  /// Defaults to `0`.
  final int currentIndex;

  /// The color of the selected icon.
  ///
  /// Defaults to [Colors.black].
  final Color selectedColor;

  /// The color of the unselected icons.
  ///
  /// Defaults to [Colors.black38].
  final Color unselectedColor;

  /// The duration of the animations for the indicator and icons.
  ///
  /// Defaults to `Duration(milliseconds: 200)`.
  final Duration animationDuration;

  /// The curve used for the indicator animation.
  ///
  /// Defaults to [Curves.easeOutCubic].
  final Curve animationIndicatorCurve;

  /// The curve used for the icon animation.
  ///
  /// Defaults to [Curves.easeOutCubic].
  final Curve animationIconCurve;

  /// The decoration for the indicator that moves with the selected icon.
  ///
  /// If not provided, a default decoration will be used.
  final BoxDecoration? indicatorDecoration;

  /// The decoration for each item (icon) in the navigation bar.
  ///
  /// If not provided, no decoration will be applied.
  final BoxDecoration? itemDecoration;

  /// The decoration for the entire bottom navigation bar.
  ///
  /// If not provided, a default decoration with a shadow will be used.
  final BoxDecoration? bottonNavigationDecoration;

  /// The height of the bottom navigation bar.
  ///
  /// Defaults to `57.0`.
  final double height;

  /// The height of the indicator that moves with the selected icon.
  ///
  /// Defaults to `3.0`.
  final double indicatorHeight;

  /// The space between the bottom of the indicator and the bottom of the navigation bar.
  ///
  /// Defaults to `15.0`.
  final double indicatorSpaceBotton;

  /// The size of the icons in the navigation bar.
  ///
  /// Defaults to `24.0`.
  final double iconSize;

  /// Creates an instance of [AnimatedBottomNavigation].
  ///
  /// The [icons] parameter is required and [onTapChange] should be provided to handle navigation.
  const AnimatedBottomNavigation({
    super.key,
    required this.icons,
    required this.onTapChange,
    this.currentIndex = 0,
    this.backgroundColor = Colors.white,
    this.iconSize = 24.0,
    this.selectedColor = Colors.black,
    this.unselectedColor = Colors.black38,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationIndicatorCurve = Curves.easeOutCubic,
    this.animationIconCurve = Curves.easeOutCubic,
    this.indicatorDecoration,
    this.itemDecoration,
    this.bottonNavigationDecoration,
    this.height = 57.0,
    this.indicatorHeight = 3.0,
    this.indicatorSpaceBotton = 15.0,
  });

  @override
  _AnimatedBottomNavigationState createState() =>
      _AnimatedBottomNavigationState();
}

class _AnimatedBottomNavigationState extends State<AnimatedBottomNavigation> {
  /// Changes the currently selected tab based on the given index.
  ///
  /// This method updates the state to reflect the selected tab and triggers the onTapChange callback if provided.
  void _changePage(int page) {
    widget.onTapChange.call(page);
  }

  /// Calculates the position of the indicator based on the selected tab.
  ///
  /// The position is calculated relative to the width of the screen and
  /// the number of icons in the navigation bar.
  double _calculateIndicatorPosition(BuildContext context) {
    return (widget.currentIndex *
            MediaQuery.of(context).size.width /
            widget.icons.length) +
        (MediaQuery.of(context).size.width / (2 * widget.icons.length)) -
        (widget.iconSize / 2);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: widget.bottonNavigationDecoration ??
          BoxDecoration(
            color: widget.backgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
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
            curve: widget.animationIndicatorCurve,
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
    );
  }

  /// Builds a navigation item for the bottom navigation bar.
  ///
  /// The item includes an icon that animates when selected or unselected.
  Widget _buildNavigationItem(int index, IconData icon) {
    bool isSelected = widget.currentIndex == index;
    return GestureDetector(
      onTap: () => _changePage(index),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / widget.icons.length,
        height: widget.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: widget.animationDuration,
              curve: widget.animationIconCurve,
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
