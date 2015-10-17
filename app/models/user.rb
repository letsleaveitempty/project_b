class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]
  
        # def string provider
        # def string uid
# "provider" (string) and "uid" (string)
#
#          def change
#     create_table :products do |t|
#       t.string :name
#       t.text :description
#
#       t.timestamps null: false
#     end

end
