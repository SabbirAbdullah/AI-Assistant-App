// lib/utils/container_decorations.dart

import 'package:flutter/material.dart';

// Light border decoration
BoxDecoration lightBorderDecoration = BoxDecoration(
  border: Border.all(
    color: Colors.grey,
    width: 1.0,
  ),
  borderRadius: BorderRadius.circular(4.0),
);

// Dark border decoration
BoxDecoration darkBorderDecoration = BoxDecoration(
  border: Border.all(
    color: Colors.black,
    width: 1.0,
  ),
  borderRadius: BorderRadius.circular(4.0),
);

// Rounded corners decoration
BoxDecoration roundedCornersDecoration = BoxDecoration(
  color: Colors.white,
  border: Border.all(
    color: Colors.grey,
    width: 1.0,
  ),
  borderRadius: BorderRadius.circular(12.0),
);

// Half-rounded corners decoration (rounded on the top)
BoxDecoration halfRoundedTopDecoration = BoxDecoration(
  color: Colors.white,
  border: Border.all(
    color: Colors.grey,
    width: 1.0,
  ),
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(12.0),
    topRight: Radius.circular(12.0),
  ),
);

// Half-rounded corners decoration (rounded on the bottom)
BoxDecoration halfRoundedBottomDecoration = BoxDecoration(
  color: Colors.white,
  border: Border.all(
    color: Colors.grey,
    width: 1.0,
  ),
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(12.0),
    bottomRight: Radius.circular(12.0),
  ),
);

// No border with rounded corners
BoxDecoration noBorderRoundedCornersDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
);

// Full rounded decoration (circle)
BoxDecoration circleDecoration = BoxDecoration(
  color: Colors.white,
  shape: BoxShape.circle,
  border: Border.all(
    color: Colors.grey,
    width: 1.0,
  ),
);

// Shadowed container decoration
BoxDecoration shadowDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(12.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);