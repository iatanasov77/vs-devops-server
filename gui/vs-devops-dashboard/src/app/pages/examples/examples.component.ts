import { Component, OnInit, OnDestroy } from '@angular/core';
import { Observable, Subscription } from 'rxjs';
import { ApiService } from "../../services/api.service";
import { IDevOpsConfig } from "../../services/devops-config.interface";

@Component({
  selector: 'app-page-examples',
  templateUrl: './examples.component.html',
  styleUrls: ['./examples.component.scss']
})
export class ExamplesComponent implements OnInit, OnDestroy
{
    devopsConfig?: IDevOpsConfig;
    
    subscription?: Subscription;
    
    constructor( private apiService: ApiService ) { }

    ngOnInit()
    {
        let observable: Observable<IDevOpsConfig> = this.apiService.loadDevOpsConfigJson();
        
        this.subscription   = observable.subscribe( ( response: IDevOpsConfig ) => {
            //console.log( response );
            
            this.devopsConfig = {
                subsystems: response.subsystems,
                vaultKeys: response.vaultKeys,
            };
        });
    }
  
    ngOnDestroy()
    {
        this.subscription?.unsubscribe();
    }
}
