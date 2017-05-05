//
//  AMFChooseWalletModuleOutput.h
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>
#import "AMFWalletProtocol.h"

@protocol AMFWalletProtocol;

@protocol AMFChooseWalletModuleOutput <RamblerViperModuleOutput>

/**
 * gives feedback about which category was chosen by user
 */
- (void)walletChosen:(id<AMFWalletProtocol>)wallet;

@end
