import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MyteamComponent } from './myteam/myteam.component';
import { FindComponent } from './find/find.component';
import { LeaderboardComponent } from './leaderboard/leaderboard.component';

const routes: Routes = [{path:'myteam', component:MyteamComponent},
                        {path:'find', component:FindComponent},
                        {path:'leaderboard', component:LeaderboardComponent}];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
