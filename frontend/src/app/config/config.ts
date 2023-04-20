export class Config{

    static readonly APIROOT = "http://localhost:3000";

    static readonly APIURLS = {
        FORMATIONS : "/formations",
        LEAGUES : "/leagues",
        TEAMS : "/teams",
        TEAMSTATS : "/teams/stats",
        TEAMPLAYERS : "/teams/:id/players",
        PLAYERS : "/players",
        PLAYERSTATS : "/players/stats",
        COACHES : "/coaches",
        PLAYERSORT : "/players/sort/byposition"
    }
}