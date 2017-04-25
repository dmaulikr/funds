//
//  AMFAddRecordInteractorOutput.h
//  funds
//
//  Created by Michael Artuerhof on 16/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFAddRecordInteractorOutput <NSObject>

/**
 * record was created
 */
- (void)recordCreatedWithError:(NSError*)er;

@end
