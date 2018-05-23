class Issue < ActiveRecord::Base
	has_many :events
end