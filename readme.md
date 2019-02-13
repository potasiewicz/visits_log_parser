# Visits Log Application
### Ruby version
The application was developed and checked with **ruby 2.5.0** and **ruby 2.6.1**.

### Running application
```sh
$ bundle install
$ ./visits_log_parser.rb webserver.log
```
### Executing tests
```sh
$ bundle install
$ rspec
```
### Code coverage
Report with code coverage is available in dir **coverage** when tests have been finished.

### Static code analysis
```sh
$ bundle install
$ rubocop
```
Some default rubocop rules were changes. 
- Documentation - has been switch off because the code is so simple that it is self-describing
- Metrics/LineLength - I'm always using 120 chars. The whole line is well visible on a screen
- Metrics/BlockLength - has been switch off only for **spec** dir. Tests usually contain longer modules
- Lint/ImplicitStringConcatenation - has been switch off only for **spec** dir. It simplifies application tests
- Style/FrozenStringLiteralComment - has been switch off only for visits_log_parser.rb. The first line in this file is to set script interpreter