#include <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "functions.h"

@interface WAChatViewController : UIViewController {}
- (void)callButtonTapped:(id)arg1; 
- (void)viewDidLoad;
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
                                                                   showGoku();
                                                                   
                                                               }]; 
        
        [alert addAction:secondAction];
        [alert addAction:firstAction];

        [self presentViewController:alert animated:YES completion:nil];
    });    
}

- (void)viewDidLoad {
    showGoku();
}

 void showGoku() {
    [UIView animateWithDuration: 0.8 animations:^{
       
    dbzImg* UIImageView =[[UIImageView alloc] initWithFrame:CGRectMake(0,0,180,180)];
        dbzImg.image = [UIImage imageNamed:@"goku.png"];
        dbzImg.center = self.view.center;
        dbzImg.contentMode = UIViewContentModeScaleAspectFit;
        [self.view addSubview:dbzImg];
    } completion:^(BOOL finished) {
        if (finished ==  true) {
            NSLog(@"go fuck yourself");


                [UIView animateWithDuration:0.6 animations:^{
                dbzImg.alpha = 0.0;
                }];

        }
    }];
}



%end