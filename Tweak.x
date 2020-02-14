#define kBundlePath @"/Library/MobileSubstrate/DynamicLibraries/com.akshu.khamankar"
#include <UIKit/UIKit.h>

@interface WAChatViewController : UIViewController {}
- (void)callButtonTapped:(id)arg1; 
UIImageView *dbzImg;

NSBundle *bundle = [[[NSBundle alloc] initWithPath:kBundlePath] autorelease];

NSString *imagePath = [bundle pathForResource:@"goku" ofType:@"png"];

UIImage *myImage = [UIImage imageWithContentsOfFile:imagePath];
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
                                                                  showPopUp(self);
                                                               }]; 
        
        [alert addAction:secondAction];
        [alert addAction:firstAction];

        [self presentViewController:alert animated:YES completion:nil];
    });    
}

static void showPopUp(ViewController *object) {
    [UIView animateWithDuration: 0.8 animations:^{
        myImage =[[UIImageView alloc] initWithFrame:CGRectMake(0,0,180,180)];
        myImage.center = object.view.center;
        myImage.image=[UIImage imageNamed:@"goku.png"];
        myImage.contentMode = UIViewContentModeScaleAspectFit;
        [object.view addSubview:myImage];
    } completion:^(BOOL finished) {
        if (finished ==  true) {
            NSLog(@"go fuck yourself");
            double delayInSeconds = 0.5;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [UIView animateWithDuration:0.6 animations:^{
                    myImage.alpha = 0.0;
                }];
            });
        }
    }];
}



%end