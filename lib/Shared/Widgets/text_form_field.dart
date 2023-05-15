import 'package:flutter/material.dart';

class MyTextFormField {
  final String? label;
  final IconData? startIcon;
  final TextEditingController? controller;
  final TextInputAction? inputAction;
  final TextInputType? inputType;
  final FocusNode? focusName;
  final IconButton? suffixIcon;
  final TextCapitalization? capitalization;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final String? Function(String?)? validator;
  final String? helperText;

  // Constructors
  const MyTextFormField({
    this.controller,
    this.label,
    this.startIcon,
    this.inputAction,
    this.inputType,
    this.focusName,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.capitalization,
    this.onEditingComplete,
    this.validator,
    this.helperText,
  });
  // Para criar a instância da classe
  const MyTextFormField.empty()
      : label = null,
        startIcon = null,
        controller = null,
        inputAction = null,
        inputType = null,
        focusName = null,
        suffixIcon = null,
        onFieldSubmitted = null,
        capitalization = null,
        onEditingComplete = null,
        validator = null,
        helperText = null;

  Widget inputField() {
    return TextFormField(
      focusNode: focusName,
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      maxLines: 1,
      textInputAction: inputAction,
      keyboardType: inputType,
      textCapitalization: capitalization ?? TextCapitalization.none,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      validator: validator,
      decoration: InputDecoration(
        icon: Icon(
          startIcon,
        ),
        labelText: label,
        suffixIcon: suffixIcon,
        helperText: helperText,
      ),
    );
  }

  MyTextFormField copyWith({
    String? label,
    IconData? startIcon,
    TextEditingController? controller,
    TextInputAction? inputAction,
    TextInputType? inputType,
    TextCapitalization? capitalization,
    FocusNode? focusName,
    IconButton? suffixIcon,
    void Function(String)? onFieldSubmitted,
    void Function()? onEditingComplete,
    String? Function(String?)? validator,
    String? helperText,
  }) {
    return MyTextFormField(
      label: label ?? this.label,
      startIcon: startIcon ?? this.startIcon,
      controller: controller ?? this.controller,
      inputAction: inputAction ?? this.inputAction,
      inputType: inputType ?? this.inputType,
      capitalization: capitalization ?? this.capitalization,
      focusName: focusName ?? this.focusName,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      onFieldSubmitted: onFieldSubmitted ?? this.onFieldSubmitted,
      onEditingComplete: onEditingComplete ?? this.onEditingComplete,
      validator: validator ?? this.validator,
      helperText: helperText ?? this.helperText,
    );
  }
}
