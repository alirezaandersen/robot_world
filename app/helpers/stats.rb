module StatisticHelper

  def get_age_in_completed_years(bd, d)
    # Difference in years, less one if you have not had a birthday this year.
    a = d.year - bd.year
    a = a - 1 if (
    bd.month >  d.month or
    (bd.month >= d.month and bd.day > d.day)
    )
    a
  end

  def get_all_robot_ages
    database.select(:birthdate).from(:robots).map do |bday|
      robot_bd = Date.strptime(bday[:birthdate],'%Y-%m-%d')
      get_age_in_completed_years(robot_bd,Date.today)
    end
  end

  def get_average_robot_age
    get_all_robot_ages.reduce(:+)/get_all_robot_ages.length
    #  binding.pry
  end

  def date_hired
    work = database.select(:date_hired).from(:robots).map do |date|
      date[:date_hired]
    end
  end

  def year_hired
    date_hired.group_by { |date| year, month, date = date.split('-'); year}
  end

  def robots_hired_per_year
    year_hired.map{|k,v| [k,v.length]}.to_h
  end

  def robots_jobs
    database.select(:department).from(:robots).map do |dep|
      dep[:department].downcase
    end
  end

  def format_departments
    robots_jobs.map do |department|
      department.gsub('&',',').split(",")
    end.flatten
  end

  def clean_deparment_list
    format_departments.map{|val| val.strip}
  end

  def employees_per_deparment
    clean_deparment_list.group_by { |dept| dept}.map{|k,v| [k,v.length] }.to_h
  end

  def number_of_city
    database.select(:city).from(:robots).map do |dep|
      dep[:city]
    end
  end

  def capitalize_city_name
    number_of_city.map{|v| v.split.map(&:capitalize).join(' ')}
  end

  def population_by_city
    capitalize_city_name.group_by{|city| city}.map{|k,v| [k,v.length] }.to_h
  end

  def number_of_states
    database.select(:state).from(:robots).map do |st|
      st[:state]
    end
  end

  def population_by_state
    x = number_of_states.group_by{ |state| state}.map{|k,v| [k,v.length] }.to_h
  end

end
