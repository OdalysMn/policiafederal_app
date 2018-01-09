import 'package:flutter/material.dart';

class Utilities {
  static final Utilities _singleton = new Utilities._internal();

  factory Utilities() {
    return _singleton;
  }

  Utilities._internal();

  int currentActivity;
  int currentLevel;

  int getCurrentActivity() {
    return this.currentActivity;
  }

  setCurrentActivity(currentActivity) {
    this.currentActivity = currentActivity;
  }

  int getCurrentLevel() {
    return this.currentLevel;
  }

  setCurrentLevel(currentLevel) {
    this.currentLevel = currentLevel;
  }


}