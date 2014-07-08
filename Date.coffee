command: "date +%A,%B,%e,%Y"

refreshFrequency: 1000

style: """
  size = 800px

  width: size
  margin-left: -.5 * size

  top: 80%
  left: 50%

  text-align: center

  font-family: Helvetica Neue
  font-weight: 100
  font-size: 46px


  primaryColor = rgba(0,0,30,0.55)
  secondaryColor = rgba(255,255,255,0.25)

  #main-div
  	veritcal-align: top


  #main
    color: primaryColor
    font-size: 64px


  #suffix
  	color: primaryColor
  	font-weight: 100
  	margin-left: -15px

  #secondary
    font-weight: 100
  	color: secondaryColor
"""

render: (output) -> """
  <div id="main-div">
    <span id ="main"></span>
    <sup id="suffix"></sup>
  </div>
  <div id="secondary"></div>

"""


update: (output) ->
  dateInfo = output.split(',')

  day = dateInfo[0]
  month = dateInfo[1]
  numDate = parseInt(dateInfo[2])
  year = dateInfo[3]


  suffix = switch
  	when numDate is 1 then 'st'
  	when numDate is 2 then 'nd'
  	when numDate is 3 then 'rd'
  	when numDate < 21 then 'th'
  	when numDate is 21 then 'st'
  	when numDate is 22 then 'nd'
  	when numDate is 23 then 'rd'
  	when numDate < 31 then 'th'
  	when numDate is 31 then 'st'
  	else 'ERROR'

  top = day+" the "+numDate
  bottom = month+", "+year

  $('#main').text top
  $('#suffix').text suffix
  $('#secondary').text bottom

