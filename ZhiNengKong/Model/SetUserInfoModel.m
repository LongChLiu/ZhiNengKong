//
//  Model/SetUserInfoModel.m
//  ZhiNengKong
//
//  Created by 高大为 on 15/6/25.
//  Copyright (c) 2015年 Andon Health Co,.Ltd. All rights reserved.
//

#import "SetUserInfoModel.h"

NSString *const kSetUserInfoModelIsSuccess = @"IsSuccess";
NSString *const kSetUserInfoModelErrors = @"Errors";

@interface SetUserInfoModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SetUserInfoModel

@synthesize isSuccess = _isSuccess;
@synthesize errors = _errors;

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
        self.isSuccess = [self objectOrNilForKey:kSetUserInfoModelIsSuccess fromDictionary:dict];
        self.errors = [self objectOrNilForKey:kSetUserInfoModelErrors fromDictionary:dict];
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
	[mutableDict setValue:self.isSuccess forKey:kSetUserInfoModelIsSuccess];
	[mutableDict setValue:self.errors forKey:kSetUserInfoModelErrors];
    
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

	self.isSuccess = [aDecoder decodeObjectForKey:kSetUserInfoModelIsSuccess];
	self.errors = [aDecoder decodeObjectForKey:kSetUserInfoModelErrors];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
	[aCoder encodeObject:_isSuccess forKey:kSetUserInfoModelIsSuccess];
	[aCoder encodeObject:_errors forKey:kSetUserInfoModelErrors];
}

- (id)copyWithZone:(NSZone *)zone
{
    SetUserInfoModel *copy = [[SetUserInfoModel alloc] init];
    
    if (copy) {
        
		copy.isSuccess = [self.isSuccess copyWithZone:zone];
		copy.errors = [self.errors copyWithZone:zone];
    }
    
    return copy;
}


@end