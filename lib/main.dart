import 'dart:io';

import 'package:flutter/material.dart';

import 'awai_for.dart';

void main() {
  runApp(const MaterialApp(
    home: MyWidget(),
  ));
}

Future<String> _errorHandling() async {
  try {
    var value = await Future.value(5);
    var response = await Future.delayed(Duration(seconds: value), () {
      return 'Praksh Data';
    });

    return response;
  } on HttpException catch (error) {
    print(error);
    throw 'eRROR';
  } catch (expception) {
    print(expception);
    throw 'eRROR';
  } finally {
    print('It is finally');
  }
}
