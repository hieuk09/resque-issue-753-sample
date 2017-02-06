# resque-issue-753-sample

# Description

This is a minimum rails app which I create to reproduce issue [#753](https://github.com/resque/resque/issues/753) of resque. 
This problem appears when using resque together with zeus

To setup and reproduce the issue, please follow the steps below:

```shell
# create database
rake db:create

# start redis

# start zeus in another terminal window
zeus start

# In another terminal window, run
zeus rspec spec

# To compare, run
rspec
```

You can see that the result is different in 2 cases: with zeus, there is one test failed while all tests passed without it.
