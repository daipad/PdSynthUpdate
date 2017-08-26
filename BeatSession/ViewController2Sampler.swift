//
//  ViewController2Sampler.swift
//  BeatSession
//
//  Created by seito on 2017/01/11.
//  Copyright © 2017年 seito. All rights reserved.
//

import UIKit

class ViewController2Sampler: UIViewController {
    
    
    var samplerPatch:PDPatch?;

    //小節を配列に
    var SamplerTruck1: [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]; //要素数32 キック
    var SamplerTruck2: [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]; //要素数32 スネア
    var SamplerTruck3: [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]; //要素数32 オープンハイハット
    //何小節目か
    var beatTimelineCounter = 0;
    
    
    //データ保存用
    let userDefaults = UserDefaults.standard;
    
    //AudioPlayer用変数
    var Kick909Player01     = AVAudioPlayer();
    var Kick909Player01_2   = AVAudioPlayer();
    var Kick909Player01_3   = AVAudioPlayer();
    var Kick909Player01_4   = AVAudioPlayer();
    
    
    
    
    var Kick909Player02     = AVAudioPlayer();
    var Kick909Player02_2   = AVAudioPlayer();
    var Kick909Player02_3   = AVAudioPlayer();
    var Kick909Player02_4   = AVAudioPlayer();
    var Kick909Player02_5   = AVAudioPlayer();
    
    
    
    
    var Snare909Player01    = AVAudioPlayer();
    
    var Snare909Player02    = AVAudioPlayer();
    var Snare909Player02_2    = AVAudioPlayer();
    var Snare909Player02_3    = AVAudioPlayer();
    var Snare909Player02_4    = AVAudioPlayer();
    var Snare909Player02_5    = AVAudioPlayer();
    
    
    var CHHat909Player01    = AVAudioPlayer();
    var CHHat909Player02    = AVAudioPlayer();
    
    var OHHat909Player01    = AVAudioPlayer();
    var OHHat909Player01_2    = AVAudioPlayer();
    var OHHat909Player01_3    = AVAudioPlayer();
    var OHHat909Player01_4    = AVAudioPlayer();
    var OHHat909Player01_5    = AVAudioPlayer();
    
    
    var OHHat909Player02    = AVAudioPlayer();
    
    var Clap909Player01     = AVAudioPlayer();
    var Clap909Player02     = AVAudioPlayer();
    
    var Crash909Player01    = AVAudioPlayer();
    var Crash909Player02    = AVAudioPlayer();
    
    var rhythmF7            = AVAudioPlayer();
    var rhythmF6            = AVAudioPlayer();
    
    var KickDubPlayer01     = AVAudioPlayer(); //add
    
    var tempBeepSound01     = AVAudioPlayer();
    var tempBeepSound02     = AVAudioPlayer(); //add
    
    
    
    var getPalameterTimer:Timer!;
    func palamTimer(_ args:Timer){

        //pdSampler?.samplerMetroVol(Int32(MetroVolume.value));
        
    }
    
    
    //値の引き渡し
    
    
    //BPM調整
    var tempoMakerTimer:Timer!;
    var tempoMakerGetBPM:Timer!;
    
    
    var tempoMakerHantei:Bool = false;
    var BPMCounter:Double = 0.0;

    

    
    
    
    
    
    @IBOutlet weak var bpmLabel: UILabel!
    
    @IBOutlet weak var BPMSlider: UISlider!
    @IBAction func BPMSliderAction(_ sender: Any) {
        let BPMValue = Int(BPMSlider.value);
        bpmLabel.text = "\(BPMValue)";
        BPMCounter = 60/(Double(BPMSlider.value)*4);
        
        userDefaults.set(BPMCounter, forKey: "BPMValue");
        userDefaults.synchronize();
        

    }
    
    
    //リズムマシン電源
    @IBAction func samplerPlay(_ sender: Any) {
        
        samplerPatch?.samplerActive();
        /*
        if tempoMakerHantei  == false {
            
            tempBeepSound01.currentTime = 0; //初めの一回
            tempBeepSound01.play();
            
            //metronomeActive = true;
            //MetronomeFunc();
            
            
            tempoMakerTimer = Timer.scheduledTimer(timeInterval: BPMCounter, target: self, selector: #selector(self.MetroNome(_:)), userInfo: nil, repeats: true);
            tempoMakerHantei  = true;
            
            userDefaults.set(tempoMakerHantei, forKey: "tempoHantei");
            userDefaults.synchronize();
        
        } else {
            //metronomeActive = false;
            
            
            if(tempoMakerTimer.isValid){
                tempoMakerTimer.invalidate();
            }
            
            
            tempoMakerHantei  = false;
            
            userDefaults.set(tempoMakerHantei, forKey: "tempoHantei");
            userDefaults.synchronize();
            
        }
         */
    }
    
