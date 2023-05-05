import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AppRoutingModule } from '../app-routing.module';
import { HeaderComponent } from './header/header.component';
import { FooterComponent } from './footer/footer.component';
import { NavigationComponent } from './navigation/navigation.component';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { AlertsComponent } from './alerts/alerts.component';
import { PagesModule } from '../pages/pages.module';

@NgModule({
    declarations: [
        HeaderComponent,
        FooterComponent,
        NavigationComponent,
        PageNotFoundComponent,
        AlertsComponent
    ],
    imports: [
        CommonModule,
        AppRoutingModule,
        PagesModule
    ],
    exports: [
        HeaderComponent,
        FooterComponent,
        NavigationComponent,
        PageNotFoundComponent,
        AlertsComponent
    ]
})
export class CoreModule { }
