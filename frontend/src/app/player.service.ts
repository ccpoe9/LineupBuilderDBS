import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Config } from './config/config';
import { catchError, throwError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PlayerService {

  constructor(private http : HttpClient) { }

  queryParams: HttpParams = new HttpParams();
  
  getAllPlayers(){
    return this.http.get<any[]>(Config.APIROOT + Config.APIURLS.PLAYERS).pipe(
      catchError((err) => {
        console.error(err);
        return throwError(err);
      }));
  }

  getAllPlayersWithStats(orderBy : string, orderDir : string){

    this.queryParams = new HttpParams().set('orderBy', orderBy).set('orderDir', orderDir);
    return this.http.get<any[]>(Config.APIROOT + Config.APIURLS.PLAYERSTATS, { params : this.queryParams}).pipe(
      catchError((err) => {
        console.error(err);
        return throwError(err);
      }));
  }

  getAllCoaches(){
    return this.http.get<any[]>(Config.APIROOT + Config.APIURLS.COACHES).pipe(
      catchError((err) => {
        console.error(err);
        return throwError(err);
      }));
  }

  getPlayerByPositions(position_id : number){
    this.queryParams = new HttpParams().set('position_id', position_id);
    return this.http.get<any[]>(Config.APIROOT + Config.APIURLS.PLAYERSORT, { params : this.queryParams}).pipe(
      catchError((err) => {
        console.error(err);
        return throwError(err);
      }));
  }

  changePlayerTeam(player_id : number, team : number){
    let body = {
      player_id : player_id,
      team : team
    }
    return this.http.put<any[]>(Config.APIROOT + Config.APIURLS.PLAYERS, body).pipe(
      catchError((err) => {
        console.error(err);
        return throwError(err);
      }));
  }

  changeCoachTeam(coach_id : number, team : number){
    let body = {
      coach_id : coach_id,
      team : team
    }
    return this.http.put<any[]>(Config.APIROOT + Config.APIURLS.COACHES, body).pipe(
      catchError((err) => {
        console.error(err);
        return throwError(err);
      }));
  }



  
}
