//
//  ViewController.h
//  JCfireBase
//
//  Created by Mac on 17/08/1938 Saka.
//  Copyright © 1938 Saka Jivan Chaudhari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *detail;
    
}
@property (strong, nonatomic) IBOutlet UITextField *textName;
@property (strong, nonatomic) IBOutlet UITextField *textBloodGroup;

@property (strong, nonatomic) IBOutlet UITextField *taexNumber;
@property (strong, nonatomic) IBOutlet UITextView *textAddress;

- (IBAction)actionSave:(id)sender;


@end

