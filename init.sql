CREATE TABLE `coaches` (
  `coachid` int NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `team` int DEFAULT NULL,
  PRIMARY KEY (`coachid`),
  KEY `team_idx` (`team`),
  CONSTRAINT `coach_team` FOREIGN KEY (`team`) REFERENCES `teams` (`teamid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `formations` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `leagues` (
  `league_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`league_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `player_stats` (
  `player_id` int NOT NULL,
  `goals` int DEFAULT NULL,
  `assists` int DEFAULT NULL,
  `saves` int DEFAULT NULL,
  `tackles` int DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  UNIQUE KEY `player_id_UNIQUE` (`player_id`),
  CONSTRAINT `playerid_stats` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `players` (
  `player_id` int NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `position` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `team` int DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  UNIQUE KEY `player_id_UNIQUE` (`player_id`),
  KEY `player_team_idx` (`team`),
  CONSTRAINT `player_team` FOREIGN KEY (`team`) REFERENCES `teams` (`teamid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `teams` (
  `teamid` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `formation` int NOT NULL,
  `league` int NOT NULL,
  KEY `team_idx` (`teamid`),
  KEY `team_league` (`league`),
  CONSTRAINT `team_leagueid` FOREIGN KEY (`league`) REFERENCES `leagues` (`league_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
