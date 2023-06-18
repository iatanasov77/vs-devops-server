import { Component, OnInit, Input } from '@angular/core';

import { IDevOpsConfig } from "../../../../services/devops-config.interface";

@Component({
    selector: 'app-page-examples-ansible-nagios',
    templateUrl: './examples-ansible-nagios.component.html',
    styleUrls: []
})
export class ExamplesAnsibleNagiosComponent implements OnInit
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
