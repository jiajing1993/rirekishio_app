#
# Top section contain pieces of code, bottom section contain assembled and working codes (faster)
#


# Similar function to first_inputs helper in profile helper
# The title part can be replaced by array implementation to save performance
@nth_inputs_slow = (parent, childs = [], number) ->
  result = ''
  for child in childs
    title = (child.split('_').map (word) -> word[0].toUpperCase() + word[1..-1]).join ' '
    result += '<em>' + title + '&nbsp</em>' + text_field_tag(parent + '[' + number + '][' + child + ']') + '<br><br>'
  result
@nth_inputs = (parent, childs = [], number) ->
  result = ''
  for child in childs
    title = (child.split('_').map (word) -> word[0].toUpperCase() + word[1..-1]).join ' '
    result +=  '<em>' + title + '&nbsp</em>' + '<input type="text" name="' + parent + '[' + number + '][' + child + '] id="' + parent + '_' + number + '_' + child + '"><br><br>'

# Generate string of input tag, only mimicked the current required effect of original rails helper
@text_field_tag = (string) ->
  return '<input type="text" name="' + string + ' id="' + string.split(/[\[\]]/).filter((x) -> return x != "").join('_') + '">'


# Real input fields generator
# parents: 0:skill 1:work_experience 2:education_background 3:project_experience


@field_count = [ # => Current number of respective set of input fields available on the page, default to 1.
  1, # => skills
  1, # => work experience
  1, # => education background
  1, # => project experience
]
@field_groups = [
  'skills',
  'work_experience',
  'education_background',
  'project_experience'
]
@field_names = [
  [
    ["Proficiency", "proficiency"],
    ["Skills", "skills"],
    ["Description", "description"]
  ],
  [
    ["Company Name", "company"],
    ["Role", "role"],
    ["Start Date", "start_date"],
    ["End Date", "end_date"],
    ["City", "city"],
    ["Descripton", "description"]
  ],
  [
    ["Graduation Date", "graduation_date"],
    ["University", "university"],
    ["Major", "major"]
  ],
  [
    ["Project Name", "name"],
    ["Project Link", "link"],
    ["Description", "description"]
  ]
]

@nth_field = (k, n) -> # => k denotes the index of parents
  result = ''
  parent = @field_groups[k]
  for field in @field_names[k]
    title = field[0]
    child = field[1]
    result +=  '<em>' + title + '&nbsp</em>' + '<input type="text" name="' + parent + '[' + n + '][' + child + ']" id="' + parent + '_' + n + '_' + child + '">'
  result += '<br><br>'

@input_fields = (k) -> # => k denotes the index of parents
  # Create buffer
  buffer = []
  count = 0
  while count != @field_count[k]
    buffer[count] = []
    for child,i in @field_names[k]
      buffer[count][i] = document.getElementById(@field_groups[k] + '_' + count + '_' + child[1]).value
    count++

  # Generate html, refresh html
  @field_count[k] += 1
  count = 0
  result = ''
  while count != @field_count[k]
    result += @nth_field(k, count)
    count++
  target_id = (@field_groups[k].split('_').map (word) -> word[0].toUpperCase() + word[1..-1]).join('')
  document.getElementById(target_id).innerHTML = result

  # Load buffer
  count = 0
  while count != @field_count[k] - 1
    for child,i in @field_names[k]
      document.getElementById(@field_groups[k] + '_' + count + '_' + child[1]).value = buffer[count][i]
    count++
