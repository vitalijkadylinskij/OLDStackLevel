module CaseStudiesHelper
  def project_services(case_study)
    case_study.project_services.split(',')
  end

  def project_technologies(case_study)
    case_study.technologies.pluck(:name, :logo).each_with_object([]) do |item, result|
      result << item.first
    end
  end

  def project_domains(case_study)
    case_study.business_domains.pluck(:name).each_with_object([]) do |item, result|
      result << item
    end
  end

  def project_integrations(case_study)
    case_study.integrations.pluck(:name, :logo).each_with_object([]) do |item, result|
      result << { name: item.first, logo: item.last }
    end
  end

  def image(url)
    url ? image_url(url) : nil
  end
end
