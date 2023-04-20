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

  ngOnInit() {
    this.getAllPlayersWithStats();
  }


  getAllPlayersWithStats(){
    this.playerservice.getAllPlayersWithStats().subscribe( data => {
      this.players = data[0];
    });
  }
  
  

}
