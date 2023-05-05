import { Component, OnInit } from '@angular/core';
declare var $: any;

@Component({
    selector: 'app-alerts',
    templateUrl: './alerts.component.html',
    styleUrls: ['./alerts.component.scss']
})
export class AlertsComponent implements OnInit {

    constructor() { }
    
    ngOnInit(): void {
        $( '#ApplicationAlerts' ).addClass( 'd-none' );
        $( '#ApplicationAlerts' ).removeClass( 'show' );
        $( '#ApplicationAlertsBody' ).html( '' );
        
        $( '#ErrorApplicationAlerts' ).addClass( 'd-none' );
        $( '#ErrorApplicationAlerts' ).removeClass( 'show' );
        $( '#ErrorApplicationAlertsBody' ).html( '' );
    }

}
