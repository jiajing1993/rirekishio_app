# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@load_code_area = () ->
  if document.getElementById('template_content') != null
    myTextArea = document.getElementById('template_content')
    @editor = CodeMirror.fromTextArea(myTextArea, theme:'rubyblue')

@selectTheme = () ->
  input = document.getElementById("select")
  theme = input.options[input.selectedIndex].textContent
  @editor.setOption 'theme', theme
  location.hash = '#' + theme
  return
