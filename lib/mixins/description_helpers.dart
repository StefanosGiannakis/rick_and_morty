import 'package:flutter/material.dart';

mixin DescriptionHelpers {

  getCharacterStatusColor(String status) {
    if (status == 'Alive') {
      return Colors.green;
    } else if (status == 'Dead') {
      return Colors.red;
    }

    return const Color(0x00ffffff);
  }
}
