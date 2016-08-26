import 'package:angular2/core.dart';
import 'dart:async';

@Injectable()
class ToastService {
  bool _show = false;

  showToast() {
    _show = true;
    var timer = new Timer(const Duration(seconds: 3), () => _show = false);
  }
}
