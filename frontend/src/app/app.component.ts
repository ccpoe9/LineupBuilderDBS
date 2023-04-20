import { Component } from '@angular/core';
import { ActivatedRoute, NavigationStart, Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'frontend';

  currentPage : string = "";
  
  constructor(private router : Router){
    this.router.events
          .subscribe(
            (event: any) => {
              if(event instanceof NavigationStart) {
                this.currentPage = event.url;
              }
            });
  }

  reset(){
    localStorage.clear();
    location.reload();
  }
}
