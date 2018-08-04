current_round = 0
number_of_players = 2
level_1 = {}
level_2 = {}
level_3 = {}
level_4 = {}
level_5 = {}
level_6 = {}
rounds_3 = {}
rounds_4 = {}
rounds_5 = {}
number_of_players_button = {}
setup_button = {}
minors_button = {}
occs_button = {}
card1 = {}
card2 = {}
card3 = {}
card4 = {}
card5 = {}
card6 = {}
card_1 = {}
card_2 = {}
card_3 = {}
card_4 = {}
card_5 = {}
card_6 = {}
card_7 = {}
card_8 = {}
card_9 = {}
card_10 = {}
card_11 = {}
card_12 = {}
card_13 = {}
card_14 = {}
sheep_id = '85b867'
pig_id = '6c1287'
cow_id = '1e18f2'
stone_1_id = '0d7a31'
stone_2_id = 'd37bf8'
traveling_1_id = '944d68'
traveling_2_id = 'c8734c'
wood_1_id = '11e22f'
wood_2_a_id = '91aa89'
wood_2_b_id = 'aadc49'
wood_3_id = '470341'
clay_1_id = 'c2aaf9'
clay_2_id = '37a094'
clay_3_id = '1316e0'
reed_1_id = '4db587'
food = {}
clay = {}
wood = {}
stone = {}
reed = {}
sheep = {}
pig = {}
cow = {}

function onload()
	Ag = {
		scriptingZone = getObjectFromGUID('fb5e33'),
		homePositions = { purple = {-9.74, 1.26, -22.78}, red = {16.62, 1.26, -22.87}, wood = {42.67, 1.26, -4.14},
											blue = {30.44, 1.26, 21.22}, green = {0.98, 1.26, 21.14} }
	}

  level_1 = getObjectFromGUID('70a876')
  level_2 = getObjectFromGUID('05db33')
  level_3 = getObjectFromGUID('e8aa98')
  level_4 = getObjectFromGUID('fa1c5e')
  level_5 = getObjectFromGUID('eb4a6b')
  level_6 = getObjectFromGUID('caae5b')
  rounds_3 = getObjectFromGUID('b4aad8')
  rounds_4 = getObjectFromGUID('eb2550')
  rounds_5 = getObjectFromGUID('6fd961')
  number_of_players_button = players_button_setup()
  setup_button = setup()
  minors_button = minors_setup()
  occs_button = occs_setup()
  food = getObjectFromGUID('f249ab')
  wood = getObjectFromGUID('57458b')
  clay = getObjectFromGUID('8a147c')
  stone = getObjectFromGUID('c64ad7')
  reed = getObjectFromGUID('141313')
  sheep = getObjectFromGUID('f851b2')
  pig = getObjectFromGUID('e7b33c')
  cow = getObjectFromGUID('f0c5e7')
  card_14 = getObjectFromGUID('a1e455')
end

function setup()
  local button = getObjectFromGUID('739563')
  local button_parameters = {}
  button_parameters.click_function = "run_setup"
  button_parameters.label = "Setup"
  button_parameters.function_owner = nil
  button_parameters.position = {0.0, 1.0, 0.0}
  ---button_parameters.rotation = {x, y, z}
  button_parameters.width = 500
  button_parameters.height = 500
  --button_parameters.font_size = 200
  button.createButton(button_parameters)
  return button
end

function minors_setup()
  local button = getObjectFromGUID('2f9fd8')
  local button_parameters = {}
  button_parameters.click_function = "onClick_RotateHandsL"
  button_parameters.label = "Pass\nMinors"
  button_parameters.function_owner = self
  button_parameters.position = {0.0, 1.0, 0.0}
  ---button_parameters.rotation = {x, y, z}
  button_parameters.width = 500
  button_parameters.height = 500
  --button_parameters.font_size = 200
  button.createButton(button_parameters)
  return button
end

function occs_setup()
  local button = getObjectFromGUID('82855d')
  local button_parameters = {}
  button_parameters.click_function = "onClick_RotateHandsR"
  button_parameters.label = "Pass\nOccs"
  button_parameters.function_owner = self
  button_parameters.position = {0.0, 1.0, 0.0}
  ---button_parameters.rotation = {x, y, z}
  button_parameters.width = 500
  button_parameters.height = 500
  --button_parameters.font_size = 200
  button.createButton(button_parameters)
  return button
end

