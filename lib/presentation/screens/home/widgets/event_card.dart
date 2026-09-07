import 'package:flutter/material.dart';
import 'package:local_event_finder/core/category_color.dart';
import 'package:local_event_finder/domain/event.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key, required this.event, required this.onTap,
  });

  final Event event;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: Card(
            color: Colors.white,
            elevation: 4,
            child: InkWell(
              onTap: onTap,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: .circular(12)
                    ),
                    child: Image.network(event.imageUrl,
                    height: 150,
                    width: .infinity,
                    fit: .cover,
                    ),
                  ),
                  Container(
                    padding: .symmetric(horizontal: 12,vertical: 4),
                    decoration: BoxDecoration(
                      color: getCategoryColor(event.category),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(12)
                      )
                    ),
                    child: Text(event.category,
                    style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(event.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: .bold,
                        ),
                        ),
                        Text("Date: ${event.date}",),
                        Text("Location: ${event.location}",)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}