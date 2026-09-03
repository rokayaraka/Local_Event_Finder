import 'package:local_event_finder/data/dummy_data.dart';
import 'package:local_event_finder/domain/event.dart';

class EventService {
  Future<List<Event>> getAllEvents() async {
    await Future.delayed(const Duration(seconds: 2));
    return DummyData().dummyEvents;
  }

  Future<Event> getEvent(String id) async {
    return DummyData().dummyEvents.firstWhere((event) => event.id == id);
  }
}
