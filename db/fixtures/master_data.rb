# frozen_string_literal: true

ActiveRecord::Base.transaction do
  TuloCommon::MasterDataRelated::MasterData.sorted_file_list.each do |file|
    klass = File.basename(file, '.csv').gsub('master_', 'master/').classify.constantize
    ::CSV.read(file, headers: true).each do |row|
      klass.seed do |seed|
        row.to_hash
           .select { |header| klass.column_names.include?(header.to_s) }
           .each do |header, value|
          seed.send("#{header}=", value)
        end
      end
    end
  end
end
