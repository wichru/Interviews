class TitleBracketsValidator < ActiveModel::Validator
  def validate(record)
    string = record.title

    if !empty_brackets?(string)
      record.errors.add(string, "brackets cannot be empty")
    elsif !is_valid_title(string)
      record.errors.add(string, "brackets are invalid")
    end
  end

  def empty_brackets?(string)
    %w[ () [] {} ].none?(&string.method(:include?))
  end

  def is_valid_title(string)
    match_count = 0

    string.each_char do |c|
      match_count += 1 if [ '[', '{', '(' ].include?(c)
      match_count -= 1 if [ ']', '}', ')' ].include?(c)
    end
    match_count == 0
  end
end