function onClick_RotateHandsL()
  flipDraftCounters()
    local players = getRealSeatedPlayers()
    local playersClockwise = playersClockwise(players)
    --print("DEBUG: Number of seated players: " .. #players)
    --print("DEBUG: Number of players clockwise: " .. #playersClockwise)
    --for i,player in ipairs(playersClockwise) do
    --    print("DEBUG: " .. i .. " : " .. player.color)
    --end
    for i, player in ipairs(playersClockwise) do
        local moveToIndex = 1
        if i == #players
        then
            moveToIndex = 1
        else
            moveToIndex = i + 1
        end
        local moveToPlayer = playersClockwise[moveToIndex]
        --print("DEBUG: Moving cards from " .. i .. " : " .. player.color ..
        --    " to " .. moveToIndex .. " : " .. moveToPlayer.color)
        for i,card in ipairs(player.getHandObjects()) do
      			card.setPosition(getPlayerHandPosition(moveToPlayer))
      			card.setRotation({0, moveToPlayer.getHandTransform(1).rotation[2]+180, 0})
    		end
    end
end

function onClick_RotateHandsR()
  flipDraftCounters()
    local players = getRealSeatedPlayers()
    local playersCounterClockwise = playersCounterClockwise(players)
    --print("DEBUG: Number of seated players: " .. #players)
    --print("DEBUG: Number of players clockwise: " .. #playersClockwise)
    --for i,player in ipairs(playersClockwise) do
    --    print("DEBUG: " .. i .. " : " .. player.color)
    --end
    for i, player in ipairs(playersCounterClockwise) do
        local moveToIndex = 1
        if i == #players
        then
            moveToIndex = 1
        else
            moveToIndex = i + 1
        end
        local moveToPlayer = playersCounterClockwise[moveToIndex]
        --print("DEBUG: Moving cards from " .. i .. " : " .. player.color ..
        --    " to " .. moveToIndex .. " : " .. moveToPlayer.color)
        for i,card in ipairs(player.getHandObjects()) do
            card.setPosition(getPlayerHandPosition(moveToPlayer))
      			card.setRotation({0, moveToPlayer.getHandTransform(1).rotation[2]+180, 0})
        end
    end
end


-- getSeatedPlayers() doesn't return the actual Player objects.
-- This function will instead return the 'real' Player objects.
function getRealSeatedPlayers()
    local playerColors = getSeatedPlayers()
    local players = {}
    local newI = 1
    for i, playerColor in pairs(playerColors) do
        if Player[playerColor].getPlayerHand() != nil
        then
            players[newI] = Player[playerColor]
            newI = newI + 1
        end
    end
    return players
end

function getPlayerHandPosition(player)
    hand = player.getPlayerHand()
    return {hand.pos_x, hand.pos_y, hand.pos_z}
end

-- Returns a Table with player angles (in radians) as the keys
function playerAngles(players)
    local angles = {}
    for i, player in pairs(players) do
        angles[getPlayerAngle(player)] = player
    end
    return angles
end

function playersCounterClockwise(players)
    local newPlayers = {}
    local newI = 1
    for i, player in pairsByKeys(playerAngles(players)) do
        newPlayers[newI] = player
        newI = newI + 1
    end
    return newPlayers
end

function playersClockwise(players)
    local newPlayers = {}
    local newI = #players
    for i, player in pairsByKeys(playerAngles(players)) do
        newPlayers[newI] = player
        newI = newI - 1
    end
    return newPlayers
end

function getPlayerAngle(player)
    local hand = player.getPlayerHand()
    --print("DEBUG: Player color: " .. player.color)
    return math.atan2(hand.pos_z, hand.pos_x)
end

-- Copied from LUA docs... returns iterator in order of keys
function pairsByKeys (t, f)
    local a = {}
    for n in pairs(t) do table.insert(a, n) end
        table.sort(a, f)
        local i = 0      -- iterator variable
        local iter = function ()   -- iterator function
        i = i + 1
        if a[i] == nil then return nil
            else return a[i], t[a[i]]
        end
    end
    return iter
end

function reverseArray(tbl)
  for i=1, math.floor(#tbl / 2) do
    local tmp = tbl[i]
    tbl[i] = tbl[#tbl - i + 1]
    tbl[#tbl - i + 1] = tmp
  end
end

function flipDraftCounters()
  y = getAllObjects()
  for i,v in pairs(y) do
    rotation = v.getRotation()
    zAxis = rotation[3]
    if v.getDescription() == 'Drafting Button' and zAxis <= 179.99 then
      v.flip()
    end
  end
end

function run_setup()
  rounds_3.shuffle()
  rounds_4.shuffle()
  rounds_5.shuffle()
  level_1.shuffle()
  level_2.shuffle()
  level_3.shuffle()
  level_4.shuffle()
  level_5.shuffle()

  startLuaCoroutine(Global, 'remove_and_deal')
end

function remove_and_deal()
  if number_of_players == 3 then
    waitFrames(15)
    local params = {}
    params.position = { -2.44, 1.13, 4.5 }
    params.rotation = { 0, 180, 0}
    card1 = rounds_3.takeObject(params)
    waitFrames(15)
    local params = {}
    params.position = { 0.43, 1.13, 4.5 }
    params.rotation = { 0, 180, 0}
    card2 = rounds_3.takeObject(params)
    waitFrames(15)
    local params = {}
    params.position = { -2.37, 1.13, 0.11 }
    params.rotation = { 0, 180, 0}
    card3 = rounds_3.takeObject(params)
    waitFrames(15)
    local params = {}
    params.position = { 0.43, 1.13, 0.11 }
    params.rotation = { 0, 180, 0}
    card4 = rounds_3.takeObject(params)
    rounds_3.destruct()
    waitFrames(60)
    card1.lock()
    card2.lock()
    card3.lock()
    card4.lock()
  end

  if number_of_players == 4 then
    waitFrames(15)
    local params = {}
    params.position = { -2.44, 1.13,4.5 }
    params.rotation = { 0, 180, 0}
    card1 = rounds_4.takeObject(params)
    waitFrames(15)
    local params = {}
    params.position = { 0.43, 1.13,4.5 }
    params.rotation = { 0, 180, 0}
    card2 = rounds_4.takeObject(params)
    waitFrames(15)
    local params = {}
    params.position = { -2.37, 1.13,0.11 }
    params.rotation = { 0, 180, 0}
    card3 = rounds_4.takeObject(params)
    waitFrames(15)
    local params = {}
    params.position = { 0.43, 1.13,0.11 }
    params.rotation = { 0, 180, 0}
    card4 = rounds_4.takeObject(params)
    waitFrames(15)
    local params = {}
    params.position = { -2.44, 1.13,-4.17 }
    params.rotation = { 0, 180, 0}
    card5 = rounds_4.takeObject(params)
    waitFrames(15)
    local params = {}
    params.position = { 0.43, 1.13,-4.17 }
    params.rotation = { 0, 180, 0}
    card6 = rounds_4.takeObject(params)
    rounds_4.destruct()
    waitFrames(60)
    card1.lock()
    card2.lock()
    card3.lock()
    card4.lock()
    card5.lock()
    card6.lock()
  end

  if number_of_players == 5 then
    waitFrames(15)
    local params = {}
    params.position = { -2.44, 1.13,4.5 }
    params.rotation = { 0, 180, 0}
    card1 = rounds_5.takeObject(params)
    waitFrames(15)
    local params = {}
    params.position = { 0.43, 1.13,4.5 }
    params.rotation = { 0, 180, 0}
    card2 = rounds_5.takeObject(params)
    waitFrames(15)
    local params = {}
    params.position = { -2.37, 1.13,0.11 }
    params.rotation = { 0, 180, 0}
    card3 = rounds_5.takeObject(params)
    waitFrames(15)
    local params = {}
    params.position = { 0.43, 1.13,0.11 }
    params.rotation = { 0, 180, 0}
    card4 = rounds_5.takeObject(params)
    waitFrames(15)
    local params = {}
    params.position = { -2.44, 1.13,-4.17 }
    params.rotation = { 0, 180, 0}
    card5 = rounds_5.takeObject(params)
    waitFrames(15)
    local params = {}
    params.position = { 0.43, 1.13,-4.17 }
    params.rotation = { 0, 180, 0}
    card6 = rounds_5.takeObject(params)
    rounds_5.destruct()
    waitFrames(60)
    card1.lock()
    card2.lock()
    card3.lock()
    card4.lock()
    card5.lock()
    card6.lock()
  end

  destroyObject(number_of_players_button)
  destroyObject(minors_button)
  destroyObject(occs_button)

  local button_parameters = {}
  button_parameters.index = 0
  button_parameters.position = {0, 1.0, 0}
  --button_parameters.rotation = {0, 180, 0}
  button_parameters.click_function = "start_first_round"
  button_parameters.label = "Start"
  setup_button.editButton(button_parameters)

  waitFrames(15)
  local params = {}
  params.position = { 7.87, 1.13, 4.57 }
  params.rotation = { 0, 180, 180}
  card_1 = level_1.takeObject(params)
  waitFrames(15)
  local params = {}
  params.position = { 10.99, 1.13,4.57 }
  params.rotation = { 0, 180, 180}
  card_2 = level_1.takeObject(params)
  waitFrames(15)
  local params = {}
  params.position = { 10.99, 1.13,0.23 }
  params.rotation = { 0, 180, 180}
  card_3 = level_1.takeObject(params)
  waitFrames(15)
  local params = {}
  params.position = { 10.99, 1.13,-4.25 }
  params.rotation = { 0, 180, 180}
  card_4 = level_1.takeObject(params)
  level_1.destruct()

  waitFrames(15)
  local params = {}
  params.position = { 13.95, 1.13,4.57 }
  params.rotation = { 0, 180, 180}
  card_5 = level_2.takeObject(params)
  waitFrames(15)
  local params = {}
  params.position = { 13.95, 1.13,0.23 }
  params.rotation = { 0, 180, 180}
  card_6 = level_2.takeObject(params)
  waitFrames(15)
  local params = {}
  params.position = { 13.95, 1.13,-4.25 }
  params.rotation = { 0, 180, 180}
  card_7 = level_2.takeObject(params)
  level_2.destruct()

  waitFrames(15)
  local params = {}
  params.position = { 18.05, 1.13,4.42 }
  params.rotation = { 0, 180, 180}
  card_8 = level_3.takeObject(params)
  waitFrames(15)
  local params = {}
  params.position = { 18.05, 1.13,0.0 }
  params.rotation = { 0, 180, 180}
  card_9 = level_3.takeObject(params)
  waitFrames(15)
  level_3.destruct()

  waitFrames(15)
  local params = {}
  params.position = { 20.85, 1.13,4.42 }
  params.rotation = { 0, 180, 180}
  card_10 = level_4.takeObject(params)
  waitFrames(15)
  local params = {}
  params.position = { 20.85, 1.13,0.0 }
  params.rotation = { 0, 180, 180}
  card_11 = level_4.takeObject(params)
  waitFrames(15)
  level_4.destruct()

  waitFrames(15)
  local params = {}
  params.position = { 24, 1.13,4.42 }
  params.rotation = { 0, 180, 180}
  card_12 = level_5.takeObject(params)
  waitFrames(15)
  local params = {}
  params.position = { 24, 1.13,0.0 }
  params.rotation = { 0, 180, 180}
  card_13 = level_5.takeObject(params)
  waitFrames(15)
  level_5.destruct()

  waitFrames(15)
  local params = {}
  params.position = { 26.9, 1.13,4.42}
  params.rotation = { 0, 180, 180}
  card_14 = level_6.takeObject(params)
  waitFrames(15)
  level_6.destruct()

  return 1
end

function players_button_setup()
  number_of_players = 2
  local button = getObjectFromGUID('df68c1')
  local button_parameters = {}
  button_parameters.click_function = "set_three_players"
  button_parameters.label = "# Players:\n 2"
  button_parameters.function_owner = nil
  button_parameters.position = {0.0, 1.0, 0.0}
  ---button_parameters.rotation = {x, y, z}
  button_parameters.width = 500
  button_parameters.height = 500
  --button_parameters.font_size = 150
  button.createButton(button_parameters)
  return button
end

function set_two_players()
  number_of_players = 2
  local button_parameters = {}
  button_parameters.index = 0
  button_parameters.position = {0.0, 1.0, 0.0}
  ---button_parameters.rotation = {x, y, z}
  button_parameters.click_function = "set_three_players"
  button_parameters.label = "# Players:\n 2"
  number_of_players_button.editButton(button_parameters)
end

function set_three_players()
  number_of_players = 3
  local button_parameters = {}
  button_parameters.index = 0
  button_parameters.position = {0.0, 1.0, 0.0}
  ---button_parameters.rotation = {x, y, z}
  button_parameters.click_function = "set_four_players"
  button_parameters.label = "# Players:\n 3"
  number_of_players_button.editButton(button_parameters)
end

function set_four_players()
  number_of_players = 4
  local button_parameters = {}
  button_parameters.index = 0
  button_parameters.position = {0.0, 1.0, 0.0}
  ---button_parameters.rotation = {x, y, z}
  button_parameters.click_function = "set_five_players"
  button_parameters.label = "# Players:\n 4"
  number_of_players_button.editButton(button_parameters)
end

function set_five_players()
  number_of_players = 5
  local button_parameters = {}
  button_parameters.index = 0
  button_parameters.position = {0.0, 1.0, 0.0}
  ---button_parameters.rotation = {x, y, z}
  button_parameters.click_function = "set_two_players"
  button_parameters.label = "# Players:\n 5"
  number_of_players_button.editButton(button_parameters)
end

function start_first_round()
	recallDudes()
  current_round = 1
  local button_parameters = {}
  button_parameters.index = 0
  button_parameters.position = {0.0, 1.0, 0.0}
  ---button_parameters.rotation = {x, y, z}
  button_parameters.click_function = "start_second_round"
  button_parameters.label = "Round 2"
  setup_button.editButton(button_parameters)

  startLuaCoroutine(Global, 'first_round')
end

function first_round()
  card_1.flip()
  waitFrames(50)
  card_1.lock()
  populate_common()

  if card_1.getGUID() == sheep_id then
    local params = {}
    params.position = { 7.87, 2, 4.57 }
    sheep.takeObject(params)
  end

  return 1
end

function start_second_round()
	recallDudes()
  current_round = 2
  local button_parameters = {}
  button_parameters.index = 0
  button_parameters.position = {0.0, 1.0, 0.0}
  ---button_parameters.rotation = {x, y, z}
  button_parameters.click_function = "start_third_round"
  button_parameters.label = "Round 3"
  setup_button.editButton(button_parameters)

  startLuaCoroutine(Global, 'second_round')
end

function second_round()
  card_2.flip()
  waitFrames(50)
  card_2.lock()
  populate_common()

  if card_1.getGUID() == sheep_id then
    local params = {}
    params.position = { 7.87, 2, 4.57 }
    sheep.takeObject(params)
  end
  if card_2.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, 4.57 }
    sheep.takeObject(params)
  end

  return 1
end

function start_third_round()
	recallDudes()
  current_round = 3
  local button_parameters = {}
  button_parameters.index = 0
  button_parameters.position = {0.0, 1.0, 0.0}
  ---button_parameters.rotation = {x, y, z}
  button_parameters.click_function = "start_fourth_round"
  button_parameters.label = "Round 4"
  setup_button.editButton(button_parameters)

  startLuaCoroutine(Global, 'third_round')
end

function third_round()
  card_3.flip()
  waitFrames(50)
  card_3.lock()
  populate_common()

  if card_1.getGUID() == sheep_id then
    local params = {}
    params.position = { 7.87, 2, 4.57 }
    sheep.takeObject(params)
  end
  if card_2.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, 4.57 }
    sheep.takeObject(params)
  end
  if card_3.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, 0.23 }
    sheep.takeObject(params)
  end

  return 1
end

function start_fourth_round()
	recallDudes()
  current_round = 4
  local button_parameters = {}
  button_parameters.index = 0
  button_parameters.position = {0.0, 1.0, 0.0}
  ---button_parameters.rotation = {x, y, z}
  button_parameters.click_function = "start_fifth_round"
  button_parameters.label = "Round 5"
  setup_button.editButton(button_parameters)

  startLuaCoroutine(Global, 'fourth_round')
end

function fourth_round()
  card_4.flip()
  waitFrames(50)
  card_4.lock()
  populate_common()

  if card_1.getGUID() == sheep_id then
    local params = {}
    params.position = { 7.87, 2, 4.57 }
    sheep.takeObject(params)
  end
  if card_2.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, 4.57 }
    sheep.takeObject(params)
  end
  if card_3.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, 0.23 }
    sheep.takeObject(params)
  end
  if card_4.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, -4.25 }
    sheep.takeObject(params)
  end

  return 1
end

function start_fifth_round()
	recallDudes()
  current_round = 5
  local button_parameters = {}
  button_parameters.index = 0
  button_parameters.position = {0.0, 1.0, 0.0}
  ---button_parameters.rotation = {x, y, z}
  button_parameters.click_function = "start_sixth_round"
  button_parameters.label = "Round 6"
  setup_button.editButton(button_parameters)

  startLuaCoroutine(Global, 'fifth_round')
end

function fifth_round()
  card_5.flip()
  waitFrames(50)
  card_5.lock()
  populate_common()

  if card_1.getGUID() == sheep_id then
    local params = {}
    params.position = { 7.87, 2, 4.57 }
    sheep.takeObject(params)
  end
  if card_2.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, 4.57 }
    sheep.takeObject(params)
  end
  if card_3.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, 0.23 }
    sheep.takeObject(params)
  end
  if card_4.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, -4.25 }
    sheep.takeObject(params)
  end
  if card_5.getGUID() == stone_1_id then
    local params = {}
    params.position = { 13.95, 2, 4.57 }
    stone.takeObject(params)
  end

  return 1
