//
//  Goku.m
//  alertView
//
//  Created by Akshay Khamankar on 14/02/20.
//  Copyright © 2020 Akshay Khamankar. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Goku.h"

@implementation Goku
UISwitch *customSwitch;
UIView *cloneView;

- (void)showGokuWithView:(UIView*)view{
     UIView *redRectangle = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 200, 200)];
    [redRectangle setBackgroundColor: [UIColor clearColor ]];
    
    redRectangle.backgroundColor = UIColor.blackColor;
    redRectangle.alpha = 0.0;
    [view addSubview:redRectangle];
    redRectangle.translatesAutoresizingMaskIntoConstraints = false;
    
    [view addConstraint:[NSLayoutConstraint constraintWithItem:redRectangle
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:view
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0
                                                      constant:0.0]];
    
    [view addConstraint:[NSLayoutConstraint constraintWithItem:redRectangle
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:view
                                                     attribute:NSLayoutAttributeLeading
                                                    multiplier:1.0
                                                      constant:0.0]];
    
    [view addConstraint:[NSLayoutConstraint constraintWithItem:redRectangle
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:view
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0
                                                      constant:0.0]];
    
    [view addConstraint:[NSLayoutConstraint constraintWithItem:redRectangle
                                                     attribute:NSLayoutAttributeTrailing
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:view
                                                     attribute:NSLayoutAttributeTrailing
                                                    multiplier:1.0
                                                      constant:0.0]];
  

    __block UIImageView *dbzImg = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,50,50)];
;
    [UIView animateWithDuration: 0.8 animations:^{
//        dbzImg.image = [UIImage imageNamed:@"goku.png"];
        redRectangle.alpha = 0.75;
        
        NSBundle *bundle = [[NSBundle alloc] initWithPath:@"/Library/MobileSubstrate/DynamicLibraries/com.akshu.khamankar.bundle"];
                int someNum = arc4random_uniform(6);

           switch (someNum) {
            case 0:
                  dbzImg = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[bundle pathForResource:@"goku" ofType:@"png"]]];
                break;
            case 1:
               
                  dbzImg = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[bundle pathForResource:@"snoopy0" ofType:@"png"]]];
                break;
            case 2:
             
                  dbzImg = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[bundle pathForResource:@"snoopy1" ofType:@"png"]]];
                break;
            case 3:
          
                  dbzImg = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[bundle pathForResource:@"snoopy2" ofType:@"png"]]];
                break;
            case 4:
          
                  dbzImg = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[bundle pathForResource:@"snoopy3" ofType:@"png"]]];
                break;
            case 5:
            
                  dbzImg = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[bundle pathForResource:@"snoopy4" ofType:@"png"]]];
                break;
            default:
                break;
        }
       
        dbzImg.center = view.center;
        [view addSubview:dbzImg];
    } completion:^(BOOL finished) {
        if (finished ==  true) {
            NSLog(@"done");
            double delayInSeconds = 0.5;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [UIView animateWithDuration:0.6 animations:^{
                    dbzImg.alpha = 0.0;
                         [UIView animateWithDuration:0.6 animations:^{
                        redRectangle.alpha = 0.0;
                    } completion:^(BOOL finished) {
                        if (finished == true) {
                            redRectangle.hidden = true;
                        }
                    }];
                }];
            });
        }
    }];
}

- (void) configureSwitch:(UIView *)someView {
    static dispatch_once_t once;
    dispatch_once(&once, ^ {
        cloneView = someView;
        customSwitch = [[UISwitch alloc] initWithFrame: CGRectMake(0, 0, 200, 200)];
        [someView addSubview:customSwitch];
        customSwitch.center = someView.center;
        UITapGestureRecognizer *letterTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(switchyTapped:)];
        [letterTapRecognizer setNumberOfTapsRequired:3];
        [someView addGestureRecognizer:letterTapRecognizer];        
        customSwitch.hidden = false;
    });
}


-(void)switchAction:(UISwitch*)buttonName {
    buttonName.hidden = !buttonName.hidden;
        if (buttonName.hidden == true) {
            buttonName.hidden = true;
        } else {
            buttonName.hidden = false;
        }
}

- (void)switchyTapped:(UITapGestureRecognizer*)sender{
    NSLog(@"Fucking tapped!");
    [self configSwitchy];
}

-(void) configSwitchy {
    [self switchAction: customSwitch];
}



@end
