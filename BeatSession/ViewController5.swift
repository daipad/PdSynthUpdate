//
//  ViewController.swift
//  BeatSession
//
//  Created by seito on 2016/10/05.
//  Copyright © 2016年 seito. All rights reserved.
//

import UIKit

class ViewController5: UIViewController {
    
    //他画面から戻る時
    @IBAction func SynthMenu(_ segue:UIStoryboardSegue){
        print("SynthMenu")
    }
    
    
    //メトロノーム用
    var tempoMakerTimer:Timer!;
    var tempoMakerGetBPM:Timer!;
    var tempoMakerHantei    = false;
    var BPMCounter          = 0.5;
    var tempoBlock          = 0;
    
    var tempBeepSound01     = AVAudioPlayer();
    var tempBeepSound02     = AVAudioPlayer(); //add
    
    
    var patch:PDPatch?;
    var sinwave:PDPatch?;
    var phasorwave:PDPatch?;
    var squarewave:PDPatch?;
    var trianglewave:PDPatch?;
    
    
    var fmwave:PDPatch?;
    
    var octaveDefault = 3;
    
    var getPalameterTimer:Timer!;
    var togglesound = false;
    var soundPitch = 48;
    var waveType = 0;
    
    /*
    @IBAction func PlaySound(_ sender: Any) {
        switch waveType {
            case 0:
                sinwave?.playSoundOsc();
            case 1:
                
                phasorwave?.playSoundPhasor();
            case 2:
                
                squarewave?.playSoundSquare();
            case 3:
                
                trianglewave?.playSoundTriangle();
            default:
                break;
        }
    }
    */
    
    
    @IBOutlet weak var octaveOutlet: UILabel!
   
    @IBAction func OctaveDown(_ sender: Any) {
        if(octaveDefault==1){
            octaveDefault = 1;
            octaveOutlet.text = "\(octaveDefault + 1)";
        } else {
            octaveDefault -= 1;
            octaveOutlet.text = "\(octaveDefault + 1)";
        }
    }
    
    
    @IBAction func OctaveUp(_ sender: Any) {
        if(octaveDefault==7){
            octaveDefault = 7;
            octaveOutlet.text = "\(octaveDefault + 1)";
        } else {
            octaveDefault += 1;
            octaveOutlet.text = "\(octaveDefault + 1)";
        }
        
    }
    
    
    
    
    //鍵盤の箇所
    @IBAction func keyboardC(_ sender: Any) {
        soundPitch = 0 + 12 * octaveDefault;
        playSynthSound();
    }
    @IBAction func keyboardCSharp(_ sender: Any) {
        soundPitch = 1 + 12 * octaveDefault;
        playSynthSound();
    }
    @IBAction func keyboardD(_ sender: Any) {
        soundPitch = 2 + 12 * octaveDefault;
        playSynthSound();
    }
    @IBAction func keyboardDSharp(_ sender: Any) {
        soundPitch = 3 + 12 * octaveDefault;
        playSynthSound();
    }
    @IBAction func keyboardE(_ sender: Any) {
        soundPitch = 4 + 12 * octaveDefault;
        playSynthSound();
    }
    @IBAction func keyboardF(_ sender: Any) {
        soundPitch = 5 + 12 * octaveDefault;
        playSynthSound();
    }
    @IBAction func keyboardFSharp(_ sender: Any) {
        soundPitch = 6 + 12 * octaveDefault;
        playSynthSound();
    }
    @IBAction func keyboardG(_ sender: Any) {
        soundPitch = 7 + 12 * octaveDefault;
        playSynthSound();
    }
    @IBAction func keyboardGSharp(_ sender: Any) {
        soundPitch = 8 + 12 * octaveDefault;
        playSynthSound();
    }
    @IBAction func keyboardA(_ sender: Any) {
        soundPitch = 9 + 12 * octaveDefault;
        playSynthSound();
    }
    @IBAction func keyboardASharp(_ sender: Any) {
        soundPitch = 10 + 12 * octaveDefault;
        playSynthSound();
    }
    @IBAction func keyboardB(_ sender: Any) {
        soundPitch = 11 + 12 * octaveDefault;
        playSynthSound();
    }
    
    
    @IBAction func keyboardC2(_ sender: Any) {
        soundPitch = 12 + 12 * octaveDefault;
        playSynthSound();
    }
    @IBAction func keyboardCSharp2(_ sender: Any) {
        soundPitch = 13 + 12 * octaveDefault;
        playSynthSound();
    }
    @IBAction func keyboardD2(_ sender: Any) {
        soundPitch = 14 + 12 * octaveDefault;
        playSynthSound();
    }
    @IBAction func keyboardDSharp2(_ sender: Any) {
        soundPitch = 15 + 12 * octaveDefault;
        playSynthSound();
    }
    @IBAction func keyboardE2(_ sender: Any) {
        soundPitch = 16 + 12 * octaveDefault;
        playSynthSound();
    }
    @IBAction func keyboardF2(_ sender: Any) {
        soundPitch = 17 + 12 * octaveDefault;
        playSynthSound();
    }
    @IBAction func keyboardFSharp2(_ sender: Any) {
        soundPitch = 18 + 12 * octaveDefault;
        playSynthSound();
    }
    @IBAction func keyboardG2(_ sender: Any) {
        soundPitch = 19 + 12 * octaveDefault;
        playSynthSound();
    }
    @IBAction func keyboardGSharp2(_ sender: Any) {
        soundPitch = 20 + 12 * octaveDefault;
        playSynthSound();
    }
    @IBAction func keyboardA2(_ sender: Any) {
        soundPitch = 21 + 12 * octaveDefault;
        playSynthSound();
    }
    @IBAction func keyboardASharp2(_ sender: Any) {
        soundPitch = 22 + 12 * octaveDefault;
        playSynthSound();
    }
    @IBAction func keyboardB2(_ sender: Any) {
        soundPitch = 23 + 12 * octaveDefault;
        playSynthSound();
    }
    
    
    
    
    
    
    
    
    
    
    
    
    func playSynthSound() {
    
        switch waveType {
            
        case 0:
            sinwave?.synthPitchOsc(Int32(soundPitch));
            sinwave?.playSoundOsc();
        case 1:
            phasorwave?.synthPitchPhasor(Int32(soundPitch));
            phasorwave?.playSoundPhasor();
        case 2:
            squarewave?.synthPitchSquare(Int32(soundPitch));
            squarewave?.playSoundSquare();
        case 3:
            trianglewave?.synthPitchTriangle(Int32(soundPitch));
            trianglewave?.playSoundTriangle();
        case 4:
            fmwave?.synthPitchFm(Int32(soundPitch));
            fmwave?.playSoundFm();
        default:
            break;
        }
    
    }
    