end

function start_sixth_round()
	recallDudes()
  current_round = 6
  local button_parameters = {}
  button_parameters.index = 0
  button_parameters.position = {0.0, 1.0, 0.0}
  ---button_parameters.rotation = {x, y, z}
  button_parameters.click_function = "start_seventh_round"
  button_parameters.label = "Round 7"
  setup_button.editButton(button_parameters)

  startLuaCoroutine(Global, 'sixth_round')
end

function sixth_round()
  card_6.flip()
  waitFrames(50)
  card_6.lock()
  populate_common()

  if card_1.getGUID() == sheep_id then
    local params = {}
    params.position = { 7.87, 2, 4.57 }
    sheep.takeObject(params)
  end
  if card_2.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, 4.57 }
    sheep.takeObject(params)
  end
  if card_3.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, 0.23 }
    sheep.takeObject(params)
  end
  if card_4.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, -4.25 }
    sheep.takeObject(params)
  end
  if card_5.getGUID() == stone_1_id then
    local params = {}
    params.position = { 13.95, 2, 4.57 }
    stone.takeObject(params)
  end
  if card_6.getGUID() == stone_1_id then
    local params = {}
    params.position = { 13.95, 2, 0.23 }
    stone.takeObject(params)
  end

  return 1
end

function start_seventh_round()
	recallDudes()
  current_round = 7
  local button_parameters = {}
  button_parameters.index = 0
  button_parameters.position = {0.0, 1.0, 0.0}
  ---button_parameters.rotation = {x, y, z}
  button_parameters.click_function = "start_8_round"
  button_parameters.label = "Round 8"
  setup_button.editButton(button_parameters)

  startLuaCoroutine(Global, 'seventh_round')
