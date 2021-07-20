-- Monday June 28, 2021
USE Test_Merge2

select Item.ItemNumber, rev.RevisionLabel, lcs.DisplayName, lcd.Name, ii.ItemTitle, i.IterationNumber, i.RevisionId, i.LifeCycleStateID,lcd.LifeCycleDefId
from Iteration i  
join [Test_Merge2].[dbo].[ItemIteration] ii on i.IterationID = ii.ItemIterationID
join LifeCycleState lcs on lcs.LifeCycleStateId = i.LifeCycleStateID
join LifeCycleDefinition lcd on lcs.LifeCycleDefId = lcd.LifeCycleDefId
join Revision Rev on rev.RevisionId = i.RevisionId
join ItemNumber item on item.ItemMasterID = rev.MasterId
 where item.ItemNumber in ('100003')
 order by IterationNumber, ItemNumber, RevisionLabel,LifeCycleDefId, RevisionId desc

 SELECT * FROM ItemIteration

select Item.ItemNumber, rev.RevisionLabel, lcs.DisplayName, prop.Value AS 'State (Historical)', lcd.Name, ii.ItemTitle, ii.ItemIterationID, i.IterationNumber, i.RevisionId, i.LifeCycleStateID,lcd.LifeCycleDefId
from Iteration i  
join [Test_Merge].[dbo].[ItemIteration] ii on i.IterationID = ii.ItemIterationID
join LifeCycleState lcs on lcs.LifeCycleStateId = i.LifeCycleStateID
join LifeCycleDefinition lcd on lcs.LifeCycleDefId = lcd.LifeCycleDefId
join Revision Rev on rev.RevisionId = i.RevisionId
join ItemNumber item on item.ItemMasterID = rev.MasterId
join Property prop on ii.ItemIterationID = prop.EntityID
 where item.ItemNumber in ('100004') AND prop.PropertyDefID = 50
 order by IterationNumber, ItemNumber, RevisionLabel,LifeCycleDefId, RevisionId desc


SELECT * FROM PropertyDef WHERE FriendlyName LIKE '%historical%'

SELECT * FROM Property WHERE PropertyDefID = 50

SELECT * FROM ItemIteration WHERE PartNumber = '100003'


SELECT * FROM Entity


USE Test_Merge
SELECT * FROM Iteration

-- Tuesday June 29, 2021

USE Test_Merge


select Item.ItemNumber, rev.RevisionLabel, lcs.DisplayName, prop.Value, lcd.Name, ii.ItemTitle, ii.ItemIterationID, i.IterationNumber, i.RevisionId, i.LifeCycleStateID,lcd.LifeCycleDefId
from Iteration i  
join [Test_Merge].[dbo].[ItemIteration] ii on i.IterationID = ii.ItemIterationID
join LifeCycleState lcs on lcs.LifeCycleStateId = i.LifeCycleStateID
join LifeCycleDefinition lcd on lcs.LifeCycleDefId = lcd.LifeCycleDefId
join Revision Rev on rev.RevisionId = i.RevisionId
join ItemNumber item on item.ItemMasterID = rev.MasterId
join Property prop on ii.ItemIterationID = prop.EntityID
 where item.ItemNumber in ('100004') AND prop.PropertyDefID = 50
 order by IterationNumber, ItemNumber, RevisionLabel,LifeCycleDefId, RevisionId desc

select Item.ItemNumber, rev.RevisionLabel, lcs.DisplayName, lcd.Name, ii.ItemTitle, i.IterationNumber, i.RevisionId, i.LifeCycleStateID,lcd.LifeCycleDefId
from Iteration i  
join [Test_Merge2].[dbo].[ItemIteration] ii on i.IterationID = ii.ItemIterationID
join LifeCycleState lcs on lcs.LifeCycleStateId = i.LifeCycleStateID
join LifeCycleDefinition lcd on lcs.LifeCycleDefId = lcd.LifeCycleDefId
join Revision Rev on rev.RevisionId = i.RevisionId
join ItemNumber item on item.ItemMasterID = rev.MasterId
 where item.ItemNumber in ('100004')
 order by IterationNumber, ItemNumber, RevisionLabel,LifeCycleDefId, RevisionId desc



 select Item.ItemNumber, rev.RevisionLabel, lcs.DisplayName, prop.Value AS 'State (Historical)', lcd.Name, ii.ItemTitle, ii.ItemIterationID, i.IterationNumber, i.RevisionId, i.LifeCycleStateID,lcd.LifeCycleDefId
from Iteration i  
join [Test_Merge].[dbo].[ItemIteration] ii on i.IterationID = ii.ItemIterationID
join LifeCycleState lcs on lcs.LifeCycleStateId = i.LifeCycleStateID
join LifeCycleDefinition lcd on lcs.LifeCycleDefId = lcd.LifeCycleDefId
join Revision Rev on rev.RevisionId = i.RevisionId
join ItemNumber item on item.ItemMasterID = rev.MasterId
join Property prop on ii.ItemIterationID = prop.EntityID
 where item.ItemNumber in ('100004') AND prop.PropertyDefID = 50
 order by IterationNumber, ItemNumber, RevisionLabel,LifeCycleDefId, RevisionId desc

 SELECT * FROM Item

 SELECT * FROM Property WHERE PropertyDefID = 50

 -- build a query to find the same Items in Test_Merge and Test_Merge2

