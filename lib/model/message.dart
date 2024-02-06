import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Message {
  final String senderId, senderEmail, receiverId, message;
  final Timestamp timestamp;

  Message(
      {required this.timestamp,
      required this.senderId,
      required this.senderEmail,
      required this.receiverId,
      required this.message});

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp,
    };
  }
}
