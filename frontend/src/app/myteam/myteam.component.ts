import { Component } from '@angular/core';
import { TeamService } from '../team.service';

@Component({
  selector: 'app-myteam',
  templateUrl: './myteam.component.html',
  styleUrls: ['./myteam.component.scss']
})
export class MyteamComponent {

  constructor(private teamservice : TeamService){}

  ngOnInit(){
    this.getFormations();
  }

  getFormations(){
    this.teamservice.getFormations()
    .subscribe( data => {
      console.log(data);
    })
  }
}
