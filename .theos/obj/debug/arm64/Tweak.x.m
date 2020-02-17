#line 1 "Tweak.x"

#include <UIKit/UIKit.h>
#import "Goku.h"




@interface WAChatViewController : UIViewController{}
- (void)callButtonTapped:(id)arg1; 
- (void)viewDidLoad;

@end




#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class WAChatViewController; 
static void (*_logos_orig$_ungrouped$WAChatViewController$callButtonTapped$)(_LOGOS_SELF_TYPE_NORMAL WAChatViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$WAChatViewController$callButtonTapped$(_LOGOS_SELF_TYPE_NORMAL WAChatViewController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$WAChatViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL WAChatViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WAChatViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL WAChatViewController* _LOGOS_SELF_CONST, SEL); 

#line 16 "Tweak.x"

Goku *g;


static void _logos_method$_ungrouped$WAChatViewController$callButtonTapped$(_LOGOS_SELF_TYPE_NORMAL WAChatViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

           dispatch_async(dispatch_get_main_queue(), ^(void){
         UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Prompt"
                                                                          message:@"Hello Akshay, are you sure you want to call this person?"
                                                                   preferredStyle:UIAlertControllerStyleAlert]; 
        UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"Yes"
                                                              style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                                 return _logos_orig$_ungrouped$WAChatViewController$callButtonTapped$(self, _cmd, arg1);
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

static void _logos_method$_ungrouped$WAChatViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL WAChatViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

     g = [[Goku alloc] init];
      [g configureSwitch:self.view];
      _logos_orig$_ungrouped$WAChatViewController$viewDidLoad(self, _cmd);
}








static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$WAChatViewController = objc_getClass("WAChatViewController"); MSHookMessageEx(_logos_class$_ungrouped$WAChatViewController, @selector(callButtonTapped:), (IMP)&_logos_method$_ungrouped$WAChatViewController$callButtonTapped$, (IMP*)&_logos_orig$_ungrouped$WAChatViewController$callButtonTapped$);MSHookMessageEx(_logos_class$_ungrouped$WAChatViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$WAChatViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$WAChatViewController$viewDidLoad);} }
#line 64 "Tweak.x"
