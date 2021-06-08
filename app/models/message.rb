class Message < ApplicationRecord

  belongs_to: user
  belongs_to: conversation
  validates_presence_of :user,:conversation_id,:user_id

  def message_time
    created_at.strftime("%d-%m-%Y at %H:%M:%S")
  end

end
