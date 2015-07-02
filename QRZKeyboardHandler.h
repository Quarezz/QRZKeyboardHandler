//
//  QRZKeyboardHandler.h
//
//  Created by Ruslan on 7/2/15.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QRZKeyboardHandler : NSObject

-(id) initWithConstraint: (NSLayoutConstraint *) constraint parentView: (UIView *) view;

-(void) subscribeOnKeyboard;
-(void) unsubscribeFromKeyboard;

@end
