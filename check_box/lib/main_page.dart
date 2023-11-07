import 'package:check_box/calculation_service.dart';
import 'package:check_box/widgets.dart/check_widget.dart';
import 'package:check_box/widgets.dart/separator_widget.dart';
import 'package:check_box/widgets.dart/text_widget.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final bool isActive;
  final String text;
  const MainPage({
    super.key,
    required this.isActive,
    required this.text,
  });
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomMultiChildLayout(
            delegate: OwnMultiChildLayoutDelegate(),
            children: [
              LayoutId(id: 1, child: TextWidget(text: widget.text)),
              LayoutId(id: 2, child: const SeparatorWidget()),
              LayoutId(id: 3, child: CheckBox(isActive: widget.isActive)),
            ]),
      ),
    );
  }
}

class OwnMultiChildLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  Size getSize(BoxConstraints constraints) {
    return Size(constraints.biggest.width, 25);
  }

  @override
  void performLayout(Size size) {
    //определяет, есть ли ребонок с определенным ID
    if (hasChild(1) && hasChild(2) && hasChild(3)) {
      final secondElementMinWidth = CalculationService().separatorMinSize;
      final thirdElementWidth = CalculationService().checkBoxSize;
      final padding = CalculationService().padding;
      final separatorPadding = CalculationService().separatorPadding;
      final firstElementMaxWidth =
          size.width - secondElementMinWidth - thirdElementWidth - padding * 2;
      final firstElementSize = layoutChild(
        1,
        BoxConstraints.loose(
          Size(firstElementMaxWidth, size.height),
        ),
      );

      final thirdElementMaxWidth = thirdElementWidth;
      final thirdElementSize = layoutChild(
        3,
        BoxConstraints.loose(
          Size(thirdElementMaxWidth, size.height),
        ),
      );

      final secondElementMaxWidth = size.width -
          firstElementSize.width -
          thirdElementWidth -
          padding * 2 -
          separatorPadding * 2;

      final secondElementSize = layoutChild(
        2,
        BoxConstraints.loose(
          Size(secondElementMaxWidth, size.height),
        ),
      );

      final firstElementYOffset = size.height / 2 - firstElementSize.height / 2;
      positionChild(1, Offset(16, firstElementYOffset));

      final thirdElementYOffset = size.height / 2 - thirdElementSize.height / 2;
      final thirdElementXOffset = size.width - thirdElementSize.width - padding;
      positionChild(3, Offset(thirdElementXOffset, thirdElementYOffset));

      final secondElementYOffset =
          size.height / 2 - secondElementSize.height / 2;
      var secondElementXOffset =
          firstElementSize.width + padding + separatorPadding;
      positionChild(2, Offset(secondElementXOffset, secondElementYOffset));
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}
