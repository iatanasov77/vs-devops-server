import { Component, OnInit, OnDestroy } from '@angular/core';

import { Store } from '@ngrx/store';
import { Actions, ofType } from '@ngrx/effects';
import { map, merge } from 'rxjs';
import { loadDevOpsConfigJson, loadDevOpsConfigJsonFailure, loadDevOpsConfigJsonSuccess } from '../../../+store/actions';
import { loadDevOpsConfig } from '../../../+store/selectors';

import { IDevOpsConfig } from "../../../services/devops-config.interface";

declare var $: any;

@Component({
    selector: 'app-page-examples-container',
    templateUrl: './examples-container.component.html',
    styleUrls: ['./examples-container.component.scss']
})
export class ExamplesContainerComponent implements OnInit, OnDestroy
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
        $( '#body' ).addClass( 'large-content' );
    }
    
    ngOnDestroy()
    {
        $( '#body' ).removeClass( 'large-content' );
    }
    
    /**
     * https://stackoverflow.com/questions/41451375/passing-data-into-router-outlet-child-components
     */
    onOutletLoaded( component: any )
    {
        component.devopsConfig = this.devopsConfig;
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
