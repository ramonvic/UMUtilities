//
//  MTLModel+Timestamps.h
//  Mix de Ofertas
//
//  Created by Ramon Vicente on 11/24/15.
//  Copyright © 2015 Umobi. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface MTLModel (Timestamps)

+ (NSValueTransformer *)createdAtJSONTransformer;
+ (NSValueTransformer *)updatedAtJSONTransformer;
+ (NSValueTransformer *)deletedAtJSONTransformer;

+ (NSValueTransformer *)createdAtFMDBTransformer;
+ (NSValueTransformer *)updatedAtFMDBTransformer;
+ (NSValueTransformer *)deletedAtFMDBTransformer;
@end
