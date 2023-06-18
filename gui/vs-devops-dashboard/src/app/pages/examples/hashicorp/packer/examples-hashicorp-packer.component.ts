import { Component, OnInit, Input } from '@angular/core';

import { IDevOpsConfig } from "../../../../services/devops-config.interface";

@Component({
    selector: 'app-page-examples-hashicorp-packer',
    templateUrl: './examples-hashicorp-packer.component.html',
    styleUrls: []
})
export class ExamplesHashicorpPackerComponent implements OnInit
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
