# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@count = # => Current number of respective set of input fields available on the page, default to 1.
  skills:1
  work_experience:1
  education_background:1
  project_experience:1

# Similar function to first_inputs helper in profile helper
# The title part can be replaced by array implementation to save performance
@nth_inputs = (parent, childs = [], number) ->
  result = ''
  for child in childs
    title = (child.split('_').map (word) -> word[0].toUpperCase() + word[1..-1]).join ' '
    result += '<em>' + title + '&nbsp</em>' + text_field_tag(parent + '[' + number + '][' + child + ']') + '<br><br>'
  result

# Generate string of input tag, only mimicked the current required effect of original rails helper
@text_field_tag = (string) ->
  return '<input type="text" name="' + string + ' id="' + string.split(/[\[\]]/).filter((x) -> return x != "").join('_') + '">'
