import { Injectable } from '@angular/core';

import { HttpClient, HttpParams } from '@angular/common/http';
import { Config } from './config/config';
import { catchError, throwError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class TeamService {

  constructor(private http : HttpClient) { }

  queryParams : HttpParams = new HttpParams();

  getFormations(){
    return this.http.get<any[]>(Config.APIROOT+Config.APIURLS.FORMATIONS).pipe(
      catchError((err) => {
        console.error(err);
        return throwError(err);
      }));
  }

  getLeagues(){
    return this.http.get<any[]>(Config.APIROOT+Config.APIURLS.LEAGUES).pipe(
      catchError((err) => {
        console.error(err);
        return throwError(err);
      }));
  }


  createTeam(newTeam : any){
    return this.http.post<any[]>(Config.APIROOT+Config.APIURLS.TEAMS, newTeam).pipe(
      catchError((err) => {
        console.error(err);
        return throwError(err);
      }));
  }

  getAllTeamsWithStats(orderBy : string, orderDir : string){
    this.queryParams = new HttpParams().set('orderBy', orderBy).set('orderDir', orderDir);
    return this.http.get<any[]>(Config.APIROOT + Config.APIURLS.TEAMSTATS).pipe(
      catchError((err) => {
        console.error(err);
        return throwError(err);
      }));
  }
}
