import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

// Error Pages
import { PageNotFoundComponent } from './core/page-not-found/page-not-found.component';

// Application Pages
import { HomeComponent } from './pages/home/home.component';

import { ExamplesContainerComponent } from './pages/examples/container/examples-container.component';
import { ExamplesAnsibleComponent } from './pages/examples/ansible/examples-ansible.component';
import { ExamplesHashicorpComponent } from './pages/examples/hashicorp/examples-hashicorp.component';
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
                redirectTo: 'ansible',
                pathMatch: 'full'
            },
            {
                path: 'ansible',
                component: ExamplesAnsibleComponent,
                data: {
                    title: 'VS DevOps Examples - Ansible',
                },
            },
            {
                path: 'hashicorp',
                component: ExamplesHashicorpComponent,
                data: {
                    title: 'VS DevOps Examples - Hashicorp',
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
