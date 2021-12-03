class SystemPage
  def admin_btn
    browser.find_element(id: 'coreapps-systemadministration-homepageLink-coreapps-systemadministration-homepageLink-extension')
  end

  def adv_btn
    browser.find_element(id: 'referenceapplication-legacyAdmin-app')
  end

  def scheduler
    browser.find_element(link_text: 'Manage Scheduler')
  end

  def add_task
    browser.find_element(xpath: "//div/a[text()='Add Task']")
  end

  def task_name_field
    browser.find_element(xpath: '//form/fieldset/table/tbody/tr[2]/td[2]')
  end

  def subtitle_field
    browser.find_element(xpath: '//form/fieldset/table/tbody/tr[3]/td[2]')
  end

  def save_btn
    browser.find_element(text: 'Save')
  end

  def find_task(data)
    browser.find_element(link_text: data)
  end
end
