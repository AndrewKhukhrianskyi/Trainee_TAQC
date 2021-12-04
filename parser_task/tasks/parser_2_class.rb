# Ошибка с поиском элементов страницы. Подредачь
class FindPage
  def find_input
    browser.find_element(class: 'gLFyf gsfi')
  end

  def search_btn
    browser.find_element(class: 'gNO89b')
  end

  def find_page
    browser.find_element(class: 'LC20lb MBeuO DKV0Md')
  end
end
