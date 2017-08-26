//
//  ViewController.swift
//  BeatSession
//
//  Created by seito on 2016/10/05.
//  Copyright © 2016年 seito. All rights reserved.
//

import UIKit
import AVFoundation
//import RealmSwift
import CoreData
//import SlideMenuControllerSwift
/*
class ContainerViewController: SlideMenuController {
    
    override func awakeFromNib() {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "Main") {
            self.mainViewController = controller
        }
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "Left") {
            self.leftViewController = controller
        }
        super.awakeFromNib()
    }
    
}
*/


class ViewController2: UIViewController, UIViewControllerTransitioningDelegate{
    
    //他画面から戻る時
    @IBAction func DrumPads(_ segue:UIStoryboardSegue){
        print("Drum Pads")
    }
    
    

    
    
    
    //小節を配列に
    var beatTimelinePad14: [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]; //要素数16
    //何小節目か
    var beatTimelineCounter = 0;
    var rhythmTimeline      = 0;
    
    //レコード用タイマー変数
    var recordTimer:Timer!;
    var beatPlayerTimer:Timer!;
    var recordTimerHantei   = false;
    
    //メトロノーム用
    var tempoMakerTimer:Timer!;
    var tempoMakerGetBPM:Timer!;
    var tempoMakerHantei    = false;
    var BPMCounter          = 0.5;
    var tempoBlock          = 0;
    
    //違う方法
    var metronomeActive     = false;
    var metronomeLoop       = 0;
    
    
    //音声変更用
    var changerActive       = false;
    
    var changerSoundTarget  = 0;    //変更元
    var changerSoundNum     = 0;    //変更後
    
    //var BindSoundFileNum    = 0;    //現在の音声ファイル番号を格納
    
    //ボタンごとの初期サウンド、および変更後のサウンド格納場所
    
    var Pad11SoundFile      = 11;
    var Pad12SoundFile      = 12;
    var Pad13SoundFile      = 13;
    var Pad14SoundFile      = 14;
    
    
    
    
    
    
    
    //var Pad13Bind           = self.Pad13Sound();
    /*
    let changerTargetPad13 = {(nameOfSound:() -> Void -> () in
        nameOfSound();
    }
    */
    //let changerTargetSound13 = kick909Sound01;
    

    
    //AudioPlayer用変数
    var Kick909Player01     = AVAudioPlayer();
    var Kick909Player02     = AVAudioPlayer();
    
    var Snare909Player01    = AVAudioPlayer();
    var Snare909Player02    = AVAudioPlayer();
    
    var CHHat909Player01    = AVAudioPlayer();
    var CHHat909Player02    = AVAudioPlayer();
    
    var OHHat909Player01    = AVAudioPlayer();
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
    
    
    
    
    
    let PadSound14 = "Kick909Player02";

    
    
    @IBOutlet weak var Pad14Outlet: SpringButton!

    
    
