//
//  SecondViewController.h
//  Luminous
//
//  Created by Aditya Challa on 4/22/14.
//  Copyright (c) 2014 BerkeleyBoys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
{
@private
    UIColor *color;
}
-(void)colorChanger;

-(IBAction)ButtonPressed:(UIButton*)Pressed;

@end
