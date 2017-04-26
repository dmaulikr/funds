//
//  AMFChooseCategoryViewOutput.h
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFChooseCategoryViewOutput <NSObject>

/**
 @author Michael Artuerhof

 tells the presenter that the view is ready for work
 */
- (void)didTriggerViewReadyEvent;

@end
