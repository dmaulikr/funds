//
//  AMFAddPageInteractorInput.h
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFPageProtocol;

@protocol AMFAddPageInteractorInput <NSObject>

- (void)createPageWithName:(NSString*)pageName;
- (void)updatePage:(id<AMFPageProtocol>)page withName:(NSString*)name;

@end
