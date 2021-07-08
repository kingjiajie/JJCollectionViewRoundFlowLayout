//
//  SQCollectionRoundFlowLayout.h
//  JJCollectionViewRoundFlowLayout
//
//  Created by liaoyp on 2021/7/8.
//

#import <UIKit/UIKit.h>
#import <JJCollectionViewRoundFlowLayout/JJCollectionViewRoundFlowLayout.h>
@class IGListAdapter;

#define CP_UNAVAILABLE(message) __attribute__((unavailable(message)))


NS_ASSUME_NONNULL_BEGIN

@interface SQCollectionRoundFlowLayout : JJCollectionViewRoundFlowLayout<JJCollectionViewDelegateRoundFlowLayout>

@property (nonatomic, weak) IGListAdapter *adapter;

- (instancetype)init CP_UNAVAILABLE("Use -[TopicCollectionViewWaterfallLayout initWithIGListAdapter:] instead");
+ (instancetype)new CP_UNAVAILABLE("Use -[TopicCollectionViewWaterfallLayout initWithIGListAdapter:] instead");
- (instancetype)initWithIGListAdapter:(IGListAdapter *)adapter NS_DESIGNATED_INITIALIZER;

@end


NS_ASSUME_NONNULL_END
