//
//  MenuTVC.m
//  SimpleExample
//
//  Created by apple on 2018/6/21.
//  Copyright © 2018年 yaoh. All rights reserved.
//

#import "MenuTVC.h"
#import "MenuItemEntity.h"
#import "DataCenter.h"

@interface MenuTVC ()

@end

@implementation MenuTVC{
    NSMutableArray * items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    if (_menu) {
        items = _menu.items;
        self.title = LS(_menu.name);
    }
    else {
        items = [DataCenter sharedDataCenter].menuItems;
        self.title = LS(@"Root");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSObject * obj = [items objectAtIndex:indexPath.row];
    if ([obj isKindOfClass:[MenuEntity class]]) {
        cell.textLabel.text = ((MenuEntity *)obj).name;
        cell.detailTextLabel.text = ((MenuEntity *)obj).detail;
    }
    else if([obj isKindOfClass:[MenuItemEntity class]]) {
        cell.textLabel.text = ((MenuItemEntity *)obj).name;
        cell.detailTextLabel.text = ((MenuItemEntity *)obj).detail;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSObject * obj = [items objectAtIndex:indexPath.row];
    if ([obj isKindOfClass:[MenuEntity class]]) {
        MenuTVC * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuTVC"];
        vc.menu = (MenuEntity *)obj;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if([obj isKindOfClass:[MenuItemEntity class]]) {
        MenuItemEntity * item = (MenuItemEntity *)obj;
        UIViewController * vc;
        if (item.storyboard.length > 0) {
            vc = [[UIStoryboard storyboardWithName:item.storyboard bundle:nil] instantiateViewControllerWithIdentifier:item.viewName];
        }
        else {
            Class class = NSClassFromString(item.viewName);
            vc = [class new];
        }
        
        if (item.isNC) {
            [self.navigationController pushViewController:vc animated:YES];
        }
        else {
            vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self.navigationController presentViewController:vc animated:YES completion:nil];
        }
    }
}



@end
