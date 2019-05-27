--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Types
-------------------------------------	
INSERT INTO Types	
		(Type,									Kind)
VALUES	('TRAIT_CIVILIZATION_UNIT_MERKAVA',	'KIND_TRAIT'),
		('UNIT_MERKAVA',					'KIND_UNIT');
-------------------------------------			
-- Traits			
-------------------------------------				
INSERT INTO Traits				
		(TraitType,							Name,						Description)
VALUES	('TRAIT_CIVILIZATION_UNIT_MERKAVA',	'LOC_UNIT_MERKAVA_NAME',	'LOC_UNIT_MERKAVA_DESCRIPTION');
-------------------------------------
-- CivilizationTraits
-------------------------------------	
INSERT INTO CivilizationTraits	
		(CivilizationType,			TraitType)
VALUES	('CIVILIZATION_LEU_ISRAEL',	'TRAIT_CIVILIZATION_UNIT_MERKAVA');
-----------------------------------------------------------------------------------
-- Units
-----------------------------------------------------------------------------------	
INSERT INTO Units	
		(UnitType,		BaseMoves, 	 Cost, AdvisorType, BaseSightRange, ZoneOfControl, Domain, FormationClass, Name,					Description,				 	MandatoryObsoleteTech, PurchaseYield, PromotionClass, Maintenance, Combat,	PrereqTech,	TraitType,							Range,	RangedCombat)
SELECT  'UNIT_MERKAVA',	BaseMoves, 	 Cost, AdvisorType, BaseSightRange, ZoneOfControl, Domain, FormationClass, 'LOC_UNIT_MERKAVA_NAME',	'LOC_UNIT_MERKAVA_DESCRIPTION', MandatoryObsoleteTech, PurchaseYield, PromotionClass, Maintenance, 96,		PrereqTech,	'TRAIT_CIVILIZATION_UNIT_MERKAVA',	Range,	RangedCombat
FROM Units WHERE UnitType = 'UNIT_MODERN_ARMOR';
-----------------------------------------------------------------------------------
-- UnitReplaces
-----------------------------------------------------------------------------------	
INSERT INTO UnitReplaces	
		(CivUniqueUnitType,	ReplacesUnitType)
VALUES	('UNIT_MERKAVA',	'UNIT_MODERN_ARMOR');
-----------------------------------------------------------------------------------
-- UnitAIInfos
-----------------------------------------------------------------------------------	
INSERT INTO UnitAIInfos	
		(UnitType,		AiType)
SELECT  'UNIT_MERKAVA',	AiType
FROM UnitAIInfos WHERE UnitType = 'UNIT_MODERN_ARMOR'; 
-----------------------------------------------------------------------------------
-- Tags
-----------------------------------------------------------------------------------	
INSERT INTO Tags	
		(Tag,				Vocabulary)
VALUES	('CLASS_MERKAVA',	'ABILITY_CLASS');
-----------------------------------------------------------------------------------
-- TypeTags
-----------------------------------------------------------------------------------	
INSERT INTO TypeTags
		(Type,			Tag)
SELECT  'UNIT_MERKAVA',	Tag
FROM TypeTags WHERE Type = 'UNIT_MODERN_ARMOR';

INSERT INTO TypeTags
		(Type,				Tag)
VALUES	('UNIT_MERKAVA',	'CLASS_MERKAVA'),
		('UNIT_MERKAVA',	'CLASS_WAR_CART');
--==========================================================================================================================
-- UNITS: ABILITIES
--==========================================================================================================================
-- Types
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Types	
		(Type,				Kind)
VALUES	('ABILITY_MERKAVA',	'KIND_ABILITY');
-----------------------------------------------------------------------------------
-- TypeTags
-----------------------------------------------------------------------------------	
INSERT INTO TypeTags	
		(Type,				Tag)
VALUES	('ABILITY_MERKAVA',	'CLASS_MERKAVA');	
-----------------------------------------------------------------------------------
-- UnitAbilities
-----------------------------------------------------------------------------------	
INSERT INTO UnitAbilities	
		(UnitAbilityType,	Name,						Inactive,	Description)
VALUES	('ABILITY_MERKAVA',	'LOC_ABILITY_MERKAVA_NAME',	0,			'LOC_ABILITY_MERKAVA_DESCRIPTION');
-----------------------------------------------------------------------------------
-- UnitAbilityModifiers
-----------------------------------------------------------------------------------	
INSERT INTO UnitAbilityModifiers	
		(UnitAbilityType,	ModifierId)
VALUES	('ABILITY_MERKAVA',	'MERKAVA_FAITH_KILL'),
		('ABILITY_MERKAVA',	'HETAIROI_FREE_PROMOTION');
-----------------------------------------------------------------------------------
-- Modifiers
-----------------------------------------------------------------------------------	
INSERT INTO Modifiers	
		(ModifierId,			ModifierType,								SubjectRequirementSetId)
VALUES	('MERKAVA_FAITH_KILL',	'MODIFIER_UNIT_ADJUST_POST_COMBAT_YIELD',	null);
-----------------------------------------------------------------------------------	
-- ModifierArguments		
-----------------------------------------------------------------------------------	
INSERT INTO ModifierArguments		
		(ModifierId,			Name,						Value)
VALUES	('MERKAVA_FAITH_KILL',	'YieldType',				'YIELD_FAITH'),
		('MERKAVA_FAITH_KILL',	'PercentDefeatedStrength',	50);
--==========================================================================================================================
--==========================================================================================================================