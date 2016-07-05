//
//  ViewController.m
//  表情键盘
//
//  Created by 张马亮 on 16/7/5.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "ViewController.h"
#import "FaceKeyboardVC.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.array = @[@"键盘一直显示在屏幕底部",@"键盘在屏幕下方，不可见"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = self.array[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    FaceKeyboardVC *vc = [FaceKeyboardVC new];
    vc.flag = indexPath.row == 1;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
