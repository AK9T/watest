
#include <UIKit/UIKit.h>
#import "Goku.h"
#define kPath @"/var/mobile/Library/Preferences/Root.plist"



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
NSDictionary *prefs=[[NSDictionary alloc] initWithContentsOfFile:kPath];
%orig;
if ([[prefs objectForKey:@"kCoin"] boolValue]) {                    //instead "Coin" put what u want, but there must be "k"
arg1 = 1; ;                                                     //here what you want return your function         
}
[prefs release];
return %orig;
}

%end
