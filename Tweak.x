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
    [UIView animateWithDuration: 0.8 animations:^{
        NSBundle *bundle = [[NSBundle alloc] initWithPath:@"/Library/MobileSubstrate/DynamicLibraries/com.akshu.khamankar.bundle"];
		dbzImg = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[bundle pathForResource:@"goku" ofType:@"png"]]];
        dbzImg =[[UIImageView alloc] initWithFrame:CGRectMake(0,0,180,180)];
        dbzImg.center = self.view.center;
        dbzImg.contentMode = UIViewContentModeScaleAspectFit;
        [self.view addSubview:dbzImg];
    } completion:^(BOOL finished) {
        if (finished ==  true) {
            NSLog(@"go fuck yourself");
            double delayInSeconds = 0.5;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [UIView animateWithDuration:0.6 animations:^{
                    dbzImg.alpha = 0.0;
                }];
            });
        }
    }];
}



%end