CREATE TABLE games (
  id INT PRIMARY KEY AUTO_INCREMENT COMMENT 'ゲームID',
  winner_disc INT COMMENT '勝者のコマの色',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'ゲーム開始日時',
  end_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'ゲーム更新日時'
);

CREATE TABLE turns (
  id INT PRIMARY KEY AUTO_INCREMENT COMMENT 'ターンID',
  game_id INT NOT NULL COMMENT 'ゲームID',
  turn_count INT NOT NULL COMMENT '○ターン目',
  x INT NOT NULL COMMENT '盤面のx座標',
  y INT NOT NULL COMMENT '盤面のy座標',
  disc INT NOT NULL COMMENT 'コマの種類',
  next_disc INT NOT NULL COMMENT '次のターンのコマの種類',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
  FOREIGN KEY (game_id) REFERENCES games(id),
  UNIQUE (game_id, turn_count)
);

CREATE TABLE squares (
  id INT PRIMARY KEY AUTO_INCREMENT COMMENT 'マス目ID',
  turn_id INT NOT NULL  COMMENT 'ターンID',
  x INT NOT NULL COMMENT '盤面のx座標',
  y INT NOT NULL COMMENT '盤面のy座標',
  disc INT NOT NULL COMMENT 'コマの種類',
  FOREIGN KEY (turn_id) REFERENCES turns(id),
  UNIQUE (turn_id, x, y)
);

CREATE TABLE discs (
  id INT PRIMARY KEY AUTO_INCREMENT COMMENT '主キー',
  kind_disc_id INT NOT NULL COMMENT 'コマの識別ID',
  disc_description VARCHAR(10) NOT NULL COMMENT 'コマの詳細'
);
