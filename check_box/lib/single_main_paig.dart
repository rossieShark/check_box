import 'package:check_box/calculation_service.dart';
import 'package:check_box/widgets.dart/check_widget.dart';
import 'package:check_box/widgets.dart/separator_widget.dart';
import 'package:check_box/widgets.dart/text_widget.dart';
import 'package:flutter/material.dart';

class SingleMainPage extends StatelessWidget {
  final bool isActive;
  final String text;

  const SingleMainPage({
    Key? key,
    required this.isActive,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(CalculationService().padding),
          child: Row(
            children: [
              Expanded(
                child: _TextWidget(text: text),
              ),
              CheckBox(isActive: isActive),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextWidget extends StatelessWidget {
  final String text;
  const _TextWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LimitedBox(
          maxWidth: CalculationService().calculateTextMaxWidth(context),
          child: TextWidget(text: text),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: CalculationService().separatorPadding),
          child: const SeparatorWidget(),
        )),
      ],
    );
  }
}
