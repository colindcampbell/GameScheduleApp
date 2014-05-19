class Game
  include Mongoid::Document
  field :location, type: String
  field :time, type: Time, default:'12:00:00'
  field :sport, type: String
  field :overtime, type: Mongoid::Boolean
  field :home_score, type: Integer
  field :away_score, type: Integer
  field :recorded, type: Mongoid::Boolean, default:false
  field :final, type: Mongoid::Boolean, default:false
  #A = away_team win
  #H = home_team win
  #a = away_team win in OT
  #h = home_team win in OT
  #T = tie
  def outcome
    if self.final
    	h = home_team
    	a = away_team
    	# h.wins=0 if h.wins==nil
    	# h.losses=0 if h.losses==nil
    	# a.wins=0 if a.wins==nil
    	# a.losses=0 if a.losses==nil
    	if home_score == away_score
    		return 'T'
    	elsif home_score > away_score
    		if !self.recorded
  	  		h.wins += 1
  	  		a.losses += 1
  	  		h.save
  	  		a.save
  	  		self.recorded=true
  	  		self.save
  	  	end
    		if overtime
    			return 'h'
    		else
    			return 'H'
    		end
    	else
    		if !self.recorded
  	  		h.losses += 1
  	  		a.wins += 1
  	  		a.save
  	  		h.save
  	  		self.recorded=true
  	  		self.save
  	  	end
    		if overtime
    			return 'a'
    		else
    			return 'A'
    		end
    	end
    end
  end

  def reverse_outcome
    #If you delete the game it reverses reverts the record if the score was final and resets recorded to false
  end

  # validate :teams_not_same
  # def teams_not_same()
  #   if self.home_team == self.away_team
  #     errors.add(:home_team, 'Pick two different teams!')
  #   end
  # end
  			
  		
  #You can build a game with home and away teams (Game.create)
  #Or you can build a home_game or away_game from the team ex:
  #g3 = Team.all[1].home_games.create(away_team:Team.all[2])
  belongs_to :home_team, class_name: 'Team', inverse_of: :home_games
  belongs_to :away_team, class_name: 'Team', inverse_of: :away_games
  belongs_to :league
  belongs_to :day
end