SELECT IN1.ItemNumber, RV1.RevisionLabel, LCS1.DisplayName, PR1.Value AS 'StateHistorical', LCD1.Name, II1.ItemTitle, II1.ItemIterationID, I1.IterationNumber, I1.RevisionId, I1.LifeCycleStateID, LCD1.LifeCycleDefId
FROM [Test_Merge].[dbo].[Iteration] I1
join [Test_Merge].[dbo].[ItemIteration] II1 on I1.IterationID = II1.ItemIterationID
join [Test_Merge].[dbo].[LifeCycleState] LCS1 on LCS1.LifeCycleStateId = I1.LifeCycleStateID
join [Test_Merge].[dbo].[LifeCycleDefinition] LCD1 on LCS1.LifeCycleDefId = LCD1.LifeCycleDefId
join [Test_Merge].[dbo].[Revision] RV1 on RV1.RevisionId = I1.RevisionId
join [Test_Merge].[dbo].[ItemNumber] IN1 on IN1.ItemMasterID = RV1.MasterId
join [Test_Merge].[dbo].[Property] PR1 on II1.ItemIterationID = PR1.EntityID
WHERE IN1.ItemNumber in ('100004') AND PR1.PropertyDefID = 50

-- stripped down to what we need
-- yeilds 13 results
SELECT IN1.ItemNumber, PR1.Value AS 'StateHistorical', II1.ItemIterationID AS ItemIterationID1, I1.IterationNumber
FROM [Test_Merge].[dbo].[Iteration] I1
join [Test_Merge].[dbo].[ItemIteration] II1 on I1.IterationID = II1.ItemIterationID
join [Test_Merge].[dbo].[Revision] RV1 on RV1.RevisionId = I1.RevisionId
join [Test_Merge].[dbo].[ItemNumber] IN1 on IN1.ItemMasterID = RV1.MasterId
join [Test_Merge].[dbo].[Property] PR1 on II1.ItemIterationID = PR1.EntityID
WHERE IN1.ItemNumber in ('100004') AND PR1.PropertyDefID = 50

-- yeilds no results because the property does not yet exist
SELECT IN1.ItemNumber, PR1.Value AS 'StateHistorical', II1.ItemIterationID AS ItemIterationID1, I1.IterationNumber
FROM [Test_Merge2].[dbo].[Iteration] I1
join [Test_Merge2].[dbo].[ItemIteration] II1 on I1.IterationID = II1.ItemIterationID
join [Test_Merge2].[dbo].[Revision] RV1 on RV1.RevisionId = I1.RevisionId
join [Test_Merge2].[dbo].[ItemNumber] IN1 on IN1.ItemMasterID = RV1.MasterId
join [Test_Merge2].[dbo].[Property] PR1 on II1.ItemIterationID = PR1.EntityID
WHERE IN1.ItemNumber in ('100004') AND PR1.PropertyDefID = 50

-- combined
-- yeilds 13 results
SELECT IN1.ItemNumber, PR1.Value AS 'StateHistorical', II1.ItemIterationID AS ItemIterationID1, I1.IterationNumber, II2.ItemIterationID AS ItemIterationID2
FROM [Test_Merge].[dbo].[Iteration] I1
JOIN [Test_Merge].[dbo].[ItemIteration] II1 ON I1.IterationID = II1.ItemIterationID
JOIN [Test_Merge].[dbo].[Revision] RV1 ON I1.RevisionId = RV1.RevisionId
JOIN [Test_Merge].[dbo].[ItemNumber] IN1 ON RV1.MasterId = IN1.ItemMasterID
JOIN [Test_Merge].[dbo].[Property] PR1 ON II1.ItemIterationID = PR1.EntityID
JOIN [Test_Merge2].[dbo].[Iteration] I2 ON I1.IterationNumber = I2.IterationNumber
join [Test_Merge2].[dbo].[ItemIteration] II2 ON I2.IterationID = II2.ItemIterationID
join [Test_Merge2].[dbo].[Revision] RV2 ON I2.RevisionId = RV2.RevisionId
join [Test_Merge2].[dbo].[ItemNumber] IN2 ON RV2.MasterId = IN2.ItemMasterID
WHERE IN1.ItemNumber in ('100004') AND PR1.PropertyDefID = 50 AND IN1.ItemNumber = IN2.ItemNumber



-- insert into Test_Merge2 State (Historical)
INSERT INTO [Test_Merge2].[dbo].[Property] (PropertyDefID, EntityID, Value)
SELECT 50, II2.ItemIterationID, PR1.Value
FROM [Test_Merge].[dbo].[Iteration] I1
JOIN [Test_Merge].[dbo].[ItemIteration] II1 ON I1.IterationID = II1.ItemIterationID
JOIN [Test_Merge].[dbo].[Revision] RV1 ON I1.RevisionId = RV1.RevisionId
JOIN [Test_Merge].[dbo].[ItemNumber] IN1 ON RV1.MasterId = IN1.ItemMasterID
JOIN [Test_Merge].[dbo].[Property] PR1 ON II1.ItemIterationID = PR1.EntityID
JOIN [Test_Merge2].[dbo].[Iteration] I2 ON I1.IterationNumber = I2.IterationNumber
join [Test_Merge2].[dbo].[ItemIteration] II2 ON I2.IterationID = II2.ItemIterationID
join [Test_Merge2].[dbo].[Revision] RV2 ON I2.RevisionId = RV2.RevisionId
join [Test_Merge2].[dbo].[ItemNumber] IN2 ON RV2.MasterId = IN2.ItemMasterID
WHERE IN1.ItemNumber in ('100004') AND PR1.PropertyDefID = 50 AND IN1.ItemNumber = IN2.ItemNumber


SELECT * FROM [Test_Merge].[dbo].[Property]
SELECT * FROM [Test_Merge2].[dbo].[Property]


