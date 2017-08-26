//
//  PDPatch.h
//  BeatSession
//
//  Created by seito on 2016/12/08.
//  Copyright © 2016年 seito. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PdDispatcher.h"

@interface PDPatch : NSObject



-(void)onOff:(BOOL)yesNo;

//sinSynth
-(void)waveonOff:(BOOL)yesNo;

-(void)playSoundOsc;
-(void)playSoundPhasor;
-(void)playSoundSquare;
-(void)playSoundTriangle;
-(void)playSoundFm;




-(void)synthPitchOsc:(int)pitchOscValue;
-(void)synthPitchPhasor:(int)pitchPhasorValue;
-(void)synthPitchSquare:(int)pitchSquareValue;
-(void)synthPitchTriangle:(int)pitchTriangleValue;

-(void)synthPitchFm:(int)pitchFmValue;
-(void)synthFmModFreq:(int)fmModFreqValue;
-(void)synthFmModIndex:(int)fmModIndexValue;




-(void)samplerActive;
-(void)samplerBPMValue:(int)TempoValue;
-(void)samplerVol1Value:(int)Volume1Value;

-(void)samplerMetroVol:(int)metroValue;

-(void)samplerTrack1Load;

-(void)pad1_1_on;-(void)pad1_2;-(void)pad1_3;-(void)pad1_4;
-(void)pad1_5_on;-(void)pad1_6;-(void)pad1_7;-(void)pad1_8;
-(void)pad1_9_on;-(void)pad1_10;-(void)pad1_11;-(void)pad1_12;
-(void)pad1_13_on;-(void)pad1_14;-(void)pad1_15;-(void)pad1_16;

//+ (int)sendMessage:(NSString *)message withArguments:(NSArray *)list toReceiver:(NSString *)receiverName;  // list may be nil



-(void)synthVelocity:(int)velocityValue;
-(void)synthDuration:(int)durationValue;

-(void)synthAttack:(int)attackValue;
-(void)synthDecay:(int)decayValue;
-(void)synthSustain:(int)sustainValue;
-(void)synthRelease:(int)releaseValue;

//-(void)synthWaveType:(int)waveType;

-(instancetype)initWithFile:(NSString *)pdFile;


@end
