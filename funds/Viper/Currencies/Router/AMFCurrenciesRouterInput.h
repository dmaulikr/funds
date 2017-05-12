//
//  AMFCurrenciesRouterInput.h
//  funds
//
//  Created by Michael Artuerhof on 12/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFNameIconSetterModuleOutput;
@class UIAlertAction;

@protocol AMFCurrenciesRouterInput <NSObject>

- (void)showEditorWithLabel:(NSString*)label
                           andContents:(NSString*)content
                         andOutput:(id<AMFNameIconSetterModuleOutput>) output;

- (void)showEditOptionsWithActionSymbol:(void(^)(UIAlertAction *action))symbolAction
                          andActionRate:(void(^)(UIAlertAction *action))rateAction
                          andActionName:(void(^)(UIAlertAction *action))nameAction;

@end
