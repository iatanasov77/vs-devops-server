import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

// Error Pages
import { PageNotFoundComponent } from './core/page-not-found/page-not-found.component';

// Application Pages
import { HomeComponent } from './pages/home/home.component';

import { ExamplesContainerComponent } from './pages/examples/container/examples-container.component';

import { ExamplesAnsibleGeneralComponent } from './pages/examples/ansible/general/examples-ansible-general.component';
import { ExamplesAnsibleJenkinsComponent } from './pages/examples/ansible/jenkins/examples-ansible-jenkins.component';
import { ExamplesAnsibleNagiosComponent } from './pages/examples/ansible/nagios/examples-ansible-nagios.component';

import { ExamplesHashicorpPackerComponent } from './pages/examples/hashicorp/packer/examples-hashicorp-packer.component';
import { ExamplesHashicorpTerraformComponent } from './pages/examples/hashicorp/terraform/examples-hashicorp-terraform.component';
import { ExamplesHashicorpVaultComponent } from './pages/examples/hashicorp/vault/examples-hashicorp-vault.component';

import { ExamplesOtherComponent } from './pages/examples/other/examples-other.component';

import { ExternalToolsComponent } from './pages/external-tools/external-tools.component';
import { DevopsServicesComponent } from './pages/devops-services/devops-services.component';

const routes: Routes = [
    {
        path: '',
        pathMatch: 'full',
        redirectTo: '/about'
    },
    {
        path: 'not-found',
        component: PageNotFoundComponent
    },
    {
        path: 'about',
        component: HomeComponent,
        data: {
            title: 'VS DevOps About',
        }
    },
    {
        path: 'examples',
        component: ExamplesContainerComponent,
        data: {
            title: 'VS DevOps Examples',
        },
        children: [
            {
                path:'',
                redirectTo: 'ansible/general',
                pathMatch: 'full'
            },
            {
                path: 'ansible/general',
                component: ExamplesAnsibleGeneralComponent,
                data: {
                    title: 'VS DevOps Examples - Ansible - General',
                },
            },
            {
                path: 'ansible/jenkins',
                component: ExamplesAnsibleJenkinsComponent,
                data: {
                    title: 'VS DevOps Examples - Ansible - Jenkins',
                },
            },
            {
                path: 'ansible/nagios',
                component: ExamplesAnsibleNagiosComponent,
                data: {
                    title: 'VS DevOps Examples - Ansible - Nagios',
                },
            },
            {
                path: 'hashicorp/packer',
                component: ExamplesHashicorpPackerComponent,
                data: {
                    title: 'VS DevOps Examples - Hashicorp - Packer',
                },
            },
            {
                path: 'hashicorp/terraform',
                component: ExamplesHashicorpTerraformComponent,
                data: {
                    title: 'VS DevOps Examples - Hashicorp - Terraform',
                },
            },
            {
                path: 'hashicorp/vault',
                component: ExamplesHashicorpVaultComponent,
                data: {
                    title: 'VS DevOps Examples - Hashicorp - Vault',
                },
            },
            {
                path: 'other',
                component: ExamplesOtherComponent,
                data: {
                    title: 'VS DevOps Examples - Other',
                },
            },
        ],
    },
    {
        path: 'external-tools',
        component: ExternalToolsComponent,
        data: {
            title: 'VS DevOps External Tools',
        }
    },
    {
        path: 'devops-services',
        component: DevopsServicesComponent,
        data: {
            title: 'VS DevOps Services',
        }
    }
    
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
