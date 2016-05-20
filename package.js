Package.describe({
    name: 'mellors:agilecrm',
    version: '0.0.2',
    // Brief, one-line summary of the package.
    summary: 'Insert and update contacts to agilecrm with the help of simple-schema and autoform',
    // URL to the Git repository containing the source code for this package.
    git: '',
    // By default, Meteor will default to using README.md for documentation.
    // To avoid submitting documentation, set this field to null.
    documentation: 'README.md'
});

Package.onUse(function(api) {
    api.versionsFrom('1.2.1');
    api.use(['ecmascript', "coffeescript", "check"]);
    api.use("aldeed:autoform@5.0.0");
    api.addFiles('both/simpleschema.coffee');
    api.addFiles('client/api.coffee', 'client');
    api.addFiles('client/autoform/agilecrm.coffee', 'client');

    // Imply SS to make sure SimpleSchema object is available to app
    api.imply('aldeed:simple-schema@1.1.0');

});

Package.onTest(function(api) {
    api.use('ecmascript');
    api.use('tinytest');
    api.use('mellors:agilecrm');
});
