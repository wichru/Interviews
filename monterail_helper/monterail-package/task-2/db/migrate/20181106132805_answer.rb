      class Answer < ActiveRecord::Migration[5.0]
        def change
          create_table :answers do |f|
            f.string :value
            f.integer :question_id
          end
        end
      end
