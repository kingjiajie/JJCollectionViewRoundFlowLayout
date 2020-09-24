//
//  JJCollectionViewRoundFlowLayout.m
//  FuLaDuo
//
//  Created by jiajie on 2019/9/17.
//  Copyright © 2019 谢家杰. All rights reserved.
//

#import "JJCollectionViewRoundFlowLayout.h"
#import "JJCollectionViewFlowLayoutUtils.h"
#import "JJCollectionViewRoundFlowLayout+Alignment.h"

static NSString *const JJCollectionViewRoundSection = @"com.JJCollectionViewRoundSection";

@interface JJCollectionViewRoundLayoutAttributes  : UICollectionViewLayoutAttributes

//间距
@property (nonatomic, assign) UIEdgeInsets borderEdgeInsets;
@property (nonatomic, strong) JJCollectionViewRoundConfigModel *myConfigModel;

@end

@implementation JJCollectionViewRoundLayoutAttributes

@end

@interface JJCollectionReusableView : UICollectionReusableView

@property (weak, nonatomic) JJCollectionViewRoundLayoutAttributes *myCacheAttr;

@end

@implementation JJCollectionReusableView

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    [super applyLayoutAttributes:layoutAttributes];
    JJCollectionViewRoundLayoutAttributes *attr = (JJCollectionViewRoundLayoutAttributes *)layoutAttributes;
    _myCacheAttr = attr;
    [self toChangeCollectionReusableViewRoundInfoWithLayoutAttributes:attr];
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    [super traitCollectionDidChange:previousTraitCollection];
    [self toChangeCollectionReusableViewRoundInfoWithLayoutAttributes:_myCacheAttr];
}

- (void)toChangeCollectionReusableViewRoundInfoWithLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    
    JJCollectionViewRoundLayoutAttributes *attr = (JJCollectionViewRoundLayoutAttributes *)layoutAttributes;
    if (attr.myConfigModel) {
        JJCollectionViewRoundConfigModel *model = attr.myConfigModel;
        UIView *view = self;
        
        if (@available(iOS 13.0, *)) {
            view.layer.backgroundColor = [model.backgroundColor resolvedColorWithTraitCollection:self.traitCollection].CGColor;
        } else {
            view.layer.backgroundColor = model.backgroundColor.CGColor;
        }
        
        if (@available(iOS 13.0, *)) {
            view.layer.shadowColor = [model.shadowColor resolvedColorWithTraitCollection:self.traitCollection].CGColor;
        } else {
            view.layer.shadowColor = model.shadowColor.CGColor;
        }
        
        view.layer.shadowOffset = model.shadowOffset;
        view.layer.shadowOpacity = model.shadowOpacity;
        view.layer.shadowRadius = model.shadowRadius;
        view.layer.cornerRadius = model.cornerRadius;
        view.layer.borderWidth = model.borderWidth;
        
        if (@available(iOS 13.0, *)) {
            view.layer.borderColor = [model.borderColor resolvedColorWithTraitCollection:self.traitCollection].CGColor;
        } else {
            view.layer.borderColor = model.borderColor.CGColor;
        }
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (event.type == UIEventTypeTouches) {
        //touchType
        [self decorationViewUserDidSelectEvent];
    }
}

#pragma mark - touchEvent

- (void)decorationViewUserDidSelectEvent {
    UICollectionView *collectionView = (UICollectionView *)self.superview;
    if ([collectionView isKindOfClass:[UICollectionView class]]) {
        //is CollectionView
        id <JJCollectionViewDelegateRoundFlowLayout> delegate  = (id <JJCollectionViewDelegateRoundFlowLayout>)collectionView.delegate;
        if ([delegate respondsToSelector:@selector(collectionView:didSelectDecorationViewAtIndexPath:)]) {
            [delegate collectionView:collectionView didSelectDecorationViewAtIndexPath:_myCacheAttr.indexPath];
        }
    }
}

@end

@interface JJCollectionViewRoundFlowLayout ()

@property (nonatomic, strong) NSMutableArray<UICollectionViewLayoutAttributes *> *decorationViewAttrs;

@end

