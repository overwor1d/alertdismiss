#include <UIKit/UIKit.h>
#include <Foundation/Foundation.h>

%hook UIViewController

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {
        // UIAlertControllerの場合、即座に閉じる
        [viewControllerToPresent dismissViewControllerAnimated:NO completion:nil];
        return;
    }
    // 他のビューコントローラの場合は通常の処理を継続する
    %orig;
}

%end
