import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';

import { StoreModule } from '@ngrx/store';
import { StoreRouterConnectingModule } from '@ngrx/router-store';
import { EffectsModule } from '@ngrx/effects';

import { reducers } from './+store';
import { CustomSerializer } from './+store/router';
import { Effects } from './+store/effects';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { MainComponent } from './main/main.component';

import { SharedModule } from './shared/shared.module';
import { CoreModule } from './core/core.module';
import { PagesModule } from './pages/pages.module';

@NgModule({
    declarations: [
        AppComponent,
        MainComponent,
    ],
    imports: [
        BrowserModule,
        HttpClientModule,
        AppRoutingModule,
        
        StoreRouterConnectingModule.forRoot( { serializer: CustomSerializer } ),
        StoreModule.forRoot( reducers ),
        EffectsModule.forRoot( [Effects] ),
            
        SharedModule,
        CoreModule,
        PagesModule
    ],
    providers: [],
    bootstrap: [AppComponent]
})
export class AppModule { }
