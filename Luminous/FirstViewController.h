//
//  FirstViewController.h
//  Luminous
//
//  Created by Aditya Challa on 4/22/14.
//  Copyright (c) 2014 BerkeleyBoys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "SecondViewController.h"

@interface FirstViewController : UIViewController
{
@private
    UIImageView* _backgroundimage;
    AVAudioPlayer *audioPlayer;
    SecondViewController *view2;// =[[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
}

-(IBAction)MusicButtonPressed:(UIButton*)Pressed;
-(void) BackgroundImage;
-(void)levelTimerCallback:(NSTimer *)timer;
@end
