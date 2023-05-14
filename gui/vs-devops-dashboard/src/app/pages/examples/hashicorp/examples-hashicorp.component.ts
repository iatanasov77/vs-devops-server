import { Component, OnInit, Input } from '@angular/core';

import { IDevOpsConfig } from "../../../services/devops-config.interface";

@Component({
    selector: 'app-page-examples-hashicorp',
    templateUrl: './examples-hashicorp.component.html',
    styleUrls: []
})
export class ExamplesHashicorpComponent implements OnInit
{
    @Input() devopsConfig?: IDevOpsConfig;
    
    constructor()
    {
        
    }
    
    ngOnInit()
    {
        //console.log( this.devopsConfig$ );
    }
}
