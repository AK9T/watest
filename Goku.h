//
//  Goku.h
//  alertView
//
//  Created by Akshay Khamankar on 14/02/20.
//  Copyright © 2020 Akshay Khamankar. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Goku : NSObject {

}

- (void)showGokuWithView:(UIView*)view;
- (void) configureSwitch:(UIView *)someView;
-(void)switchAction:(UISwitch*)buttonName;
-(void)configSwitchy;
- (void)switchyTapped:(UITapGestureRecognizer*)sender;


@end
