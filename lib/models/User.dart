import 'package:flutter/material.dart';

class User {
  String designation,
      key,
      name,
      phone,
      email,
      address,
      area,
      since,
      relation,
      priority;

  User(
      {this.key,
      this.priority,
      this.name,
      this.phone,
      this.email,
      this.address,
      this.area,
      this.designation,
      this.since,
      this.relation});
}
