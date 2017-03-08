//
//  AMFCurrencyProtocol.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

@protocol AMFCurrencyProtocol <NSObject>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) CGFloat rate;

@end
