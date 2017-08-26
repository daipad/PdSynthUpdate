//
//  PDPatch.m
//  BeatSession
//
//  Created by seito on 2016/12/08.
//  Copyright © 2016年 seito. All rights reserved.
//

#import "PDPatch.h"

@implementation PDPatch

-(void)onOff:(BOOL)yesNo{
    
    float yn = (float)yesNo;
    [PdBase sendFloat:yn toReceiver:@"onOff"];

}

-(void)waveonOff:(BOOL)yesNo{
    
    float yn = (float)yesNo;
    [PdBase sendFloat:yn toReceiver:@"waveonOff"];
    
}


-(void)playSoundOsc{
    
    [PdBase sendBangToReceiver:@"playSynthOsc"];

}

-(void)playSoundPhasor{
    
    [PdBase sendBangToReceiver:@"playSynthPhasor"];
    
}

-(void)playSoundSquare{

    [PdBase sendBangToReceiver:@"playSynthSquare"];
    
}

-(void)playSoundTriangle{
    
    [PdBase sendBangToReceiver:@"playSynthTriangle"];
    
}

-(void)playSoundFm{

    [PdBase sendBangToReceiver:@"playSynthFmOsc"];
}




//サンプラー関連
-(void)samplerActive{

    [PdBase sendBangToReceiver:@"samplerSwitch"];
    
}

-(void)samplerBPMValue:(int)TempoValue{
    
    float value = (int)TempoValue;
    [PdBase sendFloat:value toReceiver:@"samplerBPM"];
    
}

-(void)samplerVol1Value:(int)Volume1Value{
    
    float value = (int)Volume1Value;
    [PdBase sendFloat:value toReceiver:@"samplerVol1"];
    
}
-(void)samplerMetroVol:(int)metroValue{
    
    float value = (int)metroValue;
    [PdBase sendFloat:value toReceiver:@"MetroSoundVolume"];

}




-(void)samplerTrack1Load{
    
    [PdBase sendBangToReceiver:@"track1SoundBang"];

}


-(void)pad1_1_on{
    
    [PdBase sendBangToReceiver:@"pad1_1"];
    
}

-(void)pad1_2{
    
    [PdBase sendBangToReceiver:@"pad1_2"];
    
}

-(void)pad1_3{
    
    [PdBase sendBangToReceiver:@"pad1_3"];
    
}

-(void)pad1_4{
    
    [PdBase sendBangToReceiver:@"pad1_4"];
    
}

-(void)pad1_5_on{
    
    [PdBase sendBangToReceiver:@"pad1_5"];
    
}

-(void)pad1_6{
    
    [PdBase sendBangToReceiver:@"pad1_6"];
    
}

-(void)pad1_7{
    
    [PdBase sendBangToReceiver:@"pad1_7"];
    
}

-(void)pad1_8{
    [PdBase sendBangToReceiver:@"pad1_8"];
}
-(void)pad1_9_on{
    [PdBase sendBangToReceiver:@"pad1_9"];
}
-(void)pad1_10{
    [PdBase sendBangToReceiver:@"pad1_10"];
}
-(void)pad1_11{
    [PdBase sendBangToReceiver:@"pad1_11"];
}
-(void)pad1_12{
    [PdBase sendBangToReceiver:@"pad1_12"];
}
-(void)pad1_13_on{
    [PdBase sendBangToReceiver:@"pad1_13"];
}
-(void)pad1_14{
    [PdBase sendBangToReceiver:@"pad1_14"];
}
-(void)pad1_15{
    [PdBase sendBangToReceiver:@"pad1_15"];
}
-(void)pad1_16{
    [PdBase sendBangToReceiver:@"pad1_16"];
}






-(void)synthPitchOsc:(int)pitchOscValue{
    
    float Oscvalue = (int)pitchOscValue;
    [PdBase sendFloat:Oscvalue toReceiver:@"synthPitchOsc"];
    
}

-(void)synthPitchPhasor:(int)pitchPhasorValue{

    float Phasorvalue = (int)pitchPhasorValue;
    [PdBase sendFloat:Phasorvalue toReceiver:@"synthPitchPhasor"];
    
}

-(void)synthPitchSquare:(int)pitchSquareValue{

    float Squarevalue = (int)pitchSquareValue;
    [PdBase sendFloat:Squarevalue toReceiver:@"synthPitchSquare"];

}

-(void)synthPitchTriangle:(int)pitchTriangleValue{
    
    float Trianglevalue = (int)pitchTriangleValue;
    [PdBase sendFloat:Trianglevalue toReceiver:@"synthPitchTriangle"];
    
}

-(void)synthPitchFm:(int)pitchFmValue{

    float fmValue = (int)pitchFmValue;
    [PdBase sendFloat:fmValue toReceiver:@"synthPitchFmOsc"];
    
}

-(void)synthFmModFreq:(int)fmModFreqValue{

    float modValue = (int)fmModFreqValue;
    [PdBase sendFloat:modValue toReceiver:@"fmModFreq"];

}

-(void)synthFmModIndex:(int)fmModIndexValue{

    float indexValue = (int)fmModIndexValue;
    [PdBase sendFloat:indexValue toReceiver:@"fmModIndex"];

}




-(void)synthVelocity:(int)velocityValue{
    
    float value = (int)velocityValue;
    [PdBase sendFloat:value toReceiver:@"synthVelocity"];

}

-(void)synthDuration:(int)durationValue{
    
    float value = (int)durationValue;
    [PdBase sendFloat:value toReceiver:@"synthDuration"];
    
}

-(void)synthAttack:(int)attackValue{
    
    float value = (int)attackValue;
    [PdBase sendFloat:value toReceiver:@"synthAttack"];
    
}

-(void)synthDecay:(int)decayValue{
    
    float value = (int)decayValue;
    [PdBase sendFloat:value toReceiver:@"synthDecay"];
    
}

-(void)synthSustain:(int)sustainValue{
    
    float value = (int)sustainValue;
    [PdBase sendFloat:value toReceiver:@"synthSustain"];
    
}

-(void)synthRelease:(int)releaseValue{
    
    float value = (int)releaseValue;
    [PdBase sendFloat:value toReceiver:@"synthRelease"];
    
}

/*
-(void)synthWaveType:(int)waveType{
    float synthWave = (int)waveType;
    if (synthWave == 0){
        printf("%f", synthWave);
        [PdBase sendSymbol:@"osc~" toReceiver:@"waveType"];
    } else {
        printf("%f", synthWave);
        [PdBase sendSymbol:@"phasor~" toReceiver:@"waveType"];
    }
}
 */


-(instancetype)initWithFile:(NSString *)pdFile{
    void *patch;
    self = [super init];
    if (self){
        //Init code
        patch = [PdBase openFile:pdFile path:[[NSBundle mainBundle]resourcePath]];
        if (!patch) {
            printf("PDPatch not found.");
        }
    }
    return self;
}

@end
