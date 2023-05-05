import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'
import { Observable } from "rxjs";
import { ISubsystems } from "./subsystems.interface";

const backendURL = 'http://devops.lh/angular-api.php';

@Injectable({
    providedIn: 'root'
})
export class ApiService
{
    constructor( private httpClient: HttpClient ) { }
    
    loadSubsystemsJson(): Observable<ISubsystems>
    {
        return this.httpClient.get<ISubsystems>( backendURL );
    }
}
