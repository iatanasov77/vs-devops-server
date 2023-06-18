import { Component, OnInit, Input } from '@angular/core';

import { IDevOpsConfig } from "../../../../services/devops-config.interface";

@Component({
    selector: 'app-page-examples-hashicorp-vault',
    templateUrl: './examples-hashicorp-vault.component.html',
    styleUrls: []
})
export class ExamplesHashicorpVaultComponent implements OnInit
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
