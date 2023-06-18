import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AppRoutingModule } from '../app-routing.module';
import { SharedModule } from '../shared/shared.module';

import { HomeComponent } from './home/home.component';
import { ExamplesContainerComponent } from './examples/container/examples-container.component';

import { ExamplesAnsibleGeneralComponent } from './examples/ansible/general/examples-ansible-general.component';
import { ExamplesAnsibleJenkinsComponent } from './examples/ansible/jenkins/examples-ansible-jenkins.component';
import { ExamplesAnsibleNagiosComponent } from './examples/ansible/nagios/examples-ansible-nagios.component';

import { ExamplesHashicorpPackerComponent } from './examples/hashicorp/packer/examples-hashicorp-packer.component';
import { ExamplesHashicorpTerraformComponent } from './examples/hashicorp/terraform/examples-hashicorp-terraform.component';
import { ExamplesHashicorpVaultComponent } from './examples/hashicorp/vault/examples-hashicorp-vault.component';

import { ExamplesOtherComponent } from './examples/other/examples-other.component';

import { ExternalToolsComponent } from './external-tools/external-tools.component';
import { DevopsServicesComponent } from './devops-services/devops-services.component';

@NgModule({
    declarations: [
        HomeComponent,
        ExamplesContainerComponent,
        
        ExamplesAnsibleGeneralComponent,
        ExamplesAnsibleJenkinsComponent,
        ExamplesAnsibleNagiosComponent,
        
        ExamplesHashicorpPackerComponent,
        ExamplesHashicorpTerraformComponent,
        ExamplesHashicorpVaultComponent,
        
        ExamplesOtherComponent,
        
        ExternalToolsComponent,
        DevopsServicesComponent
    ],
    imports: [
        CommonModule,
        AppRoutingModule,
        SharedModule
    ],
    exports: [
        HomeComponent,
        ExamplesContainerComponent,
        ExternalToolsComponent,
        DevopsServicesComponent
    ]
})
export class PagesModule { }
