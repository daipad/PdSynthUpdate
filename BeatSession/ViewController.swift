//
//  ViewController.swift
//  BeatSession
//
//  Created by seito on 2016/10/05.
//  Copyright © 2016年 seito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func MainMenu(_ segue:UIStoryboardSegue){
        print("Menu")
    }
    
    


    override func viewDidLoad() {
        
        //NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.beatRepeat(_:)), userInfo: nil, repeats: true);
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //画面の向き
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        
        let orientation: UIInterfaceOrientationMask = UIInterfaceOrientationMask.landscapeRight;
        
        return orientation;
        
    }
    override var shouldAutorotate : Bool {
        return true;
    }


}

