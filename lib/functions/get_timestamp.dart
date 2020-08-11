import 'package:cloud_firestore/cloud_firestore.dart';

Timestamp getTimestamp(d) {
  Timestamp date;
  if (d == null) {
    date = null;
  } else if (d is Timestamp) {
    date = d;
  } else if (d is int) {
    date = Timestamp.fromMillisecondsSinceEpoch(d);
  } else if (d is String) {
    date = Timestamp.fromDate(DateTime.parse(d));
  } else if (d is DateTime) {
    // This is a dart DateTime object, idk how, but hey. Who am I to ask
    date = Timestamp.fromDate(d);
  } else if (d['_seconds'] != null && d['_nanoseconds'] != null) {
    // This is a Timestamp from realtimeDB
    date = Timestamp(d['_seconds'], d['_nanoseconds']);
  } else if (d['@ts'] != null) {
    // This is a Timestamp from faunaDB
    date = Timestamp.fromDate(DateTime.parse(d['@ts']));
  } else {
    date = d;
  }
  return date;
}
