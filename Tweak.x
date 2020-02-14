#include <UIKit/UIKit.h>
#include "functions.h"


@interface WAChatViewController : UIViewController {}
- (void)callButtonTapped:(id)arg1; 
@end

UIImageView *bobImageView;
UIImage *bobImage;

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
        
        [alert addAction:secondAction];
        [alert addAction:firstAction];

        [self presentViewController:alert animated:YES completion:nil];
    });    
}




- (void)showGoku {
    [UIView animateWithDuration: 0.8 animations:^{
    bobImage = [UIImage imageWithContentsOfFile:@"/Library/Application Support/ModuleViews.bundle/goku.png"];
	bobImageView = [[UIImageView alloc] initWithImage:bobImage];
	[bobImageView setFrame:CGRectMake(0, 250, 250, 250)];
        bobImageView.center = self.view.center;
        bobImageView.contentMode = UIViewContentModeScaleAspectFit;
       [[[UIApplication sharedApplication] keyWindow] addSubview:bobImageView];
    } completion:^(BOOL finished) {
        if (finished ==  true) {
            NSLog(@"go fuck yourself");


                [UIView animateWithDuration:0.6 animations:^{
                bobImageView.alpha = 0.0;
                }];

        }
    }];
}



%end