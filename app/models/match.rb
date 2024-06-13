class Match < ApplicationRecord
  belongs_to :team1, class_name: "Team", foreign_key: :team1_id
  belongs_to :team2, class_name: "Team", foreign_key: :team2_id
  belongs_to :game

  def infos_match
    {
      id: id,
      game: game.name,
      team1: {
        picture: team1.picture,
        name: team1.team_name,
        odd: odd.match(/(\d\.\d*)\/(\d\.\d*)/)[1]
      },
      team2: {
        picture: team2.picture,
        name: team2.team_name,
        odd: odd.match(/(\d\.\d*)\/(\d\.\d*)/)[2]
      }
    }.to_json

  end


  after_validation :change_bet_status, if: :will_save_change_to_status?



  def change_bet_status
    p "change-bet"

    Bet.where(match: self).each do |bet|

      winner = score_team1 > score_team2 ? 1 : 2

      p "wwwwwwwinnnner"
      p winner
      p odd

      if winner == 1
        the_odd = odd.match(/(\d\.\d*)\/(\d\.\d*)/)[1]

      else
        the_odd  = odd.match(/(\d\.\d*)\/(\d\.\d*)/)[2]
      end

      if bet.team_number == winner
        bet.gain = bet.place_money * the_odd.to_f

      else
        bet.gain = 0
      end


      bet.save!
      p bet
    end

  end

end