@implementation JJCollectionViewRoundFlowLayout

- (instancetype)init{
    self = [super init];
    if (self) {
        self.isRoundEnabled = YES;
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    _isRoundEnabled = YES;
}

- (void)prepareLayout{
    [super prepareLayout];
    
    if (!self.isRoundEnabled) {
        return;
    }
    
    NSInteger sections = [self.collectionView numberOfSections];
    id <JJCollectionViewDelegateRoundFlowLayout> delegate  = (id <JJCollectionViewDelegateRoundFlowLayout>)self.collectionView.delegate;
//    id delegate  = self.collectionView.delegate;
    
    //检测是否实现了背景样式模块代理
    if ([delegate respondsToSelector:@selector(collectionView:layout:configModelForSectionAtIndex:)]) {
    }else{
        return ;
    }
    
    //1.初始化
    [self registerClass:[JJCollectionReusableView class] forDecorationViewOfKind:JJCollectionViewRoundSection];
    [self.decorationViewAttrs removeAllObjects];
    
    for (NSInteger section = 0; section < sections; section++) {
        NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:section];
        if (numberOfItems > 0) {
            UICollectionViewLayoutAttributes *firstAttr = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
            CGRect firstFrame = firstAttr.frame;
            
            //判断是否计算headerview
            BOOL isCalculateHeaderView = NO;
            if ([delegate respondsToSelector:@selector(collectionView:layout:isCalculateHeaderViewIndex:)]) {
                isCalculateHeaderView = [delegate collectionView:self.collectionView layout:self isCalculateHeaderViewIndex:section];
            }else{
                isCalculateHeaderView = self.isCalculateHeader;
            }
            
            if (isCalculateHeaderView) {
                //headerView
                UICollectionViewLayoutAttributes *headerAttr = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
                if (headerAttr &&
                    (headerAttr.frame.size.width != 0|| headerAttr.frame.size.height != 0)) {
                    firstFrame = headerAttr.frame;
                }else{
                    CGRect rect = firstFrame;
                    if (self.isCalculateTypeOpenIrregularitiesCell) {
                        rect = [JJCollectionViewFlowLayoutUtils calculateIrregularitiesCellByMinTopFrameWithLayout:self section:section numberOfItems:numberOfItems defaultFrame:rect];
                    }
                    firstFrame = self.scrollDirection == UICollectionViewScrollDirectionVertical ?
                    CGRectMake(rect.origin.x, rect.origin.y, self.collectionView.bounds.size.width, rect.size.height):
                    CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, self.collectionView.bounds.size.height);
                }
            }else{
                //不计算headerview的情况
                if (self.isCalculateTypeOpenIrregularitiesCell) {
                    firstFrame = [JJCollectionViewFlowLayoutUtils calculateIrregularitiesCellByMinTopFrameWithLayout:self section:section numberOfItems:numberOfItems defaultFrame:firstFrame];
                }
            }

            UICollectionViewLayoutAttributes *lastAttr = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:(numberOfItems - 1) inSection:section]];
            CGRect lastFrame = lastAttr.frame;
            
            //判断是否计算headerview
            BOOL isCalculateFooterView = NO;
            if ([delegate respondsToSelector:@selector(collectionView:layout:isCalculateFooterViewIndex:)]) {
                isCalculateFooterView = [delegate collectionView:self.collectionView layout:self isCalculateFooterViewIndex:section];
            }else{
                isCalculateFooterView = self.isCalculateFooter;
            }
            
            if (isCalculateFooterView) {
                //footerView
                UICollectionViewLayoutAttributes *footerAttr = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter atIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
                if (footerAttr &&
                    (footerAttr.frame.size.width != 0 || footerAttr.frame.size.height != 0)) {
                    lastFrame = footerAttr.frame;
                }else{
                    CGRect rect = lastFrame;
                    if (self.isCalculateTypeOpenIrregularitiesCell) {
                        rect = [JJCollectionViewFlowLayoutUtils calculateIrregularitiesCellByMaxBottomFrameWithLayout:self section:section numberOfItems:numberOfItems defaultFrame:rect];
                    }
                    lastFrame = self.scrollDirection == UICollectionViewScrollDirectionVertical ?
                    CGRectMake(rect.origin.x, rect.origin.y, self.collectionView.bounds.size.width, rect.size.height):
                    CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, self.collectionView.bounds.size.height);
                }
            }else{
                //不计算footerView的情况
                if (self.isCalculateTypeOpenIrregularitiesCell) {
                    lastFrame = [JJCollectionViewFlowLayoutUtils calculateIrregularitiesCellByMaxBottomFrameWithLayout:self section:section numberOfItems:numberOfItems defaultFrame:lastFrame];
                }
            }
            
            //获取sectionInset
            UIEdgeInsets sectionInset = [JJCollectionViewFlowLayoutUtils evaluatedSectionInsetForItemWithCollectionLayout:self atIndex:section];
            
            UIEdgeInsets userCustomSectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
            if ([delegate respondsToSelector:@selector(collectionView:layout:borderEdgeInsertsForSectionAtIndex:)]) {
                //检测是否实现了该方法，进行赋值
                userCustomSectionInset = [delegate collectionView:self.collectionView layout:self borderEdgeInsertsForSectionAtIndex:section];
            }
            
            CGRect sectionFrame = CGRectUnion(firstFrame, lastFrame);
            if (!isCalculateHeaderView && !isCalculateFooterView) {
                //都没有headerView&footerView
                sectionFrame = [self calculateDefaultFrameWithSectionFrame:sectionFrame sectionInset:sectionInset];
            }else{
                if (isCalculateHeaderView && !isCalculateFooterView) {
                    //headerView
                    UICollectionViewLayoutAttributes *headerAttr = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
                    //判断是否有headerview
                    if (headerAttr &&
                        (headerAttr.frame.size.width != 0 || headerAttr.frame.size.height != 0)) {
                        if (self.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
                            //判断包含headerview, left位置已经计算在内，不需要补偏移
                            sectionFrame.size.width += sectionInset.right;
                            
                            //减去系统adjustInset的top
                            if (@available(iOS 11.0, *)) {
                                sectionFrame.size.height = self.collectionView.frame.size.height - self.collectionView.adjustedContentInset.top;
                            } else {
                                sectionFrame.size.height = self.collectionView.frame.size.height - fabs(self.collectionView.contentOffset.y)/*适配iOS11以下*/;
                            }
                        }else{
                            //判断包含headerview, top位置已经计算在内，不需要补偏移
                            sectionFrame.size.height += sectionInset.bottom;
                        }
                    }else{
                        sectionFrame = [self calculateDefaultFrameWithSectionFrame:sectionFrame sectionInset:sectionInset];
                    }
                }else if (!isCalculateHeaderView && isCalculateFooterView) {
                    //footerView
                    UICollectionViewLayoutAttributes *footerAttr = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter atIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
                    if (footerAttr &&
                        (footerAttr.frame.size.width != 0 || footerAttr.frame.size.height != 0)) {
                        if (self.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
                            //判断包含footerView, right位置已经计算在内，不需要补偏移
                            //(需要补充x偏移)
                            sectionFrame.origin.x -= sectionInset.left;
                            sectionFrame.size.width += sectionInset.left;
                            
                            //减去系统adjustInset的top
                            if (@available(iOS 11.0, *)) {
                                sectionFrame.size.height = self.collectionView.frame.size.height - self.collectionView.adjustedContentInset.top;
                            } else {
                                sectionFrame.size.height = self.collectionView.frame.size.height - fabs(self.collectionView.contentOffset.y)/*适配iOS11以下*/;
                            }
                        }else{
                            //判断包含footerView, bottom位置已经计算在内，不需要补偏移
                            //(需要补充y偏移)
                            sectionFrame.origin.y -= sectionInset.top;
                            sectionFrame.size.width = self.collectionView.frame.size.width;
                            sectionFrame.size.height += sectionInset.top;
                        }
                    }else{
                        sectionFrame = [self calculateDefaultFrameWithSectionFrame:sectionFrame sectionInset:sectionInset];
                    }
                }else{
                    //headerView
                    UICollectionViewLayoutAttributes *headerAttr = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];

                    //footerView
                    UICollectionViewLayoutAttributes *footerAttr = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter atIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
                    if (headerAttr &&
                        footerAttr &&
                        (headerAttr.frame.size.width != 0 || headerAttr.frame.size.height != 0) &&
                        (footerAttr.frame.size.width != 0 || footerAttr.frame.size.height != 0)) {
                        //都有headerview和footerview就不用计算了
                    }else{
                        sectionFrame = [self calculateDefaultFrameWithSectionFrame:sectionFrame sectionInset:sectionInset];
                    }
                }
            }
            
            sectionFrame.origin.x += userCustomSectionInset.left;
            sectionFrame.origin.y += userCustomSectionInset.top;
            if (self.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
                sectionFrame.size.width -= (userCustomSectionInset.left + userCustomSectionInset.right);
                sectionFrame.size.height -= (userCustomSectionInset.top + userCustomSectionInset.bottom);
            }else{
                sectionFrame.size.width -= (userCustomSectionInset.left + userCustomSectionInset.right);
                sectionFrame.size.height -= (userCustomSectionInset.top + userCustomSectionInset.bottom);
            }
            
            //2. 定义
            JJCollectionViewRoundLayoutAttributes *attr = [JJCollectionViewRoundLayoutAttributes layoutAttributesForDecorationViewOfKind:JJCollectionViewRoundSection withIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
            attr.frame = sectionFrame;
            attr.zIndex = -1;
            attr.borderEdgeInsets = userCustomSectionInset;
            if ([delegate respondsToSelector:@selector(collectionView:layout:configModelForSectionAtIndex:)]) {
                attr.myConfigModel = [delegate collectionView:self.collectionView layout:self configModelForSectionAtIndex:section];
            }
            [self.decorationViewAttrs addObject:attr];
        }else{
            continue ;
        }
    }
}

