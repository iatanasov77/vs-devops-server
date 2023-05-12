import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AppRoutingModule } from '../app-routing.module';
import { SharedModule } from '../shared/shared.module';

import { HomeComponent } from './home/home.component';
import { ExamplesComponent } from './examples/examples.component';
import { ExternalToolsComponent } from './external-tools/external-tools.component';
import { DevopsServicesComponent } from './devops-services/devops-services.component';

@NgModule({
    declarations: [
        HomeComponent,
        ExamplesComponent,
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
        ExamplesComponent,
        ExternalToolsComponent,
        DevopsServicesComponent
    ]
})
export class PagesModule { }
