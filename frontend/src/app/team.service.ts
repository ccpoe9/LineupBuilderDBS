import { Injectable } from '@angular/core';

import { HttpClient, HttpParams } from '@angular/common/http';
import { Config } from './config/config';
import { catchError, throwError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class TeamService {

  constructor(private http : HttpClient) { }

  getFormations(){
    return this.http.get<any[]>(Config.APIROOT+Config.APIURLS.FORMATIONS).pipe(
      catchError((err) => {
        console.error(err);
        return throwError(err);
      }));
  }
}