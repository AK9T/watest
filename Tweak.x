
#include <UIKit/UIKit.h>
#import "Goku.h"




@interface WAChatViewController : UIViewController{}
- (void)callButtonTapped:(id)arg1; 


@end



%hook WAChatViewController
 UISwitch *customSwitch;
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

- (void) viewDidLoad {

   customSwitch = [[UISwitch alloc] initWithFrame: CGRectMake(0, 0, 50, 50)];
    [self.view addSubview:customSwitch];
    customSwitch.center = self.view.center;
    self.view.backgroundColor = [UIColor clearColor];
   UITapGestureRecognizer *letterTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showUISwitch:)];
    [letterTapRecognizer setNumberOfTapsRequired:3];
    [self.view addGestureRecognizer:letterTapRecognizer];

    

    %orig;


}





%end


