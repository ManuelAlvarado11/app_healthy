import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

var maskFormatterDUI = MaskTextInputFormatter(
    mask: 'xxxxxxxx-x',
    filter: {"x": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

var maskFormatterTelefono = MaskTextInputFormatter(
    mask: 'xxxx-xxxx',
    filter: {"x": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);
