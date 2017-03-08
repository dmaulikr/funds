//
//  AMFBalanceModuleInput.h
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>

@protocol AMFBalanceModuleInput <RamblerViperModuleInput>

/**
 @author Michael Artuerhof

 Метод инициирует стартовую конфигурацию текущего модуля
 */
- (void)configureModule;

@end
