//
//  HGMEmployer.h
//  11111
//
//  Created by Nick on 2018/8/1.
//  Copyright © 2018年 nick. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HGMEmployerDelegate <NSObject>

@optional
- (void)employerHireMembers;
- (void)employerFireMembers;
- (void)employerReplaceMembers;

- (void)employerShouldHireMembers;
- (void)employerShouldFireMembers;
- (void)employerShouldReplaceMembers;

@end

NS_ASSUME_NONNULL_BEGIN

@interface HGMEmployer : NSObject

@property (nonatomic, weak) id<HGMEmployerDelegate> delegate;
- (void)callDelegate;

@end

NS_ASSUME_NONNULL_END
