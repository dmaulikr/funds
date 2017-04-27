//
//  AMFChooseCategoryInteractorOutput.h
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFChooseCategoryInteractorOutput <NSObject>

- (void)categoriesReceived:(NSArray*)categories;

@end
