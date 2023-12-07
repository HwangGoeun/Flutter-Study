import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void showNotificationWithButton() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'basic_channel',
        title: 'Simple Notification',
        body: 'Simple body',
      ),
      actionButtons: <NotificationActionButton>[
        NotificationActionButton(key: 'yes', label: 'Yes'),
        NotificationActionButton(key: 'no', label: 'No'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          // 플로팅 버튼 생성
          onPressed: showNotificationWithButton,
          child: const Icon(Icons.notifications),
        ),
        appBar: AppBar(
          title: const Text('Awsome notification practice'),
        ),
        body: const Center(
          child: Text('Press the floating action button'),
        ),
      ),
    );
  }
}
