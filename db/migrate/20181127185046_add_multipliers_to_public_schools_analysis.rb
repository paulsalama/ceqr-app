class AddMultipliersToPublicSchoolsAnalysis < ActiveRecord::Migration[5.2]
  def change
    add_column :public_schools_analyses, :multipliers, :jsonb
    
    reversible do |dir|
      dir.up do
        execute <<-SQL
          UPDATE public_schools_analyses SET multipliers = (
            '{
              "version": "march-2014",
              "thresholdPsIsStudents": 50,
              "thresholdHsStudents": 150,
            
              "boroughs": [
                {"name": "Manhattan", "ps": 0.12, "is": 0.04, "hs": 0.06, "psisThreshold": 310, "hsThreshold": 2492},
                {"name": "Bronx", "ps": 0.39, "is": 0.16, "hs": 0.19, "psisThreshold": 90, "hsThreshold": 787},
                {"name": "Brooklyn", "ps": 0.29, "is": 0.12, "hs": 0.14, "psisThreshold": 121, "hsThreshold": 1068},
                {"name": "Queens", "ps": 0.28, "is": 0.12, "hs": 0.14, "psisThreshold": 124, "hsThreshold": 1068},
                {"name": "Staten Island", "ps": 0.21, "is": 0.09, "hs": 0.14, "psisThreshold": 165, "hsThreshold": 1068} 
              ]
            }'
          ) 
        SQL
      end
    end
  end
end
