//
//  AMFWalletPresenter.h
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFWalletViewOutput.h"
#import "AMFWalletInteractorOutput.h"
#import "AMFWalletModuleInput.h"

@protocol AMFWalletViewInput;
@protocol AMFWalletInteractorInput;
@protocol AMFWalletRouterInput;

@interface AMFWalletPresenter : NSObject <AMFWalletModuleInput, AMFWalletViewOutput, AMFWalletInteractorOutput>

@property (nonatomic, weak) id<AMFWalletViewInput> view;
@property (nonatomic, strong) id<AMFWalletInteractorInput> interactor;
@property (nonatomic, strong) id<AMFWalletRouterInput> router;

@end
