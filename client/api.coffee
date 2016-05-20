Meteor.startup ->
  $.getScript "https://sipgate.agilecrm.com/stats/min/agile-min.js", ->
    _agile.set_account(Meteor.settings.public.agileCrmApiKey, 'sipgate');