-- yeilds 13 results because the property has been introduced
SELECT IN1.ItemNumber, PR1.Value AS 'StateHistorical', II1.ItemIterationID AS ItemIterationID1, I1.IterationNumber
FROM [Test_Merge2].[dbo].[Iteration] I1
join [Test_Merge2].[dbo].[ItemIteration] II1 on I1.IterationID = II1.ItemIterationID
join [Test_Merge2].[dbo].[Revision] RV1 on RV1.RevisionId = I1.RevisionId
join [Test_Merge2].[dbo].[ItemNumber] IN1 on IN1.ItemMasterID = RV1.MasterId
join [Test_Merge2].[dbo].[Property] PR1 on II1.ItemIterationID = PR1.EntityID
WHERE IN1.ItemNumber in ('100004') AND PR1.PropertyDefID = 50

-- find the properties for 100004 Iteration number 1
-- 5
SELECT * FROM [Test_Merge].[dbo].[Property] WHERE EntityID = 35

-- 0
SELECT * FROM [Test_Merge2].[dbo].[Property] WHERE EntityID = 161




-- yeilds NO results because the property has been introduced
SELECT IN1.ItemNumber, PR1.PropertyDefID, PR1.Value, II1.ItemIterationID AS ItemIterationID1, I1.IterationNumber
FROM [Test_Merge2].[dbo].[Iteration] I1
join [Test_Merge2].[dbo].[ItemIteration] II1 on I1.IterationID = II1.ItemIterationID
join [Test_Merge2].[dbo].[Revision] RV1 on RV1.RevisionId = I1.RevisionId
join [Test_Merge2].[dbo].[ItemNumber] IN1 on IN1.ItemMasterID = RV1.MasterId
join [Test_Merge2].[dbo].[Property] PR1 on II1.ItemIterationID = PR1.EntityID
WHERE IN1.ItemNumber in ('100004')

-- combined - all properties - not just State Historical
-- yeilds 75 results
SELECT IN1.ItemNumber, PR1.PropertyDefID, PR1.Value, II1.ItemIterationID AS ItemIterationID1, I1.IterationNumber, II2.ItemIterationID AS ItemIterationID2
FROM [Test_Merge].[dbo].[Iteration] I1
JOIN [Test_Merge].[dbo].[ItemIteration] II1 ON I1.IterationID = II1.ItemIterationID
JOIN [Test_Merge].[dbo].[Revision] RV1 ON I1.RevisionId = RV1.RevisionId
JOIN [Test_Merge].[dbo].[ItemNumber] IN1 ON RV1.MasterId = IN1.ItemMasterID
JOIN [Test_Merge].[dbo].[Property] PR1 ON II1.ItemIterationID = PR1.EntityID
JOIN [Test_Merge2].[dbo].[Iteration] I2 ON I1.IterationNumber = I2.IterationNumber
join [Test_Merge2].[dbo].[ItemIteration] II2 ON I2.IterationID = II2.ItemIterationID
join [Test_Merge2].[dbo].[Revision] RV2 ON I2.RevisionId = RV2.RevisionId
join [Test_Merge2].[dbo].[ItemNumber] IN2 ON RV2.MasterId = IN2.ItemMasterID
WHERE IN1.ItemNumber in ('100004') AND IN1.ItemNumber = IN2.ItemNumber


-- insert into Test_Merge2 ALL properties
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
WHERE IN1.ItemNumber in ('100004') AND IN1.ItemNumber = IN2.ItemNumber


-- Wednesday June 30, 2021
USE Test_Merge2

SELECT * FROM PropertyDef

-- stripped down to what we need
-- yeilds 13 results
SELECT IN1.ItemNumber, PR1.Value AS 'StateHistorical', II1.ItemIterationID AS ItemIterationID1, I1.IterationNumber
FROM [Test_Merge].[dbo].[Iteration] I1
join [Test_Merge].[dbo].[ItemIteration] II1 on I1.IterationID = II1.ItemIterationID
join [Test_Merge].[dbo].[Revision] RV1 on RV1.RevisionId = I1.RevisionId
join [Test_Merge].[dbo].[ItemNumber] IN1 on IN1.ItemMasterID = RV1.MasterId
join [Test_Merge].[dbo].[Property] PR1 on II1.ItemIterationID = PR1.EntityID
WHERE IN1.ItemNumber in ('100004') AND PR1.PropertyDefID = 50

-- yeilds no results because the property does not yet exist
SELECT IN1.ItemNumber, PR1.Value AS 'StateHistorical', II1.ItemIterationID AS ItemIterationID1, I1.IterationNumber
FROM [Test_Merge2].[dbo].[Iteration] I1
join [Test_Merge2].[dbo].[ItemIteration] II1 on I1.IterationID = II1.ItemIterationID
join [Test_Merge2].[dbo].[Revision] RV1 on RV1.RevisionId = I1.RevisionId
join [Test_Merge2].[dbo].[ItemNumber] IN1 on IN1.ItemMasterID = RV1.MasterId
join [Test_Merge2].[dbo].[Property] PR1 on II1.ItemIterationID = PR1.EntityID
WHERE IN1.ItemNumber in ('100004') AND PR1.PropertyDefID = 50


-- stripped down to what we need
-- yeilds 13 results
SELECT IN1.ItemNumber, PR1.Value AS 'StateHistorical', II1.ItemIterationID AS ItemIterationID1, I1.IterationNumber
FROM [Test_Merge].[dbo].[Iteration] I1
join [Test_Merge].[dbo].[ItemIteration] II1 on I1.IterationID = II1.ItemIterationID
join [Test_Merge].[dbo].[Revision] RV1 on RV1.RevisionId = I1.RevisionId
join [Test_Merge].[dbo].[ItemNumber] IN1 on IN1.ItemMasterID = RV1.MasterId
join [Test_Merge].[dbo].[Property] PR1 on II1.ItemIterationID = PR1.EntityID
WHERE IN1.ItemNumber in ('100004')

