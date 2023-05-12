import { Component, OnInit } from '@angular/core';

import { Store } from '@ngrx/store';
import { Actions, ofType } from '@ngrx/effects';
import { map, merge } from 'rxjs';
import { loadDevOpsConfigJson, loadDevOpsConfigJsonFailure, loadDevOpsConfigJsonSuccess } from '../../+store/actions';
import { loadDevOpsConfig } from '../../+store/selectors';

import { IDevOpsConfig } from "../../services/devops-config.interface";

@Component({
    selector: 'app-page-devops-services',
    templateUrl: './devops-services.component.html',
    styleUrls: ['./devops-services.component.scss']
})
export class DevopsServicesComponent implements OnInit
{
    devopsConfig$: any;
    isFetchingDevopsConfig$: any;
    
    showSpinner = true;
    devopsConfig?: IDevOpsConfig;
    
    constructor( private store: Store, private actions$: Actions )
    {
        this.loadDevopsConfig();
    }
    
    ngOnInit()
    {
        //console.log( this.devopsConfig$ );
    }
    
    loadDevopsConfig()
    {
        this.devopsConfig$   = this.store.select( loadDevOpsConfig );
        
        this.isFetchingDevopsConfig$ = merge(
            this.actions$.pipe(
                ofType( loadDevOpsConfigJson ),
                map( () => true )
            ),
            this.actions$.pipe(
                ofType( loadDevOpsConfigJsonSuccess ),
                map( () => false )
            ),
            this.actions$.pipe(
                ofType( loadDevOpsConfigJsonFailure ),
                map( () => false )
            )
        );
        
        this.store.dispatch( loadDevOpsConfigJson() );
        this.store.subscribe( ( state: any ) => {
            this.showSpinner    = state.main.devopsConfig == null;
            this.devopsConfig   = state.main.devopsConfig;
        });
    }
}
