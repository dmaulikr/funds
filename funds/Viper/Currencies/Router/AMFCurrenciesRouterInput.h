//
//  AMFCurrenciesRouterInput.h
//  funds
//
//  Created by Michael Artuerhof on 12/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFNameIconSetterModuleOutput;

@protocol AMFCurrenciesRouterInput <NSObject>

- (void)showEditorWithLabel:(NSString*)label
                           andContents:(NSString*)content
                         andOutput:(id<AMFNameIconSetterModuleOutput>) output;

@end
