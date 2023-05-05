import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

// Error Pages
import { PageNotFoundComponent } from './core/page-not-found/page-not-found.component';

// Application Pages
import { HomeComponent } from './pages/home/home.component';
import { ExamplesComponent } from './pages/examples/examples.component';
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
        component: ExamplesComponent,
        data: {
            title: 'VS DevOps Examples',
        }
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
