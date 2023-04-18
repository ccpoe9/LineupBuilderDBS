import { Component } from '@angular/core';
import { TeamService } from '../team.service';
import { switchMap } from 'rxjs';

@Component({
  selector: 'app-myteam',
  templateUrl: './myteam.component.html',
  styleUrls: ['./myteam.component.scss']
})
export class MyteamComponent {

  constructor(private teamservice : TeamService){}

  formations : any[] = [];
  leagues : any[] = [];

  playerSlots = [
    {
      playerName : "<empty slot>", 
      position : "None",
      Rating : 0 
    },
    {
      playerName : "<empty slot>", 
      position : "None",
      Rating : 0 
    },
    {
      playerName : "<empty slot>", 
      position : "None",
      Rating : 0 
    },
    {
      playerName : "<empty slot>", 
      position : "None",
      Rating : 0 
    },
    {
      playerName : "<empty slot>", 
      position : "None",
      Rating : 0 
    }
]

  newTeam = {
    teamName : "",
    formation : 0,
    league : 0
  }

  teamCreated : boolean = false;

  ngOnInit(){
    this.getFormations();
    
  }

  getFormations(){
    this.teamservice.getFormations()
    .pipe( switchMap ( data => {
      this.formations = data;
      return this.teamservice.getLeagues();
    }))
    .subscribe( data => {
      this.leagues = data;
      console.log(this.leagues);
    })
  }

  CreateTeam(){
    this.teamservice.createTeam(this.newTeam)
    .subscribe( () => {
      this.teamCreated = true;
      this.setTeamFormation(this.newTeam.formation);
      localStorage.setItem('created' , 'true');
    })
  }


  setTeamFormation(formation : number){
    let formationName = this.formations.find(form => form.id == formation).name;
    if(formationName == '2-1-1'){
      let positions = ['GK', 'DF', 'DF', 'MF', 'FW'];
      for(let i = 0; i<positions.length ; i++){
        this.playerSlots[i].position = positions[i];
      }
    }
    else if(formationName == '2-2 (Classic)'){
      let positions = ['GK', 'DF', 'DF', 'MF', 'FW'];
      for(let i = 0; i<positions.length ; i++){
        this.playerSlots[i].position = positions[i];
      }
    }
    else if(formationName == '2-2 (Double FW)'){
      let positions = ['GK', 'DF', 'DF', 'FW', 'FW'];
      for(let i = 0; i<positions.length ; i++){
        this.playerSlots[i].position = positions[i];
      }
    }
    else if(formationName == '1-1-2'){
      let positions = ['GK', 'DF', 'MF', 'FW', 'FW'];
      for(let i = 0; i<positions.length ; i++){
        this.playerSlots[i].position = positions[i];
      }
    }
    else if(formationName == '1-2-1'){
      let positions = ['GK', 'DF', 'MF', 'MF', 'FW'];
      for(let i = 0; i<positions.length ; i++){
        this.playerSlots[i].position = positions[i];
      }
    }
    else if(formationName == '1-3 (Classic)'){
      let positions = ['GK', 'DF', 'MF', 'MF', 'FW'];
      for(let i = 0; i<positions.length ; i++){
        this.playerSlots[i].position = positions[i];
      }
    }
    else if(formationName == '1-3 (Double FW)'){
      let positions = ['GK', 'DF', 'MF', 'FW', 'FW'];
      for(let i = 0; i<positions.length ; i++){
        this.playerSlots[i].position = positions[i];
      }
    }
    else{
      let positions = ['GK', 'DF', 'DF', 'DF', 'FW'];
      for(let i = 0; i<positions.length ; i++){
        this.playerSlots[i].position = positions[i];
      }
    }

  }


}