    //メトロノーム起動時の処理
    func MetroNome(_ args:Timer){
        //tempoMakerTimer.timeInterval = BPMCounter;
        
        //print(delegateValue.bpmValue);

        if(beatTimelineCounter > 15){
            beatTimelineCounter = 0;
        }
        
        //トラック１
        if(SamplerTruck1[beatTimelineCounter] == 1){
            if(beatTimelineCounter==0 || beatTimelineCounter==5 || beatTimelineCounter==10){
                Kick909Player02.currentTime = 0;
                Kick909Player02.play();
            }
            if(beatTimelineCounter==4 || beatTimelineCounter==9 || beatTimelineCounter==14){
                Kick909Player02_2.currentTime = 0;
                Kick909Player02_2.play();
            }
            if(beatTimelineCounter==8 || beatTimelineCounter==2 || beatTimelineCounter==13){
                Kick909Player02_3.currentTime = 0;
                Kick909Player02_3.play();
            }
            if(beatTimelineCounter==12 || beatTimelineCounter==1 || beatTimelineCounter==6){
                Kick909Player02_4.currentTime = 0;
                Kick909Player02_4.play();
            }
            if(beatTimelineCounter==3 || beatTimelineCounter==7 || beatTimelineCounter==11 || beatTimelineCounter==15){
                Kick909Player02_5.currentTime = 0;
                Kick909Player02_5.play();
            }
        }
        //トラック２
        if(SamplerTruck2[beatTimelineCounter] == 1){
            if(beatTimelineCounter==0 || beatTimelineCounter==5 || beatTimelineCounter==10){
                Snare909Player02.currentTime = 0;
                Snare909Player02.play();
            }
            if(beatTimelineCounter==4 || beatTimelineCounter==9 || beatTimelineCounter==14){
                Snare909Player02_2.currentTime = 0;
                Snare909Player02_2.play();
            }
            if(beatTimelineCounter==8 || beatTimelineCounter==2 || beatTimelineCounter==13){
                Snare909Player02_3.currentTime = 0;
                Snare909Player02_3.play();
            }
            if(beatTimelineCounter==12 || beatTimelineCounter==1 || beatTimelineCounter==6){
                Snare909Player02_4.currentTime = 0;
                Snare909Player02_4.play();
            }
            if(beatTimelineCounter==3 || beatTimelineCounter==7 || beatTimelineCounter==11 || beatTimelineCounter==15){
                Snare909Player02_5.currentTime = 0;
                Snare909Player02_5.play();
            }
        }
        //トラック３
        if(SamplerTruck3[beatTimelineCounter] == 1){
            if(beatTimelineCounter==0 || beatTimelineCounter==5 || beatTimelineCounter==10){
                OHHat909Player01.currentTime = 0;
                OHHat909Player01.play();
            }
            if(beatTimelineCounter==4 || beatTimelineCounter==9 || beatTimelineCounter==14){
                OHHat909Player01_2.currentTime = 0;
                OHHat909Player01_2.play();
            }
            if(beatTimelineCounter==8 || beatTimelineCounter==2 || beatTimelineCounter==13){
                OHHat909Player01_3.currentTime = 0;
                OHHat909Player01_3.play();
            }
            if(beatTimelineCounter==12 || beatTimelineCounter==1 || beatTimelineCounter==6){
                OHHat909Player01_4.currentTime = 0;
                OHHat909Player01_4.play();
            }
            if(beatTimelineCounter==3 || beatTimelineCounter==7 || beatTimelineCounter==11 || beatTimelineCounter==15){
                OHHat909Player01_5.currentTime = 0;
                OHHat909Player01_5.play();
            }
        }
        
        
        
        
        
        beatTimelineCounter += 1;
        
        
        if(tempoMakerTimer.timeInterval != BPMCounter){
            BPMCounter = 60/(Double(BPMSlider.value)*4);
            
            userDefaults.set(BPMCounter, forKey: "BPMValue");
            userDefaults.synchronize();
            
            tempoMakerTimer.invalidate();
            tempoMakerTimer = Timer.scheduledTimer(timeInterval: BPMCounter, target: self, selector: #selector(self.MetroNome(_:)), userInfo: nil, repeats: true);
        }
    }
    
    //BPMからタイマーの間隔を取得
    func GetBPM(_ args:Timer){
        BPMCounter = 60/(Double(BPMSlider.value)*4);
        
        userDefaults.set(BPMCounter, forKey: "BPMValue");
        userDefaults.synchronize();
  
    }
    

    
    
    
    @IBOutlet weak var VolumeSlider: UISlider!
    @IBOutlet weak var MetroVolume: UISlider!
    
    
    //トラック１
    @IBAction func pad1_1(_ sender: Any) {
        samplerPatch?.pad1_1_on()
        /*
        if(SamplerTruck1[0]==0){
            SamplerTruck1[0] = 1;
        } else {
            SamplerTruck1[0] = 0;
        }
         */
    }
    @IBAction func pad1_2(_ sender: Any) {
        if(SamplerTruck1[1]==0){
            SamplerTruck1[1] = 1;
        } else {
            SamplerTruck1[1] = 0;
        }
    }
    @IBAction func pad1_3(_ sender: Any) {
        if(SamplerTruck1[2]==0){
            SamplerTruck1[2] = 1;
        } else {
            SamplerTruck1[2] = 0;
        }
    }
    @IBAction func pad1_4(_ sender: Any) {
        if(SamplerTruck1[3]==0){
            SamplerTruck1[3] = 1;
        } else {
            SamplerTruck1[3] = 0;
        }
    }
    @IBAction func pad1_5(_ sender: Any) {
        samplerPatch?.pad1_5_on()
        /*
        if(SamplerTruck1[4]==0){
            SamplerTruck1[4] = 1;
        } else {
            SamplerTruck1[4] = 0;
        }
        */
    }
    @IBAction func pad1_6(_ sender: Any) {
        if(SamplerTruck1[5]==0){
            SamplerTruck1[5] = 1;
        } else {
            SamplerTruck1[5] = 0;
        }
    }
    @IBAction func pad1_7(_ sender: Any) {
        if(SamplerTruck1[6]==0){
            SamplerTruck1[6] = 1;
        } else {
            SamplerTruck1[6] = 0;
        }
    }
    
    @IBAction func pad1_8(_ sender: Any) {
        if(SamplerTruck1[7]==0){
            SamplerTruck1[7] = 1;
        } else {
            SamplerTruck1[7] = 0;
        }
    }
    @IBAction func pad1_9(_ sender: Any) {
        samplerPatch?.pad1_9_on()
        /*
        if(SamplerTruck1[8]==0){
            SamplerTruck1[8] = 1;
        } else {
            SamplerTruck1[8] = 0;
        }
        */
    }
    @IBAction func pad1_10(_ sender: Any) {
        if(SamplerTruck1[9]==0){
            SamplerTruck1[9] = 1;
        } else {
            SamplerTruck1[9] = 0;
        }
    }
    @IBAction func pad1_11(_ sender: Any) {
        if(SamplerTruck1[10]==0){
            SamplerTruck1[10] = 1;
        } else {
            SamplerTruck1[10] = 0;
        }
    }
    @IBAction func pad1_12(_ sender: Any) {
        if(SamplerTruck1[11]==0){
            SamplerTruck1[11] = 1;
        } else {
            SamplerTruck1[11] = 0;
        }
    }
    @IBAction func pad1_13(_ sender: Any) {
        samplerPatch?.pad1_13_on()
        /*
        if(SamplerTruck1[12]==0){
            SamplerTruck1[12] = 1;
        } else {
            SamplerTruck1[12] = 0;
        }
        */
    }
    @IBAction func pad1_14(_ sender: Any) {
        if(SamplerTruck1[13]==0){
            SamplerTruck1[13] = 1;
        } else {
            SamplerTruck1[13] = 0;
        }
    }
    @IBAction func pad1_15(_ sender: Any) {
        if(SamplerTruck1[14]==0){
            SamplerTruck1[14] = 1;
        } else {
            SamplerTruck1[14] = 0;
        }
    }
    @IBAction func pad1_16(_ sender: Any) {
        if(SamplerTruck1[15]==0){
            SamplerTruck1[15] = 1;
        } else {
            SamplerTruck1[15] = 0;
        }
    }
    
    //トラック２

    @IBAction func pad2_1(_ sender: Any) {
        if(SamplerTruck2[0]==0){
            SamplerTruck2[0] = 1;
        } else {
            SamplerTruck2[0] = 0;
        }
    }
    @IBAction func pad2_2(_ sender: Any) {
        if(SamplerTruck2[1]==0){
            SamplerTruck2[1] = 1;
        } else {
            SamplerTruck2[1] = 0;
        }
    }
    @IBAction func pad2_3(_ sender: Any) {
        if(SamplerTruck2[2]==0){
            SamplerTruck2[2] = 1;
        } else {
            SamplerTruck2[2] = 0;
        }
    }
    @IBAction func pad2_4(_ sender: Any) {
        if(SamplerTruck2[3]==0){
            SamplerTruck2[3] = 1;
        } else {
            SamplerTruck2[3] = 0;
        }
    }
    @IBAction func pad2_5(_ sender: Any) {
        if(SamplerTruck2[4]==0){
            SamplerTruck2[4] = 1;
        } else {
            SamplerTruck2[4] = 0;
        }
    }
    @IBAction func pad2_6(_ sender: Any) {
        if(SamplerTruck2[5]==0){
            SamplerTruck2[5] = 1;
        } else {
            SamplerTruck2[5] = 0;
        }
    }
    @IBAction func pad2_7(_ sender: Any) {
        if(SamplerTruck2[6]==0){
            SamplerTruck2[6] = 1;
        } else {
            SamplerTruck2[6] = 0;
        }
    }
    @IBAction func pad2_8(_ sender: Any) {
        if(SamplerTruck2[7]==0){
            SamplerTruck2[7] = 1;
        } else {
            SamplerTruck2[7] = 0;
        }
    }
    @IBAction func pad2_9(_ sender: Any) {
        if(SamplerTruck2[8]==0){
            SamplerTruck2[8] = 1;
        } else {
            SamplerTruck2[8] = 0;
        }
    }
    @IBAction func pad2_10(_ sender: Any) {
        if(SamplerTruck2[9]==0){
            SamplerTruck2[9] = 1;
        } else {
            SamplerTruck2[9] = 0;
        }
    }
    @IBAction func pad2_11(_ sender: Any) {
        if(SamplerTruck2[10]==0){
            SamplerTruck2[10] = 1;
        } else {
            SamplerTruck2[10] = 0;
        }
    }
    @IBAction func pad2_12(_ sender: Any) {
        if(SamplerTruck2[11]==0){
            SamplerTruck2[11] = 1;
        } else {
            SamplerTruck2[11] = 0;
        }
    }
    @IBAction func pad2_13(_ sender: Any) {
        if(SamplerTruck2[12]==0){
            SamplerTruck2[12] = 1;
        } else {
            SamplerTruck2[12] = 0;
        }
    }
    @IBAction func pad2_14(_ sender: Any) {
        if(SamplerTruck2[13]==0){
            SamplerTruck2[13] = 1;
        } else {
            SamplerTruck2[13] = 0;
        }
    }
    @IBAction func pad2_15(_ sender: Any) {
        if(SamplerTruck2[14]==0){
            SamplerTruck2[14] = 1;
        } else {
            SamplerTruck2[14] = 0;
        }
    }
    @IBAction func pad2_16(_ sender: Any) {
        if(SamplerTruck2[15]==0){
            SamplerTruck2[15] = 1;
        } else {
            SamplerTruck2[15] = 0;
        }
    }
    //トラック３
    @IBAction func pad3_1(_ sender: Any) {
        if(SamplerTruck3[0]==0){
            SamplerTruck3[0] = 1;
        } else {
            SamplerTruck3[0] = 0;
        }
    }
    @IBAction func pad3_2(_ sender: Any) {
        if(SamplerTruck3[1]==0){
            SamplerTruck3[1] = 1;
        } else {
            SamplerTruck3[1] = 0;
        }
    }
    @IBAction func pad3_3(_ sender: Any) {
        if(SamplerTruck3[2]==0){
            SamplerTruck3[2] = 1;
        } else {
            SamplerTruck3[2] = 0;
        }
    }
    @IBAction func pad3_4(_ sender: Any) {
        if(SamplerTruck3[3]==0){
            SamplerTruck3[3] = 1;
        } else {
            SamplerTruck3[3] = 0;
        }
    }
    @IBAction func pad3_5(_ sender: Any) {
        if(SamplerTruck3[4]==0){
            SamplerTruck3[4] = 1;
        } else {
            SamplerTruck3[4] = 0;
        }
    }
    @IBAction func pad3_6(_ sender: Any) {
        if(SamplerTruck3[5]==0){
            SamplerTruck3[5] = 1;
        } else {
            SamplerTruck3[5] = 0;
        }
    }
    @IBAction func pad3_7(_ sender: Any) {
        if(SamplerTruck3[6]==0){
            SamplerTruck3[6] = 1;
        } else {
            SamplerTruck3[6] = 0;
        }
    }
    @IBAction func pad3_8(_ sender: Any) {
        if(SamplerTruck3[7]==0){
            SamplerTruck3[7] = 1;
        } else {
            SamplerTruck3[7] = 0;
        }
    }
    @IBAction func pad3_9(_ sender: Any) {
        if(SamplerTruck3[8]==0){
            SamplerTruck3[8] = 1;
        } else {
            SamplerTruck3[8] = 0;
        }
    }
    @IBAction func pad3_10(_ sender: Any) {
        if(SamplerTruck3[9]==0){
            SamplerTruck3[9] = 1;
        } else {
            SamplerTruck3[9] = 0;
        }
    }
    @IBAction func pad3_11(_ sender: Any) {
        if(SamplerTruck3[10]==0){
            SamplerTruck3[10] = 1;
        } else {
            SamplerTruck3[10] = 0;
        }
    }
    @IBAction func pad3_12(_ sender: Any) {
        if(SamplerTruck3[11]==0){
            SamplerTruck3[11] = 1;
        } else {
            SamplerTruck3[11] = 0;
        }
    }
    @IBAction func pad3_13(_ sender: Any) {
        if(SamplerTruck3[12]==0){
            SamplerTruck3[12] = 1;
        } else {
            SamplerTruck3[12] = 0;
        }
    }
    @IBAction func pad3_14(_ sender: Any) {
        if(SamplerTruck3[13]==0){
            SamplerTruck3[13] = 1;
        } else {
            SamplerTruck3[13] = 0;
        }
    }
    @IBAction func pad3_15(_ sender: Any) {
        if(SamplerTruck3[14]==0){
            SamplerTruck3[14] = 1;
        } else {
            SamplerTruck3[14] = 0;
        }
    }
    @IBAction func pad3_16(_ sender: Any) {
        if(SamplerTruck3[15]==0){
            SamplerTruck3[15] = 1;
        } else {
            SamplerTruck3[15] = 0;
        }
    }
    
    
    override func viewDidLoad() {
        
        //Drum Sounds Load Point.
        let Kick909_01 = URL(fileURLWithPath: Bundle.main.path(forResource: "DrumSoundsMP3/Kick01_edit", ofType: "mp3")!);
        do { try Kick909Player01 = AVAudioPlayer(contentsOf: Kick909_01)
            Kick909Player01.prepareToPlay()
            //Kick909Player01_2.prepareToPlay()
            //Kick909Player01_3.prepareToPlay()
            //Kick909Player01_4.prepareToPlay()
        } catch { print("error")
        }
        Kick909Player01.prepareToPlay();
        
        
        
        let Kick909_02 = URL(fileURLWithPath: Bundle.main.path(forResource: "DrumSoundsMP3/Kick02", ofType: "mp3")!);
        do { try Kick909Player02 = AVAudioPlayer(contentsOf: Kick909_02)
            Kick909Player02.prepareToPlay()
            
        } catch { print("error")
        }
        do { try Kick909Player02_2 = AVAudioPlayer(contentsOf: Kick909_02)
            Kick909Player02_2.prepareToPlay()
            
        } catch { print("error")
        }
        do { try Kick909Player02_3 = AVAudioPlayer(contentsOf: Kick909_02)
            Kick909Player02_3.prepareToPlay()
            
        } catch { print("error")
        }
        do { try Kick909Player02_4 = AVAudioPlayer(contentsOf: Kick909_02)
            Kick909Player02_4.prepareToPlay()
            
        } catch { print("error")
        }
        do { try Kick909Player02_5 = AVAudioPlayer(contentsOf: Kick909_02)
            Kick909Player02_5.prepareToPlay()
            
        } catch { print("error")
        }
        Kick909Player02.prepareToPlay();
        Kick909Player02_2.prepareToPlay()
        Kick909Player02_3.prepareToPlay()
        Kick909Player02_4.prepareToPlay()
        Kick909Player02_5.prepareToPlay()
        
        let Snare909_01 = URL(fileURLWithPath: Bundle.main.path(forResource: "DrumSoundsMP3/Snare01", ofType: "mp3")!);
        do { try Snare909Player01 = AVAudioPlayer(contentsOf: Snare909_01)
            Snare909Player01.prepareToPlay()
        } catch { print("error")
        }
        Snare909Player01.prepareToPlay();
        let Snare909_02 = URL(fileURLWithPath: Bundle.main.path(forResource: "DrumSoundsMP3/Snare01", ofType: "mp3")!);
        do { try Snare909Player02 = AVAudioPlayer(contentsOf: Snare909_02)
            Snare909Player02.prepareToPlay()
        } catch { print("error")
        }
        do { try Snare909Player02_2 = AVAudioPlayer(contentsOf: Snare909_02)
            Snare909Player02_2.prepareToPlay()
        } catch { print("error")
        }
        do { try Snare909Player02_3 = AVAudioPlayer(contentsOf: Snare909_02)
            Snare909Player02_3.prepareToPlay()
        } catch { print("error")
        }
        do { try Snare909Player02_4 = AVAudioPlayer(contentsOf: Snare909_02)
            Snare909Player02_4.prepareToPlay()
        } catch { print("error")
        }
        do { try Snare909Player02_5 = AVAudioPlayer(contentsOf: Snare909_02)
            Snare909Player02_5.prepareToPlay()
        } catch { print("error")
        }
        
        Snare909Player02.prepareToPlay();
        Snare909Player02_2.prepareToPlay();
        Snare909Player02_3.prepareToPlay();
        Snare909Player02_4.prepareToPlay();
        Snare909Player02_5.prepareToPlay();
        
        let CHHat909_01 = URL(fileURLWithPath: Bundle.main.path(forResource: "DrumSoundsMP3/CHHat01", ofType: "mp3")!);
        do { try CHHat909Player01 = AVAudioPlayer(contentsOf: CHHat909_01)
            CHHat909Player01.prepareToPlay()
        } catch { print("error")
        }
        CHHat909Player01.prepareToPlay();
        let CHHat909_02 = URL(fileURLWithPath: Bundle.main.path(forResource: "DrumSoundsMP3/CHHat02", ofType: "mp3")!);
        do { try CHHat909Player02 = AVAudioPlayer(contentsOf: CHHat909_02)
            CHHat909Player02.prepareToPlay()
        } catch { print("error")
        }
        CHHat909Player02.prepareToPlay();
        
        let OHHat909_01 = URL(fileURLWithPath: Bundle.main.path(forResource: "DrumSoundsMP3/OHHat01", ofType: "mp3")!);
        do { try OHHat909Player01 = AVAudioPlayer(contentsOf: OHHat909_01)
            OHHat909Player01.prepareToPlay()
        } catch { print("error")
        }
        do { try OHHat909Player01_2 = AVAudioPlayer(contentsOf: OHHat909_01)
            OHHat909Player01_2.prepareToPlay()
        } catch { print("error")
        }
        do { try OHHat909Player01_3 = AVAudioPlayer(contentsOf: OHHat909_01)
            OHHat909Player01_3.prepareToPlay()
        } catch { print("error")
        }
        do { try OHHat909Player01_4 = AVAudioPlayer(contentsOf: OHHat909_01)
            OHHat909Player01_4.prepareToPlay()
        } catch { print("error")
        }
        do { try OHHat909Player01_5 = AVAudioPlayer(contentsOf: OHHat909_01)
            OHHat909Player01_5.prepareToPlay()
        } catch { print("error")
        }
        OHHat909Player01.prepareToPlay();
        OHHat909Player01_2.prepareToPlay();
        OHHat909Player01_3.prepareToPlay();
        OHHat909Player01_4.prepareToPlay();
        OHHat909Player01_5.prepareToPlay();
        
        
        let OHHat909_02 = URL(fileURLWithPath: Bundle.main.path(forResource: "DrumSoundsMP3/OHHat02", ofType: "mp3")!);
        do { try OHHat909Player02 = AVAudioPlayer(contentsOf: OHHat909_02)
            OHHat909Player02.prepareToPlay()
        } catch { print("error")
        }
        
        OHHat909Player02.prepareToPlay();
        
        let Clap909_01 = URL(fileURLWithPath: Bundle.main.path(forResource: "DrumSoundsMP3/Clap01", ofType: "mp3")!);
        do { try Clap909Player01 = AVAudioPlayer(contentsOf: Clap909_01)
            Clap909Player01.prepareToPlay()
        } catch { print("error")
        }
        Clap909Player01.prepareToPlay();
        let Clap909_02 = URL(fileURLWithPath: Bundle.main.path(forResource: "DrumSoundsMP3/Clap02", ofType: "mp3")!);
        do { try Clap909Player02 = AVAudioPlayer(contentsOf: Clap909_02)
            Clap909Player02.prepareToPlay()
        } catch { print("error")
        }
        Clap909Player02.prepareToPlay();
        
        let Crash909_01 = URL(fileURLWithPath: Bundle.main.path(forResource: "DrumSoundsMP3/Crush01", ofType: "mp3")!);
        do { try Crash909Player01 = AVAudioPlayer(contentsOf: Crash909_01)
            Crash909Player01.prepareToPlay()
        } catch { print("error")
        }
        Crash909Player01.prepareToPlay();
        let Crash909_02 = URL(fileURLWithPath: Bundle.main.path(forResource: "DrumSoundsMP3/Crush02", ofType: "mp3")!);
        do { try Crash909Player02 = AVAudioPlayer(contentsOf: Crash909_02)
            Crash909Player02.prepareToPlay()
        } catch { print("error")
        }
        Crash909Player02.prepareToPlay();
        
        
        let DubKick_01 = URL(fileURLWithPath: Bundle.main.path(forResource: "DrumSoundsMP3/DubSmashKick01", ofType: "mp3")!);
        do { try KickDubPlayer01 = AVAudioPlayer(contentsOf: DubKick_01)
            KickDubPlayer01.prepareToPlay()
        } catch { print("error")
        }
        KickDubPlayer01.prepareToPlay();
        
        let tempBeepClick_01 = URL(fileURLWithPath: Bundle.main.path(forResource: "tempBeep01", ofType: "mp3")!);
        do { try tempBeepSound01 = AVAudioPlayer(contentsOf: tempBeepClick_01)
            tempBeepSound01.prepareToPlay()
        } catch { print("error")
        }
        tempBeepSound01.prepareToPlay();
        let tempBeepClick_02 = URL(fileURLWithPath: Bundle.main.path(forResource: "tempoBeep02", ofType: "mp3")!);
        do { try tempBeepSound02 = AVAudioPlayer(contentsOf: tempBeepClick_02)
            tempBeepSound02.prepareToPlay()
        } catch { print("error")
        }
        tempBeepSound02.prepareToPlay();

        
        
        
        
        
        
        //NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.beatRepeat(_:)), userInfo: nil, repeats: true);
        
        super.viewDidLoad()
        
        
        getPalameterTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.palamTimer(_:)), userInfo: nil, repeats: true);
        
