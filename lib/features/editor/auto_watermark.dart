String buildAutoWatermark(String? make, String? model) {
  if (make == null) return 'Shot on Camera';

  final lower = make.toLowerCase();

  if (lower.contains('apple')) {
    return 'Shot on iPhone';
  }
  if (lower.contains('xiaomi')) {
    return 'Shot on Xiaomi';
  }
  if (lower.contains('samsung')) {
    return 'Shot on Samsung';
  }
  if (lower.contains('google')) {
    return 'Shot on Pixel';
  }

  // fallback generic
  return model != null ? 'Shot on $model' : 'Shot on Camera';
}
