import { Injectable } from "@angular/core";

import { createEffect, Actions, ofType } from '@ngrx/effects';
import { catchError, map, switchMap } from "rxjs";

import {
    loadDevOpsConfigJson,
    loadDevOpsConfigJsonFailure,
    loadDevOpsConfigJsonSuccess
} from "./actions";

import { ApiService } from "../services/api.service";
import { IDevOpsConfig } from '../services/devops-config.interface';


/**
 * Effects are an RxJS powered side effect model for Store. Effects use streams to provide new sources of actions to reduce state based on external interactions such 
 * as network requests, web socket messages and time-based events.
 * 
 * In a service-based Angular application, components are responsible for interacting with external resources directly through services. Instead, effects provide a way 
 * to interact with those services and isolate them from the components. Effects are where you handle tasks such as fetching data, long-running tasks that produce 
 * multiple events, and other external interactions where your components don't need explicit knowledge of these interactions.
 */

@Injectable({
    providedIn: 'root'
})
export class Effects
{
    constructor( private actions$: Actions, private apiService: ApiService ) { }
    
    loadDevOpsConfigJson = createEffect( (): any => this.actions$.pipe(
        ofType( loadDevOpsConfigJson ),
        switchMap( () => this.apiService.loadDevOpsConfigJson().pipe(
            map( ( devopsConfig: IDevOpsConfig ) => loadDevOpsConfigJsonSuccess( { devopsConfig } ) ),
            catchError( error => [loadDevOpsConfigJsonFailure( { error } )] )
        ))
    ));
}