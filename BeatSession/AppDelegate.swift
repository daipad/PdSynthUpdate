//
//  AppDelegate.swift
//  BeatSession
//
//  Created by seito on 2016/10/05.
//  Copyright © 2016年 seito. All rights reserved.
//

import UIKit
//import SlideMenuControllerSwift




@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var bpmValue = 0;
    var rhythmHantei = false;
    
    
    
    //PureData
    var pd:PdAudioController?;

    
    func application(_ application: UIApplication , didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        /*
        let mainViewController = UIStoryboard.instantiateViewControllerWithIdentifier("MainViewController") as! ViewController2
        let leftViewController = UIStoryboard.instantiateViewControllerWithIdentifier("LeftViewController") as! ViewController2Option
        
        
        
        let slideMenuController = SlideMenuController(mainViewController: ViewController2, leftMenuViewController: ViewController2Option)
        self.window?.rootViewController = slideMenuController
        self.window?.makeKeyAndVisible()
        */
        
        //PureDataを扱う
        pd = PdAudioController()
        
       
        let pdInit = pd?.configureAmbient(withSampleRate: 44100, numberChannels: 2, mixingEnabled: true)
        /*
        while pdInit != PdAudioOK {
                print("Pd is not ready. Retying.");
                pdInit = pd?.configureAmbient(withSampleRate: 44100, numberChannels: 2, mixingEnabled: true)
            
            if pdInit == PdAudioOK{
                break;
            }
        }
         */

        if(pdInit == PdAudioOK) {
                print("Pd is ready to go.");
        }
        
        let ud = UserDefaults.standard;
        ud.removeObject(forKey: "tempoHantei");
        ud.removeObject(forKey: "BPMValue");
     
        

        
        return true
    }
 
    
    //アプリがアクティブではない場合
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        
        pd?.isActive = false
        
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    
    //アプリがアクティブな場合
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        pd?.isActive = true
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

