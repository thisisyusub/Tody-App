import 'dart:convert';

abstract interface class Base64Converter {
  String convert(List<int> bytes);
}

class Base64ConverterImpl implements Base64Converter {
  @override
  String convert(List<int> bytes) => base64Encode(bytes);
}
