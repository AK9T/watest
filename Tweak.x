
#include <UIKit/UIKit.h>
#import "Goku.h"



@interface WAChatViewController : UIViewController {}
- (void)callButtonTapped:(id)arg1; 
  
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
                                                               
                                                                  NSLog(@"You pressed button two");
                                                                    _videoCallButton.hidden = true;
                                                                     Goku *g = [[Goku alloc] init];
                                                                      [g showGokuWithView: self.view];
                                                         

                                                                   }];
        
        [alert addAction:secondAction];
        [alert addAction:firstAction];

        [self presentViewController:alert animated:YES completion:nil];
    });    
}


%hook WAConversationHeaderView
- (void)setCallButtonHidden:(bool)arg1 {
  arg1 = 1;
  %orig;
}


%end
