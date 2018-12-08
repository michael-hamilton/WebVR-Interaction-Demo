#Initialize Hologram cursor
Hologram.cursor.enabled = true
Hologram.cursor.fuseTimeout = 0.1
Hologram.cursor.parent = Camera_1

#Initialize fog in the scene
Hologram.scene.fog =
    type: Fog.linear
    near: 100
    far: 7000
    color: "#ccc"

#Handle main menu interactions
Ok_Button_1.onCursorIn (event, entity) ->
  Ok_Button_1.color = "#ff0000"
  	
Ok_Button_1.onCursorOut (event, entity) ->
  Ok_Button_1.color = "#1400FF"
  
Ok_Button_1.onClick (event, entity) ->
	Menu_1.visible = false
	Menu_2.visible = true
	
Ok_Button_2.onCursorIn (event, entity) ->
  Ok_Button_2.color = "#ff0000"
  	
Ok_Button_2.onCursorOut (event, entity) ->
  Ok_Button_2.color = "#1400FF"
  
Ok_Button_2.onClick (event, entity) ->
	Menu_2.visible = false
	
#Initialize animations
Menus.animate
	y: 1
	direction: 'alternate'
	curve: 'easeSine'
	time: 3
	repeat: Infinity
	
animateDuck = ->
  angle = Utils.randomNumber() * 360
  Duck.animate
    rotationY: angle
    time: 1
    curve: 'ease'
    then: ->
      componentX = 5 * Math.cos Duck.rotation.x
      componentZ = 5 * Math.sin Duck.rotation.z
      Duck.animate
        lookAt: "0 " + componentX + " " + componentZ 
        x: componentX
        z: componentZ
        time: 1
        curve: 'ease'
        then: ->
          animateDuck()
animateDuck()


Camera_1.animate
	z: 30
	y: 24
	time: 5
	curve: 'easeInOut'