    //パッドボタン周り
    @IBAction func Pad01_down(_ sender: AnyObject) {
        
    }
    @IBAction func Pad02_down(_ sender: AnyObject) {
        
    }
    @IBAction func Pad03_down(_ sender: AnyObject) {
    }
    @IBAction func Pad04_down(_ sender: AnyObject) {
    }
    @IBAction func Pad05_down(_ sender: AnyObject) {
        
    }
    @IBAction func Pad06_down(_ sender: AnyObject) {
        
    }
    @IBAction func Pad07_down(_ sender: AnyObject) {
        
    }
    @IBAction func Pad08_down(_ sender: AnyObject) {
        
    }
    @IBAction func Pad09_down(_ sender: AnyObject) {
        
    }
    @IBAction func Pad10_down(_ sender: AnyObject) {
        
    }
    @IBAction func Pad11_down(_ sender: AnyObject) {
        if changerActive == true {
            
        } else {
            SoundPlay(BindSoundFileNum: Pad11SoundFile);
        }
    }
    @IBAction func Pad12_down(_ sender: AnyObject) {
        if changerActive == true {
            
        } else {
            SoundPlay(BindSoundFileNum: Pad12SoundFile);
        }
    }
    @IBAction func Pad13_down(_ sender: AnyObject) {
        if changerActive == true {
            
        } else {
            SoundPlay(BindSoundFileNum: Pad13SoundFile);
        }
    }
    @IBAction func Pad14_down(_ sender: AnyObject) {
        
        
        if changerActive == true {
            
        } else {
            //springアニメーション
            Pad14Outlet.animation = "pop"
            Pad14Outlet.animate()
            
            SoundPlay(BindSoundFileNum: Pad14SoundFile);
        }
    }
    @IBAction func Pad15_down(_ sender: AnyObject) {
    }

    
    
    
    //音声ファイルを鳴らすところ
    func SoundPlay(BindSoundFileNum: Int){
    //音声ファイル確認
        switch BindSoundFileNum {
            
        case 0:
            Kick909Player01.currentTime = 0;
            Kick909Player01.play();
        case 1:
            Kick909Player02.currentTime = 0;
            Kick909Player02.play();
            
        case 3:
            Snare909Player01.currentTime = 0;
            Snare909Player01.play();
        case 4:
            Snare909Player02.currentTime = 0;
            Snare909Player02.play();
            
        case 5:
            Clap909Player01.currentTime = 0;
            Clap909Player01.play();
        case 6:
            Clap909Player02.currentTime = 0;
            Clap909Player02.play();
        
        case 7:
            Crash909Player01.currentTime = 0;
            Crash909Player01.play();
        case 8:
            Crash909Player02.currentTime = 0;
            Crash909Player02.play();
            
            
        case 11:
            CHHat909Player01.currentTime = 0;
            CHHat909Player01.play();
        case 12:
            CHHat909Player02.currentTime = 0;
            CHHat909Player02.play();
        case 13:
            Kick909Player01.currentTime = 0;
            Kick909Player01.play();
        case 14:
            Kick909Player02.currentTime = 0;
            Kick909Player02.play();
            

        default:
            break;
        }
    
    
    }
    
    /*
    //パッドに割り当てる音声変更メニューを表示する 
    @IBAction func DrumPadsMenu(_ sender: Any) {
        if(changerActive==false){
            changerActive = true;
        } else {
            changerActive = false;
        }
    }
     */
    
    
    
    
    
    
    
    /*
    Kick909Player02.currentTime = 0;
    Kick909Player02.play();
    if recordTimerHantei == true {
    if beatTimelinePad14[beatTimelineCounter] == 0 {
    beatTimelinePad14[beatTimelineCounter] = 1;
    } else {
    beatTimelinePad14[beatTimelineCounter] = 0;
    }
    }
    */
    
    
    
    
    
    
    //音声変更用ボタン
    /*
    @IBAction func SoundEditButton(_ sender: Any) {
        if changerActive == false {
            changerActive = true;
            //サイドオープン
            self.slideMenuController()?.openLeft()
        } else {
            changerActive = false;
            //サイドクローズ
            self.slideMenuController()?.closeLeft()
        }
    }
    */
    
    
    
    @IBAction func ChangeCrush01(_ sender: Any) {
        Crash909PSound01();
    }
    
    //????????
    func Pad13Sound(soundPlay: (Void) -> Void) {
        soundPlay();
    }
    

    func kick909Sound01() {
        Kick909Player01.currentTime = 0;
        Kick909Player01.play();
    }
    
    func Crash909PSound01() {
        Crash909Player01.currentTime = 0;
        Crash909Player01.play();
    }
    
    func PadSound14Play() {
        self.kick909Sound02();
        
    }
    func kick909Sound02() {
        Kick909Player02.currentTime = 0;
        Kick909Player02.play();
    }
    
    
    
    
    
    @IBOutlet weak var PadVolSlider: UISlider!
    
    @IBAction func PadVolSliderAction(_ sender: AnyObject) {
        Kick909Player01.volume  = PadVolSlider.value;
        Kick909Player02.volume  = PadVolSlider.value;
        Snare909Player01.volume = PadVolSlider.value;
        Snare909Player02.volume = PadVolSlider.value;
        CHHat909Player01.volume = PadVolSlider.value;
        CHHat909Player02.volume = PadVolSlider.value;
        OHHat909Player01.volume = PadVolSlider.value;
        OHHat909Player02.volume = PadVolSlider.value;
        Clap909Player01.volume  = PadVolSlider.value;
        Clap909Player02.volume  = PadVolSlider.value;
        Crash909Player01.volume = PadVolSlider.value;
        Crash909Player02.volume = PadVolSlider.value;
    }
    
    //小節カウンター
    func recordBell(_ args:Timer){
        //print(beatTimelineCounter);
        if beatTimelineCounter < 15 {
            beatTimelineCounter += 1;
        } else {
            beatTimelineCounter = 0;
        }
        //メトロノーム音
        tempBeepSound01.currentTime = 0;
        tempBeepSound01.play();
    }
    
