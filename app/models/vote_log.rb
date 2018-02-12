class VoteLog < ApplicationRecord
  belongs_to :candidate
  # use rails g model vote_log candidate:references ip_address:string
  # it'll create belongs_to and foreign_key on model 
end
