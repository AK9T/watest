
#include <UIKit/UIKit.h>

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
                                                               style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                                   NSLog(@"You pressed button two");
                                                               }]; 
        
        [alert addAction:firstAction];
        [alert addAction:secondAction];
        [self presentViewController:alert animated:YES completion:nil];
    });
}


%end