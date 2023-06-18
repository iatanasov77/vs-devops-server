import { Component, OnInit, Input } from '@angular/core';

import { IDevOpsConfig } from "../../../../services/devops-config.interface";

@Component({
    selector: 'app-page-examples-ansible',
    templateUrl: './examples-ansible-jenkins.component.html',
    styleUrls: []
})
export class ExamplesAnsibleJenkinsComponent implements OnInit
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
