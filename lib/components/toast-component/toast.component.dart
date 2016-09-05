import 'dart:async';
import 'package:angular2/core.dart';



@Component(
    selector: 'toast-component',
    templateUrl: 'toast.component.html',
    styleUrls: const ['toast.component.css'])
class ToastComponent {
  @Input()
  String message;
  @Input()
  bool isShow = false;



}
