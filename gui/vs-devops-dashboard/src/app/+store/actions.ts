import { createAction, props } from "@ngrx/store";
import { IDevOpsConfig } from '../services/devops-config.interface';

const actionTypes = {
    loadDevOpsConfigJson:           'LOAD_DEVOPS_CONFIG',
    loadDevOpsConfigJsonSuccess:    'LOAD_DEVOPS_CONFIG_SUCCESS',
    loadDevOpsConfigJsonFailure:    'LOAD_DEVOPS_CONFIG_FAILURE',
};

export const loadDevOpsConfigJson           = createAction( actionTypes.loadDevOpsConfigJson );
export const loadDevOpsConfigJsonSuccess    = createAction( actionTypes.loadDevOpsConfigJsonSuccess, props<{ devopsConfig: IDevOpsConfig }>() );
export const loadDevOpsConfigJsonFailure    = createAction( actionTypes.loadDevOpsConfigJsonFailure, props<{ error: any }>() );

