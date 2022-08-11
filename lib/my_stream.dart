import 'dart:async';

class MyStream {
  StreamController<int> controller = StreamController();
  int count = 0;
  MyStream() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      controller.sink.add(count);
      count++;

      if (count == 20) {
        controller.close();
        timer.cancel();
      }
    });
  }

  Stream<int> get stream => controller.stream;
}
