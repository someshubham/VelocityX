/*
 * Copyright 2020 Pawan Kumar. All rights reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:velocity_x/src/flutter/text.dart';

/// Extension Methods & Widgets for the numbers
extension NumExtension on num {
  /// This ext will be removed soon. Use [toDoubleStringAsFixed] instead.
  @Deprecated('Use [toDoubleStringAsFixed] instead. It will be removed soon.')
  String toDollarAsFixed({int digit = 2}) {
    return toStringAsFixed(truncateToDouble() == this ? 0 : digit);
  }

  ///
  /// Use this extension method to get fixed values after decimal with defined length.
  ///
  String toDoubleStringAsFixed({int digit = 2}) =>
      toStringAsFixed(truncateToDouble() == this ? 0 : digit);

  ///
  /// Use this extension method to get precised values after decimal with defined length.
  ///
  String toDoubleStringAsPrecised({int length = 4}) {
    return ((this * pow(10, length)).truncateToDouble() / pow(10, length))
        .toString();
  }

  ///
  /// Check if the number is null
  ///
  // ignore: unnecessary_null_comparison
  bool? get isNull => this == null;

  ///
  /// Check if the number is not null
  ///
  // ignore: unnecessary_null_comparison
  bool? get isNotNull => this != null;

  /// Returns number of digits in this number
  int get numberOfDigits => toString().length;

  /// Returns if the number is even
  bool get isEven => this % 2 == 0;

  /// Returns if the number is odd
  bool get isOdd => this % 2 != 0;

  /// Returns if the number is positive
  bool get isPositive => this > 0;

  /// Returns if the number is negative
  bool get isNegative => this < 0;

  /// Format numeric currency
  String get numCurrency =>
      intl.NumberFormat.currency(customPattern: "#,##0.00").format(this);

  /// Format numeric currency with provided locale
  String numCurrencyWithLocale({String locale = "en_US"}) =>
      intl.NumberFormat.currency(
        locale: locale,
      ).format(this);

  ///Widgets

  ///
  ///Converts the number into a [SizedBox] with the width as that number.
  ///
  Widget get widthBox => SizedBox(
        width: toDouble(),
      );

  ///
  ///Converts the number into a [SizedBox] with the height as that number.
  ///
  Widget get heightBox => SizedBox(
        height: toDouble(),
      );

  ///
  ///Converts the number into a [SizedBox] with the width & height as that number.
  ///
  Widget get squareBox => SizedBox(
        height: toDouble(),
        width: toDouble(),
      );

  /// Get Text Widget for the String
  VxTextBuilder get text => VxTextBuilder(toString());
}

/// Extension method for integers.
extension IntExtension on int {
  /// Returns an iterable from `0` up to but not including [this].
  /// Example:
  /// ```dart
  /// 5.range; // (0, 1, 2, 3, 4)
  /// ```
  Iterable<int> get range => Iterable<int>.generate(this);

  /// Returns an iterable from [this] inclusive to [end] exclusive.
  ///
  /// Example:
  /// ```dart
  /// 3.to(6); // (3, 4, 5)
  /// 2.to(-2); // (2, 1, 0, -1)
  /// ```
  ///
  /// If [by] is provided, it will be used as step size for iteration. [by] is
  /// always positive, even if the direction of iteration is decreasing.
  ///
  /// Example:
  /// ```dart
  /// 8.to(3, by: 2); // (8, 6, 4)
  /// ```
  Iterable<int> to(int end, {int by = 1}) {
    if (by < 1) {
      throw ArgumentError(
          'Invalid step size: $by. Step size must be greater than 0');
    }
    final count = ((end - this).abs() / by).ceil();
    // Explicit type declaration required for function argument.
    final int Function(int) generator = this >= end
        ? (index) => this - (by * index)
        : (index) => this + (by * index);
    return Iterable<int>.generate(count, generator);
  }

  /// Returns [Duration] of [this] in days.
  Duration get days => Duration(days: this);

  /// Returns [Duration] of [this] in hours.
  Duration get hours => Duration(hours: this);

  /// Returns [Duration] of [this] in minutes.
  Duration get minutes => Duration(minutes: this);

  /// Returns [Duration] of [this] in seconds.
  Duration get seconds => Duration(seconds: this);

  /// Returns [Duration] of [this] in milliseconds.
  Duration get milliseconds => Duration(milliseconds: this);

  /// Returns [Duration] of [this] in microseconds.
  Duration get microseconds => Duration(microseconds: this);
}
