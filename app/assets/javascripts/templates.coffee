# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@load_code_area = () ->
  if Cookies.get('theme_name') != undefined
    theme = Cookies.get('theme_name')
    document.getElementById("select").selectedIndex = Cookies.get('theme_index')
  else
    theme = 'rubyblue'

  if document.getElementById('template_content') != null
    contentArea = document.getElementById('template_content')
    @editor1 = CodeMirror.fromTextArea(contentArea, theme:theme)
    @editor1.setOption 'mode', 'slim'

  if document.getElementById('template_style') != null
    styleArea = document.getElementById('template_style')
    @editor2 = CodeMirror.fromTextArea(styleArea, theme:theme)
    @editor2.setOption 'mode', 'css'

@selectTheme = () ->
  input = document.getElementById("select")
  theme = input.options[input.selectedIndex].textContent

  @editor1.setOption 'theme', theme
  @editor2.setOption 'theme', theme
  location.hash = '#' + theme

  Cookies.set 'theme_name', theme
  Cookies.set 'theme_index', input.selectedIndex

  return
