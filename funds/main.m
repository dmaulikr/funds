//
//  main.m
//  funds
//
//  Created by Michael on 06.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RamblerAppDelegateProxy/RamblerAppDelegateProxy.h>
#import "TyphoonAppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        // inject the app delegate which will collect all other app delegates (small ones) in run-time :)
        [[RamblerAppDelegateProxy injector] setDefaultAppDelegate:[TyphoonAppDelegate new]];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([RamblerAppDelegateProxy class]));
    }
}
