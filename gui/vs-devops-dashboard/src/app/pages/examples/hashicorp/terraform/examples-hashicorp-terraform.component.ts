import { Component, OnInit, Input } from '@angular/core';

import { IDevOpsConfig } from "../../../../services/devops-config.interface";

import { HighlightLoader, HighlightAutoResult } from 'ngx-highlightjs';
const themeGithub: string = 'node_modules/highlight.js/styles/github-dark.css';

declare var $: any;

@Component({
    selector: 'app-page-examples-hashicorp-terraform',
    templateUrl: './examples-hashicorp-terraform.component.html',
    styleUrls: []
})
export class ExamplesHashicorpTerraformComponent implements OnInit
{
    @Input() devopsConfig?: IDevOpsConfig;
    
    response?: HighlightAutoResult;
    currentTheme: string = themeGithub;
    
    codeCopyExamples        = `
        $ cp /vagrant/examples/Terraform /vagrant/tmp/TestTerraform
    `;
    codeBuildAspNetExample = `
        $ cd /vagrant/tmp/TestTerraform/Azure/AspNetContacts
        $ terraform init
        $ terraform apply
    `;
    
    constructor( private hljsLoader: HighlightLoader )
    {
        this.hljsLoader.setTheme( this.currentTheme );
        
        // Fix Prety View Of Coce Variables
        this.codeCopyExamples       = this.codeCopyExamples.replace(/^\s+/g, '');
        this.codeBuildAspNetExample = this.codeBuildAspNetExample.replace(/^\s+/g, '');
        
        this.codeCopyExamples       = this.codeCopyExamples.replace(/\n\s+/g, '\n');
        this.codeBuildAspNetExample = this.codeBuildAspNetExample.replace(/\n\s+/g, '\n');
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
