import { Component } from '@angular/core';
import { TeamService } from '../team.service';
import { Observable, switchMap } from 'rxjs';
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

  teamID : number = 0;
  slotOpen = [true, true, true, true, true];
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
    .pipe( switchMap( data => {
      this.leagues = data;
      return this.playersevice.getAllPlayers();
    }))
    .pipe( switchMap( data => {
      this.players = data;
      return this.playersevice.getAllCoaches();
    }))
    .pipe(switchMap ( data => {
      this.coaches = data;
      if(localStorage.getItem('teamid')){
        this.teamCreated = true;
        this.teamID = Number(localStorage.getItem('teamid'));
        this.setTeamFormation(Number(localStorage.getItem('formation')));
        this.coachSlot.Team = localStorage.getItem('teamName') || '';
        this.coachSlot.Name = localStorage.getItem('coach') || '';
        if(localStorage.getItem('teamset')) this.slotOpen = [false, false, false, false, false];
        return this.teamservice.getMyTeam(this.teamID);     
      }
      else{
        return [];
      }
    }))
    .subscribe( data => {
      let players = data;
      let i = 0;
      while(i < this.playerSlots.length){
        this.playerSlots[i].playerName = localStorage.getItem(String(i)) || '';
        this.playerSlots[i].Rating = players.find( (player) => 
        this.playerSlots[i].playerName.includes(player.firstname)).rating;
        i++;
      }
    })
  }

  CreateTeam(){
    this.coachSlot.Team = this.newTeam.teamName;
    this.teamservice.createTeam(this.newTeam)
    .pipe(switchMap ( (data) => {
      this.teamCreated = true;
      this.teamID = data.teamid;
      localStorage.setItem('teamid', String(this.teamID));
      localStorage.setItem('teamName', this.newTeam.teamName);
      this.setTeamFormation(this.newTeam.formation);
      localStorage.setItem('formation', String(this.newTeam.formation));
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
    this.slotOpen[this.slotValue - 1] = false;
    if(this.slotOpen.indexOf(true) == -1) localStorage.setItem('teamset', 'true');
    localStorage.setItem(String(this.slotValue - 1), this.slotPlayerName);
    let rating = this.players.find( player => this.slotPlayerName.includes(player.firstname)).rating;
    let id = this.players.find( player => this.slotPlayerName.includes(player.firstname)).player_id;
    this.playerSlots[this.slotValue - 1].Rating = rating;
    this.playersevice.changePlayerTeam(id, this.teamID).subscribe();
  }

  setCoachSlot(){
    this.coachSlot.Name = this.slotCoachName;
    let id  = this.coaches.find( coach => this.slotCoachName.includes(coach.firstname)).coach_id;
    localStorage.setItem('coach', this.coachSlot.Name);
    this.playersevice.changeCoachTeam(id, this.teamID).subscribe();
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
  
  DeleteCoach(){
    let coachId = this.coaches.find( coach => this.slotCoachName.includes(coach.firstname)).id;
    this.playersevice.DeleteCoach(coachId).pipe( switchMap ( () => {
      return this.playersevice.getAllCoaches();
    }))
    .subscribe( data => {
      this.coaches = data;
    })
  }



}
