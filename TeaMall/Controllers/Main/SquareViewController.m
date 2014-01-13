//
//  SquareViewController.m
//  TeaMall
//
//  Created by vedon on 13/1/14.
//  Copyright (c) 2014 helloworld. All rights reserved.
//

#import "SquareViewController.h"
#import "SquareItemCell.h"
#import "SquareItemDetailViewController.h"
#import "CustomiseServiceViewController.h"
static NSString * cellIdentifier = @"cellIdentifier";
@interface SquareViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSUInteger cellItemHeight;

}
@end

@implementation SquareViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    cellItemHeight = 0;
    SquareItemCell * cell = [[[NSBundle mainBundle]loadNibNamed:@"SquareItemCell" owner:self options:nil]objectAtIndex:0];
    cellItemHeight = cell.frame.size.height;
    cell = nil;
    
    UINib *cellNib = [UINib nibWithNibName:@"SquareItemCell" bundle:[NSBundle bundleForClass:[SquareItemCell class]]];
    [self.contentTable registerNib:cellNib forCellReuseIdentifier:cellIdentifier];
    
    if ([OSHelper iOS7]) {
        self.contentTable.separatorInset = UIEdgeInsetsZero;
    }
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)gotoContactServiceViewController
{
    CustomiseServiceViewController * viewController = [[CustomiseServiceViewController alloc]initWithNibName:@"CustomiseServiceViewController" bundle:nil];
    [self.navigationController pushViewController:viewController animated:YES];
    viewController = nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellItemHeight;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SquareItemCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    [cell.contactServiceBtn addTarget:self action:@selector(gotoContactServiceViewController) forControlEvents:UIControlEventTouchUpInside];
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SquareItemDetailViewController * viewController = [[SquareItemDetailViewController alloc]initWithNibName:@"SquareItemDetailViewController" bundle:nil];
    [self.navigationController pushViewController:viewController animated:YES];
    viewController = nil;
    
}
@end