end

function seventh_round()
  card_7.flip()
  waitFrames(50)
  card_7.lock()
  populate_common()

  if card_1.getGUID() == sheep_id then
    local params = {}
    params.position = { 7.87, 2, 4.57 }
    sheep.takeObject(params)
  end
  if card_2.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, 4.57 }
    sheep.takeObject(params)
  end
  if card_3.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, 0.23 }
    sheep.takeObject(params)
  end
  if card_4.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, -4.25 }
    sheep.takeObject(params)
  end
  if card_5.getGUID() == stone_1_id then
    local params = {}
    params.position = { 13.95, 2, 4.57 }
    stone.takeObject(params)
  end
  if card_6.getGUID() == stone_1_id then
    local params = {}
    params.position = { 13.95, 2, 0.23 }
    stone.takeObject(params)
  end
  if card_7.getGUID() == stone_1_id then
    local params = {}
    params.position = { 13.95, 2, -4.25 }
    stone.takeObject(params)
  end

  return 1
end

function start_8_round()
	recallDudes()
  current_round = 8
  local button_parameters = {}
  button_parameters.index = 0
  button_parameters.position = {0.0, 1.0, 0.0}
  ---button_parameters.rotation = {x, y, z}
  button_parameters.click_function = "start_9_round"
  button_parameters.label = "Round 9"
  setup_button.editButton(button_parameters)

  startLuaCoroutine(Global, 'round_8')
