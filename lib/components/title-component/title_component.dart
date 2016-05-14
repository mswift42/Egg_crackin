import 'package:angular2/core.dart';

@Component(
    selector: 'title-component',
    templateUrl: 'title_component.html',
    styleUrls: const ['title_component.css'])
class TitleComponent {
  @Input()
  String title;
}
