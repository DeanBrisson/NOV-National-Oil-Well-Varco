-- Tuesday July 20, 2021

USE [Test_Merge2]

-- CODE BELOW FIXES THE Purge for Items and Files by 
-- running the UpdateIterationControlInfoOnHistory stored procedure
-- on all configured lifecycle states
-- Purge viability is managed by the [IterationControl].[Controlled] flag

-- look at the IterationControl table on both databases
-- compare the Controlled column between the two
-- run this before and after to verify that the "Controlled" flag is set properly after you apply the fix
SELECT IN1.ItemNumber, I1.IterationNumber, II1.ItemIterationID AS ItemIterationID1, II2.ItemIterationID AS ItemIterationID2, IC1.Controlled, IC2.Controlled
FROM [Test_Merge].[dbo].[Iteration] I1
JOIN [Test_Merge].[dbo].[ItemIteration] II1 ON I1.IterationID = II1.ItemIterationID
JOIN [Test_Merge].[dbo].[IterationControl] IC1 on I1.IterationID = IC1.IterationID
JOIN [Test_Merge].[dbo].[Revision] RV1 ON I1.RevisionId = RV1.RevisionId
JOIN [Test_Merge].[dbo].[ItemNumber] IN1 ON RV1.MasterId = IN1.ItemMasterID
JOIN [Test_Merge2].[dbo].[Iteration] I2 ON I1.IterationNumber = I2.IterationNumber
join [Test_Merge2].[dbo].[ItemIteration] II2 ON I2.IterationID = II2.ItemIterationID
JOIN [Test_Merge2].[dbo].[IterationControl] IC2 on I2.IterationID = IC2.IterationID
join [Test_Merge2].[dbo].[Revision] RV2 ON I2.RevisionId = RV2.RevisionId
join [Test_Merge2].[dbo].[ItemNumber] IN2 ON RV2.MasterId = IN2.ItemMasterID
WHERE IN1.ItemNumber = IN2.ItemNumber

-- Search for the LifeCycleState definitions 
SELECT * FROM [Test_Merge2].[dbo].[LifecycleState]

-- run the stored procedure on all defined LifeCycleStates
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory]	1
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory]	2
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory]	3
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory]	4
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory]	5
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory]	6
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory]	7
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory]	8
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory]	9
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory]	10
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory]	11
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory]	12
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory]	13
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory]	14
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory]	15
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory]	16
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory]	17
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory]	18
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory]	19
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory]	20
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory]	21
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory]	22
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory]	23
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory]	24
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory]	25
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory]	26
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory] 27
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory] 28
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory] 29
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory] 30
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory] 31



-- CODE BELOW FIXES THE Item LOCK Icon in Vault
-- by copying them from the Source Database to the Target database
-- this is controled by the [EntitySecurity].[SystemAclId] column

-- run the following query before and after the fix to see that it was applied
SELECT IM1.ItemMasterID, IN1.ItemNumber, ES1.SystemAclId, ES2.SystemAclId
FROM [Test_Merge].[dbo].[ItemMaster] IM1
JOIN [Test_Merge].[dbo].[ItemNumber] IN1 ON IM1.ItemMasterID = IN1.ItemMasterID
JOIN [Test_Merge].[dbo].[EntitySecurity] ES1 ON IM1.ItemMasterID = ES1.EntityId 
JOIN [Test_Merge2].[dbo].[ItemNumber] IN2 ON IN1.ItemNumber = IN2.ItemNumber
JOIN [Test_Merge2].[dbo].[EntitySecurity] ES2 ON IN2.ItemMasterID = ES2.EntityId 


-- now we can update SystemAclId for all Items
-- and it will show the lock on Items that need it
UPDATE [Test_Merge2].[dbo].[EntitySecurity]
SET SystemAclId = ES1.SystemAclId
FROM [Test_Merge].[dbo].[ItemMaster] IM1
JOIN [Test_Merge].[dbo].[ItemNumber] IN1 ON IM1.ItemMasterID = IN1.ItemMasterID
JOIN [Test_Merge].[dbo].[EntitySecurity] ES1 ON IM1.ItemMasterID = ES1.EntityId 
JOIN [Test_Merge2].[dbo].[ItemNumber] IN2 ON IN1.ItemNumber = IN2.ItemNumber
JOIN [Test_Merge2].[dbo].[EntitySecurity] ES2 ON IN2.ItemMasterID = ES2.EntityId 



-- CODE BELOW FIXES THE Historical property information for Items
-- by copying them from the Source Database to the Target database

-- query will make sure previous values are not already existing
-- and does not overwrite them if they already exist

INSERT INTO [Test_Merge2].[dbo].[Property] (PropertyDefID, EntityID, Value)
SELECT PR1.PropertyDefID, II2.ItemIterationID, PR1.Value
FROM [Test_Merge].[dbo].[Iteration] I1
JOIN [Test_Merge].[dbo].[ItemIteration] II1 ON I1.IterationID = II1.ItemIterationID
JOIN [Test_Merge].[dbo].[Revision] RV1 ON I1.RevisionId = RV1.RevisionId
JOIN [Test_Merge].[dbo].[ItemNumber] IN1 ON RV1.MasterId = IN1.ItemMasterID
JOIN [Test_Merge].[dbo].[Property] PR1 ON II1.ItemIterationID = PR1.EntityID
JOIN [Test_Merge2].[dbo].[Iteration] I2 ON I1.IterationNumber = I2.IterationNumber
join [Test_Merge2].[dbo].[ItemIteration] II2 ON I2.IterationID = II2.ItemIterationID
join [Test_Merge2].[dbo].[Revision] RV2 ON I2.RevisionId = RV2.RevisionId
join [Test_Merge2].[dbo].[ItemNumber] IN2 ON RV2.MasterId = IN2.ItemMasterID
WHERE IN1.ItemNumber = IN2.ItemNumber
AND NOT EXISTS (SELECT *
                     FROM [Test_Merge2].[dbo].[Property] PR2
                     WHERE PR2.PropertyDefID = PR1.PropertyDefID
                     AND   PR2.EntityID = II2.ItemIterationID)


