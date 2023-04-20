import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Config } from './config/config';
import { catchError, throwError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PlayerService {

  constructor(private http : HttpClient) { }

  getAllPlayers(){
    return this.http.get<any[]>(Config.APIROOT + Config.APIURLS.PLAYERS).pipe(
      catchError((err) => {
        console.error(err);
        return throwError(err);
      }));
  }

  getAllPlayersWithStats(){
    return this.http.get<any[]>(Config.APIROOT + Config.APIURLS.PLAYERSTATS).pipe(
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


  
}
