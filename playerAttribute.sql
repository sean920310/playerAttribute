ALTER TABLE `users` ADD COLUMN
(
	`attr` LONGTEXT NULL DEFAULT '{"maxHealth":500,"maxStamina":150,"criticalStrikeRate":0,"criticalStrikeHarm":0,"physicalDefense":0,"magicDefense":0,"physicalAttack":0,"magicAttack":0}' COLLATE 'utf8mb4_bin'
) 