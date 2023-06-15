import { envVars } from './env_vars';

export const environment = {
    production: true,
    backendURL: 'http://api.' + envVars.hostname + '/angular-api.php'
};
