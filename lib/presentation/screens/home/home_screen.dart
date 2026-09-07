import 'package:flutter/material.dart';
import 'package:local_event_finder/presentation/providers/event_provider.dart';
import 'package:local_event_finder/presentation/screens/event/event_screen.dart';
import 'package:provider/provider.dart';

import 'widgets/event_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _fetchEvents();
    });
  }

  void _fetchEvents(){
    context.read<EventProvider>().fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Local Event Finder",
          style: TextStyle(fontSize: 24, fontWeight: .bold),
        ),
      ),
      body: Consumer<EventProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            final events = provider.events;
            return ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return EventCard(event: event, onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EventScreen()));
                });
              },
            );
          }
        },
      ),
    );
  }
}