end

function round_8()
  card_8.flip()
  waitFrames(50)
  card_8.lock()
  populate_common()

  if card_1.getGUID() == sheep_id then
    local params = {}
    params.position = { 7.87, 2, 4.57 }
    sheep.takeObject(params)
  end
  if card_2.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, 4.57 }
    sheep.takeObject(params)
  end
  if card_3.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, 0.23 }
    sheep.takeObject(params)
  end
  if card_4.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, -4.25 }
    sheep.takeObject(params)
  end
  if card_5.getGUID() == stone_1_id then
    local params = {}
    params.position = { 13.95, 2, 4.57 }
    stone.takeObject(params)
  end
  if card_6.getGUID() == stone_1_id then
    local params = {}
    params.position = { 13.95, 2, 0.23 }
    stone.takeObject(params)
  end
  if card_7.getGUID() == stone_1_id then
    local params = {}
    params.position = { 13.95, 2, -4.25 }
    stone.takeObject(params)
  end
  if card_8.getGUID() == pig_id then
    local params = {}
    params.position = { 18.05, 2, 4.42 }
    pig.takeObject(params)
  end

  return 1
end

function start_9_round()
	recallDudes()
  current_round = 9
  local button_parameters = {}
  button_parameters.index = 0
  button_parameters.position = {0.0, 1.0, 0.0}
  ---button_parameters.rotation = {x, y, z}
  button_parameters.click_function = "start_10_round"
  button_parameters.label = "Round 10"
  setup_button.editButton(button_parameters)

  startLuaCoroutine(Global, 'round_9')
end

function round_9()
  card_9.flip()
  waitFrames(50)
  card_9.lock()
  populate_common()

  if card_1.getGUID() == sheep_id then
    local params = {}
    params.position = { 7.87, 2, 4.57 }
    sheep.takeObject(params)
  end
  if card_2.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, 4.57 }
    sheep.takeObject(params)
  end
  if card_3.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, 0.23 }
    sheep.takeObject(params)
  end
  if card_4.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, -4.25 }
    sheep.takeObject(params)
  end
  if card_5.getGUID() == stone_1_id then
    local params = {}
    params.position = { 13.95, 2, 4.57 }
    stone.takeObject(params)
  end
  if card_6.getGUID() == stone_1_id then
    local params = {}
    params.position = { 13.95, 2, 0.23 }
    stone.takeObject(params)
  end
  if card_7.getGUID() == stone_1_id then
    local params = {}
    params.position = { 13.95, 2, -4.25 }
    stone.takeObject(params)
  end
  if card_8.getGUID() == pig_id then
    local params = {}
    params.position = { 18.05, 2, 4.42 }
    pig.takeObject(params)
  end
  if card_9.getGUID() == pig_id then
    local params = {}
    params.position = { 18.05, 2, 0.0 }
    pig.takeObject(params)
  end

  return 1
end

function start_10_round()
	recallDudes()
  current_round = 10
  local button_parameters = {}
  button_parameters.index = 0
  button_parameters.position = {0.0, 1.0, 0.0}
  ---button_parameters.rotation = {x, y, z}
  button_parameters.click_function = "start_11_round"
  button_parameters.label = "Round 11"
  setup_button.editButton(button_parameters)

  startLuaCoroutine(Global, 'round_10')
end

