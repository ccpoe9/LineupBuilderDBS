import { Component, OnInit } from '@angular/core';
import { TeamService } from '../team.service';

@Component({
  selector: 'app-leaderboard',
  templateUrl: './leaderboard.component.html',
  styleUrls: ['./leaderboard.component.scss']
})
export class LeaderboardComponent implements OnInit{

  teams : any[] = [];

  sortBySelected = "";
  constructor(private teamservice : TeamService){}

  ngOnInit(): void {
    this.sortBySelected = "Alphabetical order by team name";
    this.getAllTeams();
  }



  getAllTeams(){
    this.teamservice.getAllTeamsWithStats().subscribe( data => {
      this.teams = data[0];
    });
  }

}
