//
//  AppDelegate.swift
//  BMI Calculator
//
//  Created by Souvik Biswas on 09/02/20.
//  Copyright © 2020 Souvik Biswas. All rights reserved.
//

import UIKit
import Flutter
import FlutterPluginRegistrant // Used to connect plugins.

@UIApplicationMain
class AppDelegate: FlutterAppDelegate { // More on the FlutterAppDelegate.
  lazy var flutterEngine = FlutterEngine(name: "my flutter engine")

  override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Runs the default Dart entrypoint with a default Flutter route.
    flutterEngine.run();
    GeneratedPluginRegistrant.register(with: self.flutterEngine);
    return super.application(application, didFinishLaunchingWithOptions: launchOptions);
  }
}