-- yeilds no results because the property does not yet exist
SELECT IN1.ItemNumber, PR1.Value AS 'StateHistorical', II1.ItemIterationID AS ItemIterationID1, I1.IterationNumber
FROM [Test_Merge2].[dbo].[Iteration] I1
join [Test_Merge2].[dbo].[ItemIteration] II1 on I1.IterationID = II1.ItemIterationID
join [Test_Merge2].[dbo].[Revision] RV1 on RV1.RevisionId = I1.RevisionId
join [Test_Merge2].[dbo].[ItemNumber] IN1 on IN1.ItemMasterID = RV1.MasterId
join [Test_Merge2].[dbo].[Property] PR1 on II1.ItemIterationID = PR1.EntityID
WHERE IN1.ItemNumber in ('100004')

-- 2148
SELECT * FROM [Test_Merge].[dbo].[Property]

-- 777
SELECT * FROM [Test_Merge2].[dbo].[Property]

-- 75*14 = 1050

-- see what's different about between version 1-13 and 14, 15
SELECT IN1.ItemNumber, PR1.Value AS 'StateHistorical', II1.ItemIterationID AS ItemIterationID1, I1.IterationNumber
FROM [Test_Merge2].[dbo].[Iteration] I1
join [Test_Merge2].[dbo].[ItemIteration] II1 on I1.IterationID = II1.ItemIterationID
join [Test_Merge2].[dbo].[Revision] RV1 on RV1.RevisionId = I1.RevisionId
join [Test_Merge2].[dbo].[ItemNumber] IN1 on IN1.ItemMasterID = RV1.MasterId
join [Test_Merge2].[dbo].[Property] PR1 on II1.ItemIterationID = PR1.EntityID
WHERE IN1.ItemNumber in ('100004')

SELECT I1.*, II1.*, RV1.*, IN1.*
FROM [Test_Merge2].[dbo].[Iteration] I1
join [Test_Merge2].[dbo].[ItemIteration] II1 on I1.IterationID = II1.ItemIterationID
join [Test_Merge2].[dbo].[Revision] RV1 on RV1.RevisionId = I1.RevisionId
join [Test_Merge2].[dbo].[ItemNumber] IN1 on IN1.ItemMasterID = RV1.MasterId
WHERE IN1.ItemNumber in ('100004')

SELECT I1.*, II1.*, E1.*
FROM [Test_Merge2].[dbo].[Iteration] I1
JOIN [Test_Merge2].[dbo].[ItemIteration] II1 on I1.IterationID = II1.ItemIterationID
JOIN [Test_Merge2].[dbo].[Entity] E1 on I1.IterationID = E1.EntityId
JOIN [Test_Merge2].[dbo].[Revision] RV1 on RV1.RevisionId = I1.RevisionId
JOIN [Test_Merge2].[dbo].[ItemNumber] IN1 on IN1.ItemMasterID = RV1.MasterId
WHERE IN1.ItemNumber in ('100004')

SELECT I1.*, II1.*, E1.*, EC1.*
FROM [Test_Merge].[dbo].[Iteration] I1
JOIN [Test_Merge].[dbo].[ItemIteration] II1 on I1.IterationID = II1.ItemIterationID
JOIN [Test_Merge].[dbo].[Entity] E1 on I1.IterationID = E1.EntityId
JOIN [Test_Merge].[dbo].[EntityChanges] EC1 on E1.EntityId = EC1.EntityId
JOIN [Test_Merge].[dbo].[Revision] RV1 on RV1.RevisionId = I1.RevisionId
JOIN [Test_Merge].[dbo].[ItemNumber] IN1 on IN1.ItemMasterID = RV1.MasterId
WHERE IN1.ItemNumber in ('100004')

SELECT I1.*, II1.*, E1.*, EC1.*
FROM [Test_Merge2].[dbo].[Iteration] I1
JOIN [Test_Merge2].[dbo].[ItemIteration] II1 on I1.IterationID = II1.ItemIterationID
JOIN [Test_Merge2].[dbo].[Entity] E1 on I1.IterationID = E1.EntityId
JOIN [Test_Merge2].[dbo].[EntityChanges] EC1 on E1.EntityId = EC1.EntityId
JOIN [Test_Merge2].[dbo].[Revision] RV1 on RV1.RevisionId = I1.RevisionId
JOIN [Test_Merge2].[dbo].[ItemNumber] IN1 on IN1.ItemMasterID = RV1.MasterId
WHERE IN1.ItemNumber in ('100004')

SELECT * FROM [Test_Merge2].[dbo].[AssociationPropertyDef]
SELECT * FROM [Test_Merge2].[dbo].[BehaviorClass]


SELECT I1.*, II1.*, E1.*, ELCS1.*
FROM [Test_Merge].[dbo].[Iteration] I1
JOIN [Test_Merge].[dbo].[ItemIteration] II1 on I1.IterationID = II1.ItemIterationID
JOIN [Test_Merge].[dbo].[Entity] E1 on I1.IterationID = E1.EntityId
JOIN [Test_Merge].[dbo].[EntityLifeCycleState] ELCS1 on E1.EntityId = ELCS1.EntityID
JOIN [Test_Merge].[dbo].[Revision] RV1 on RV1.RevisionId = I1.RevisionId
JOIN [Test_Merge].[dbo].[ItemNumber] IN1 on IN1.ItemMasterID = RV1.MasterId
WHERE IN1.ItemNumber in ('100004')

