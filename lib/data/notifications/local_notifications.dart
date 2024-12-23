import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

@singleton
class PushNotificationService {
  PushNotificationService() {
    this.initialise();
  }

  Future initialise() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const androidSettings = AndroidInitializationSettings('app_icon');
    const iosSettings = DarwinInitializationSettings();

    final hasPermission = await flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.requestNotificationsPermission() ??
        true;
    if (!hasPermission) return;

    const androidChannel = AndroidNotificationChannel(
      'channel_id_1',
      "Channel",
      description: "Notifications",
      importance: Importance.max,
    );

    final initializationSettings =
        InitializationSettings(android: androidSettings, iOS: iosSettings);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidChannel);

    tz.initializeTimeZones();
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'channel_id_1',
      'Channel',
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    final now = tz.TZDateTime.now(tz.local);
    final midnight =
        DateTime(now.year, now.month, now.day, 23, 59, 59, 59, 59).toUtc();

    final difference = tz.TZDateTime.now(tz.local).add(Duration(
      hours: midnight.hour - now.hour,
      minutes: midnight.minute - now.minute,
      seconds: midnight.second - now.second,
    ));

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      "New waifu!",
      "A new waifu is available!",
      difference,
      platformChannelSpecifics,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }
}
