class Subject < ApplicationRecord
  belongs_to :degree
  belongs_to :standard
  belongs_to :semester
end
