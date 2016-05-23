# mellors:agilecrm

Insert and update contacts to agilecrm with the help of [simple-schema](https://github.com/aldeed/meteor-simple-schema) and [autoform](https://github.com/aldeed/meteor-autoform) 

#Installation

`meteor add mellors:agilecrm`

#Configuration

Declare your AgileCRM API Key in your settings

```
{
  "public": {
    "agileCrmApiKey": "h8a9325tfbasmr4tkpim61o1vq"
  }
}
```

First define a schema for the contact form and declare a agileCrmField for every field.

```
@mySchema = new SimpleSchema
  email:
    type: String
    regEx: SimpleSchema.RegEx.Email
    agileCrmField: "email"
```
   
Now you can use the schema with autoform. By using the the type "insert_agilecrm" or "update_agilecrm" 

```
<template name="hello">
    {{> quickForm schema="mySchema" id="newAgileCrmContact" type="insert_agilecrm" agiletags="tag1, tags"}}
</template>
{{> agileCrmMessage formId="newAgileCrmContact" successMessage="Thank you" errorMessage="That did not work :("}}
```