/// 计算默认不包含headerview和footerview的背景大小
/// @param frame frame description
/// @param sectionInset sectionInset description
- (CGRect)calculateDefaultFrameWithSectionFrame:(CGRect)frame sectionInset:(UIEdgeInsets)sectionInset{
    CGRect sectionFrame = frame;
    sectionFrame.origin.x -= sectionInset.left;
      sectionFrame.origin.y -= sectionInset.top;
      if (self.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
          sectionFrame.size.width += sectionInset.left + sectionInset.right;
          //减去系统adjustInset的top
          if (@available(iOS 11.0, *)) {
              sectionFrame.size.height = self.collectionView.frame.size.height - self.collectionView.adjustedContentInset.top;
          } else {
              sectionFrame.size.height = self.collectionView.frame.size.height - fabs(self.collectionView.contentOffset.y)/*适配iOS11以下*/;
          }
      }else{
          sectionFrame.size.width = self.collectionView.frame.size.width;
          sectionFrame.size.height += sectionInset.top + sectionInset.bottom;
      }
    return sectionFrame;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSMutableArray * attrs = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    
    //用户设置了对称方式，进行对称设置 (若没设置，不执行，继续其他计算)
    if (self.collectionCellAlignmentType != JJCollectionViewFlowLayoutAlignmentTypeBySystem
        && self.scrollDirection == UICollectionViewScrollDirectionVertical) {
        //竖向,Cell对齐方式暂不支持横向
        NSArray *formatGroudAttr = [self groupLayoutAttributesForElementsByYLineWithLayoutAttributesAttrs:attrs];
        
        [self evaluatedAllCellSettingFrameWithLayoutAttributesAttrs:formatGroudAttr
                                        toChangeAttributesAttrsList:&attrs
                                                  cellAlignmentType:self.collectionCellAlignmentType];
    }

    for (UICollectionViewLayoutAttributes *attr in self.decorationViewAttrs) {
        [attrs addObject:attr];
    }
    
    return attrs;
}

#pragma mark - other

- (NSMutableArray<UICollectionViewLayoutAttributes *> *)decorationViewAttrs{
    if (!_decorationViewAttrs) {
        _decorationViewAttrs = [NSMutableArray array];
    }
    return _decorationViewAttrs;
}

@end
