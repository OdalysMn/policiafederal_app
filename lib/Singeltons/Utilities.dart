import 'package:flutter/material.dart';

class Utilities {
  static final Utilities _singleton = new Utilities._internal();

  factory Utilities() {
    return _singleton;
  }

  Utilities._internal();

  int currentActivity = 0;
  int currentLevel = 0;
  int completedActivities = 0;

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

  int getCompletedActivities(){
    return this.completedActivities;
  }

  setCompletedActivities(int completedActivities){
    this.completedActivities = completedActivities;
  }


}