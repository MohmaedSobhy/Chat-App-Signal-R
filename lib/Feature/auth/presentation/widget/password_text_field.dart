import 'package:chat_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class TextPasswordField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hint;
  final String? Function(String?)? validator;

  const TextPasswordField({
    super.key,
    required this.textEditingController,
    required this.hint,
    required this.validator,
  });

  @override
  State<TextPasswordField> createState() => _TextPasswordFieldState();
}

class _TextPasswordFieldState extends State<TextPasswordField> {
  final ValueNotifier<bool> _isVisible = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isVisible,
      builder: (context, value, child) {
        return CustomTextField(
          keyboardType: TextInputType.visiblePassword,
          obscureText: _isVisible.value,
          controller: widget.textEditingController,
          validator: widget.validator,
          hintText: widget.hint,
          suffixIcon: InkWell(
            onTap: () {
              _isVisible.value = !_isVisible.value;
            },
            child:
                (_isVisible.value)
                    ? const Icon(Icons.visibility_off, size: 20)
                    : const Icon(Icons.visibility, size: 20),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _isVisible.dispose();

    super.dispose();
  }
}
