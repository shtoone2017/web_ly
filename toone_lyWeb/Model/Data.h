//
//  Data.h
//
//  Created by   on 2018/1/4
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Data : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *remark;
@property (nonatomic, strong) NSString *imgname;
@property (nonatomic, assign) double xiangmubuid;
@property (nonatomic, assign) double dataIdentifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double orderid;
@property (nonatomic, assign) double biaoduanid;
@property (nonatomic, strong) NSString *biaoduanname;
@property (nonatomic, strong) NSString *xiangmubuname;
@property (nonatomic, strong) NSString *url;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
