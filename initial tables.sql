/* create database */
CREATE DATABASE worldcup

/* connect to database */
USE worldcup

/* create table 'game' to store the games information, identity(1,1) for starting value of ID and increment*/

CREATE TABLE games (
    game_id integer NOT NULL identity(1,1,
    year integer NOT NULL,
    round character varying(50) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);

/* create table 'teams' to store the teams information, both winners and opponents, identity(1,1) for starting value of ID and increment*/ 

CREATE TABLE teams (
    team_id integer NOT NULL identity(1,1),
    name character varying(50) NOT NULL
);

/* add unique constraint on team names */

ALTER TABLE teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);

/* add primary key constraints */

ALTER TABLE games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);

ALTER TABLE teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);

/* add foreign keys */

ALTER TABLE games
    ADD CONSTRAINT fk_winner_id FOREIGN KEY (winner_id) REFERENCES teams(team_id);

ALTER TABLE games
    ADD CONSTRAINT fkopponent_id FOREIGN KEY (opponent_id) REFERENCES teams(team_id);

/* tableas are empty and data will be inserted by running the script insert_data.sh */
