import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/category_color.dart';
import '../../providers/event_provider.dart';
import 'widgets/event_map_widget.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key, this.eventId});

  final String? eventId;

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    final eventProvider = context.read<EventProvider>();
    final event = eventProvider.getEventById(widget.eventId!);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          " Event Details",
          style: TextStyle(fontSize: 24, fontWeight: .bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Image.network(
              event.imageUrl,
              height: 200,
              width: .infinity,
              fit: .cover,
            ),
            Container(
              padding: .symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: getCategoryColor(event.category),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Text(
                event.category,
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    event.title,
                    style: TextStyle(fontSize: 20, fontWeight: .bold),
                  ),
                  Text("Date: ${event.date}"),
                  Text("Location: ${event.location}"),
                  SizedBox(height: 20),
                  Text(
                    "About This Event",
                    style: TextStyle(fontSize: 20, fontWeight: .bold),
                  ),
                  Text(event.description),
                  SizedBox(height: 20),
                  Text(
                    "Event Location",
                    style: TextStyle(fontSize: 20, fontWeight: .bold),
                  ),

                  EventMapWidget(
                    latitude: event.latitude,
                    longitude: event.longitude,
                    locaion: event.location,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
