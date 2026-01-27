module HireDevelopersHelper

    def developer_technologies(hire_developer)
      hire_developer.technologies.pluck(:name, :logo).each_with_object([]) do |item, result|
        result << { name: item.first, logo: item.last }
      end
    end
    
    def dedicated_projects(hire_developer)
      hire_developer.case_studies.pluck(:project_title, :path_name, :project_bg ).each_with_object([]) do |item, result|
        result << { project_title: item[0], path_name: item[1], project_bg: item[2] }
      end
    end
end
