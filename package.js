Package.describe({
  name: 'mellors:agilecrm',
  version: '0.0.1',
  // Brief, one-line summary of the package.
  summary: '',
  // URL to the Git repository containing the source code for this package.
  git: '',
  // By default, Meteor will default to using README.md for documentation.
  // To avoid submitting documentation, set this field to null.
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.2.1');
  api.use(['ecmascript', "coffeescript", "check"]);
  api.use("aldeed:autoform");
  api.addFiles('both/simpleschema.coffee');
  api.addFiles('client/api.coffee', 'client');
  api.addFiles('client/autoform/agilecrm.coffee', 'client');

  // Imply SS to make sure SimpleSchema object is available to app
  api.imply('aldeed:simple-schema');

});

Package.onTest(function(api) {
  api.use('ecmascript');
  api.use('tinytest');
  api.use('mellors:agilecrm');
});
