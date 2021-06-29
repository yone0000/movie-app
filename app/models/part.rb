class Part < ActiveHash::Base
            self.data = [
          { id: 1, name: '--' },
          { id: 2, name: 'Chest(胸)' },
          { id: 3, name: 'Sholder（肩）' },
          { id: 4, name: 'back（背中）' },
          { id: 5, name: 'Arm（腕）' },
          { id: 6, name: 'Leg（脚）' },
        ] 

include ActiveHash::Associations
  has_many :articles

  end
