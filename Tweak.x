
#include <UIKit/UIKit.h>
#import "Goku.h"



@interface WAChatViewController : UIViewController {}
- (void)callButtonTapped:(id)arg1; 
@end


%hook WAChatViewController


- (void)callButtonTapped:(id)arg1 {
 UIView *redRectangle = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 200, 200)];
    [redRectangle setBackgroundColor: [UIColor clearColor ]];
    
    redRectangle.backgroundColor = UIColor.blackColor;
    redRectangle.alpha = 0.0;
    [self.view addSubview:redRectangle];
    redRectangle.translatesAutoresizingMaskIntoConstraints = false;
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:redRectangle
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:redRectangle
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:redRectangle
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:redRectangle
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1.0
                                                           constant:0.0]];
  


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
                                                         
                                                                    [UIView animateWithDuration:0.6 animations:^{
                                                                      Goku *g = [[Goku alloc] init];
                                                                      [g showGokuWithView: self.view];
                                                                      redRectangle.alpha = 0.77;
                                                                  } completion:^(BOOL finished) {
                                                                      if (finished == true) {
                                                                          [UIView animateWithDuration:0.6 animations:^{
                                                                              redRectangle.alpha = 0.0;
                                                                          } completion:^(BOOL finished) {
                                                                              if (finished == true) {
                                                                                  redRectangle.hidden = true;
                                                                              }
                                                                          }];
                                                                      }
                                                                  }];
                                                         

                                                                   }];
        
        [alert addAction:secondAction];
        [alert addAction:firstAction];

        [self presentViewController:alert animated:YES completion:nil];
    });    
}


%end
