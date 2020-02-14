
#include <UIKit/UIKit.h>
#import "Goku.h"
#import "Goku.m"
#import <objc/runtime.h>


@interface WAChatViewController : UIViewController {}
- (void)callButtonTapped:(id)arg1; 
- (void)showGokuWithView:(UIView*)view;
@end


%hook WAChatViewController


- (void)callButtonTapped:(id)arg1 {
           dispatch_async(dispatch_get_main_queue(), ^(void){
         UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Prompt"
                                                                          message:@"Hello Akshay, are you sure you want to call this person?"
                                                                   preferredStyle:UIAlertControllerStyleAlert]; // 1
        UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"Yes"
                                                              style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                                 return %orig();
                                                              }]; 
        UIAlertAction *secondAction = [UIAlertAction actionWithTitle:@"No"
                                                               style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
                                                               
                                                                
                                                                  [self showGokuWithView: self.view];

                                                                   }];
        
        [alert addAction:secondAction];
        [alert addAction:firstAction];

        [self presentViewController:alert animated:YES completion:nil];
    });    
}


%end
