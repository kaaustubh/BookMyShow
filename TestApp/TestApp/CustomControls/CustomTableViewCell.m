//
//  CustomTableViewCell.m
//  TestApp
//
//  Created by Kaustubh Ratnaparkhi on 3/28/15.
//  Copyright (c) 2015 Kaustubh. All rights reserved.
//

#import "CustomTableViewCell.h"

@interface CustomTableViewCell(){}
@property (nonatomic, strong) LazyLoadingImageView *custImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation CustomTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        _custImageView=[[LazyLoadingImageView alloc] initWithFrame:CGRectMake(0, 0, 50,self.contentView.frame.size.height )];
        _titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(_custImageView.frame.size.width, 0, self.contentView.frame.size.width-_custImageView.frame.size.width, self.contentView.frame.size.height)];
        [self.contentView addSubview:_custImageView];
        [self.contentView addSubview:_titleLabel];
    }
    return self;
}

-(void)setObject:(Place*)place
{
    [_custImageView setURLString:place.placeIcon];
    _titleLabel.text=place.plceName;
}

@end
