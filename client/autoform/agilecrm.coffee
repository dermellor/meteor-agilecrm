global = @

validateForm = ->
  return AutoForm._validateFormDoc(@formDoc, false, @form.id, global[@form.schema], @form)

formToAgileContact = (formId) ->

  formValues = AutoForm.getFormValues(formId)
  schema = AutoForm.getFormSchema(formId)._schema
  doc = AutoForm.getFormValues(formId)["insertDoc"]
  agileCrmContact = {}

  for key, value of doc
    agileField = schema[key].agileCrmField
    agileCrmContact[agileField] = value

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
    _agile.update_contact(agileCrmContact getResultObj(@))

  validateForm: validateForm
}