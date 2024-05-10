import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({
    super.key,
    required this.onValue,
  });

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode(); // * Lo usaremos para mantener el foco

    final color = Theme.of(context).colorScheme;

    final outlineInputBoder = OutlineInputBorder(
      borderSide: BorderSide(color: color.secondary, width: 2),
      borderRadius: BorderRadius.circular(10),
    );

    final inputDecoration = InputDecoration(
      filled: true,
      hintText: 'End your messahe with a "?"',
      enabledBorder: outlineInputBoder,
      border: outlineInputBoder,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send),
        onPressed: () {
          final textValue = textController.value.text;
          textController.clear();
          onValue(textValue);
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) => focusNode.unfocus(),
      controller: textController,
      decoration: inputDecoration,
      focusNode: focusNode,
      onFieldSubmitted: (value) {
        textController.clear();
        // * Mantener el foco
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
