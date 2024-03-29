//
//  Model/PostSetUserInfoModel.m
//  ZhiNengKong
//
//  Created by 高大为 on 15/6/25.
//  Copyright (c) 2015年 Andon Health Co,.Ltd. All rights reserved.
//

#import "PostSetUserInfoModel.h"

NSString *const kPostSetUserInfoModelUN = @"UN";
NSString *const kPostSetUserInfoModelAccessToken = @"AccessToken";
NSString *const kPostSetUserInfoModelChanges = @"Changes";

@interface PostSetUserInfoModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PostSetUserInfoModel

@synthesize uN = _uN;
@synthesize accessToken = _accessToken;
@synthesize changes = _changes;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.uN = [self objectOrNilForKey:kPostSetUserInfoModelUN fromDictionary:dict];
        self.accessToken = [self objectOrNilForKey:kPostSetUserInfoModelAccessToken fromDictionary:dict];
        self.changes = [self objectOrNilForKey:kPostSetUserInfoModelChanges fromDictionary:dict];
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
	[mutableDict setValue:self.uN forKey:kPostSetUserInfoModelUN];
	[mutableDict setValue:self.accessToken forKey:kPostSetUserInfoModelAccessToken];
	[mutableDict setValue:self.changes forKey:kPostSetUserInfoModelChanges];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

	self.uN = [aDecoder decodeObjectForKey:kPostSetUserInfoModelUN];
	self.accessToken = [aDecoder decodeObjectForKey:kPostSetUserInfoModelAccessToken];
	self.changes = [aDecoder decodeObjectForKey:kPostSetUserInfoModelChanges];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
	[aCoder encodeObject:_uN forKey:kPostSetUserInfoModelUN];
	[aCoder encodeObject:_accessToken forKey:kPostSetUserInfoModelAccessToken];
	[aCoder encodeObject:_changes forKey:kPostSetUserInfoModelChanges];
}

- (id)copyWithZone:(NSZone *)zone
{
    PostSetUserInfoModel *copy = [[PostSetUserInfoModel alloc] init];
    
    if (copy) {
        
		copy.uN = [self.uN copyWithZone:zone];
		copy.accessToken = [self.accessToken copyWithZone:zone];
		copy.changes = [self.changes copyWithZone:zone];
    }
    
    return copy;
}


@end