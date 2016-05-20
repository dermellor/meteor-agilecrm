# mellors:agilecrm

Insert and update contacts to agilecrm with the help of [simple-schema](https://github.com/aldeed/meteor-simple-schema) and [autoform](https://github.com/aldeed/meteor-autoform) 

#Installation

`meteor add mellors:agilecrm`

#Configuration

Declare your AgileCRM API Key in your settings

```
{
  "public": {
    "agileCrmApiKey": "YOUR_API_KEY"
  }
}
```

Then define your schema for the contact form. For every field you must add the correlating field name in AgileCRM.

```
@mySchema = new SimpleSchema
  email:
    type: String
    regEx: SimpleSchema.RegEx.Email
    agileCrmField: "email"
```
   
Now you can add an autoform which uses the schema. Using the form types "insert_agilecrm" or "update_agilecrm" the form will push the values to AgileCRM.

```
<template name="hello">
    {{> quickForm schema="mySchema" id="newAgileCrmContact" type="insert_agilecrm"}}
</template>
```