function round_10()
  card_10.flip()
  waitFrames(50)
  card_10.lock()
  populate_common()

  if card_1.getGUID() == sheep_id then
    local params = {}
    params.position = { 7.87, 2, 4.57 }
    sheep.takeObject(params)
  end
  if card_2.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, 4.57 }
    sheep.takeObject(params)
  end
  if card_3.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, 0.23 }
    sheep.takeObject(params)
  end
  if card_4.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, -4.25 }
    sheep.takeObject(params)
  end
  if card_5.getGUID() == stone_1_id then
    local params = {}
    params.position = { 13.95, 2, 4.57 }
    stone.takeObject(params)
  end
  if card_6.getGUID() == stone_1_id then
    local params = {}
    params.position = { 13.95, 2, 0.23 }
    stone.takeObject(params)
  end
  if card_7.getGUID() == stone_1_id then
    local params = {}
    params.position = { 13.95, 2, -4.25 }
    stone.takeObject(params)
  end
  if card_8.getGUID() == pig_id then
    local params = {}
    params.position = { 18.05, 2, 4.42 }
    pig.takeObject(params)
  end
  if card_9.getGUID() == pig_id then
    local params = {}
    params.position = { 18.05, 2, 0.0 }
    pig.takeObject(params)
  end
  if card_10.getGUID() == cow_id then
    local params = {}
    params.position = { 20.85, 2, 4.42 }
    cow.takeObject(params)
  end
  if card_10.getGUID() == stone_2_id then
    local params = {}
    params.position = { 20.85, 2, 4.42 }
    stone.takeObject(params)
  end

  return 1
end

function start_11_round()
	recallDudes()
  current_round = 11
  local button_parameters = {}
  button_parameters.index = 0
  button_parameters.position = {0.0, 1.0, 0.0}
  ---button_parameters.rotation = {x, y, z}
  button_parameters.click_function = "start_12_round"
  button_parameters.label = "Round 12"
  setup_button.editButton(button_parameters)

  startLuaCoroutine(Global, 'round_11')
end

function round_11()
  card_11.flip()
  waitFrames(50)
  card_11.lock()
  populate_common()

  if card_1.getGUID() == sheep_id then
    local params = {}
    params.position = { 7.87, 2, 4.57 }
    sheep.takeObject(params)
  end
  if card_2.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, 4.57 }
    sheep.takeObject(params)
  end
  if card_3.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, 0.23 }
    sheep.takeObject(params)
  end
  if card_4.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, -4.25 }
    sheep.takeObject(params)
  end
  if card_5.getGUID() == stone_1_id then
    local params = {}
    params.position = { 13.95, 2, 4.57 }
    stone.takeObject(params)
  end
  if card_6.getGUID() == stone_1_id then
    local params = {}
    params.position = { 13.95, 2, 0.23 }
    stone.takeObject(params)
  end
  if card_7.getGUID() == stone_1_id then
    local params = {}
    params.position = { 13.95, 2, -4.25 }
    stone.takeObject(params)
  end
  if card_8.getGUID() == pig_id then
    local params = {}
    params.position = { 18.05, 2, 4.42 }
    pig.takeObject(params)
  end
  if card_9.getGUID() == pig_id then
    local params = {}
    params.position = { 18.05, 2, 0.0 }
    pig.takeObject(params)
  end
  if card_10.getGUID() == cow_id then
    local params = {}
    params.position = { 20.85, 2, 4.42 }
    cow.takeObject(params)
  end
  if card_11.getGUID() == cow_id then
    local params = {}
    params.position = { 20.85, 2, 0.0 }
    cow.takeObject(params)
  end
  if card_10.getGUID() == stone_2_id then
    local params = {}
    params.position = { 20.85, 2, 4.42 }
    stone.takeObject(params)
  end
  if card_11.getGUID() == stone_2_id then
    local params = {}
    params.position = { 20.85, 2, 0.0 }
    stone.takeObject(params)
  end

  return 1
end

function start_12_round()
	recallDudes()
  current_round = 12
  local button_parameters = {}
  button_parameters.index = 0
  button_parameters.position = {0.0, 1.0, 0.0}
  ---button_parameters.rotation = {x, y, z}
  button_parameters.click_function = "start_13_round"
  button_parameters.label = "Round 13"
  setup_button.editButton(button_parameters)

  startLuaCoroutine(Global, 'round_12')
end

function round_12()
  card_12.flip()
  waitFrames(50)
  card_12.lock()
  populate_common()
  populate_all()

  return 1
end

function start_13_round()
	recallDudes()
  current_round = 13
  local button_parameters = {}
  button_parameters.index = 0
  button_parameters.position = {0.0, 1.0, 0.0}
  ---button_parameters.rotation = {x, y, z}
  button_parameters.click_function = "start_14_round"
  button_parameters.label = "Round 14"
  setup_button.editButton(button_parameters)

  startLuaCoroutine(Global, 'round_13')
end

function round_13()
  card_13.flip()
  waitFrames(50)
  card_13.lock()
  populate_common()
  populate_all()

  return 1
end

function start_14_round()
	recallDudes()
  current_round = 14
  setup_button.destruct()

  startLuaCoroutine(Global, 'round_14')
end

function round_14()
  card_14.flip()
  waitFrames(50)
  card_14.lock()
  populate_common()
  populate_all()

  return 1
end

