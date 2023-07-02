import { Component, OnInit, Input } from '@angular/core';

import { IDevOpsConfig } from "../../../../services/devops-config.interface";

import { HighlightLoader, HighlightAutoResult } from 'ngx-highlightjs';
const themeGithub: string = 'node_modules/highlight.js/styles/github-dark.css';

@Component({
    selector: 'app-page-examples-ansible-general',
    templateUrl: './examples-ansible-general.component.html',
    styleUrls: []
})
export class ExamplesAnsibleGeneralComponent implements OnInit
{
    @Input() devopsConfig?: IDevOpsConfig;
    
    response?: HighlightAutoResult;

    codePlaybookRoles = `
        ansible-galaxy install --roles-path /vagrant/ansible.d/playbook/roles -r /vagrant/ansible.d/requirements.yml --force
    `;
    
    currentTheme: string = themeGithub;
  
    constructor( private hljsLoader: HighlightLoader )
    {
        this.hljsLoader.setTheme( this.currentTheme );
        
        // Fix Prety View Of Coce Variables
        this.codePlaybookRoles  = this.codePlaybookRoles.replace(/^\s+/g, '');
    }
    
    ngOnInit()
    {
        //console.log( this.devopsConfig$ );
    }
    
    onHighlight( e: HighlightAutoResult )
    {
        this.response = {
            language: e.language,
            relevance: e.relevance,
            secondBest: '{...}',
            value: '{...}',
        };
    }
}
