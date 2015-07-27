//
//  AppDelegate.swift
//  kawa
//
//  Created by noraesae on 27/07/2015.
//  Copyright (c) 2015 noraesae. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var preferenceWindowController: PreferenceWindowController!
    var statusBar: StatusBar!
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        NSApp.setActivationPolicy(NSApplicationActivationPolicy.Accessory)
        InputSourceManager.initialize()
        showPreferenceWindow()
        statusBar = StatusBar(preferenceWindowController: preferenceWindowController)
    }

    func showPreferenceWindow() {
        if preferenceWindowController == nil {
            let storyboard = NSStoryboard(name: "Main", bundle: nil)!
            preferenceWindowController = storyboard.instantiateControllerWithIdentifier("Preference") as! PreferenceWindowController
        }
        preferenceWindowController.showAndFocusWindow(self)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
    }

    @IBAction func showPreferences(sender: AnyObject?) {
        preferenceWindowController.showAndFocusWindow(self)
    }

    @IBAction func hidePreferences(sender: AnyObject?) {
        preferenceWindowController.hideWindow(self)
    }
}
