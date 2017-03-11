//
//  AMFPageChooserInteractorOutput.h
//  funds
//
//  Created by Michael Artuerhof on 11/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFPageChooserInteractorOutput <NSObject>

/**
 pages delivered
 */
-(void) receivedPages:(NSArray*) pages;

@end