    //C3 Pitch 48
    //C4 Pitch 60
    //libpd.scodeproj/pure_data/src/d_osc.c
    
    /*
    @IBAction func SoundSwitch(_ sender: Any) {
        let onOffSwitch = sender as! UISwitch;
        patch?.onOff(onOffSwitch.isOn);
    }
    */
    
    @IBOutlet weak var attackSlider: UISlider!
    @IBOutlet weak var decaySlider: UISlider!
    @IBOutlet weak var sustainSlider: UISlider!
    @IBOutlet weak var releaseSlider: UISlider!
    @IBOutlet weak var sliderDuration: UISlider!
    @IBOutlet weak var sliderModFreq: UISlider!
    @IBOutlet weak var sliderModIndex: UISlider!
    //Velocity用スライダー
    @IBOutlet weak var sliderValocity: UISlider!
    @IBAction func sliderVelocityAction(_ sender: Any) {
    }
    
    func palamTimer(_ args:Timer){
  
        //sinwave?.synthPitchOsc(Int32(soundPitch));              //ピッチ読み取り
        sinwave?.synthVelocity(Int32(sliderValocity.value));    //ヴェロシティ読み取り
        sinwave?.synthDuration(Int32(sliderDuration.value));    //デュレイション読み取り
        sinwave?.synthAttack(Int32(attackSlider.value));
        sinwave?.synthDecay(Int32(decaySlider.value));
        sinwave?.synthSustain(Int32(sustainSlider.value));
        sinwave?.synthRelease(Int32(releaseSlider.value));
        
        //phasorwave?.synthPitchPhasor(Int32(soundPitch));
        phasorwave?.synthVelocity(Int32(sliderValocity.value));    //ヴェロシティ読み取り
        phasorwave?.synthDuration(Int32(sliderDuration.value));    //デュレイション読み取り
        phasorwave?.synthAttack(Int32(attackSlider.value));
        phasorwave?.synthDecay(Int32(decaySlider.value));
        phasorwave?.synthSustain(Int32(sustainSlider.value));
        phasorwave?.synthRelease(Int32(releaseSlider.value));
                
        //fmwave?.synthPitchFm(Int32(soundPitch));
        fmwave?.synthVelocity(Int32(sliderValocity.value));    //ヴェロシティ読み取り
        fmwave?.synthDuration(Int32(sliderDuration.value));    //デュレイション読み取り
        fmwave?.synthAttack(Int32(attackSlider.value));
        fmwave?.synthDecay(Int32(decaySlider.value));
        fmwave?.synthSustain(Int32(sustainSlider.value));
        fmwave?.synthRelease(Int32(releaseSlider.value));
        
        fmwave?.synthFmModFreq(Int32(sliderModFreq.value));
        fmwave?.synthFmModIndex(Int32(sliderModIndex.value));
        
        
        //squarewave?.synthPitchSquare(Int32(soundPitch));
        squarewave?.synthVelocity(Int32(sliderValocity.value));    //ヴェロシティ読み取り
        squarewave?.synthDuration(Int32(sliderDuration.value));    //デュレイション読み取り
        squarewave?.synthAttack(Int32(attackSlider.value));
        squarewave?.synthDecay(Int32(decaySlider.value));
        squarewave?.synthSustain(Int32(sustainSlider.value));
        squarewave?.synthRelease(Int32(releaseSlider.value));
        
        
        //trianglewave?.synthPitchTriangle(Int32(soundPitch));
        trianglewave?.synthVelocity(Int32(sliderValocity.value));    //ヴェロシティ読み取り
        trianglewave?.synthDuration(Int32(sliderDuration.value));    //デュレイション読み取り
        trianglewave?.synthAttack(Int32(attackSlider.value));
        trianglewave?.synthDecay(Int32(decaySlider.value));
        trianglewave?.synthSustain(Int32(sustainSlider.value));
        trianglewave?.synthRelease(Int32(releaseSlider.value));
    
    }

    
    @IBOutlet weak var BPMText: UILabel!
    
