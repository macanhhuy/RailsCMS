# encoding: utf-8
class Blog < ActiveRecord::Base
  attr_accessible :slug, :title
  extend FriendlyId
  friendly_id :title, use: :slugged
  def normalize_friendly_id(input)
    require "babosa2"
    input.to_s.to_slug.normalize(transliterations: :vietnamese).to_s
  end
end
