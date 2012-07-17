//
//  PSDrawingGroup.m
//  PlaySketch
//
//  Created by Ryder Ziola on 12-07-14.
//  Copyright (c) 2012 Singapore Management University. All rights reserved.
//

#import "PSDrawingGroup.h"
#import "PSDrawingGroup.h"
#import "PSDrawingLine.h"


@implementation PSDrawingGroup

@dynamic name;
@dynamic rootGroup;
@dynamic children;
@dynamic drawingLines;
@dynamic parent;


- (void)awakeFromInsert
{
	// TODO TEMP: Setting these explicitly
	// Make sure we are pulling these out of a time-indexed list
	currentSRTPosition = SRTPositionMake( 0, 0, 1, 0, 0, 0);
	currentSRTRate = SRTRateMake( 0, 0, 0, 0 );
}

- (void)awakeFromFetch
{
	// TODO TEMP: Setting these explicitly
	// Make sure we are pulling these out of a time-indexed list
	currentSRTPosition = SRTPositionMake( 0, 0, 1, 0, 0, 0);
	currentSRTRate = SRTRateMake( 0, 0, 0, 0 );
}

/*
	Find the max and min points across our children
	This is not cached (maybe it should be if this is needed often?)
*/
- (CGRect)calculateFrame
{
	if ( self.drawingLines.count == 0 )
		return CGRectZero;
	else
	{
		CGPoint min = CGPointMake(1e100, 1e100);
		CGPoint max = CGPointMake(-1e100, -1e100);
		
		for (PSDrawingLine* line in self.drawingLines)
		{
			CGPoint* points = line.points;
			for(int i = 0; i < line.pointCount; i++)
			{
				min.x = MIN(min.x, points[i].x);
				min.y = MIN(min.y, points[i].y);
				max.x = MAX(max.x, points[i].x);
				max.y = MAX(max.y, points[i].y);
			}
		}
		return CGRectMake(min.x, min.y, (max.x - min.x), (max.y - min.y));
	}
}


// TODO TEMPORARY DELETE THIS WHEN WE HAVE A PATH
-(void)setCurrentSRTRate:(SRTRate)r
{
	currentSRTRate = r;
}

-(void)setCurrentSRTPosition:(SRTPosition)p
{
	currentSRTPosition = p;
}

@end
