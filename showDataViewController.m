//
//  showDataViewController.m
//  coreDataDemo
//
//  Created by 汤维炜 on 16/3/20.
//  Copyright © 2016年 Tommy. All rights reserved.
//

#import "showDataViewController.h"
#import "Person.h"

@interface showDataViewController ()

@property (strong, nonatomic) UILabel *showContentLabel;
@property (nonatomic, strong) Person  *personModel;

@end

@implementation showDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _showContentLabel       = [[UILabel alloc]init];
    _showContentLabel.frame = CGRectMake(20, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    _showContentLabel.textColor       = [UIColor orangeColor];
    _showContentLabel.numberOfLines   = 0;
    _showContentLabel.font            = [UIFont systemFontOfSize:20];
    _showContentLabel.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_showContentLabel];
    

    NSArray *personArr = [Person MR_findAll];
    
    for (_personModel in personArr)
    {
        [self defaultContentLabel];
    }
    
}

- (void)defaultContentLabel {

    NSString *contentString = [NSString stringWithFormat:@"\n firstname_predicate : %@,\n lastname_predicate: %@ \n person age message: %@\n person decription : %@", _personModel.firstname,_personModel.lastname,_personModel.age,_personModel.decription?_personModel.decription:@"暂无描述信息"];
    
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc]initWithString:contentString];
    NSMutableParagraphStyle *spaceline   = [[NSMutableParagraphStyle alloc]init];
    [spaceline setLineSpacing:15];
    
    [attString addAttribute:NSParagraphStyleAttributeName value:spaceline range:NSMakeRange(0, [contentString length])];
    self.showContentLabel.attributedText = attString;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
