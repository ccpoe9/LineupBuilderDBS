import { Component, OnInit } from '@angular/core';
import { PlayerService } from '../player.service';

@Component({
  selector: 'app-find',
  templateUrl: './find.component.html',
  styleUrls: ['./find.component.scss']
})
export class FindComponent implements OnInit{

  constructor( private playerservice : PlayerService){}

  players : any[] = [];

  sortBySelected = 'A-Z';
  RatingSelected = 'Rating';
  PositionSelected = 'Position';
  GoalsSelected = 'Goals';
  AssistsSelected = 'Assists';
  TacklesSelected = 'Tackles';
  SavesSelected = 'Saves';
  orderBy = 'lastname';
  orderDir = 'ASC';

  ngOnInit() {
    this.getAllPlayersWithStats();
  }


  getAllPlayersWithStats(){
    this.playerservice.getAllPlayersWithStats(this.orderBy, this.orderDir).subscribe( data => {
      this.players = data[0];

    });
  }

  changeSelected( orderBy : string , orderDir : string, newValue : string){
    this.resetValues();
    this.playerservice.getAllPlayersWithStats(orderBy, orderDir).subscribe( data => {
      this.players = data[0];
    });
    console.log(orderBy);
    if(orderBy == 'lastname'){
      this.sortBySelected = newValue;
    }
    else if(orderBy == 'rating'){
      this.RatingSelected = newValue;
    }
    else if(orderBy == 'goals'){
      this.GoalsSelected = newValue;
    }
    else if(orderBy == 'assists'){
      this.AssistsSelected = newValue;
    }
    else if(orderBy == 'tackles'){
      this.TacklesSelected = newValue;
    }
    else if(orderBy == 'saves'){
      this.SavesSelected = newValue;
    }
  }

  resetValues(){
  this.sortBySelected = 'A-Z';
  this.RatingSelected = 'Rating';
  this.PositionSelected = 'Position';
  this.GoalsSelected = 'Goals';
  this.AssistsSelected = 'Assists';
  this.TacklesSelected = 'Tackles';
  this.SavesSelected = 'Saves';
  }
  


  

}
