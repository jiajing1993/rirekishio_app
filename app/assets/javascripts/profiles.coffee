# ============
# Unused codes
# ============


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

# Generate string of input tag, accepts input in the form a[b][c]d[e]
@text_field_tag = (string) ->
  return '<input type="text" name="' + string + ' id="' + string.split(/[\[\]]/).filter((x) -> return x != "").join('_') + '">'


# ======================
# Currently active codes
# ======================****************************************************************************
# Generate field using partials, but array is preserved becuz array depends on input ids naming rule
# **************************************************************************************************


# Real input fields generator
# parents: 0:skill 1:work_experience 2:education_background 3:project_experience
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
@field_count = [ # => Current number of respective set of input fields available on the page, default to 1.
  1, # => skills
  1, # => work experience
  1, # => education background
  1, # => project experience
]

@nth_field = (k, n) -> # => k denotes the index of parents
  result = ''
  switch k
    when 0 then result += @skills
    when 1 then result += @work_experience
    when 2 then result += @education_background
    when 3 then result += @project_experience
  result = result.replace(/index/g, n)
  return result

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

@remove_field = (k, n) ->
  parent = field_groups[k]
  count = n

  # Leave at least 1 line on page
  if @field_count[k] == 1
    alert "You must have at least one line of it."
    return 0

  total_count = @field_count[k] - 1
  while count != total_count
    for child in @field_names[k]
      document.getElementById(parent + '_' + count + '_' + child[1]).value =
        document.getElementById(parent + '_' + (count + 1) + '_' + child[1]).value
     count++
  for child in @field_names[k]
    final_line = document.getElementById(parent + '_' + total_count + '_' + child[1])


    # Now need to remove the label of inputs
    # (future): use class to identify the labels and inputs
    tags = final_line.parentNode.getElementsByTagName("EM")
    final_line.parentNode.removeChild(tags[tags.length - 1])

    final_line.parentNode.removeChild(final_line)

  # clean br and X sign
  refer_node = document.getElementById(parent + '_' + 0 + '_' + @field_names[k][0][1]).parentNode
  brs = refer_node.getElementsByTagName("BR")
  refer_node.removeChild(brs[brs.length - 1])
  buttons = refer_node.getElementsByTagName("button")
  refer_node.removeChild(buttons[buttons.length - 1])

  @field_count[k] -= 1
