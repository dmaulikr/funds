//
//  AMFSwipeableCell.m
//  funds
//
//  Created by Michael Artuerhof on 02/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFSwipeableCell.h"

static CGFloat const kBounceValue = 20.0f;

@interface AMFSwipeableCell() <UIGestureRecognizerDelegate>

@property (nonatomic, weak) IBOutlet UIButton *button_edit;
@property (nonatomic, weak) IBOutlet UIView *customContentView;
@property (nonatomic, weak) IBOutlet UILabel *label;

@property (nonatomic, strong) UIPanGestureRecognizer *panRecognizer;
@property (nonatomic, assign) CGPoint panStartPoint;
@property (nonatomic, assign) CGFloat startingRightLayoutConstraintConstant;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *contentViewRightConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *contentViewLeftConstraint;

@end

@implementation AMFSwipeableCell

- (void)awakeFromNib {
    [super awakeFromNib];

    self.button_edit.hidden = YES;
    [self.button_edit setTitle:AMFLocalize(@"Edit") forState:UIControlStateNormal];

    self.panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panThisCell:)];
    self.panRecognizer.delegate = self;
    [self.customContentView addGestureRecognizer:self.panRecognizer];
}

#pragma mark - Gestures

- (void)panThisCell:(UIPanGestureRecognizer *)recognizer {
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
            self.panStartPoint = [recognizer translationInView:self.customContentView];
            self.startingRightLayoutConstraintConstant = self.contentViewRightConstraint.constant;
            //NSLog(@"Pan Began at %@", NSStringFromCGPoint(self.panStartPoint));
            break;
        case UIGestureRecognizerStateChanged: {
            CGPoint currentPoint = [recognizer translationInView:self.customContentView];
            CGFloat deltaX = currentPoint.x - self.panStartPoint.x;
            //NSLog(@"Pan Moved %f", deltaX);
            BOOL panningLeft = NO;
            if (currentPoint.x < self.panStartPoint.x) {
                panningLeft = YES;
            }

            if (self.startingRightLayoutConstraintConstant == 0) {
                //The cell was closed and is now opening
                if (!panningLeft) {
                    CGFloat constant = MAX(-deltaX, 0);
                    if (constant == 0) {
                        [self resetConstraintContstantsToZero:YES notifyDelegateDidClose:NO];
                    } else {
                        self.contentViewRightConstraint.constant = constant;
                    }
                } else {
                    CGFloat constant = MIN(-deltaX, [self buttonTotalWidth]);
                    if (constant == [self buttonTotalWidth]) {
                        [self setConstraintsToShowAllButtons:YES notifyDelegateDidOpen:NO];
                    } else {
                        self.contentViewRightConstraint.constant = constant;
                    }
                }
            }
            else {
                //The cell was at least partially open.
                CGFloat adjustment = self.startingRightLayoutConstraintConstant - deltaX;
                if (!panningLeft) {
                    CGFloat constant = MAX(adjustment, 0);
                    if (constant == 0) {
                        [self resetConstraintContstantsToZero:YES notifyDelegateDidClose:NO];
                    } else {
                        self.contentViewRightConstraint.constant = constant;
                    }
                } else {
                    CGFloat constant = MIN(adjustment, [self buttonTotalWidth]);
                    if (constant == [self buttonTotalWidth]) {
                        [self setConstraintsToShowAllButtons:YES notifyDelegateDidOpen:NO];
                    } else {
                        self.contentViewRightConstraint.constant = constant;
                    }
                }
            }

            self.contentViewLeftConstraint.constant = -self.contentViewRightConstraint.constant;
        }
            break;
        case UIGestureRecognizerStateEnded:
            //NSLog(@"Pan Ended");
            break;
        case UIGestureRecognizerStateCancelled:
            //NSLog(@"Pan Cancelled");
            break;
        default:
            break;
    }
}

- (CGFloat)buttonTotalWidth {
    return CGRectGetWidth(self.frame) - CGRectGetMinX(self.button_edit.frame);
}

- (void)resetConstraintContstantsToZero:(BOOL)animated notifyDelegateDidClose:(BOOL)endEditing
{
    if (self.startingRightLayoutConstraintConstant == 0 &&
        self.contentViewRightConstraint.constant == 0) {
        //Already all the way closed, no bounce necessary
        return;
    }

    self.contentViewRightConstraint.constant = -kBounceValue;
    self.contentViewLeftConstraint.constant = kBounceValue;

    [self updateConstraintsIfNeeded:animated completion:^(BOOL finished) {
        self.contentViewRightConstraint.constant = 0;
        self.contentViewLeftConstraint.constant = 0;

        [self updateConstraintsIfNeeded:animated completion:^(BOOL finished) {
            self.startingRightLayoutConstraintConstant = self.contentViewRightConstraint.constant;

            self.button_edit.hidden = YES;
        }];
    }];

    if (endEditing && [self.delegate respondsToSelector:@selector(cellDidClose:)]) {
        [self.delegate cellDidClose:self];
    }
}

- (void)setConstraintsToShowAllButtons:(BOOL)animated notifyDelegateDidOpen:(BOOL)notifyDelegate
{
    if (self.startingRightLayoutConstraintConstant == [self buttonTotalWidth] &&
        self.contentViewRightConstraint.constant == [self buttonTotalWidth]) {
        return;
    }

    self.button_edit.hidden = NO;

    self.contentViewLeftConstraint.constant = -[self buttonTotalWidth] - kBounceValue;
    self.contentViewRightConstraint.constant = [self buttonTotalWidth] + kBounceValue;

    [self updateConstraintsIfNeeded:animated completion:^(BOOL finished) {
        self.contentViewLeftConstraint.constant = -[self buttonTotalWidth];
        self.contentViewRightConstraint.constant = [self buttonTotalWidth];

        [self updateConstraintsIfNeeded:animated completion:^(BOOL finished) {
            self.startingRightLayoutConstraintConstant = self.contentViewRightConstraint.constant;
        }];
    }];

    if (notifyDelegate && [self.delegate respondsToSelector:@selector(cellDidOpen:)]) {
        [self.delegate cellDidOpen:self];
    }
}

- (void)updateConstraintsIfNeeded:(BOOL)animated completion:(void (^)(BOOL finished))completion {
    float duration = 0;
    if (animated) {
        duration = 0.1;
    }

    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self layoutIfNeeded];
    } completion:completion];
}

#pragma mark - user actions

- (void)setItemText:(NSString*) text {
    self.label.text = text;
    _itemText = text;
}

- (IBAction)editClicked:(id)sender {
    if (self.delegate)
        [self.delegate editActionForItem:self.itemText andCell:self];
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

#pragma mark - Issues with scrolling

- (void)prepareForReuse {
    [super prepareForReuse];
    [self resetConstraintContstantsToZero:NO notifyDelegateDidClose:NO];
}

- (void)openCell {
    [self setConstraintsToShowAllButtons:NO notifyDelegateDidOpen:NO];
}

@end
