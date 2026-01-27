# db/migrate/20260126110000_copy_order_to_position_in_case_studies.rb
class CopyOrderToPositionInCaseStudies < ActiveRecord::Migration[5.2]
  def up
    # Если бы старая колонка была, можно было бы скопировать данные:
    # CaseStudy.reset_column_information
    # CaseStudy.find_each do |cs|
    #   cs.update_column(:position, cs.order)
    # end

    # Так как колонки `order` нет, можно просто заполнить `position` по id
    CaseStudy.reset_column_information
    CaseStudy.find_each.with_index(1) do |cs, index|
      cs.update_column(:position, index)
    end
  end

  def down
    # откат просто очищает колонку position
    CaseStudy.update_all(position: nil)
  end
end


