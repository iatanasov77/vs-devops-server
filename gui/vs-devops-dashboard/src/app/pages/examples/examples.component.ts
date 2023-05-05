import { Component, OnInit, OnDestroy } from '@angular/core';
import { Observable, Subscription } from 'rxjs';
import { ApiService } from "../../services/api.service";
import { ISubsystems } from "../../services/subsystems.interface";

@Component({
  selector: 'app-page-examples',
  templateUrl: './examples.component.html',
  styleUrls: ['./examples.component.scss']
})
export class ExamplesComponent implements OnInit, OnDestroy
{
    subsystems?: ISubsystems;
    
    subscription?: Subscription;
    
    constructor( private apiService: ApiService ) { }

    ngOnInit()
    {
        let observable: Observable<ISubsystems> = this.apiService.loadSubsystemsJson();
        
        this.subscription   = observable.subscribe( ( response: ISubsystems ) => {
            //console.log( response );
            
            this.subsystems = {
                ansible: response.ansible,
                jenkins: response.jenkins,
                nagios: response.nagios,
                icinga: response.icinga,
                elastic_stack: response.elastic_stack,
                hashicorp: response.hashicorp,
                kubernetes: response.kubernetes,
            };
        });
    }
  
    ngOnDestroy()
    {
        this.subscription?.unsubscribe();
    }
}