function populate_all()
  if card_1.getGUID() == sheep_id then
    local params = {}
    params.position = { 7.87, 2, 4.57 }
    sheep.takeObject(params)
  end
  if card_2.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, 4.57 }
    sheep.takeObject(params)
  end
  if card_3.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, 0.23 }
    sheep.takeObject(params)
  end
  if card_4.getGUID() == sheep_id then
    local params = {}
    params.position = { 10.99, 2, -4.25 }
    sheep.takeObject(params)
  end
  if card_5.getGUID() == stone_1_id then
    local params = {}
    params.position = { 13.95, 2, 4.57 }
    stone.takeObject(params)
  end
  if card_6.getGUID() == stone_1_id then
    local params = {}
    params.position = { 13.95, 2, 0.23 }
    stone.takeObject(params)
  end
  if card_7.getGUID() == stone_1_id then
    local params = {}
    params.position = { 13.95, 2, -4.25 }
    stone.takeObject(params)
  end
  if card_8.getGUID() == pig_id then
    local params = {}
    params.position = { 18.05, 2, 4.42 }
    pig.takeObject(params)
  end
  if card_9.getGUID() == pig_id then
    local params = {}
    params.position = { 18.05, 2, 0.0 }
    pig.takeObject(params)
  end
  if card_10.getGUID() == cow_id then
    local params = {}
    params.position = { 4.92, 2, 13.8 }
    cow.takeObject(params)
  else
    local params = {}
    params.position = { 4.92, 2, 13.8 }
    stone.takeObject(params)
  end
  if card_10.getGUID() == cow_id then
    local params = {}
    params.position = { 20.85, 2, 4.42 }
    cow.takeObject(params)
  end
  if card_11.getGUID() == cow_id then
    local params = {}
    params.position = { 20.85, 2, 0.0 }
    cow.takeObject(params)
  end
  if card_10.getGUID() == stone_2_id then
    local params = {}
    params.position = { 20.85, 2, 4.42 }
    stone.takeObject(params)
  end
  if card_11.getGUID() == stone_2_id then
    local params = {}
    params.position = { 20.85, 2, 0.0 }
    stone.takeObject(params)
  end
end

function populate_3()
  if card1.getGUID() == clay_1_id then
    local params = {}
    params.position = { -2.44, 2, 4.5 }
    clay.takeObject(params)
  end
  if card2.getGUID() == clay_1_id then
    local params = {}
    params.position = { 0.43, 2, 4.5 }
    clay.takeObject(params)
  end
  if card3.getGUID() == clay_1_id then
    local params = {}
    params.position = { -2.37, 2, 0.11 }
    clay.takeObject(params)
  end
  if card4.getGUID() == clay_1_id then
    local params = {}
    params.position = { 0.43, 2, 0.11 }
    clay.takeObject(params)
  end
  if card1.getGUID() == wood_1_id then
    local params = {}
    params.position = { -2.44, 2, 4.5 }
    wood.takeObject(params)
    wood.takeObject(params)
  end
  if card2.getGUID() == wood_1_id then
    local params = {}
    params.position = { 0.43, 2, 4.5 }
    wood.takeObject(params)
    wood.takeObject(params)
  end
  if card3.getGUID() == wood_1_id then
    local params = {}
    params.position = { -2.37, 2, 0.11 }
    wood.takeObject(params)
    wood.takeObject(params)
  end
  if card4.getGUID() == wood_1_id then
    local params = {}
    params.position = { 0.43, 2, 0.11 }
    wood.takeObject(params)
    wood.takeObject(params)
  end
end

function populate_4()
  if card1.getGUID() == clay_2_id then
    local params = {}
    params.position = { -2.44, 2, 4.5 }
    clay.takeObject(params)
    clay.takeObject(params)
  end
  if card2.getGUID() == clay_2_id then
    local params = {}
    params.position = { 0.43, 2, 4.5 }
    clay.takeObject(params)
    clay.takeObject(params)
  end
  if card3.getGUID() == clay_2_id then
    local params = {}
    params.position = { -2.37, 2, 0.11 }
    clay.takeObject(params)
    clay.takeObject(params)
  end
  if card4.getGUID() == clay_2_id then
    local params = {}
    params.position = { 0.43, 2, 0.11 }
    clay.takeObject(params)
    clay.takeObject(params)
  end
  if card5.getGUID() == clay_2_id then
    local params = {}
    params.position = { -2.44, 2, -4.17 }
    clay.takeObject(params)
    clay.takeObject(params)
  end
  if card6.getGUID() == clay_2_id then
    local params = {}
    params.position = { 0.43, 2, -4.17 }
    clay.takeObject(params)
    clay.takeObject(params)
  end
  if card1.getGUID() == wood_2_a_id then
    local params = {}
    params.position = { -2.44, 2, 4.5 }
    wood.takeObject(params)
  end
  if card2.getGUID() == wood_2_a_id then
    local params = {}
    params.position = { 0.43, 2, 4.5 }
    wood.takeObject(params)
  end
  if card3.getGUID() == wood_2_a_id then
    local params = {}
    params.position = { -2.37, 2, 0.11 }
    wood.takeObject(params)
  end
  if card4.getGUID() == wood_2_a_id then
    local params = {}
    params.position = { 0.43, 2, 0.11 }
    wood.takeObject(params)
  end
  if card5.getGUID() == wood_2_a_id then
    local params = {}
    params.position = { -2.44, 2, -4.17 }
    wood.takeObject(params)
  end
  if card6.getGUID() == wood_2_a_id then
    local params = {}
    params.position = { 0.43, 2, -4.17 }
    wood.takeObject(params)
  end
  if card1.getGUID() == wood_2_b_id then
    local params = {}
    params.position = { -2.44, 2, 4.5 }
    wood.takeObject(params)
    wood.takeObject(params)
  end
  if card2.getGUID() == wood_2_b_id then
    local params = {}
    params.position = { 0.43, 2, 4.5 }
    wood.takeObject(params)
    wood.takeObject(params)
  end
  if card3.getGUID() == wood_2_b_id then
    local params = {}
    params.position = { -2.37, 2, 0.11 }
    wood.takeObject(params)
    wood.takeObject(params)
  end
  if card4.getGUID() == wood_2_b_id then
    local params = {}
    params.position = { 0.43, 2, 0.11 }
    wood.takeObject(params)
    wood.takeObject(params)
  end
  if card5.getGUID() == wood_2_b_id then
    local params = {}
    params.position = { -2.44, 2, -4.17 }
    wood.takeObject(params)
    wood.takeObject(params)
  end
  if card6.getGUID() == wood_2_b_id then
    local params = {}
    params.position = { 0.43, 2, -4.17 }
    wood.takeObject(params)
    wood.takeObject(params)
  end
  if card1.getGUID() == traveling_1_id then
    local params = {}
    params.position = { -2.44, 2, 4.5 }
    food.takeObject(params)
  end
  if card2.getGUID() == traveling_1_id then
    local params = {}
    params.position = { 0.43, 2, 4.5 }
    food.takeObject(params)
  end
  if card3.getGUID() == traveling_1_id then
    local params = {}
    params.position = { -2.37, 2, 0.11 }
    food.takeObject(params)
  end
  if card4.getGUID() == traveling_1_id then
    local params = {}
    params.position = { 0.43, 2, 0.11 }
    food.takeObject(params)
  end
  if card5.getGUID() == traveling_1_id then
    local params = {}
    params.position = { -2.44, 2, -4.17 }
    food.takeObject(params)
  end
  if card6.getGUID() == traveling_1_id then
    local params = {}
    params.position = { 0.43, 2, -4.17 }
    food.takeObject(params)
  end
