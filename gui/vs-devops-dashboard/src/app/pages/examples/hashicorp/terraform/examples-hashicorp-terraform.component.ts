import { Component, OnInit, Input } from '@angular/core';

import { IDevOpsConfig } from "../../../../services/devops-config.interface";

@Component({
    selector: 'app-page-examples-hashicorp-terraform',
    templateUrl: './examples-hashicorp-terraform.component.html',
    styleUrls: []
})
export class ExamplesHashicorpTerraformComponent implements OnInit
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
