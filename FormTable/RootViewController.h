//
//  RootViewController.h
//  FormTable
//
//  Created by zhe wang on 11-7-6.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "FormTableView.h"

@interface RootViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>{
    FormTableView * _formTableView;
    
    UITextField *emailTextField;
    UITextField *passwordTextField;
    UITextField *birthdayTextField;
    UITextField *genderTextField;
    UITextField *phoneTextField;
}

@end
