
#define PLIST_PATH @"/var/mobile/Library/Preferences/Root.plist"
inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}
#include <UIKit/UIKit.h>
#import "Goku.h"

@interface WAChatViewController : UIViewController{}
- (void)callButtonTapped:(id)arg1; 
- (void)viewDidLoad;

@end

%hook WAChatViewController
Goku *g;


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
                                                                  
                                                                     g = [[Goku alloc] init];
                                                                      [g showGokuWithView: self.view];

                                                         

                                                                   }];
        
        [alert addAction:secondAction];
        [alert addAction:firstAction];

        [self presentViewController:alert animated:YES completion:nil];
    });    

}

- (void)viewDidLoad {

     g = [[Goku alloc] init];
      [g configureSwitch:self.view];
      %orig;
}


%end


%hook WAConversationHeaderView

-(void)setCallButtonHidden:(bool)arg1 {
if(GetPrefBool(@"kCoin")) {           
arg1 = 1;                      
}
return %orig;
}

%end
