import 'package:angular2/core.dart';

@Component(
    selector: 'publisher-component',
templateUrl: 'publisher_component.html',
styleUrls: const ['publisher_component.css']
)

class PublisherComponent {
  @Input() String publisher;
}