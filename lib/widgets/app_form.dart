import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_sru/gen/assets.gen.dart';
import '../utils/app_style.dart';
import 'widgets.dart';

class AppForm extends StatefulWidget {
  final String? title;
  final String? initialValue;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final void Function(String)? onSubmit;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Widget? prefix;
  final Widget? suffix;
  final FocusNode? focusNode;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final String? suffixText;
  final EdgeInsetsGeometry? contentPadding;
  final Color? focusColor;
  final Color? fillColor;
  final bool? readOnly;
  final bool obscureText;
  final TextInputAction? styleTextInputAction;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final int? maxLines;
  final int? maxLength;
  final bool showCounter;
  final bool isLastForm;
  final bool isNumberOnly;
  final bool showClear;

  const AppForm({
    super.key,
    this.title,
    this.initialValue,
    this.controller,
    this.onTap,
    this.onSubmit,
    this.onSaved,
    this.validator,
    this.prefix,
    this.suffix,
    this.obscureText = false,
    this.maxLines,
    this.maxLength,
    this.keyboardType,
    this.hintText,
    this.labelText,
    this.hintStyle,
    this.suffixText,
    this.contentPadding,
    this.focusNode,
    this.focusColor,
    this.fillColor,
    this.readOnly,
    this.styleTextInputAction,
    this.onChanged,
    this.showCounter = true,
    this.isLastForm = false,
    this.isNumberOnly = false,
    this.showClear = false,
  });

  @override
  State<AppForm> createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  late final ValueNotifier<bool> _isNotEmptyNotifier;

  @override
  void initState() {
    super.initState();
    _isNotEmptyNotifier = ValueNotifier(widget.controller?.text.isNotEmpty ?? false);
    widget.controller?.addListener(() {
        _isNotEmptyNotifier.value = widget.controller?.text.isNotEmpty ?? false;
      }
    );
  }

  @override
  void dispose() {
    _isNotEmptyNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          AppText(text: widget.title!, textStyle: AppTextStyle.h4),
          const SpaceHeight(10.0),
        ],
        TextFormField(
          style: AppTextStyle.h4.copyWith(fontWeight: AppTextStyle.regular),
          initialValue: widget.initialValue,
          readOnly: widget.readOnly ?? false,
          maxLines: widget.maxLines ?? 1,
          maxLength: widget.maxLength,
          onTap: widget.onTap,
          controller: widget.controller,
          focusNode: widget.focusNode,
          validator: widget.validator,
          textInputAction: widget.isLastForm
              ? TextInputAction.done
              : widget.styleTextInputAction ?? TextInputAction.next,
          keyboardType: widget.isNumberOnly
            ? TextInputType.number
            : widget.keyboardType,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmit,
          onSaved: widget.onSaved,
          cursorColor: Colors.black,
          obscureText: widget.obscureText,
          buildCounter: widget.showCounter
              ? (
                  context, {
                  required currentLength,
                  required isFocused,
                  required maxLength,
                }) {
                  if (maxLength != null) {
                    return Container(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      transform: Matrix4.translationValues(
                        0,
                        -kToolbarHeight - 15.0,
                        0.0,
                      ),
                      child: AppText(
                        text: "$currentLength/$maxLength",
                        textStyle: AppTextStyle.regularStyle.copyWith(
                          fontSize: 10.0,
                        ),
                      ),
                    );
                  }
                  return null;
                }
              : null,
          decoration: InputDecoration(
            label: AppText(
              text: widget.labelText ?? "",
              textStyle: AppTextStyle.h4,
            ),
            floatingLabelBehavior: widget.labelText?.isNotEmpty == true
                ? null
                : FloatingLabelBehavior.always,
            hintText: widget.hintText,
            hintStyle: widget.hintStyle ?? AppTextStyle.regularStyle.copyWith(color: AppColorStyle.grey, fontSize: 15.0),
            suffixText: widget.suffixText,
            suffixStyle: AppTextStyle.h4.copyWith(color: Colors.black),
            contentPadding: widget.contentPadding ?? const EdgeInsets.all(10),
            prefixIcon: widget.prefix,
            suffixIcon: () {
              if(widget.showClear) {
                return ValueListenableBuilder(
                  valueListenable: _isNotEmptyNotifier,
                  builder: (context, isNotEmpty, child) {
                    if(!isNotEmpty) {
                      return SizedBox.shrink();
                    }
                    return GestureDetector(
                      onTap: () => widget.controller?.clear(),
                      child: Assets.images.cancel.image()
                    );
                  }
                );
              }
              return widget.suffix;
            } (),
            filled: true,
            fillColor: widget.fillColor ?? AppColorStyle.lightGrey,
            counterText: widget.showCounter ? null : "",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: BorderSide.none
            )
          ),
          inputFormatters: widget.isNumberOnly
            ? [FilteringTextInputFormatter.digitsOnly]
            : [],
        ),
      ],
    );
  }

  // OutlineInputBorder _border({final double? indent, final Color? color}) {
  //   return OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(10.0),
  //     borderSide: BorderSide(
  //       width: indent ?? 1,
  //       color: color ?? AppColors.primary,
  //     ),
  //   );
  // }
}