SELECT I1.*, II1.*, E1.*, ELCS1.*
FROM [Test_Merge2].[dbo].[Iteration] I1
JOIN [Test_Merge2].[dbo].[ItemIteration] II1 on I1.IterationID = II1.ItemIterationID
JOIN [Test_Merge2].[dbo].[Entity] E1 on I1.IterationID = E1.EntityId
JOIN [Test_Merge2].[dbo].[EntityLifeCycleState] ELCS1 on E1.EntityId = ELCS1.EntityID
JOIN [Test_Merge2].[dbo].[Revision] RV1 on RV1.RevisionId = I1.RevisionId
JOIN [Test_Merge2].[dbo].[ItemNumber] IN1 on IN1.ItemMasterID = RV1.MasterId
WHERE IN1.ItemNumber in ('100004')

SELECT I1.*, II1.*, E1.*, ES1.*
FROM [Test_Merge2].[dbo].[Iteration] I1
JOIN [Test_Merge2].[dbo].[ItemIteration] II1 on I1.IterationID = II1.ItemIterationID
JOIN [Test_Merge2].[dbo].[Entity] E1 on I1.IterationID = E1.EntityId
JOIN [Test_Merge2].[dbo].[EntitySecurity] ES1 on E1.EntityId = ES1.EntityId
JOIN [Test_Merge2].[dbo].[Revision] RV1 on RV1.RevisionId = I1.RevisionId
JOIN [Test_Merge2].[dbo].[ItemNumber] IN1 on IN1.ItemMasterID = RV1.MasterId
WHERE IN1.ItemNumber in ('100004')

-- see if the iteration is controlled
SELECT I1.*, II1.*, EC1.*
FROM [Test_Merge].[dbo].[Iteration] I1
JOIN [Test_Merge].[dbo].[ItemIteration] II1 on I1.IterationID = II1.ItemIterationID
JOIN [Test_Merge].[dbo].[IterationControl] EC1 on I1.IterationID = EC1.IterationID
JOIN [Test_Merge].[dbo].[Revision] RV1 on RV1.RevisionId = I1.RevisionId
JOIN [Test_Merge].[dbo].[ItemNumber] IN1 on IN1.ItemMasterID = RV1.MasterId
WHERE IN1.ItemNumber in ('100004')


-- see if the iteration is controlled
SELECT I1.*, II1.*, IC1.*
FROM [Test_Merge2].[dbo].[Iteration] I1
JOIN [Test_Merge2].[dbo].[ItemIteration] II1 on I1.IterationID = II1.ItemIterationID
JOIN [Test_Merge2].[dbo].[IterationControl] IC1 on I1.IterationID = IC1.IterationID
JOIN [Test_Merge2].[dbo].[Revision] RV1 on RV1.RevisionId = I1.RevisionId
JOIN [Test_Merge2].[dbo].[ItemNumber] IN1 on IN1.ItemMasterID = RV1.MasterId
WHERE IN1.ItemNumber in ('100004')


-- combined
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
WHERE IN1.ItemNumber in ('100004') AND IN1.ItemNumber = IN2.ItemNumber



-- UPDATE IterationControl Test_Merge2
UPDATE [Test_Merge2].[dbo].[IterationControl] SET Controlled = IC1.Controlled
FROM [Test_Merge].[dbo].[Iteration] I1
JOIN [Test_Merge].[dbo].[ItemIteration] II1 ON I1.IterationID = II1.ItemIterationID
JOIN [Test_Merge].[dbo].[IterationControl] IC1 on I1.IterationID = IC1.IterationID
JOIN [Test_Merge].[dbo].[Revision] RV1 ON I1.RevisionId = RV1.RevisionId
JOIN [Test_Merge].[dbo].[ItemNumber] IN1 ON RV1.MasterId = IN1.ItemMasterID
JOIN [Test_Merge2].[dbo].[Iteration] I2 ON I1.IterationNumber = I2.IterationNumber
JOIN [Test_Merge2].[dbo].[ItemIteration] II2 ON I2.IterationID = II2.ItemIterationID
JOIN [Test_Merge2].[dbo].[IterationControl] IC2 on I2.IterationID = IC2.IterationID
JOIN [Test_Merge2].[dbo].[Revision] RV2 ON I2.RevisionId = RV2.RevisionId
JOIN [Test_Merge2].[dbo].[ItemNumber] IN2 ON RV2.MasterId = IN2.ItemMasterID
WHERE IN1.ItemNumber in ('100004') AND IN1.ItemNumber = IN2.ItemNumber

-- Thursday July 1, 2021

-- [UpdateIterationControlInfo] stored procedure does the same thing
DECLARE @UL t_value;
INSERT @UL VALUES (161),(162),(163),(164),(165),(166),(167),(168),(169),(170),(171),(172),(173)
-- SELECT * FROM @UL
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfo] @iterationIds = @UL

UPDATE [Test_Merge2].[dbo].[IterationControl] SET Controlled = 0 WHERE IterationID IN (161,162,163,164,165,166,167,168,169,170,171,172,173)


-- test the purge option flags
USE Test_Merge2
SELECT * FROM dbo.IterationControl  ic
Inner Join dbo.Iteration i on ic.IterationId = i.IterationId
Inner Join dbo.EntityLifecycleState elcs on elcs.entityId = i.MasterID
Inner Join dbo.Lifecyclestate lcs on lcs.lifecyclestateId = elcs.lifecyclestateId
Where ic.IterationId = 170 AND lcs.RestrictPurgeOption=0

USE Test_Merge
SELECT * FROM dbo.IterationControl  ic
Inner Join dbo.Iteration i on ic.IterationId = i.IterationId
Inner Join dbo.EntityLifecycleState elcs on elcs.entityId = i.MasterID
Inner Join dbo.Lifecyclestate lcs on lcs.lifecyclestateId = elcs.lifecyclestateId
Where ic.IterationId = 352 AND lcs.RestrictPurgeOption=0


SELECT OBJECT_NAME(OBJECT_ID),
definition
FROM sys.sql_modules
WHERE definition LIKE '%' + 'Controlled' + '%'
GO

