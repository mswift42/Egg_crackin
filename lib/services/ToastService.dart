import 'package:angular2/core.dart';
import 'dart:async';

@Injectable()
class ToastService {
  bool _show = false;

  void toggleShow() {
    _show = !show;
    var timer = new Timer(const Duration(seconds: 3), () => _show = false);
    timer.cancel;
  }

  bool get show => _show;
}
