//
//  UMTableViewCell.h
//
//  Created by Ramon Vicente on 11/23/15.
//  Copyright © 2015 Umobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UMTableViewCellDelegate;

@interface UMTableViewCell : UITableViewCell

+(NSString*) identifier;

@property(nonatomic, assign) id<UMTableViewCellDelegate> delegate;

@end

@protocol UMTableViewCellDelegate <NSObject>

@required
-(void)tableViewCell:(UMTableViewCell*)cell didClickButtonAtIndex:(NSInteger)buttonIndex;

@end