-- Search in Stored Procedure Only
-- finds many
SELECT DISTINCT OBJECT_NAME(OBJECT_ID),
object_definition(OBJECT_ID)
FROM sys.Procedures
WHERE object_definition(OBJECT_ID) LIKE '%' + 'Controlled' + '%'
GO

-- Item release process is 7
SELECT * FROM [Test_Merge2].[dbo].[LifeCycleDefinition]

-- 27 through 31 are Item Release Process
SELECT * FROM [Test_Merge2].[dbo].[LifecycleState]

EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory] 27
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory] 28
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory] 29
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory] 30
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory] 31

-- Search in Stored Procedure Only
-- finds many
SELECT DISTINCT OBJECT_NAME(OBJECT_ID),
object_definition(OBJECT_ID)
FROM sys.Procedures
WHERE object_definition(OBJECT_ID) LIKE '%' + 'UpdateIterationControlInfoOnHistory' + '%'
GO

-- search all objects
SELECT OBJECT_NAME(OBJECT_ID),
definition
FROM sys.sql_modules
WHERE definition LIKE '%' + 'UpdateIterationControlInfoOnHistory' + '%'
GO

SELECT * FROM ItemMaster
SELECT * FROM Master

-- search for "Controlled" column name
SELECT      c.name  AS 'ColumnName'
            ,t.name AS 'TableName'
FROM        sys.columns c
JOIN        sys.tables  t   ON c.object_id = t.object_id
WHERE       c.name LIKE '%Controlled%'
ORDER BY    TableName
            ,ColumnName;

-- search for "Lock" column name
-- nothing
SELECT      c.name  AS 'ColumnName'
            ,t.name AS 'TableName'
FROM        sys.columns c
JOIN        sys.tables  t   ON c.object_id = t.object_id
WHERE       c.name LIKE '%Lock%'
ORDER BY    TableName
            ,ColumnName;

SELECT * FROM Entity
SELECT * FROM Iteration
SELECT * FROM Master


SELECT OBJECT_NAME(OBJECT_ID),
definition
FROM sys.sql_modules
WHERE definition LIKE '%' + 'Controlled' + '%'
GO


-- Friday July 9, 2021
USE Test_Merge2


-- combined - all properties - not just State Historical
-- yeilds 75 results
SELECT IN1.ItemNumber, PR1.PropertyDefID, PR1.Value, II1.ItemIterationID AS ItemIterationID1, I1.IterationNumber, II2.ItemIterationID AS ItemIterationID2
FROM [Test_Merge].[dbo].[Iteration] I1
JOIN [Test_Merge].[dbo].[ItemIteration] II1 ON I1.IterationID = II1.ItemIterationID
JOIN [Test_Merge].[dbo].[Revision] RV1 ON I1.RevisionId = RV1.RevisionId
JOIN [Test_Merge].[dbo].[ItemNumber] IN1 ON RV1.MasterId = IN1.ItemMasterID
JOIN [Test_Merge].[dbo].[Property] PR1 ON II1.ItemIterationID = PR1.EntityID
JOIN [Test_Merge2].[dbo].[Iteration] I2 ON I1.IterationNumber = I2.IterationNumber
join [Test_Merge2].[dbo].[ItemIteration] II2 ON I2.IterationID = II2.ItemIterationID
join [Test_Merge2].[dbo].[Revision] RV2 ON I2.RevisionId = RV2.RevisionId
join [Test_Merge2].[dbo].[ItemNumber] IN2 ON RV2.MasterId = IN2.ItemMasterID
WHERE IN1.ItemNumber in ('100004') AND IN1.ItemNumber = IN2.ItemNumber


-- insert into Test_Merge2 ALL properties
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
WHERE IN1.ItemNumber in ('100004') AND IN1.ItemNumber = IN2.ItemNumber

-- look at the IterationControl table on both databases
-- compare the Controlled column between the two
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
WHERE IN1.ItemNumber in ('100004') AND IN1.ItemNumber = IN2.ItemNumber

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

-- Item release process is 7
SELECT * FROM [Test_Merge2].[dbo].[LifeCycleDefinition]

-- 27 through 31 are Item Release Process
SELECT * FROM [Test_Merge2].[dbo].[LifecycleState]

EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory] 27
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory] 28
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory] 29
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory] 30
EXEC [Test_Merge2].[dbo].[UpdateIterationControlInfoOnHistory] 31


-- insert into 100002
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
WHERE IN1.ItemNumber IN ('100002') AND IN1.ItemNumber = IN2.ItemNumber


-- Wednesday July 14, 2021
USE Test_Merge2

-- insert ONLY those properties that DO NOT EXIST

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


-- run the following 2x to see if it does not insert the second time
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
WHERE IN1.ItemNumber IN ('100002') AND IN1.ItemNumber = IN2.ItemNumber
AND NOT EXISTS (SELECT *
                     FROM [Test_Merge2].[dbo].[Property] PR2
                     WHERE PR2.PropertyDefID = PR1.PropertyDefID
                     AND   PR2.EntityID = II2.ItemIterationID)


-- now we can insert missing properties for all Items
-- without worrying about overwriting them
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

-- the following counts were from a Test_Merge2 that was purged
-- check the count on the properties
-- 2154
SELECT COUNT(*) FROM [Test_Merge].[dbo].[Property]

-- 2120 -- 
SELECT COUNT(*) FROM [Test_Merge2].[dbo].[Property]

-- the following counts were from a Test_Merge2 that was loaded directly from the VaultBCP export from Test_Merge Vault
-- check the count on the properties
-- 2154
SELECT COUNT(*) FROM [Test_Merge].[dbo].[Property]

-- 2166
SELECT COUNT(*) FROM [Test_Merge2].[dbo].[Property]

