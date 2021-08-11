class StatusManagement < ApplicationRecord
    belongs_to :performer, class_name: 'User', foreign_key: 'performer_id', validate: true
    belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id', validate: true

    validates :action,
            presence: true


    def self.create_status_management(performer, receiver, action)
        item = StatusManagement.new({
            performer_id: performer.id,
            receiver_id: receiver.id,
            action: action
        })
        
        item.save
    end
end
