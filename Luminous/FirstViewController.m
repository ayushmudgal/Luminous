//
//  FirstViewController.m
//  Luminous
//
//  Created by Aditya Challa on 4/22/14.
//  Copyright (c) 2014 BerkeleyBoys. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()



@end

@implementation FirstViewController
-(void) setTorchOn:(BOOL) isOn
{
    AVCaptureDevice* device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    [device lockForConfiguration:nil];
    [device setTorchMode : isOn ? AVCaptureTorchModeOn : AVCaptureTorchModeOff];
    [device unlockForConfiguration];
}
-(IBAction) changedState:(id)sender{
    UISwitch *switchValue = (UISwitch*)sender;
    bool on = [switchValue isOn];
    NSLog(@"on? %d", (int)on);
    [self setTorchOn : [switchValue isOn]];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self BackgroundImage];
}

-(void) BackgroundImage{
    //_backgroundimage.image = [UIImage imageNamed:@"Sun.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Sun.jpg"]];

    
}

- (IBAction)playSound {
    
    NSString *audioFilePath = [[NSBundle mainBundle] pathForResource:@"Beep" ofType:@"mp3"];
    NSURL *audioFileURL = [NSURL fileURLWithPath:audioFilePath];
    NSError *error = nil;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioFileURL error:&error];
    audioPlayer.meteringEnabled = YES;
    //[audioPlayer setDelegate:self];
    [audioPlayer prepareToPlay];
    [audioPlayer play];
    if (audioPlayer == nil)
        NSLog(@"Error playing sound. %@", [error description]);
    else
        [audioPlayer play];
    
    NSTimer *levelTimer = [NSTimer scheduledTimerWithTimeInterval: 3 target: self selector: @selector(levelTimerCallback:) userInfo: nil repeats: YES];
    while (audioPlayer.playing) {
        [self levelTimerCallback:levelTimer];
    }
    [levelTimer invalidate];
  //  NSLog(@"hi");
}

-(IBAction)MusicButtonPressed:(UIButton*)Pressed{
    if (Pressed.enabled){
        [self playSound];
    }
}


- (void)levelTimerCallback:(NSTimer *)timer {
    
    //view2 =[[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    float compare1 = [audioPlayer peakPowerForChannel:0];
    [audioPlayer updateMeters];
   //NSLog(@"Peak left: %f Avg right: %f", [ audioPlayer peakPowerForChannel:0],[audioPlayer averagePowerForChannel:0]);
    float compare = [audioPlayer peakPowerForChannel:0];
    if (fabsf(compare1 - compare) > 0.5){
        NSLog(@"Change");
       // CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
        //CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
        //CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
         //UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
        //[[view2 view] setBackgroundColor:color];

        
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
