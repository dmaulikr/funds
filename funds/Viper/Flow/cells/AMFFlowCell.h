//
//  AMFFlowCell.h
//  funds
//
//  Created by Michael on 10.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMFThemeable.h"

@protocol AMFFlowCellProtocol <NSObject>

@end

@interface AMFFlowCell : UITableViewCell <AMFThemeable>

@property (nonatomic, weak) IBOutlet UIImageView *categoryView;
@property (nonatomic, weak) IBOutlet UILabel *descr;
@property (nonatomic, weak) IBOutlet UILabel *amount;

@end
