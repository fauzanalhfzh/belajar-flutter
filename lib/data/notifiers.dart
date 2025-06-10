// ValueNotifier : Hold the data
// ValueListenableBuilder: Listen to the data (no need setState)

import 'package:flutter/material.dart';

ValueNotifier<int> selectedPageNotifier = ValueNotifier(0);
ValueNotifier<bool> isDarkModeNotifier = ValueNotifier(false);