    //配列から音を鳴らすタイミングを取得
    func beatPlayer(_ args:Timer){
        //print(beatTimelinePad14[beatTimelineCounter]);
        if beatTimelinePad14[beatTimelineCounter] == 1{
            Kick909Player02.currentTime = 0;
            Kick909Player02.play();
        }
    }
    
    
    //BPM調整箇所
    @IBOutlet weak var BPMViewer: UILabel!
    @IBOutlet weak var BPMSliderOutlet: UISlider!
    @IBAction func BPMSlider(_ sender: AnyObject) {
        let BPMValue = Int(BPMSliderOutlet.value);
        BPMViewer.text = "\(BPMValue)";
        BPMCounter = 60/Double(BPMSliderOutlet.value);
    }
//メトロノーム用
    //メトロノームボタン
    @IBAction func tempoMaker(_ sender: AnyObject) {
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

        print(BPMCounter);
        
        if(tempoBlock == 3){                //４つ打ち
            tempBeepSound01.currentTime = 0;
            tempBeepSound01.play();
            tempoBlock = 0;
        } else {
            tempBeepSound02.currentTime = 0;
            tempBeepSound02.play();
            tempoBlock += 1;
        }
        
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
    
    
    func MetronomeFunc(){
        if(metronomeActive == true){
            while(metronomeLoop==0){
                sleep(UInt32(BPMCounter));
                tempBeepSound01.currentTime = 0;
                tempBeepSound01.play();
            }
        }
    }

    


    
    
//レコード用
    //レコードスタートボタン
    /*
    @IBAction func BeatRecord(_ sender: AnyObject) {
        if recordTimerHantei == false {
            recordTimer = Timer.scheduledTimer(timeInterval: 0.225, target: self, selector: #selector(self.recordBell(_:)), userInfo: nil, repeats: true);
            beatPlayerTimer = Timer.scheduledTimer(timeInterval: 0.225, target: self, selector: #selector(self.beatPlayer(_:)), userInfo: nil, repeats: true);
            recordTimerHantei = true;
            
        }
    }
    //レコードストップボタン
    @IBAction func BeatStop(_ sender: AnyObject) {
        if recordTimerHantei == true {
            recordTimer.invalidate();
            beatPlayerTimer.invalidate();
            recordTimerHantei = false;
        }
    }
 
 
    @IBAction func BeatReset(_ sender: AnyObject) {
        beatTimelinePad14 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
    }
    */
    

    override func viewDidLoad() {
        
        
        
        
        
        
        //Drum Sounds Load Point.
        let Kick909_01 = URL(fileURLWithPath: Bundle.main.path(forResource: "DrumSoundsMP3/Kick01_edit", ofType: "mp3")!);
        do { try Kick909Player01 = AVAudioPlayer(contentsOf: Kick909_01)
            Kick909Player01.prepareToPlay()
        } catch { print("error")
        }
        Kick909Player01.prepareToPlay();
        let Kick909_02 = URL(fileURLWithPath: Bundle.main.path(forResource: "DrumSoundsMP3/Kick02", ofType: "mp3")!);
        do { try Kick909Player02 = AVAudioPlayer(contentsOf: Kick909_02)
            Kick909Player02.prepareToPlay()
        } catch { print("error")
        }
        Kick909Player02.prepareToPlay();
        
        let Snare909_01 = URL(fileURLWithPath: Bundle.main.path(forResource: "DrumSoundsMP3/Snare01", ofType: "mp3")!);
        do { try Snare909Player01 = AVAudioPlayer(contentsOf: Snare909_01)
            Snare909Player01.prepareToPlay()
        } catch { print("error")
        }
        Snare909Player01.prepareToPlay();
        let Snare909_02 = URL(fileURLWithPath: Bundle.main.path(forResource: "DrumSoundsMP3/Snare02", ofType: "mp3")!);
        do { try Snare909Player02 = AVAudioPlayer(contentsOf: Snare909_02)
            Snare909Player02.prepareToPlay()
        } catch { print("error")
        }
        Snare909Player02.prepareToPlay();
        
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
        OHHat909Player01.prepareToPlay();
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
  
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //画面の向き
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        
        let orientation: UIInterfaceOrientationMask = UIInterfaceOrientationMask.landscapeLeft;
        
        return orientation;
        
    }
    override var shouldAutorotate : Bool {
        return true;
    }
    

}





