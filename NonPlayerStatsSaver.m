//
//  NonPlayerStatsSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/26.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "NonPlayerStatsSaver.h"

@implementation NonPlayerStatsSaver

+ (void)saveStats:(NonPlayerStats *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	
	cbuffer = [object databaseClass];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object attacking];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object business];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object coachingTechnique];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object directness];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object levelOfDiscipline];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object freeRoles];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object interference];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object marking];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object offside];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object patience];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object pressing];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object resources];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object workingWithYoungsters];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object determination];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object buyingPlayers];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object mindGames];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object sittingBack];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object useOfPlaymaker];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object useOfSubs];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object depth];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object flamboyancy];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object flexibility];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object hardnessOfTraining];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object squadRotation];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object tempo];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object width];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object coachingOutfieldPlayers];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object coachingGoalkeepers];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object judgingPlayerAbility];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object judgingPlayerPotential];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object manManagement];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object motivating];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object physiotherapy];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object tacticalKnowledge];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object coachingAttacking];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object coachingDefending];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object coachingFitness];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object coachingMental];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object coachingTechnical];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object coachingTactical];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object dirtinessAllowance];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object rowID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object UID];
	[data appendBytes:&ibuffer length:4];
}

@end
