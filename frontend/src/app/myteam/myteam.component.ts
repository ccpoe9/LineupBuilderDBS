import { Component } from '@angular/core';
import { TeamService } from '../team.service';
import { switchMap } from 'rxjs';
import { PlayerService } from '../player.service';
@Component({
  selector: 'app-myteam',
  templateUrl: './myteam.component.html',
  styleUrls: ['./myteam.component.scss']
})
export class MyteamComponent {

  constructor(private teamservice : TeamService, private playersevice : PlayerService){}

  formations : any[] = [];
  leagues : any[] = [];
  players : any[] = [];
  coaches : any[] = [];
  
  slotValue : number = 0;
  slotPlayerName : string = "";
   
  slotCoachName : string = "";
  
  coachSlot = {
    Name : "<empty slot>",
    Team : ""
  }
 
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

  teamID : number = 0;;

  teamCreated : boolean = false;

  ngOnInit(){
      if(localStorage.getItem('teamid')){

      }
      else {
        this.getFormations();
      }
      
  }

  setAllItems(){
      this.teamCreated = true;
      this.coachSlot.Name = localStorage.getItem('coach') || '';
      this.coachSlot.Team = localStorage.getItem('teams') || '';
      this.setTeamFormation(Number(localStorage.getItem('formation')));
      for(let i = 0; i < this.playerSlots.length ; i++){
        this.playerSlots[i].playerName = localStorage.getItem('player' + i) || '';
        this.playerSlots[i].Rating = Number(localStorage.getItem('rating' + i));
      }
  }


  getFormations(){
    this.teamservice.getFormations()
    .pipe( switchMap ( data => {
      this.formations = data;
      return this.teamservice.getLeagues();
    }))
    .subscribe( data => {
      this.leagues = data;
    })
  }

  CreateTeam(){
    this.coachSlot.Team = this.newTeam.teamName;
    this.teamservice.createTeam(this.newTeam)
    .pipe(switchMap ( (data) => {
      this.teamCreated = true;
      this.teamID = data.teamid;
      localStorage.setItem('teamid', String(this.teamID))
      this.setTeamFormation(this.newTeam.formation);
      return this.playersevice.getAllPlayers();
    }))
    .pipe( switchMap( data => {
      this.players = data;
      return this.playersevice.getAllCoaches();
    }))
    .subscribe( data => {
      this.coaches = data;
    })
  }

  setSlot(){
    this.playerSlots[this.slotValue - 1].playerName = this.slotPlayerName;
    let rating = this.players.find( player => this.slotPlayerName.includes(player.firstname)).rating;
    let id = this.players.find( player => this.slotPlayerName.includes(player.firstname)).player_id;
    this.playerSlots[this.slotValue - 1].Rating = rating;
    this.playersevice.changePlayerTeam(id, this.teamID).subscribe();
  }

  setCoachSlot(){
    this.coachSlot.Name = this.slotCoachName;
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
