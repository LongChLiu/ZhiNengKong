//
//  Model/PostSeachFriendInfoModel.h
//  ZhiNengKong
//
//  Created by 高大为 on 15/6/25.
//  Copyright (c) 2015年 Andon Health Co,.Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PostSeachFriendInfoModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *uN;
@property (nonatomic, strong) NSString *accessToken;
@property (nonatomic, strong) NSString *identifiy;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
