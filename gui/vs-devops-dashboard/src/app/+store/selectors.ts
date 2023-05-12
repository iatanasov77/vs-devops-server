import { createFeatureSelector, createSelector } from '@ngrx/store'
import { IMainState } from './index';
import { RouterStateUrl } from './router';

const mainSelector              = createFeatureSelector<IMainState>( 'main' );
const routerSelector            = createFeatureSelector<{ state: RouterStateUrl }>( 'router' );

export const getUrl             = createSelector( routerSelector, s => s?.state?.url );
export const getRouteParams     = createSelector( routerSelector, s => s?.state?.params );

export const loadDevOpsConfig   = createSelector( mainSelector, s => s.devopsConfig );