    @IBOutlet weak var BPMSliderOutlet: UISlider!
    @IBAction func BPMSliderAction(_ sender: Any) {
        let BPMValue = Int(BPMSliderOutlet.value);
        BPMText.text = "\(BPMValue)";
        BPMCounter = 60/Double(BPMSliderOutlet.value);
    }
    
    
    //メトロノームボタン
    @IBAction func MetronomeActivator(_ sender: Any) {
        if tempoMakerHantei == false {
            
            tempBeepSound01.currentTime = 0; //初めの一回
            tempBeepSound01.play();
            
            //metronomeActive = true;
            //MetronomeFunc();
            tempoMakerGetBPM = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.GetBPM(_:)), userInfo: nil, repeats: true);
            
            tempoMakerTimer = Timer.scheduledTimer(timeInterval: BPMCounter, target: self, selector: #selector(self.MetroNome(_:)), userInfo: nil, repeats: true);
            tempoMakerHantei = true;
            
        } else {
            //metronomeActive = false;
            tempoMakerGetBPM.invalidate();
            
            tempoMakerTimer.invalidate();
            tempoMakerHantei = false;
            tempoBlock = 0;
            
        }
    }
    
    //メトロノーム起動時の処理
    func MetroNome(_ args:Timer){
        //tempoMakerTimer.timeInterval = BPMCounter;
        
        //print(BPMCounter);
        tempBeepSound02.currentTime = 0;
        tempBeepSound02.play();
        
        /*
        if(tempoBlock == 3){                //４つ打ち
            tempBeepSound01.currentTime = 0;
            tempBeepSound01.play();
            tempoBlock = 0;
        } else {
            tempBeepSound02.currentTime = 0;
            tempBeepSound02.play();
            tempoBlock += 1;
        }
        */
 
        if(tempoMakerTimer.timeInterval != BPMCounter){
            BPMCounter = 60/Double(BPMSliderOutlet.value);
            tempoMakerTimer.invalidate();
            tempoMakerTimer = Timer.scheduledTimer(timeInterval: BPMCounter, target: self, selector: #selector(self.MetroNome(_:)), userInfo: nil, repeats: true);
        }
    }
    
    //BPMからタイマーの間隔を取得
    func GetBPM(_ args:Timer){
        BPMCounter = 60/Double(BPMSliderOutlet.value);
    }
    

    
    
    @IBAction func synthWaveSegment(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            waveType = 0;
        case 1:
            waveType = 1;
        case 2:
            waveType = 2;
        case 3:
            waveType = 3;
        case 4:
            waveType = 4;
        default:
            waveType = 0;
        }
        
    }
    
    
 
    
    
    
    
    override func viewDidLoad() {
        
        //NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.beatRepeat(_:)), userInfo: nil, repeats: true);
        
        super.viewDidLoad()
        
        
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
        
        
        getPalameterTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.palamTimer(_:)), userInfo: nil, repeats: true);
        
        
        patch = PDPatch(file: "pd_prac.pd");
        
        sinwave = PDPatch(file: "synthOsc.pd");
        phasorwave = PDPatch(file: "synthPhasor.pd");
        squarewave = PDPatch(file: "synthSquare.pd");
        trianglewave = PDPatch(file: "synthTriangle.pd");
        
        
        fmwave = PDPatch(file: "synthOscFm.pd");
        
        
        sinwave?.synthPitchOsc(64);
        phasorwave?.synthPitchPhasor(64);
        
        squarewave?.synthPitchSquare(64);
        trianglewave?.synthPitchSquare(64);
        
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
