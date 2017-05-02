//
//  AMFEditCategoryInteractorInput.h
//  funds
//
//  Created by Michael Artuerhof on 02/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFCategoryProtocol;

@protocol AMFEditCategoryInteractorInput <NSObject>

- (void)changeCategory:(id<AMFCategoryProtocol>)category modifyName:(NSString*)name;

- (void)changeCategory:(id<AMFCategoryProtocol>)category modifyIcon:(NSString*)name;

@end
