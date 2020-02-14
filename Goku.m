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

- (void)showGokuWithView:(UIView*)view{
    __block UIImageView *dbzImg = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,180,180)];
;
    [UIView animateWithDuration: 0.8 animations:^{
        dbzImg.image = [UIImage imageNamed:@"goku.png"];
        dbzImg.center = view.center;
        dbzImg.contentMode = UIViewContentModeScaleAspectFit;
        [view addSubview:dbzImg];
    } completion:^(BOOL finished) {
        if (finished ==  true) {
            NSLog(@"done");
            double delayInSeconds = 0.5;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [UIView animateWithDuration:0.6 animations:^{
                    dbzImg.alpha = 0.0;
                }];
            });
        }
    }];
}

@end
