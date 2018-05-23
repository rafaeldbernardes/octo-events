class Event < ActiveRecord::Base
	validates :action, presence: { allow_blank: false }
	belongs_to :issue
end