//
//  AMFWalletProtocol.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

@protocol AMFWalletProtocol <NSObject>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon_path;
@property (nonatomic, assign) double amount;

@end
