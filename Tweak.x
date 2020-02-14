#include <UIKit/UIKit.h>
#define kBundlePath @"/Library/MobileSubstrate/DynamicLibraries/com.akshu.khamankar.bundle"

@interface WAChatViewController : UIViewController {}
- (void)callButtonTapped:(id)arg1; 
- (void)showGoku;
@end

%hook WAChatViewController

UIImageView *dbzImg;

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
                                                                  [self showGoku];
                                                               }]; 
        
        [alert addAction:secondAction];
        [alert addAction:firstAction];

        [self presentViewController:alert animated:YES completion:nil];
    });    
}

- (void)showGoku {
    
}



%end