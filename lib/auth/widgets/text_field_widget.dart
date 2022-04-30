import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../const/color_styles.dart';
import '../../const/textStyles_const.dart';


class TextFieldWidget extends StatefulWidget {
  final forgotPass;
  final controller;
  final svg;
  final secret;
  final validation;
  final Function()? notifyParent;
  final String? placeholder;

  const TextFieldWidget({Key? key, this.controller, this.svg, this.secret, this.validation, this.notifyParent, this.placeholder, this.forgotPass}) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            CupertinoTextField(
              padding: EdgeInsets.symmetric(vertical: 4),
              placeholder: widget.placeholder ?? '',
              placeholderStyle: TextStyles.blueMainRegularStyle.copyWith(color: ColorStyles.greyColor),
              controller: widget.controller,
              decoration: BoxDecoration(
                color: ColorStyles.whiteColor,
                border: Border(
                  bottom: BorderSide(
                      color: widget.validation != null && !widget.validation
                          ? Colors.red
                          : ColorStyles.blackColor.withOpacity(0.1)),
                ),
              ),
              style: TextStyles.blueMainRegularStyle.copyWith(letterSpacing: widget.secret != null ? 12 : 0, color: ColorStyles.blackColor),
              cursorColor: ColorStyles.blackColor,
              obscureText: widget.secret ?? false,
              onChanged: (text) {
                if (widget.notifyParent != null) widget.notifyParent!();
              },
            ),
            widget.forgotPass == true ? Positioned(
              right: 0,
              top: 4,
                child: GestureDetector(
                  onTap: (){},
                    child: Text('Forgot password?', style: TextStyles.blueMainRegularStyle.copyWith(color: ColorStyles.lightBlueColor),)
                )
            ) : Offstage()
          ],
        ),
        widget.svg != null
            ? Positioned(
                top: 16,
                left: 16,
                child: SvgPicture.asset(
                  widget.svg,
                  width: 24,
                ),
              )
            : Offstage(),
      ],
    );
  }
}