-- backup Test_Merge2
-- 27 through 31 are Item Release Process
SELECT * FROM [Test_Merge2].[dbo].[LifecycleState]

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

-- look at the IterationControl table on both databases
-- compare the Controlled column between the two
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
WHERE IN1.ItemNumber in ('100004') AND IN1.ItemNumber = IN2.ItemNumber

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

-- trying to get lock back on content
-- backup Test_Merge2
-- Version forward 100002, 100003, and 100004
-- then Roll Back Lifecycle Change State

-- restore Test_Merge2 to Test_Merge2Restore

-- get the table names and counts
-- combine them to get table name, number of rows, and number of columns

USE Test_Merge2
USE Test_Merge2Restore

-- use the following to compare
-- there was no difference in the column count and row count
-- the roll back seemed to have worked
SELECT      T.name TableName, I.Rows NumberOfRows, COUNT(ISC.TABLE_NAME) AS ColumnCount
FROM        sys.tables T
INNER JOIN        sys.sysindexes I ON T.OBJECT_ID = I.ID
INNER JOIN INFORMATION_SCHEMA.COLUMNS ISC ON T.name = ISC.TABLE_NAME
WHERE       indid IN (0,1)
GROUP BY T.name, I.Rows
ORDER BY    I.Rows DESC,T.name


-- everything known about Iteration
SELECT *
FROM [Test_Merge2].[dbo].[Iteration] I1
JOIN [Test_Merge2].[dbo].[ItemIteration] II1 ON I1.IterationID = II1.ItemIterationID
JOIN [Test_Merge2].[dbo].[IterationControl] IC1 on I1.IterationID = IC1.IterationID
JOIN [Test_Merge2].[dbo].[Revision] RV1 ON I1.RevisionId = RV1.RevisionId
JOIN [Test_Merge2].[dbo].[ItemNumber] IN1 ON RV1.MasterId = IN1.ItemMasterID
JOIN [Test_Merge2].[dbo].[Master] M1 ON RV1.MasterId = M1.MasterID
WHERE IN1.ItemNumber in ('100004')

SELECT *
FROM [Test_Merge2Restore].[dbo].[Iteration] I1
JOIN [Test_Merge2Restore].[dbo].[ItemIteration] II1 ON I1.IterationID = II1.ItemIterationID
JOIN [Test_Merge2Restore].[dbo].[IterationControl] IC1 on I1.IterationID = IC1.IterationID
JOIN [Test_Merge2Restore].[dbo].[Revision] RV1 ON I1.RevisionId = RV1.RevisionId
JOIN [Test_Merge2Restore].[dbo].[ItemNumber] IN1 ON RV1.MasterId = IN1.ItemMasterID
JOIN [Test_Merge2Restore].[dbo].[Master] M1 ON RV1.MasterId = M1.MasterID
WHERE IN1.ItemNumber in ('100004')

SELECT * FROM Locks

SELECT * FROM [Test_Merge2].[dbo].[MasterChangesAll] WHERE MasterId = 95
SELECT * FROM [Test_Merge2Restore].[dbo].[MasterChangesAll] WHERE MasterId = 95

SELECT * FROM [Test_Merge2].[dbo].[MasterChangesTip] WHERE MasterId = 95
SELECT * FROM [Test_Merge2Restore].[dbo].[MasterChangesTip] WHERE MasterId = 95


SELECT * FROM [Test_Merge2].[dbo].[PropertyDefOnEntity] WHERE EntityId = 156
SELECT * FROM [Test_Merge2].[dbo].[PropertyDefOnEntity] WHERE EntityId = 156

SELECT * FROM [Test_Merge2].[dbo].[WorkflowCase]

SELECT * FROM [Test_Merge2].[dbo].[Temp_ToBeLocked]

SELECT * FROM [Test_Merge2].[dbo].[Property]

SELECT * FROM [Test_Merge2].[dbo].[Entity]
SELECT * FROM [Test_Merge2Restore].[dbo].[Entity]

-- stamp seems to have changed for the three we adjusted
SELECT * FROM [Test_Merge2].[dbo].[EntityOwner]
SELECT * FROM [Test_Merge2Restore].[dbo].[EntityOwner]


SELECT *
FROM [Test_Merge2].[dbo].[Iteration] I1
JOIN [Test_Merge2].[dbo].[ItemIteration] II1 ON I1.IterationID = II1.ItemIterationID
JOIN [Test_Merge2].[dbo].[IterationControl] IC1 on I1.IterationID = IC1.IterationID
JOIN [Test_Merge2].[dbo].[Revision] RV1 ON I1.RevisionId = RV1.RevisionId
JOIN [Test_Merge2].[dbo].[ItemNumber] IN1 ON RV1.MasterId = IN1.ItemMasterID
JOIN [Test_Merge2].[dbo].[Master] M1 ON RV1.MasterId = M1.MasterID
WHERE IN1.ItemNumber in ('100001')

SELECT *
FROM [Test_Merge].[dbo].[Iteration] I1
JOIN [Test_Merge].[dbo].[ItemIteration] II1 ON I1.IterationID = II1.ItemIterationID
JOIN [Test_Merge].[dbo].[IterationControl] IC1 on I1.IterationID = IC1.IterationID
JOIN [Test_Merge].[dbo].[Revision] RV1 ON I1.RevisionId = RV1.RevisionId
JOIN [Test_Merge].[dbo].[ItemNumber] IN1 ON RV1.MasterId = IN1.ItemMasterID
JOIN [Test_Merge].[dbo].[Master] M1 ON RV1.MasterId = M1.MasterID
WHERE IN1.ItemNumber in ('100001')

-- MasterID = 92
UPDATE [Test_Merge2].[dbo].[EntityOwner]
SET Stamp = 11
WHERE EntityID = 92

