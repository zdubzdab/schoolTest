import WardenAuthenticator from '../authenticators/warden';
import WardenAuthorizer from '../authorizers/warden';

export default {
    name:       'authentication',
    before:     'simple-auth',
    initialize: function(container, application) {
        container.register('simple-auth-authenticator:warden', WardenAuthenticator);
        container.register('simple-auth-authorizer:warden', WardenAuthorizer);
    }
};