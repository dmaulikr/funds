//
//  AMFChooseWalletModuleInput.h
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>

@protocol AMFWalletProtocol;

@protocol AMFChooseWalletModuleInput <RamblerViperModuleInput>

/**
 @author Michael Artuerhof

 Method initializes the starting configuration of the module
 */
- (void)configureModuleWithWallet:(id<AMFWalletProtocol>)wallet;

@end
