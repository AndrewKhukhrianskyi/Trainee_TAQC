# Trainee_TAQC
Trainee TAQC is a automation test project which consist different tasks for the automation test executions

## Getting started
Before we start our guideline about project we should understand, which technologies are used for TA process. All test cases are written on the Ruby language and special ruby instruments (gems).

### Prerequisites
Gems
1. selenium-webdriver
2. cucumber
3. rake
4. pry
5. bundler
6. ffi
7. faraday
8. rubocop
9. capybara

Programming languages
1. Ruby 3.0.2p107
2. Gherkin

Software
1. Jenkins
2. Docker

### Installing

1. Install Ruby programming language. Link: https://www.ruby-lang.org
2. Create a folder, which will be consist all test files
3. By using terminal, go to your project folder with Gemfile and write the next command
```
bundle install
```
4. Install Jenkins. Link: https://www.jenkins.io
5. Install Docker. Link: https://www.docker.com

## Running the test
The current project consist the next architecture (most of the file projects)

```Web page file => Config file => Test execution file```

### RSpec
RSpec part of the current project have the next subprojects
- UI website testing (UI Test task 1)
- File creating testing (File task)
- Website shop testing (website task)
1. Choose one project from above
2. By using terminal go to the spec folder

```
Example:
cd path_to_the_project/spec
```

3. All files in the spec folder are test execution files. Choose one of them by using next command
```
Example:
BROWSER=browser_name bundle exec rspec filename_spec.rb
```

### Cucumber
1. By using terminal, go to the next folder
```
cd cucumber_task
```
2. Start test execution process by using the next command
```
Example:
BROWSER=browser_name bundle exec cucumber features/some.feature
```

### Deployment
All subprojects require a repeatable gem installtaion. If you want to avoid problem, connected with gems missing, you should use ```bundle install``` in the all subprojects. Gemfiles are installed in the every subproject.

## Authors
Andrii Khukhrianskii - Tester & Project Owner   
Antonina Metellia - Professional Reviewer :)
