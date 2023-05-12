import { ActionReducerMap, createReducer, on } from "@ngrx/store";
import { routerReducer } from '@ngrx/router-store';
import {
    loadDevOpsConfigJsonSuccess
} from "./actions";

import { IDevOpsConfig } from '../services/devops-config.interface';

export interface IMainState
{
    devopsConfig:   null | IDevOpsConfig;
}

interface IAppState
{
    main: IMainState;
    router: ReturnType<typeof routerReducer>
}

const mainInitialState: IMainState = {
    devopsConfig:   null
};

const mainReducer = createReducer<IMainState>(
    mainInitialState,
    
    on( loadDevOpsConfigJsonSuccess, ( state, { devopsConfig } ) => {
      return { ...state, devopsConfig };
    })
);

export const reducers: ActionReducerMap<IAppState> = {
    main: mainReducer,
    router: routerReducer,
};
