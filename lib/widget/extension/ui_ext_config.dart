import 'package:flutter/material.dart';

extension DoubleExtension on double {
  EdgeInsets get all => EdgeInsets.all(this);

  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: this);

  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: this);

  Size get size => Size(this, this);

  BorderRadius get circular => BorderRadius.circular(this);

  BorderRadius get radiusAll => BorderRadius.circular(this);
}

extension DoubleSymmetricExtension on (double, double) {
  EdgeInsets get symmetric => EdgeInsets.symmetric(horizontal: this.$1, vertical: this.$2);

  Size get size => Size(this.$1, this.$2);
}

extension IntExtension on int {
  EdgeInsets get all => EdgeInsets.all(this * 1.0);

  EdgeInsets get top => EdgeInsets.only(top: this * 1.0);

  EdgeInsets get right => EdgeInsets.only(right: this * 1.0);

  EdgeInsets get bottom => EdgeInsets.only(bottom: this * 1.0);

  EdgeInsets get left => EdgeInsets.only(left: this * 1.0);

  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: this * 1.0);

  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: this * 1.0);

  Size get size => Size(this * 1.0, this * 1.0);

  BorderRadius get circular => BorderRadius.circular(this * 1.0);

  BorderRadius get radiusAll => BorderRadius.circular(this * 1.0);
}

extension IntSymmetricExtension on (int, int) {
  EdgeInsets get symmetric =>
      EdgeInsets.symmetric(horizontal: this.$1 * 1.0, vertical: this.$2 * 1.0);
}

