/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    contentSecurityPolicy: {
      'default-src': "'self' http://localhost:3000/",
      'script-src': "'self' http://localhost:3000/ 'unsafe-inline' 'unsafe-eval' use.typekit.net maps.googleapis.com maps.gstatic.com",
      'font-src': "'self' data: use.typekit.net",
      'connect-src': "'self' http://localhost:3000/",
      'img-src': "'self' https://csi.gstatic.com/ data:",
      'style-src': "'self' 'unsafe-inline' use.typekit.net"
      // 'frame-src': "s-static.ak.facebook.com static.ak.facebook.com www.facebook.com"
    },
    'simple-auth': {
      authorizer: 'simple-auth-authorizer:devise',
      store: 'simple-auth-session-store:local-storage'
    },
    'simple-auth-devise':{
      serverTokenEndpoint: "http://localhost:3000/users/sign_in"
    },
    locationType: 'hash',
    modulePrefix: 'frontend',
    environment: environment,
    baseURL: '/',
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },

    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
    }
  };

  if (environment === 'development') {
    // ENV.APP.LOG_RESOLVER = true;
    // ENV.APP.LOG_ACTIVE_GENERATION = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    // ENV.APP.LOG_VIEW_LOOKUPS = true;
  }

  if (environment === 'test') {
    // Testem prefers this...
    ENV.baseURL = '/';
    ENV.locationType = 'none';

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';
  }

  if (environment === 'production') {
  }

  return ENV;
};
