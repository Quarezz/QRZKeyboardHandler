//
//  QRZKeyboardHandler.m
//
//  Created by Ruslan on 7/2/15.
//

#import "QRZKeyboardHandler.h"

@interface QRZKeyboardHandler ()
{
    NSLayoutConstraint *mConstraint;
    CGFloat mKeyboardHeight;
    UIView *mParentView;
}

@end

@implementation QRZKeyboardHandler

-(id) initWithConstraint: (NSLayoutConstraint *) constraint parentView: (UIView *) view
{
    if (self = [super init])
    {
        mConstraint = constraint;
        mParentView = view;
    }
    return self;
}

-(void) subscribeOnKeyboard
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

-(void) unsubscribeFromKeyboard
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark Frames manipulation

-(void) keyboardFrameWillChange: (NSNotification *) notification
{
    NSDictionary *userInfo = [notification userInfo];
    CGRect frame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    mKeyboardHeight = frame.size.height;
    mConstraint.constant = mKeyboardHeight;
    
    float animationDuration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    // Adding 0.25 so we don't see scroll view going before keyboard
    [UIView animateWithDuration:animationDuration + 0.25 animations:^{ [mParentView layoutIfNeeded]; }];
}

-(void) keyboardWillHide: (NSNotification *) notification
{
    mKeyboardHeight = 0;
    mConstraint.constant = mKeyboardHeight;
    [mParentView layoutIfNeeded];
}

@end
