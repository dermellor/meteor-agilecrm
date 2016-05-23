Template.agileCrmMessage.helpers
  success: ->
    message = Session.get('agilecrm-form')
    if message && message.type == 'success' && message.formId == @formId
      return @successMessage || message.result
  error: ->
    message = Session.get('agilecrm-form')
    if message && message.type == 'error' && message.formId == @formId
      return @errorMessage || message.result
