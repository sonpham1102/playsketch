/*
 
 --------------
 Copyright 2012 Singapore Management University
 
 This Source Code Form is subject to the terms of the
 Mozilla Public License, v. 2.0. If a copy of the MPL was
 not distributed with this file, You can obtain one at
 http://mozilla.org/MPL/2.0/.
 --------------
 
 */

#import <UIKit/UIKit.h>
@class PSDrawingGroup;

@interface PSGroupOverlayButtons : UIView
@property(nonatomic,retain)IBOutlet UIButton* createGroupButton;
@property(nonatomic,retain)IBOutlet UIButton* recordingButton;
@property(nonatomic) BOOL recordPulsing;

- (void)configureForGroup:(PSDrawingGroup*)group;
- (void)setLocation:(CGPoint)p;
- (void)show:(BOOL)animated;
- (void)hide:(BOOL)animated;
- (void)startRecordingMode;
- (void)stopRecordingMode;


@end
