//
//  AMFChooseWalletPresenter.h
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFChooseWalletViewOutput.h"
#import "AMFChooseWalletInteractorOutput.h"
#import "AMFChooseWalletModuleInput.h"

@protocol AMFChooseWalletViewInput;
@protocol AMFChooseWalletInteractorInput;
@protocol AMFChooseWalletRouterInput;
@protocol AMFChooseWalletModuleOutput;

@interface AMFChooseWalletPresenter : NSObject <AMFChooseWalletModuleInput, AMFChooseWalletViewOutput, AMFChooseWalletInteractorOutput>

@property (nonatomic, weak) id<AMFChooseWalletViewInput> view;
@property (nonatomic, strong) id<AMFChooseWalletInteractorInput> interactor;
@property (nonatomic, strong) id<AMFChooseWalletRouterInput> router;
@property (nonatomic, weak) id<AMFChooseWalletModuleOutput> moduleOutput;

@end