        tempoMakerGetBPM = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.GetBPM(_:)), userInfo: nil, repeats: true);
        
        
        
        
        
        
        
        if userDefaults.object(forKey: "BPMValue") != nil {
            BPMCounter = userDefaults.object(forKey: "BPMValue") as! Double;
        }
        if userDefaults.object(forKey: "tempoHantei") != nil {
            tempoMakerHantei = userDefaults.object(forKey: "tempoHantei") as! Bool;
        }
        
        
        if tempoMakerHantei  == true {
            
            tempoMakerTimer = Timer.scheduledTimer(timeInterval: BPMCounter, target: self, selector: #selector(self.MetroNome(_:)), userInfo: nil, repeats: true);
            tempoMakerHantei  = true;
            
            userDefaults.set(tempoMakerHantei, forKey: "tempoHantei");
            userDefaults.synchronize();
            
        }
        
        
        samplerPatch = PDPatch(file: "Sampler.pd");
        samplerPatch?.samplerTrack1Load();
        samplerPatch?.samplerBPMValue(100);
        samplerPatch?.samplerVol1Value(60);
        
        
        print(BPMCounter);
        print(tempoMakerHantei);

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
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated);
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate;
        appDelegate.bpmValue = Int(BPMCounter);
        appDelegate.rhythmHantei = tempoMakerHantei;
    }
    
    /*
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidDisappear(animated);
        
        BPMCounter = Double(appDelegate.bpmValue);
        tempoMakerHantei = appDelegate.rhythmHantei;
        
    }
     */
    
}
