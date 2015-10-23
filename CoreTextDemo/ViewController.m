//
//  ViewController.m
//  CoreTextDemo
//
//  Created by Zhouboli on 15/10/23.
//  Copyright © 2015年 Boris. All rights reserved.
//

#import "ViewController.h"
#import "CTLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    CTLabel *label = [[CTLabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [label setText:@"Hello world!"];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