SELECT * FROM [Test_Merge2].[dbo].[EntityChanges]

SELECT * FROM [Test_Merge2].[dbo].[EntityLifeCycleState]
SELECT * FROM [Test_Merge2Restore].[dbo].[EntityLifeCycleState]

SELECT * FROM [Test_Merge].[dbo].[EntitySecurity]
SELECT * FROM [Test_Merge2].[dbo].[EntitySecurity]
SELECT * FROM [Test_Merge2Restore].[dbo].[EntitySecurity]

-- SEEMS that EntitySecurity is important
UPDATE [Test_Merge2].[dbo].[EntitySecurity]
SET SystemAclId = 27
WHERE EntityID = 92


-- seems the SystemAclId is important
SELECT *
FROM [Test_Merge].[dbo].[Iteration] I1
JOIN [Test_Merge].[dbo].[ItemIteration] II1 ON I1.IterationID = II1.ItemIterationID
JOIN [Test_Merge].[dbo].[Revision] RV1 ON I1.RevisionId = RV1.RevisionId
JOIN [Test_Merge].[dbo].[ItemNumber] IN1 ON RV1.MasterId = IN1.ItemMasterID
JOIN [Test_Merge2].[dbo].[Iteration] I2 ON I1.IterationNumber = I2.IterationNumber
join [Test_Merge2].[dbo].[ItemIteration] II2 ON I2.IterationID = II2.ItemIterationID
join [Test_Merge2].[dbo].[Revision] RV2 ON I2.RevisionId = RV2.RevisionId
join [Test_Merge2].[dbo].[ItemNumber] IN2 ON RV2.MasterId = IN2.ItemMasterID
WHERE IN1.ItemNumber = IN2.ItemNumber

SELECT *
FROM [Test_Merge].[dbo].[ItemMaster] IM1
JOIN [Test_Merge].[dbo].[ItemNumber] IN1 ON IM1.ItemMasterID = IN1.ItemMasterID
JOIN [Test_Merge].[dbo].[EntitySecurity] ES1 ON IM1.ItemMasterID = ES1.EntityId 
JOIN [Test_Merge2].[dbo].[ItemNumber] IN2 ON IN1.ItemNumber = IN2.ItemNumber
JOIN [Test_Merge2].[dbo].[EntitySecurity] ES2 ON IN2.ItemMasterID = ES2.EntityId 

-- Wednesday July 14, 2021
-- update SystemAclId for Items
USE [Test_Merge2]

SELECT IM1.ItemMasterID, IN1.ItemNumber, ES1.SystemAclId, ES2.SystemAclId
FROM [Test_Merge].[dbo].[ItemMaster] IM1
JOIN [Test_Merge].[dbo].[ItemNumber] IN1 ON IM1.ItemMasterID = IN1.ItemMasterID
JOIN [Test_Merge].[dbo].[EntitySecurity] ES1 ON IM1.ItemMasterID = ES1.EntityId 
JOIN [Test_Merge2].[dbo].[ItemNumber] IN2 ON IN1.ItemNumber = IN2.ItemNumber
JOIN [Test_Merge2].[dbo].[EntitySecurity] ES2 ON IN2.ItemMasterID = ES2.EntityId 

SELECT * FROM [Test_Merge2].[dbo].[EntitySecurity] WHERE SystemAclId = 27

-- now we can update SystemAclId for all Items
-- and it will show the lock on Items that need it
UPDATE [Test_Merge2].[dbo].[EntitySecurity]
SET SystemAclId = ES1.SystemAclId
FROM [Test_Merge].[dbo].[ItemMaster] IM1
JOIN [Test_Merge].[dbo].[ItemNumber] IN1 ON IM1.ItemMasterID = IN1.ItemMasterID
JOIN [Test_Merge].[dbo].[EntitySecurity] ES1 ON IM1.ItemMasterID = ES1.EntityId 
JOIN [Test_Merge2].[dbo].[ItemNumber] IN2 ON IN1.ItemNumber = IN2.ItemNumber
JOIN [Test_Merge2].[dbo].[EntitySecurity] ES2 ON IN2.ItemMasterID = ES2.EntityId 

SELECT * FROM [Test_Merge2].[dbo].[EntitySecurity]

-- Unknown what the Stamp means? or if that is important
-- stamp seems to have changed for the three we adjusted
SELECT * FROM [Test_Merge2].[dbo].[EntityOwner] WHERE EntityId = 92
SELECT * FROM [Test_Merge2Restore].[dbo].[EntityOwner] WHERE EntityId = 92



-- search for "SystemAclId" column name
-- Only on EntitySecurity
SELECT      c.name  AS 'ColumnName'
            ,t.name AS 'TableName'
FROM        sys.columns c
JOIN        sys.tables  t   ON c.object_id = t.object_id
WHERE       c.name LIKE '%SystemAclId%'
ORDER BY    TableName
            ,ColumnName;

-- search for SystemAclId in stored procedures
SELECT OBJECT_NAME(OBJECT_ID),
definition
FROM sys.sql_modules
WHERE definition LIKE '%' + 'SystemAclId' + '%'
GO


-- search for SystemAclId in stored procedures
SELECT OBJECT_NAME(OBJECT_ID),
definition
FROM sys.sql_modules
WHERE definition LIKE '%' + 'UpdateEntitySystemACL' + '%'
GO



--Stored procedures that reference SystemAclId
--OnReadAccessChanged
--GetDeletedRowsAndAceEntriesForUserAndEntities
--PropagateACL
--GetRelationEntityACL
--UpdateEntityACL
--UpdateEntitySystemACL
--CleanupEntityACLs
--GetEntitiesOnACL
--GetEntityAclSets
--SetSystemAcl
--SetSystemAcls

