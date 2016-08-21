import 'package:angular2/core.dart';

@Component(selector: 'title-component', templateUrl: 'title_component.html')
class TitleComponent {
  @Input()
  String title;
  @Input()
  String sourceurl;
}
