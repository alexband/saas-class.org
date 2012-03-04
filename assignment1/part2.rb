require 'set'
class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  strategy = Set['P','R','S']
  rules = ['PR', 'RS', 'SP']
  raise WrongNumberOfPlayersError unless game.length == 2
  game.each do |pair|
    raise NoSuchStrategyError unless strategy.member?(pair[1])
  end
  if game[0][1] == game[1][1] then return game[0] end
  battle = game[0][1]+game[1][1]
  if rules.member?(battle) then return game[0] end
  if rules.member?(battle.reverse) then return game[1] end
end

def rps_tournament_winner(tournament)
  if tournament[0][0].is_a?(String) then
    return rps_game_winner(tournament)
  else
    half = tournament.length / 2
    first = tournament.slice(0, half)[0]
    last = tournament.slice(half, tournament.length)[0]
    new_tournament = [rps_tournament_winner(first), rps_tournament_winner(last)]
    return rps_tournament_winner(new_tournament)
  end
end

