import { Component, OnInit } from '@angular/core';
import { TeamService } from '../team.service';

@Component({
  selector: 'app-leaderboard',
  templateUrl: './leaderboard.component.html',
  styleUrls: ['./leaderboard.component.scss']
})
export class LeaderboardComponent implements OnInit{

  teams : any[] = [];

  sortBySelected = "A-Z";

  constructor(private teamservice : TeamService){}

  ngOnInit(): void {
    this.getAllTeams();
  }



  getAllTeams(){
    this.teamservice.getAllTeamsWithStats('name', 'ASC').subscribe( data => {
      this.teams = data[0];
    });
  }

  changeSelected(newValue : string, orderBy : string, orderDir : string){
    this.sortBySelected = newValue;
    this.teamservice.getAllTeamsWithStats(orderBy, orderDir).subscribe( data => {
      this.teams = data[0];
      console.log(this.teams);
    });
  }

}
