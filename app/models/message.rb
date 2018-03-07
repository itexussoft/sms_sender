class Message < ApplicationRecord
  belongs_to :template, class_name: 'MessageTemplate'
  belongs_to :recipient
end
