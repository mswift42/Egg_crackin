import 'package:angular2/core.dart';

@Component(
    selector: 'tooltip-component',
    templateUrl: 'tooltip_component.html',
    styleUrls: const ['tooltip_component.css'])
class TooltipComponent {
  @Input()
  String message;
}
