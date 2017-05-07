//
//  AMFWalletInteractorInput.h
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFWalletProtocol;

@protocol AMFWalletInteractorInput <NSObject>

/**
 * ask for available wallets in storage
 */
- (void)receiveAllWallets;


/**
 * user wants change wallet's name and icon
 */
- (void)changeWallet:(id<AMFWalletProtocol>)wallet withName:(NSString*)name andIcon:(NSString*)icon;

@end
