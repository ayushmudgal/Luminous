//
//  SecondViewController.m
//  Luminous
//
//  Created by Aditya Challa on 4/22/14.
//  Copyright (c) 2014 BerkeleyBoys. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController


- (void)viewDidLoad

{
    [super viewDidLoad];
    [self colorChanger];
    
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)colorChanger{
      [[self view] setBackgroundColor:[UIColor whiteColor]];
    
}
-(IBAction)ButtonPressed:(UIButton*)Pressed{
    if (Pressed.enabled){
        CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
        CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
        CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
        color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
        [[self view] setBackgroundColor:color];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
