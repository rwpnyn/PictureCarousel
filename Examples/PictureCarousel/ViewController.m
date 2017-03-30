//
//  ViewController.m
//  PictureCarousel
//
//  Created by rocky on 2017/3/30.
//  Copyright © 2017年 rocky. All rights reserved.
//

#import "ViewController.h"

#import "RScrollImgView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    RScrollImgView *s = [[RScrollImgView alloc] init];
    s.frame = CGRectMake(0, 0, 300, 200);
    
    NSMutableArray *arr = [NSMutableArray array];
    for (int i=0; i<10; i++) {
        RImgModel *m = [[RImgModel alloc] initWithImgUrl:@"https://ss1.bdstatic.com/6ONYsjip0QIZ8tyhnq/it/u=2812578287,2368245058&fm=58&w_h=121_75&cs=2812578287,2368245058&ow_h=121_75&src=801" defaultImg:@"" mark:@""];
        
        [arr addObject:m];
    }
    [s setImgs:arr];
    
    
    [self.view addSubview:s];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