end

function populate_5()
  if card1.getGUID() == clay_3_id then
    local params = {}
    params.position = { -2.44, 2, 4.5 }
    clay.takeObject(params)
    clay.takeObject(params)
    clay.takeObject(params)
  end
  if card2.getGUID() == clay_3_id then
    local params = {}
    params.position = { 0.43, 2, 4.5 }
    clay.takeObject(params)
    clay.takeObject(params)
    clay.takeObject(params)
  end
  if card3.getGUID() == clay_3_id then
    local params = {}
    params.position = { -2.37, 2, 0.11 }
    clay.takeObject(params)
    clay.takeObject(params)
    clay.takeObject(params)
  end
  if card4.getGUID() == clay_3_id then
    local params = {}
    params.position = { 0.43, 2, 0.11 }
    clay.takeObject(params)
    clay.takeObject(params)
    clay.takeObject(params)
  end
  if card5.getGUID() == clay_3_id then
    local params = {}
    params.position = { -2.44, 2, -4.17 }
    clay.takeObject(params)
    clay.takeObject(params)
    clay.takeObject(params)
  end
  if card6.getGUID() == clay_3_id then
    local params = {}
    params.position = { 0.43, 2, -4.17 }
    clay.takeObject(params)
    clay.takeObject(params)
    clay.takeObject(params)
  end
  if card1.getGUID() == wood_3_id then
    local params = {}
    params.position = { -2.44, 2, 4.5 }
    wood.takeObject(params)
    wood.takeObject(params)
    wood.takeObject(params)
    wood.takeObject(params)
  end
  if card2.getGUID() == wood_3_id then
    local params = {}
    params.position = { 0.43, 2, 4.5 }
    wood.takeObject(params)
    wood.takeObject(params)
    wood.takeObject(params)
    wood.takeObject(params)
  end
  if card3.getGUID() == wood_3_id then
    local params = {}
    params.position = { -2.37, 2, 0.11 }
    wood.takeObject(params)
    wood.takeObject(params)
    wood.takeObject(params)
    wood.takeObject(params)
  end
  if card4.getGUID() == wood_3_id then
    local params = {}
    params.position = { 0.43, 2, 0.11 }
    wood.takeObject(params)
    wood.takeObject(params)
    wood.takeObject(params)
    wood.takeObject(params)
  end
  if card5.getGUID() == wood_3_id then
    local params = {}
    params.position = { -2.44, 2, -4.17 }
    wood.takeObject(params)
    wood.takeObject(params)
    wood.takeObject(params)
    wood.takeObject(params)
  end
  if card6.getGUID() == wood_3_id then
    local params = {}
    params.position = { 0.43, 2, -4.17 }
    wood.takeObject(params)
    wood.takeObject(params)
    wood.takeObject(params)
    wood.takeObject(params)
  end
  if card1.getGUID() == traveling_2_id then
    local params = {}
    params.position = { -2.44, 2, 4.5 }
    food.takeObject(params)
  end
  if card2.getGUID() == traveling_2_id then
    local params = {}
    params.position = { 0.43, 2, 4.5 }
    food.takeObject(params)
  end
  if card3.getGUID() == traveling_2_id then
    local params = {}
    params.position = { -2.37, 2, 0.11 }
    food.takeObject(params)
  end
  if card4.getGUID() == traveling_2_id then
    local params = {}
    params.position = { 0.43, 2, 0.11 }
    food.takeObject(params)
  end
  if card5.getGUID() == traveling_2_id then
    local params = {}
    params.position = { -2.44, 2, -4.17 }
    food.takeObject(params)
  end
  if card6.getGUID() == traveling_2_id then
    local params = {}
    params.position = { 0.43, 2, -4.17 }
    food.takeObject(params)
  end
end

function populate_common()
  if number_of_players == 3 then
    populate_3()
  end
  if number_of_players == 4 then
    populate_4()
  end
  if number_of_players == 5 then
    populate_5()
  end
  local params = {}
  params.position = { 7.25, 2.0, 1.34 }
  wood.takeObject(params)
  local params = {}
  params.position = { 7.25, 2.0, 1.34 }
  wood.takeObject(params)
  local params = {}
  params.position = { 7.25, 2.0, 1.34 }
  wood.takeObject(params)
  local params = {}
  params.position = { 8.16, 2.0, -0.88 }
  clay.takeObject(params)
  local params = {}
  params.position = { 7.19, 2.0, -3.15 }
  reed.takeObject(params)
  local params = {}
  params.position = { 8.32, 2.0, -5.34 }
  food.takeObject(params)
end

--[[ The Update function. This is called once per frame. --]]
function update ()
    --[[ print('Update loop!') --]]
end

function waitFrames(frames)
    while frames > 0 do
        coroutine.yield(0)
        frames = frames - 1
    end
end

function recallDudes()
-- bring peeps back to homes at the start of a new round
local zoneObjects, obj
	zoneObjects = Ag.scriptingZone.getObjects()
	for _, obj in pairs(zoneObjects) do
		print(obj.tooltip)
	end
end
