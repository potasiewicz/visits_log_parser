# Visits Log Application
### Ruby version
Application was developed and checked with **ruby 2.5.0**.
This version of ruby is required in **Gemfile**
### Running application
```sh
$ bundle install
$ ./visit_log_parser.rb webserver.log
```
### Executing tests
```sh
$ bundle install
$ rspec
```
### Code coverage
Report with code coverage is available in dir coverage when tests have been finished.

### Static code analysis
```sh
$ bundle install
$ rubocop
```
Some default rubocop rules were changes. 
- Documentation - has been switch off because code is so simple that it is seft describing
- Metrics/LineLength - I'm always use 120 chars. Whole line is good visible on a screen
- Metrics/BlockLength - has been switch off only for **spec** dir. Tests usually contains longer modules
- Lint/ImplicitStringConcatenation - has been switch off only for **spec** dir. It's simplify application tests.