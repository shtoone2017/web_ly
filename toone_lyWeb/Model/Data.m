//
//  Data.m
//
//  Created by   on 2018/1/4
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "Data.h"


NSString *const kDataRemark = @"remark";
NSString *const kDataImgname = @"imgname";
NSString *const kDataXiangmubuid = @"xiangmubuid";
NSString *const kDataId = @"id";
NSString *const kDataTitle = @"title";
NSString *const kDataOrderid = @"orderid";
NSString *const kDataBiaoduanid = @"biaoduanid";
NSString *const kDataBiaoduanname = @"biaoduanname";
NSString *const kDataXiangmubuname = @"xiangmubuname";
NSString *const kDataUrl = @"url";


@interface Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Data

@synthesize remark = _remark;
@synthesize imgname = _imgname;
@synthesize xiangmubuid = _xiangmubuid;
@synthesize dataIdentifier = _dataIdentifier;
@synthesize title = _title;
@synthesize orderid = _orderid;
@synthesize biaoduanid = _biaoduanid;
@synthesize biaoduanname = _biaoduanname;
@synthesize xiangmubuname = _xiangmubuname;
@synthesize url = _url;


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
            self.remark = [self objectOrNilForKey:kDataRemark fromDictionary:dict];
            self.imgname = [self objectOrNilForKey:kDataImgname fromDictionary:dict];
            self.xiangmubuid = [[self objectOrNilForKey:kDataXiangmubuid fromDictionary:dict] doubleValue];
            self.dataIdentifier = [[self objectOrNilForKey:kDataId fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kDataTitle fromDictionary:dict];
            self.orderid = [[self objectOrNilForKey:kDataOrderid fromDictionary:dict] doubleValue];
            self.biaoduanid = [[self objectOrNilForKey:kDataBiaoduanid fromDictionary:dict] doubleValue];
            self.biaoduanname = [self objectOrNilForKey:kDataBiaoduanname fromDictionary:dict];
            self.xiangmubuname = [self objectOrNilForKey:kDataXiangmubuname fromDictionary:dict];
            self.url = [self objectOrNilForKey:kDataUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.remark forKey:kDataRemark];
    [mutableDict setValue:self.imgname forKey:kDataImgname];
    [mutableDict setValue:[NSNumber numberWithDouble:self.xiangmubuid] forKey:kDataXiangmubuid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataIdentifier] forKey:kDataId];
    [mutableDict setValue:self.title forKey:kDataTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderid] forKey:kDataOrderid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.biaoduanid] forKey:kDataBiaoduanid];
    [mutableDict setValue:self.biaoduanname forKey:kDataBiaoduanname];
    [mutableDict setValue:self.xiangmubuname forKey:kDataXiangmubuname];
    [mutableDict setValue:self.url forKey:kDataUrl];

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

    self.remark = [aDecoder decodeObjectForKey:kDataRemark];
    self.imgname = [aDecoder decodeObjectForKey:kDataImgname];
    self.xiangmubuid = [aDecoder decodeDoubleForKey:kDataXiangmubuid];
    self.dataIdentifier = [aDecoder decodeDoubleForKey:kDataId];
    self.title = [aDecoder decodeObjectForKey:kDataTitle];
    self.orderid = [aDecoder decodeDoubleForKey:kDataOrderid];
    self.biaoduanid = [aDecoder decodeDoubleForKey:kDataBiaoduanid];
    self.biaoduanname = [aDecoder decodeObjectForKey:kDataBiaoduanname];
    self.xiangmubuname = [aDecoder decodeObjectForKey:kDataXiangmubuname];
    self.url = [aDecoder decodeObjectForKey:kDataUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_remark forKey:kDataRemark];
    [aCoder encodeObject:_imgname forKey:kDataImgname];
    [aCoder encodeDouble:_xiangmubuid forKey:kDataXiangmubuid];
    [aCoder encodeDouble:_dataIdentifier forKey:kDataId];
    [aCoder encodeObject:_title forKey:kDataTitle];
    [aCoder encodeDouble:_orderid forKey:kDataOrderid];
    [aCoder encodeDouble:_biaoduanid forKey:kDataBiaoduanid];
    [aCoder encodeObject:_biaoduanname forKey:kDataBiaoduanname];
    [aCoder encodeObject:_xiangmubuname forKey:kDataXiangmubuname];
    [aCoder encodeObject:_url forKey:kDataUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    Data *copy = [[Data alloc] init];
    
    if (copy) {

        copy.remark = [self.remark copyWithZone:zone];
        copy.imgname = [self.imgname copyWithZone:zone];
        copy.xiangmubuid = self.xiangmubuid;
        copy.dataIdentifier = self.dataIdentifier;
        copy.title = [self.title copyWithZone:zone];
        copy.orderid = self.orderid;
        copy.biaoduanid = self.biaoduanid;
        copy.biaoduanname = [self.biaoduanname copyWithZone:zone];
        copy.xiangmubuname = [self.xiangmubuname copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


@end
