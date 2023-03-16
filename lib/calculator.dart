// Import necessary packages
import 'package:crypto/point.dart';
import 'package:flutter/material.dart';

// Define a Calculator class
class Calculator {
  // This method takes three integers and returns an integer
  // It keeps adding 'mod' to 'firstNumber' until
  // 'firstNumber'/'secondNumber' is equal to zero (mod 'mod')
  int findCorrectNumberInModDivision(
      int firstNumber, int secondNumber, int mod) {
    int result = firstNumber;
    try {
      while (result % secondNumber != 0) {
        result += mod;
      }
      return (result ~/ secondNumber) % mod;
    } catch (e) {
      debugPrint('Your reached the end of the universe!');
      return -1;
    }
  }

  int findNumberThatDividesSecondNumberBy0(
      int firstNumber, int secondNumber, int mod) {
    int result = firstNumber;
    while (result % secondNumber != 0) {
      result += mod;
    }
    return result;
  }

  // This method takes a Point object, two integers, and returns a string
  // It performs Elliptic curve point multiplication
  String multiplyPointBy2(Point R, int k, int mod) {
    final stringBuffer = StringBuffer(); // Create a new StringBuffer object

    // Calculate lambda using the 'findCorrectNumberInModDivision' method
    final lambda =
        findCorrectNumberInModDivision(3 * R.x * R.x + k, (2 * R.y), mod);
    if (lambda == -1) return r'\text{Your reached the end of the universe!}';

    // Append the lambda calculation result to the StringBuffer object
    stringBuffer.writeln(r'\begin{aligned}');
    stringBuffer.write(
      r'\lambda&=\frac{3*' +
          R.x.toString() +
          r'^2+' +
          k.toString() +
          r'}{2 * ' +
          R.y.toString() +
          r'} = ' +
          lambda.toString(),
    );
    stringBuffer.writeln(r'\\');

    // Calculate x3 and append the result to the StringBuffer object
    final x3 = (lambda * lambda - 2 * R.x) % mod;
    stringBuffer.write(r'x_3&=' +
        lambda.toString() +
        r'^2-2*' +
        R.x.toString() +
        r'=' +
        x3.toString());
    stringBuffer.writeln(r'\\');

    // Calculate y3 and append the result to the StringBuffer object
    final y3 = (lambda * (R.x - x3) - R.y) % mod;
    stringBuffer.write(
      r'y_3&=' +
          lambda.toString() +
          r'(' +
          R.x.toString() +
          r'-' +
          x3.toString() +
          r')-' +
          R.y.toString() +
          r' = ' +
          y3.toString(),
    );
    stringBuffer.writeln(r'\\');

    stringBuffer.writeln(r'\end{aligned}');

    debugPrint(stringBuffer
        .toString()); // Print the StringBuffer object to the console
    return stringBuffer
        .toString(); // Return the final StringBuffer object as a string
  }

  String addPointToPoint(Point P, Point Q, int mod) {
    final stringBuffer = StringBuffer(); // Create a new StringBuffer object

    // Calculate lambda using the 'findCorrectNumberInModDivision' method
    final lambda = findCorrectNumberInModDivision(
        (Q.y - P.y), (Q.x - P.x), mod); // Calculate lambda
    if (lambda == -1) return r'\text{Your reached the end of the universe!}';
    stringBuffer.writeln(r'\begin{aligned}');
    stringBuffer.write(
      r'\lambda&=\frac{' +
          Q.y.toString() +
          r'-' +
          P.y.toString() +
          r'}{' +
          Q.x.toString() +
          r'-' +
          P.x.toString() +
          r'}' +
          r'=' +
          lambda.toString(),
    );
    stringBuffer.writeln(r'\\');

    // Calculate x3 and append the result to the StringBuffer object
    final x3 = (lambda * lambda - P.x - Q.x) % mod;
    stringBuffer.write(
      r'x_3&=' +
          lambda.toString() +
          r'^2-' +
          P.x.toString() +
          r'-' +
          Q.x.toString() +
          r'=' +
          x3.toString(),
    );
    stringBuffer.writeln(r'\\');

    // Calculate y3 and append the result to the StringBuffer object
    final y3 = (lambda * (P.x - x3) - P.y) % mod;
    stringBuffer.write(r'y_3&=' +
        lambda.toString() +
        r'(' +
        P.x.toString() +
        r'-' +
        x3.toString() +
        r')-' +
        P.y.toString() +
        r'=' +
        y3.toString());
    stringBuffer.writeln(r'\\');
    stringBuffer.writeln(r'\end{aligned}');

    debugPrint(stringBuffer
        .toString()); // Print the StringBuffer object to the console
    return stringBuffer
        .toString(); // Return the final StringBuffer object as a string
  }
}
