class Delay {
  static Future<void> wait(Duration duration) {
    return Future.delayed(duration);
  }
}
