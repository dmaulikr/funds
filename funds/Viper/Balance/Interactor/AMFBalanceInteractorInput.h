//
//  AMFBalanceInteractorInput.h
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol AMFPageProtocol;

@protocol AMFBalanceInteractorInput <NSObject>

/**
 * makes report for a given page could be nil then interactor will find the last one
 */
- (void)makeReportForPage:(id<AMFPageProtocol>)page;

/**
 * current used page for report
 */
- (id<AMFPageProtocol>)currentPage;

/**
 * previous page for report
 */
- (id<AMFPageProtocol>)prevPage;

/**
 * next page for report
 */
- (id<AMFPageProtocol>)nextPage;

@end
