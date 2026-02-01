import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentImageProvider = StateProvider<File?>((ref) => null);
