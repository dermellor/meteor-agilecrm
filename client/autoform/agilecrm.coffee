global = @

validateForm = ->
  return AutoForm._validateFormDoc(@formDocs["insertDoc"], false, @form.id, global[@form.schema], @form)

formToAgileContact = (formId) ->

  formValues = AutoForm.getFormValues(formId)
  schema = AutoForm.getFormSchema(formId)._schema
  doc = AutoForm.getFormValues(formId)["insertDoc"]
  agileCrmContact = AutoForm.findAttributesWithPrefix("agile")
  for key, value of doc
    agileField = schema[key].agileCrmField
    agileCrmContact[agileField] = value

  console.log agileCrmContact
  return agileCrmContact

getResultObj = (handler)->
  error: (data) ->
    handler.result(data.error, data)
  success: (data) ->
    handler.result(null, data)

AutoForm.addFormType "insert_agilecrm", {
  onSubmit: () ->
    @event.preventDefault()
    agileCrmContact = formToAgileContact(@formId)
    _agile.create_contact(agileCrmContact, getResultObj(@))

  validateForm: validateForm
}

AutoForm.addFormType "update_agilecrm", {
  onSubmit: () ->
    @event.preventDefault()
    agileCrmContact = formToAgileContact(@formId)
    _agile.set_email(agileCrmContact.email)
    _agile.update_contact(agileCrmContact, getResultObj(@))

  validateForm: validateForm
}

AutoForm.addHooks(null,
  onSuccess: (formType, result) ->
    if formType == 'insert_agilecrm' || formType == 'update_agilecrm'
      Session.set('agilecrm-form',
        type: 'success'
        formId: @formId
        result: result
      )
  onError: (formType, result) ->
    if formType == 'insert_agilecrm' || formType == 'update_agilecrm'
      console.log result
      Session.set('agilecrm-form',
        type: 'error'
        formId: @formId
        result: result
      )
)