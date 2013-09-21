require './lib/aggressive'
require './lib/defensive'

extend Aggressive
extend Defensive

on_turn do
  safe_attack
end

def safe_attack
  enemy = opponents.first
  return hunt unless enemy
  return move_away_from! enemy if my.ammo == 0 && can_fire_at? enemy
  return rest if my.ammo == 0
  return fire_at! enemy, 0.75 if can_fire_at? enemy
  return aim_at! enemy unless aiming_at? enemy
  return move_away_from! enemy if my.armor < 3
  move_towards! enemy
end
