import { Component } from '@angular/core';
import { PlayerService } from '../player.service';

@Component({
  selector: 'app-find',
  templateUrl: './find.component.html',
  styleUrls: ['./find.component.scss']
})
export class FindComponent {

  constructor( private playerservice : PlayerService){}

  

}
