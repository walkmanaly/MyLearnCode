//
//  ViewController.m
//  11111
//
//  Created by Nick on 2018/6/28.
//  Copyright © 2018年 nick. All rights reserved.
//

#import "ViewController.h"
#import "HttpTools.h"
#import "Greeting.h"
#import "Product.h"
#import "OneViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *products;
@property (nonatomic, strong) NSMutableArray *iMacs;

@end

@implementation ViewController

- (NSMutableArray *)iMacs {
    if (!_iMacs) {
        _iMacs = [NSMutableArray array];
        Product *p1 = [Product prductWithName:@"iMac" price:2000 date:[NSDate dateWithTimeIntervalSinceNow:0]];
        Product *p2 = [Product prductWithName:@"iMac" price:3000 date:[NSDate dateWithTimeIntervalSinceNow:20]];
        Product *p3 = [Product prductWithName:@"iMac" price:4000 date:[NSDate dateWithTimeIntervalSinceNow:30]];
        [_iMacs addObject:p1];
        [_iMacs addObject:p2];
        [_iMacs addObject:p3];
    }
    return _iMacs;
}

- (NSMutableArray *)products {
    if (!_products) {
        _products = [NSMutableArray array];
        Product *p1 = [Product prductWithName:@"iphone5" price:2000 date:[NSDate dateWithTimeIntervalSinceNow:0]];
        Product *p2 = [Product prductWithName:@"iphone5" price:3000 date:[NSDate dateWithTimeIntervalSinceNow:20]];
        Product *p3 = [Product prductWithName:@"iphone6" price:4000 date:[NSDate dateWithTimeIntervalSinceNow:30]];
        Product *p4 = [Product prductWithName:@"iphone7" price:5000 date:[NSDate dateWithTimeIntervalSinceNow:40]];
        [_products addObject:p1];
        [_products addObject:p2];
        [_products addObject:p3];
        [_products addObject:p4];
    }
    return _products;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSLog(@"hello world");
    unsigned int methodCount = 0;
    Method * methods = class_copyMethodList([NSArray class], &methodCount);
    for (int i = 0; i < methodCount; ++i) {
        Method m = methods[i];
        NSLog(@"%@", NSStringFromSelector(method_getName(m)));
    }
    free(methods);

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    [HttpTools getWithParams:@"?name=Nick" successed:^(NSDictionary *successed) {
//        NSLog(@"successed%@", successed);
//        Greeting *greet = [Greeting greetingWithId:successed[@"id"] content:successed[@"content"]];
//        NSLog(@"greet.id=%@, greet.content=%@", greet.id, greet.content);
//    } failured:^(NSString *failured) {
//        NSLog(@"failured%@", failured);
//    }];
    
//    [HttpTools getRequestWithSuccess:^(NSDictionary *successed) {
//
//    } failured:^(NSString *failured) {
//
//    }];

//    OneViewController *vc = [[OneViewController alloc] init];
//
//    [self.navigationController pushViewController:vc animated:YES];
    
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//
//    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"op");
//    }];
//
////    [op start];
//
//    [queue addOperation:op];
//
//    NSBlockOperation *clockOp = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"clockOp");
//    }];
//    [queue addOperation:clockOp];
//
//    [clockOp addDependency:op];
    
    
//    id result = [self.products valueForKeyPath:@"@max.date"];
    Product *p4 = self.products[3];
    [p4 setValue:@"iphone8" forKeyPath:@"name"];
    // 简单的集合运算符
    id names = [self.products valueForKeyPath:@"@max.name"];
    NSLog(@"%@", names);
    
    id valuesKeys = [self.products dictionaryWithValuesForKeys:@[@"name", @"date", @"price"]];
    NSLog(@"%@", valuesKeys);
    
    // 对象运算符
    
//    NSArray *types = @[@"iphnoe", @"ipad", @"ipad", @"macbook", @"macbook", @"macbook"];
    
    id unionObj = [self.products valueForKeyPath:@"@unionOfObjects.name"];
    // distinct去重
    id distinObj = [self.products valueForKeyPath:@"@distinctUnionOfObjects.name"];
    NSLog(@"%@- %@", unionObj, distinObj);
    
    // 数组和集合操作符
    id unionArr = [@[self.products, self.iMacs] valueForKeyPath:@"@unionOfArrays.name"];
    id distinctUnionArr = [@[self.products, self.iMacs] valueForKeyPath:@"@distinctUnionOfArrays.name"];
    NSLog(@"%@- %@", unionArr, distinctUnionArr);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
