//
//  AMFFlowCell.m
//  funds
//
//  Created by Michael on 10.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFFlowCell.h"
#import "AMFTheme.h"

@implementation AMFFlowCell

@synthesize theme;

-(void) applyTheme {
    LogDebug(@"!!applyTheme in AMFFlowCell navigation font: %@; size: %ld", self.theme.navigationFontName, (long) self.theme.navigationFontSize);
}

- (void)typhoonDidInject {
    [self applyTheme];
}

@end
