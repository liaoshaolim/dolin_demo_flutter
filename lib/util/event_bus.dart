import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class ThemeColorEvent {
  ThemeColorEvent(this.colorStr);
  String colorStr;
}
