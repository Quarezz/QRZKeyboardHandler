# QRZKeyboardHandler
A simple iOS Keyboard Handler class that can help you to reduce your UIKeyboard handling code.
### Example 

```
-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    mKeyboardHandler = [[KBNKeyboardHandler alloc] initWithConstraint:self.constraintTableViewBottom parentView:self.view]; // the view that contains your scroll/table view.
    [mKeyboardHandler subscribeOnKeyboard];
}

-(void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [mKeyboardHandler unsubscribeFromKeyboard]; // don't forget to unsubscribe!
}

```


