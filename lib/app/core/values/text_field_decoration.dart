
import 'package:flutter/material.dart';

var lightBorderTextFieldDecoration =InputDecoration(
  contentPadding: EdgeInsets.only(left:16, right: 8, top: 8, bottom: 8),
  filled: true,
  fillColor: Colors.white,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black12,

    ),
    borderRadius: BorderRadius.circular(8),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black12,

    ),
    borderRadius: BorderRadius.circular(8),
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black12,

    ),
    borderRadius: BorderRadius.circular(8),
  ),
);