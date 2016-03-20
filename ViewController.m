//
//  ViewController.m
//  coreDataDemo
//
//  Created by 汤维炜 on 16/3/20.
//  Copyright © 2016年 Tommy. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "showDataViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UITextField *textfield;
@property (nonatomic, strong) Person      *person;

@end

@implementation ViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self customNavigationUI];
    
    [self drawMainUI];
    
}

- (void)customNavigationUI {
    self.title = @"CoredataDemo";
}
- (void)drawMainUI {
    
    _person = [Person  MR_createEntity];
    
    _textfield       = [[UITextField alloc] init];
    _textfield.frame = CGRectMake(33, 200, self.view.frame.size.width-66, 40);
    _textfield.backgroundColor = [UIColor orangeColor];
    _textfield.placeholder     = @"insert message:";
    [self.view addSubview:_textfield];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame     = CGRectMake(0, 0, 100, 60);
    btn.center    = self.view.center;
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"showData" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(saveParams) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
}

- (void)saveParams {
    
    _person.age       = @15;
    _person.firstname = @"mwc";
    _person.lastname  = @"xpx";

    if (![self.textfield.text isEqualToString:@""])
    {
        _person.decription = _textfield.text;
    }
    
    // 保存数据
    [[NSManagedObjectContext MR_context]MR_saveToPersistentStoreAndWait];

    showDataViewController *ctr = [showDataViewController new];
    [self.navigationController pushViewController:ctr animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
